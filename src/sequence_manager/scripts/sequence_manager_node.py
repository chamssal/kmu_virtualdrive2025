#!/usr/bin/env python3

import os
import sys

# ─── scripts/ -> 상위 폴더(lane_follower 패키지 루트) 경로를 PYTHONPATH에 추가 ───
current_dir = os.path.dirname(os.path.realpath(__file__))
parent_dir  = os.path.abspath(os.path.join(current_dir, '..'))
if parent_dir not in sys.path:
    sys.path.insert(0, parent_dir)
    
import rospy
from std_msgs.msg import Float64, Int32, Bool, String
from sequence_manager.sequence_enum import SequenceState
import threading
import rosnode

class SequenceManager:
    def __init__(self):
        rospy.init_node("sequence_manager")
        rospy.loginfo("[SequenceManager] SequenceManager 초기화.")

        #--------------------초기상태, 멤버 초기화--------------------

        self.sequence = SequenceState.SLAM  # 초기값: SLAM 상태
        self.speed_default = 1500 # 기본속도
        self.speed_turn = 1000 # 회전속도
        self.speed_obstacle = 1000 # 장애물회피 속도
        self.speed_slow = 800 # 느린속도
        self.speed_rotary = 800 # 로타리 진행속도 (진입시)
        self.speed_rotary_out = 230 # 로타리 진행속도 (들어가고 나서)

        self.idle_speed = 0.
        self.idle_steer = 0.
        self.lane_steer = None
        self.lane_stopline = False
        self.static_dist = float("inf")
        self.static_avoid = None
        self.static_step = 0
        self.dynamic_stop_queue = []
        self.dynamic_stop_queue_size = 10
        self.traffic_is_stop = None
        self.rotary_enter = None
        self.rotary_out_once = True
        self.rotary_wait_once = True
        self.obstacle_on_lane = None
        self.front_wall = None
        self.prev_front_wall = None
        self.wall_cnt = 0
        self.forced_once = True
        
        
        self.timer_threads = [] # 타이머 작업 저장용 (중복 실행 방지)

        #--------------------Publisher--------------------

        self.seq_pub = rospy.Publisher("/sequence/state", Int32, queue_size=1)
        self.speed_pub = rospy.Publisher("/ctrl/speed", Float64, queue_size=1)
        self.steer_pub = rospy.Publisher("/ctrl/steering", Float64, queue_size=1)
        self.mode_pub = rospy.Publisher("/lane/mode", Float64, queue_size=1)

        #--------------------Subscriber--------------------
        
        self.slam_done_sub = rospy.Subscriber("/sequence/slam_done", Bool, self.slam_done_CB)
        self.static_done_sub = rospy.Subscriber("/sequence/static_done", Bool, self.static_done_CB)
        self.dynamic_done_sub = rospy.Subscriber("/sequence/dynamic_done", Bool, self.dynamic_done_CB)
        self.rotary_done_sub = rospy.Subscriber("/sequence/rotary_done", Bool, self.rotary_done_CB)
        self.traffic_done_sub = rospy.Subscriber("/sequence/traffic_done", Bool, self.traffic_done_CB)

        self.lane_steer_sub = rospy.Subscriber("/lane/steer", Float64, self.lane_steer_CB)
        self.lane_stopline_sub = rospy.Subscriber("/lane/stopline", Bool, self.lane_stopline_CB)
        self.static_dist_sub = rospy.Subscriber("/static/dist", Float64, self.static_dist_CB)
        self.dynamic_stop_sub = rospy.Subscriber("/dynamic/stop", Bool, self.dynamic_stop_CB)
        self.traffic_speed_sub = rospy.Subscriber("/traffic/semantic", String, self.traffic_semantic_CB)
        self.rotary_enter_sub = rospy.Subscriber("/rotary/enter", Bool, self.rotary_enter_CB)
        
        self.obstacle_on_lane_sub = rospy.Subscriber("/lane_obstacle_detected", Bool, self.obstacle_on_lane_CB)
        self.front_wall_sub = rospy.Subscriber("/front_wall_detected", Bool, self.front_wall_CB)
        
        self.test_sub = rospy.Subscriber("/sequnce/test", Bool, self.test_CB)

        # --- 상태 변화 감지용 ---
        self.rotary_entry_speed = 800
        self.rotary_entry_forward_time = 0.3
        self.rotary_entry_turn_time = 0.45
        self.rotary_entry_steer = 1.0
        self.stopline_once = False
        
        self.prev_sequence = None
        self.state_started_at = rospy.get_time()
        
        # --- 하드코딩용 상태 ---
        self.hardcode_active = False          # 외부에서 확인할 플래그
        self._hc_started_at = 0.0
        self._hc_duration  = 0.0
        self._hc_speed     = None             # Float64 값 (예: 1500)
        self._hc_steer     = None             # Float64 값 (0.0~1.0)
        self._hc_mode      = None             # lane/mode에 줄 값(옵션, None이면 안 보냄)
        self._hc_seq_after = None             # 종료 후 전환할 시퀀스(옵션)


        self.rate = rospy.Rate(20)
        self.run()
        
    # -------------------- 하드코딩(수동 오버라이드) API --------------------

    def start_hardcode(self, duration_sec, steer=None, speed=None, mode=None, sequence_after=None):
        """
        duration_sec 동안 steer/speed(/mode)를 강제로 퍼블리시.
        - steer: 0.0~1.0 사이 권장(안 주면 그대로 두고 speed만 강제 가능)
        - speed: Float64 수치 (예: 1500). None이면 안 보냄
        - mode : lane/mode에 보낼 값(옵션). None이면 안 보냄
        - sequence_after: 종료 후 바꿀 SequenceState (옵션)
        """
        now = rospy.get_time()
        # 중복 호출 시 덮어씀
        self._hc_started_at = now
        self._hc_duration   = float(max(0.0, duration_sec))
        self._hc_steer      = None if steer is None else float(max(0.0, min(1.0, steer)))
        self._hc_speed      = None if speed is None else float(speed)
        self._hc_mode       = mode
        self._hc_seq_after  = sequence_after
        self.hardcode_active = True
        rospy.loginfo(f"[SequenceManager] Hardcode START: {duration_sec:.2f}s "
                      f"steer={self._hc_steer}, speed={self._hc_speed}, mode={self._hc_mode}, "
                      f"after={getattr(sequence_after,'name',None)}")

    def cancel_hardcode(self):
        """수동 오버라이드 즉시 해제"""
        if self.hardcode_active:
            self.hardcode_active = False
            rospy.loginfo("[SequenceManager] Hardcode CANCELLED.")

    def _apply_hardcode(self):
        """
        루프 말미에서 호출. 활성화 중이면 퍼블리시를 덮어써서 우선권을 갖게 함.
        시간이 끝나면 자동 해제 및 필요시 시퀀스 전환.
        """
        if not self.hardcode_active:
            return

        t = rospy.get_time() - self._hc_started_at
        if t <= self._hc_duration:
            # 실행 중: 지정된 값만 덮어쓰기
            if self._hc_mode is not None:
                self.mode_pub.publish(Float64(self._hc_mode))
            if self._hc_speed is not None:
                self.speed_pub.publish(Float64(self._hc_speed))
            if self._hc_steer is not None:
                self.steer_pub.publish(Float64(self._hc_steer))
        else:
            # 종료 처리
            self.hardcode_active = False
            
            if self.sequence == SequenceState.STATIC_OBSTACLE and self.static_avoid:
                self.static_step += 1
            
            if self._hc_seq_after is not None:
                rospy.loginfo(f"[SequenceManager] Hardcode DONE → sequence={self._hc_seq_after.name}")
                self.sequence = self._hc_seq_after
            else:
                rospy.loginfo("[SequenceManager] Hardcode DONE.")
        
    #--------------------타이머 기반 상태 변경 함수--------------------
    
    def change_sequence_after(self, delay_sec, new_sequence):
        """
        delay_sec 초 후에 self.sequence를 new_sequence로 변경
        """
        if delay_sec == 0.0:
            self.sequence = new_sequence
        
        def timer_job():
            rospy.sleep(delay_sec)  # ROS time으로 sleep
            rospy.loginfo(f"[SequenceManager] {delay_sec}초 경과 → 상태 {new_sequence.name} 로 변경")
            self.sequence = new_sequence
            self.dynamic_stop_queue = []

        # 백그라운드 스레드로 실행
        t = threading.Thread(target=timer_job)
        t.daemon = True
        t.start()
        self.timer_threads.append(t)

    #--------------------각 미션 완료 콜백함수--------------------

    def test_CB(self, msg):
        if msg.data == True:
            self.static_avoid = True
        else:
            pass
        
    def slam_done_CB(self, msg):
        if msg.data == True:
            rosnode.kill_nodes(['/throttle_interpolator'])
            rospy.loginfo("/throttle_interpolator 노드 kill.")
            self.wall_cnt = 0
            self.sequence = SequenceState.LANE_OBSTACLE
        elif msg.data == False:
            self.sequence = SequenceState.ROTARY_ENTRY # test

    def static_done_CB(self, msg):
        if msg.data == True:
            self.sequence = SequenceState.LANE_FOLLOWING
        elif msg.data == False:
            self.sequence = SequenceState.STATIC_OBSTACLE
            
    def dynamic_done_CB(self, msg):
        if msg.data == True:
            self.sequence = SequenceState.TURN_LEFT
        elif msg.data == False:
            self.sequence = SequenceState.DYNAMIC_OBSTACLE
            
    def rotary_done_CB(self, msg):
        if msg.data == True:
            self.sequence = SequenceState.TRAFFIC_LIGHT
        elif msg.data == False:
            self.sequence = SequenceState.ROTARY

    def traffic_done_CB(self, msg):
        if msg.data == True:
            self.sequence = SequenceState.TURN_RIGHT
        elif msg.data == False:
            self.sequence = SequenceState.TRAFFIC_LIGHT

    #--------------------각 미션별 조향각, 속도 콜백함수--------------------
    
    def lane_steer_CB(self, msg):
        self.lane_steer = msg.data
        
    def lane_stopline_CB(self, msg):
        self.lane_stopline = msg.data

    def static_dist_CB(self, msg):
        self.static_dist = msg.data

    def dynamic_stop_CB(self, msg):
        self.dynamic_stop_queue.append(msg.data)
        if len(self.dynamic_stop_queue) > self.dynamic_stop_queue_size:
            self.dynamic_stop_queue.pop(0)

    def traffic_semantic_CB(self, msg):
        if msg.data == "LEFT" or msg.data == "STRAIGHT":
            self.traffic_is_stop = False
        else:
            self.traffic_is_stop = True
            
    def rotary_enter_CB(self, msg):
        self.rotary_enter = msg.data
    
    def obstacle_on_lane_CB(self, msg):
        self.obstacle_on_lane = msg.data
        
    def front_wall_CB(self, msg):
        curr = msg.data
        
        if self.prev_front_wall is None:
            self.prev_front_wall = curr
            self.front_wall = curr
            return
        
        if self.prev_front_wall and not curr:
            self.wall_cnt += 1
            rospy.loginfo(f"wall_cnt is {self.wall_cnt}")
        
        self.prev_front_wall = curr
        self.front_wall = curr
        
        if 100 >= self.wall_cnt and self.wall_cnt >= 2:
            self.sequence = SequenceState.ROTARY
            
    #--------------------시퀀스 Enum 기반으로 분기 처리하는 함수--------------------s
        
    def run(self):
        while not rospy.is_shutdown():
            if self.sequence != self.prev_sequence:
                self.state_started_at = rospy.get_time()
                self.prev_sequence = self.sequence
            self.seq_pub.publish(self.sequence.value)

            # Enum 기반 분기 처리
            if self.sequence == SequenceState.SLAM:
                self.handle_slam()
            elif self.sequence == SequenceState.IDLE:
                self.handle_idle()
            elif self.sequence == SequenceState.LANE_FOLLOWING:
                self.handle_lane_following()
            elif self.sequence == SequenceState.LANE_OBSTACLE:
                self.handle_lane_obstacle()
            elif self.sequence == SequenceState.STATIC_OBSTACLE:
                self.handle_static_obstacle()
            elif self.sequence == SequenceState.DYNAMIC_OBSTACLE:
                self.handle_dynamic_obstacle()
            elif self.sequence == SequenceState.TRAFFIC_LIGHT:
                self.handle_traffic_light()
            elif self.sequence == SequenceState.TRAFFIC_LIGHT_GO:
                self.handle_traffic_light_go()
            elif self.sequence == SequenceState.TURN_LEFT:
                self.handle_turn_left()
            elif self.sequence == SequenceState.TURN_RIGHT:
                self.handle_turn_right()
            elif self.sequence == SequenceState.ROTARY:
                self.handle_rotary()
            elif self.sequence == SequenceState.ROTARY_ENTRY:
                self.handle_rotary_entry()
            elif self.sequence == SequenceState.ROTARY_OUT:
                self.handle_rotary_out()
            elif self.sequence == SequenceState.FORCED_STRAIGHT:
                self.handle_forced_straight()
            else:
                rospy.logwarn_throttle(5.0, f"[SequenceManager] 알 수 없는 시퀀스: {self.sequence}")

            if self.hardcode_active and self.sequence == SequenceState.STATIC_OBSTACLE:
                self._apply_hardcode()

            self.rate.sleep()

    #--------------------각 시퀀스 별 처리 함수--------------------

    def handle_slam(self):
        rospy.loginfo_throttle(5.0, "[SequenceManager] SLAM 진행 중...")

    def handle_idle(self):
        rospy.loginfo_throttle(5.0, "[SequenceManager] 대기 상태입니다.")

    def handle_lane_following(self):
        rospy.loginfo_throttle(2.0, "[SequenceManager] 차선 추종 중... : 기본값")
        self.speed_pub.publish(Float64(self.speed_default))
        self.steer_pub.publish(self.lane_steer)
        self.mode_pub.publish(Float64(0.0))

    def handle_lane_obstacle(self):
        rospy.loginfo_throttle(2.0, "[SequenceManager] 차선 추종 중... : 장애물 코스")
        self.speed_pub.publish(Float64(self.speed_obstacle))
        self.steer_pub.publish(self.lane_steer)
        self.mode_pub.publish(Float64(0.0))
        if len(self.dynamic_stop_queue) == self.dynamic_stop_queue_size and False not in self.dynamic_stop_queue:
            rospy.loginfo(f"{self.dynamic_stop_queue}")
            self.sequence = SequenceState.DYNAMIC_OBSTACLE
        elif self.static_dist < 0.75 and self.obstacle_on_lane:
            self.static_avoid = True
            self.sequence = SequenceState.STATIC_OBSTACLE

    def handle_static_obstacle(self):
        rospy.loginfo_throttle(2.0, "[SequenceManager] 정적 장애물 회피 중...")
        if self.static_avoid == True:
            if not self.hardcode_active:
                if self.static_step == 0:
                    self.start_hardcode(0.34, 0.0, 1600)
                elif self.static_step == 1:
                    self.start_hardcode(0.68, 1.0, 1600)
                elif self.static_step == 2:
                    self.start_hardcode(0.14, 0.0, 1600)
                else:
                    self.static_avoid = False
                    self.static_dist = 0
                    self.static_step = 0
                    self.change_sequence_after(0.0, SequenceState.LANE_OBSTACLE)

    def handle_dynamic_obstacle(self):
        rospy.loginfo_throttle(2.0, "[SequenceManager] 동적 장애물 회피 중...")
        self.speed_pub.publish(Float64(0.))
        self.steer_pub.publish(Float64(0.5))
        self.change_sequence_after(2.0, SequenceState.LANE_OBSTACLE)

    def handle_traffic_light(self):
        rospy.loginfo_throttle(2.0, "[SequenceManager] 신호등 미션 차선 대기...")
        if self.lane_stopline:
            self.mode_pub.publish(Float64(0.0))
            self.steer_pub.publish(Float64(0.5))
            self.speed_pub.publish(Float64(0.0))
            if not self.traffic_is_stop:
                self.change_sequence_after(0.5, SequenceState.TRAFFIC_LIGHT_GO)
        else:
            self.mode_pub.publish(Float64(0.0))
            self.steer_pub.publish(Float64(self.lane_steer))
            self.speed_pub.publish(Float64(self.speed_slow)) 
                
    def handle_traffic_light_go(self):
        rospy.loginfo_throttle(2.0, "[SequenceManager] 신호등 미션 : 좌회전")
        self.mode_pub.publish(Float64(-1.0))
        self.speed_pub.publish(Float64(self.speed_default))
        self.steer_pub.publish(Float64(self.lane_steer))
        self.change_sequence_after(2.5, SequenceState.TURN_RIGHT)
            
    def handle_turn_left(self):
        rospy.loginfo_throttle(2.0, "[SequenceManager] 차선 추종 중... : 좌편향")
        self.mode_pub.publish(Float64(-1.0))
        self.speed_pub.publish(Float64(self.speed_turn))
        self.steer_pub.publish(self.lane_steer)

    def handle_turn_right(self):
        rospy.loginfo_throttle(2.0, "[SequenceManager] 차선 추종 중... : 우편향")
        self.mode_pub.publish(Float64(1.0))
        self.speed_pub.publish(Float64(self.speed_turn + 250))
        self.steer_pub.publish(self.lane_steer)
        if self.forced_once:
            self.change_sequence_after(9.2, SequenceState.FORCED_STRAIGHT)
            self.forced_once = False
        
    def handle_rotary(self):
        self.wall_cnt = 99999
        rospy.loginfo_throttle(2.0, "[SequenceManager] 로타리 미션 중...")
        # if self.lane_stopline:
        #     self.stopline_once = True
        # else:
        #     self.mode_pub.publish(Float64(-1.0))
        #     self.speed_pub.publish(Float64(self.speed_rotary))
        #     self.steer_pub.publish(Float64(self.lane_steer))
            
        # if self.stopline_once:
        #     if self.rotary_enter:
        #         self.state_started_at = rospy.get_time()
        #         self.sequence = SequenceState.ROTARY_ENTRY
        #     else:
        #         self.speed_pub.publish(Float64(0.))
        #         self.steer_pub.publish(Float64(0.5))
                
        ###
        
        if self.lane_stopline:
            self.mode_pub.publish(Float64(0.0))
            self.speed_pub.publish(Float64(0.0))
            self.steer_pub.publish(Float64(0.5))
            if self.rotary_enter:
                if self.rotary_wait_once:
                    self.change_sequence_after(0.5, SequenceState.ROTARY_ENTRY)
                    self.rotary_wait_once = False
        else:
            self.mode_pub.publish(Float64(-1.0))
            self.speed_pub.publish(Float64(self.speed_rotary))
            self.steer_pub.publish(Float64(self.lane_steer))
        
    def handle_rotary_entry(self):
        t = rospy.get_time() - self.state_started_at
        n = float(self.rotary_entry_speed)

        self.mode_pub.publish(Float64(1.0))

        if t < self.rotary_entry_forward_time:
            # 1단계: 직진
            self.speed_pub.publish(Float64(n))
            self.steer_pub.publish(Float64(0.5))
            rospy.loginfo_throttle(0.5, "[SequenceManager] ROTARY_ENTRY: 직진 단계")
        elif t < self.rotary_entry_forward_time + self.rotary_entry_turn_time:
            # 2단계: 조향 1.0 유지하며 전진
            self.speed_pub.publish(Float64(n))
            self.steer_pub.publish(Float64(self.rotary_entry_steer))
            rospy.loginfo_throttle(0.5, "[SequenceManager] ROTARY_ENTRY: 회전 단계")
        else:
            # 완료 → 본 로터리 시퀀스로 진입
            rospy.loginfo("[SequenceManager] ROTARY_ENTRY 완료 → ROTARY 전환")
            self.rotary_out_once = True
            self.sequence = SequenceState.ROTARY_OUT
            
    def handle_rotary_out(self):
        self.mode_pub.publish(Float64(1.0))
        self.speed_pub.publish(Float64(self.speed_rotary_out))
        self.steer_pub.publish(Float64(self.lane_steer))
        if self.rotary_out_once:
            self.change_sequence_after(6.0, SequenceState.TRAFFIC_LIGHT)
            self.rotary_out_once = False
            
    def handle_forced_straight(self):
        self.mode_pub.publish(Float64(1.0))
        self.speed_pub.publish(Float64(self.speed_turn+100))
        self.steer_pub.publish(Float64(0.5))
        self.change_sequence_after(2.5, SequenceState.TURN_RIGHT)


if __name__ == "__main__":
    try:
        SequenceManager()
    except rospy.ROSInterruptException:
        pass
