#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import math
import numpy as np
import rospy
import tf
from collections import Counter

from std_msgs.msg import Float64, Bool, String
from nav_msgs.msg import Odometry
from obstacle_detect.msg import ObstacleInfoArray

class ObstacleController:
    def __init__(self):
        rospy.init_node("obstacle_controller")
        self.debug = rospy.get_param("~debug", True)

        # speed / steer scales
        self.LANE_DRIVE_VEL   = float(rospy.get_param("~lane_drive_vel_cmd", 50.0))
        self.OBST_VEL         = float(rospy.get_param("~obst_vel_cmd",        602.0))
        self.base_servo_center= float(rospy.get_param("~servo_center",        0.5))

        # steering rad -> [0..1] mapping range
        self.map_from_min = float(rospy.get_param("~map_from_min", -0.25992659995162515))
        self.map_from_max = float(rospy.get_param("~map_from_max",  0.25992659995162515))

        # distances / thresholds
        self.stop_trigger_dist  = float(rospy.get_param("~stop_trigger_dist", 3.0)) #1.2
        self.engage_dist_static = float(rospy.get_param("~engage_dist_static", 2.5)) #0.7
        self.near_y_min         = float(rospy.get_param("~near_y_min", 0.2))
        self.first_lane         = bool(rospy.get_param("~first_lane", True))
        self.max_steer_rad      = float(rospy.get_param("~max_steer_rad", math.pi/6.0))

        # 초기 감지 무시 시간(센서 워밍업 등)
        self.ignore_first_secs  = float(rospy.get_param("~ignore_first_secs", 1.0))

        # 동적 장애물 조건(간단)
        self.dynamic_center_x    = float(rospy.get_param("~dynamic_center_x",   2.0)) # 0.25
        self.dynamic_engage_dist = float(rospy.get_param("~dynamic_engage_dist",2.0))  #1.2
        self.dynamic_clear_left  = float(rospy.get_param("~dynamic_clear_left", 0.25))
        self.dynamic_clear_right = float(rospy.get_param("~dynamic_clear_right",-0.65))

        self.cmd_speed_topic = rospy.get_param("~cmd_speed_topic", "/commands/motor/speed/fffffff")
        self.cmd_steer_topic = rospy.get_param("~cmd_steer_topic", "/commands/servo/position/fffffff")

        # ===== Publishers =====
        self.cmd_speed_pub = rospy.Publisher(self.cmd_speed_topic, Float64, queue_size=1)
        self.cmd_steer_pub = rospy.Publisher(self.cmd_steer_topic, Float64, queue_size=1)

        # 시퀀스 매니저 호환(원하면 같이 사용 가능)
        self.static_speed_pub  = rospy.Publisher("/static/speed",  Float64, queue_size=1)
        self.static_steer_pub  = rospy.Publisher("/static/steer",  Float64, queue_size=1)
        
        self.static_done_pub   = rospy.Publisher("/sequence/static_done",  Bool, queue_size=1)
        self.dynamic_done_pub  = rospy.Publisher("/sequence/dynamic_done", Bool, queue_size=1)
        
        self.dynamic_stop_pub = rospy.Publisher("/dynamic/stop", Bool, queue_size=1)
        self.static_dist_pub = rospy.Publisher("/static/dist", Float64, queue_size=1)
        
        self.state_pub = rospy.Publisher("/obstacle_controller/state", String, queue_size=1)

        # ===== Subscribers =====
        rospy.Subscriber("/odometry/filtered", Odometry, self.odom_cb, queue_size=1)
        rospy.Subscriber("/obstacle_information", ObstacleInfoArray, self.obst_cb, queue_size=1)

        # ===== States =====
        self.now_orientation = None
        self.last_obst_time  = None
        self.start_time      = rospy.Time.now()

        self.direction   = 0           
        self.obstacle_point = -1        
        self.move_left   = [0.0, 0.0, 0.0]
        self.move_right  = [0.0, 0.0, 0.0]
        self.return_ok   = False
        
        self.type = None
        self.typeQueue = []
        self.typeThreshold = 5

        self.dynamic_active = False
        self.latest_cmd_speed = self.LANE_DRIVE_VEL
        self.latest_cmd_steer = self.base_servo_center
        self.latest_state_str = "CRUISE"
        rate = float(rospy.get_param("~rate", 20.0))
        self.ctrl_timer = rospy.Timer(rospy.Duration(1.0 / rate), self.run)

        rospy.loginfo("[ObstacleController] direct publish -> %s , %s",
                      self.cmd_speed_topic, self.cmd_steer_topic)
        

    # ---------- Utils ----------
    def odom_cb(self, msg: Odometry):
        self.now_orientation = msg.pose.pose.orientation

    def get_yaw(self):
        if self.now_orientation is None:
            return None
        q = self.now_orientation
        e = tf.transformations.euler_from_quaternion([q.x, q.y, q.z, q.w])
        return e[2]

    def rotation_matrix(self, theta):
        return np.array([
            [np.cos(theta), -np.sin(theta), 0.0],
            [np.sin(theta),  np.cos(theta), 0.0],
            [0.0,            0.0,           1.0],
        ], dtype=np.float32)

    def mapping01(self, value, from_min=None, from_max=None, to_min=0.0, to_max=1.0):
        if from_min is None: from_min = self.map_from_min
        if from_max is None: from_max = self.map_from_max
        v = max(from_min, min(from_max, value))
        return ((v - from_min) / (from_max - from_min)) * (to_max - to_min) + to_min

    def report(self, ob_type="NONE", speed=None, steer=None, info=None, dist=None, extra=""):
        if speed is None:  speed = self.latest_cmd_speed
        if steer is None:  steer = self.latest_cmd_steer

        if info is None:
            # rospy.loginfo(f"[OBST] type={ob_type:7s}  speed={float(speed):.0f}  steer={float(steer):.3f}")
            return

        x, y = float(info.x), float(info.y)
        d = float(dist) if dist is not None else math.hypot(x, y)
        line = f"[OBST] type={ob_type:7s} x={x:.2f} y={y:.2f} d={d:.2f}  speed={float(speed):.0f}  steer={float(steer):.3f}"
        if extra:
            line += f" {extra}"
        rospy.loginfo(line)

    # 회피 시퀀스 생성 
    def static_obst(self, key, yaw, info):
        if key == 1:
            if self.obstacle_point == -1:
                rotated = self.rotation_matrix(yaw) @ np.array([[info.x, info.y, 1.0]], dtype=np.float32).T
                rot = rotated.T[0]; rot /= rot[2]
                tx, ty = rot[0], rot[1]
                tx = tx - 0.4
                self.move_left  = [0.0, -math.tan(tx/ty), 0.0]
                self.move_right = [0.0,  math.tan(tx/ty), 0.0]
        elif key == 2:
            if self.obstacle_point == -1:
                self.move_left  = [math.pi/2, (math.pi/3)*2, math.pi/2]
                self.move_right = [math.pi/2, (math.pi/3),   math.pi/2]
        elif key == 3:
            if self.obstacle_point == -1:
                self.move_left  = [math.pi, (math.pi/6)*5, math.pi]
                self.move_right = [math.pi, (math.pi/6)*7, math.pi]

    
    # ---------- Obstacle handling ----------
    def obst_cb(self, msg: ObstacleInfoArray):
        self.last_obst_time = rospy.Time.now()
        if not msg.obstacles:  
            self.type = "NONE"
            return
        dists = np.array([math.hypot(o.x, o.y) for o in msg.obstacles])
        idx = int(np.argmin(dists)) 
        info = msg.obstacles[idx] 
        dist = max(0.0, dists[idx] - 0.21) # 장애물과의 거리 0.21은 안전거리? 쯤으로 생각하시오
        
        if dist >= self.dynamic_engage_dist:
            self.type = "NONE"
            return

        is_dyn = bool(getattr(info, "is_dynamic", False))
        new_type = "NONE"
        if is_dyn:
            new_type = "DYNAMIC"
        else:
            new_type = "STATIC" 
            
        self.typeQueue.append(new_type)
        
        dynamic_cnt = 0
        static_cnt = 0
        if len(self.typeQueue) > self.typeThreshold:
            self.typeQueue.pop(0)        
        if len(self.typeQueue) == self.typeThreshold:
            dynamic_cnt = self.typeQueue.count("DYNAMIC")
            static_cnt = self.typeQueue.count("STATIC")
        else:
            self.type = "NONE"

        if dynamic_cnt >= 3:
            self.type = "DYNAMIC"
        elif static_cnt >= 3:
            self.type = "STATIC"
        else:
            self.type = "NONE"
        rospy.loginfo(f"[DEBUG] self.typeQueue is : {self.typeQueue}, {dynamic_cnt}, {static_cnt}, {len(self.typeQueue)}\n MYTYPE = {self.type}")
        
        if self.type == "DYNAMIC":
            self.dynamic_stop_pub.publish(Bool(True))
        else:
            self.dynamic_stop_pub.publish(Bool(False))
        if self.type == "STATIC":
            self.static_dist_pub.publish(Float64(dist))
        else:
            return
        
        

    def handle_dynamic(self, info, dist):
        if not self.dynamic_active:
            self.dynamic_done_pub.publish(Bool(data=False))
            self.dynamic_active = True
        speed_cmd = 0.0
        steer_cmd = self.base_servo_center
        if (info.x > self.dynamic_clear_left) or (info.x < self.dynamic_clear_right):
            self.dynamic_done_pub.publish(Bool(data=True))
            self.dynamic_active = False
            self.latest_state_str = "CRUISE(AFTER_DYNAMIC)"
            self.report("NONE", self.LANE_DRIVE_VEL, self.base_servo_center)
            return

        self.dynamic_speed_pub.publish(Float64(speed_cmd))
        self.dynamic_steer_pub.publish(Float64(steer_cmd))
        self.publish_cmd(speed_cmd, steer_cmd)
        self.latest_state_str = "DYNAMIC_WAIT"
        self.report("DYNAMIC", speed_cmd, steer_cmd, info, dist)

    def handle_static(self, info, dist):
        yaw = self.get_yaw()
        if self.obstacle_point > 0:
            rospy.logdebug("[STATIC] already handling, skipping new start")
            return

        if yaw is not None:
            ayaw = abs(yaw)
            if ayaw < math.pi/4:   self.direction = 1
            elif ayaw < 2.6:       self.direction = 2
            else:                  self.direction = 3
        else:
            self.latest_state_str = "CRUISE(NO_YAW)"
            return

        # 무시 조건
        angle = math.atan2(info.x, info.y)
        if info.y < self.near_y_min:
            self.latest_state_str = "CRUISE(NEAR_Y_IGN)"
            return
        if (not self.first_lane) and (angle < -math.pi/18.0):
            self.latest_state_str = "CRUISE(RIGHT_LANE_IGN)"
            return

        # 거리 조건
        if dist > self.stop_trigger_dist:
            self.latest_state_str = "CRUISE(FAR)"
            return
        if dist > self.engage_dist_static:
            self.latest_state_str = "CRUISE(KEEP)"
            return
        self.static_done_pub.publish(Bool(data=False))
        if self.obstacle_point == -1:
            self.static_obst(self.direction, abs(yaw), info)
            self.obstacle_point = 6
            self.return_ok = False
            self.latest_state_str = "STATIC_START"
            self.report("STATIC", self.OBST_VEL, self.base_servo_center, info, dist, extra=f"op={self.obstacle_point}")

    # ---------- Control loop ----------
    def run(self, _evt):
        # 기본: 장애물 없으면 크루즈(직진)
        speed_cmd = self.LANE_DRIVE_VEL
        steer_cmd = self.base_servo_center

        if self.obstacle_point >= 0:
            now_yaw = self.get_yaw()
            if now_yaw is None:
                return

            # 회피 시퀀스 진행
            if self.obstacle_point > 3:
                diff = self.move_left[self.obstacle_point % 3] - now_yaw
                if abs(diff) < (math.pi / 36.0):
                    self.obstacle_point -= 1
            elif self.return_ok:
                diff = self.move_right[self.obstacle_point % 3] - now_yaw
                if abs(diff) < (math.pi / 36.0):
                    self.obstacle_point -= 1
            else:
                diff = 0.0 - now_yaw

            steer_rad = float(np.clip(diff * 1.815, -self.max_steer_rad, self.max_steer_rad))
            steer_cmd = self.mapping01(steer_rad, self.map_from_min, self.map_from_max)
            speed_cmd = self.OBST_VEL

            self.static_speed_pub.publish(Float64(speed_cmd))
            self.static_steer_pub.publish(Float64(steer_cmd))
            self.publish_cmd(speed_cmd, steer_cmd)
            self.report("STATIC", speed_cmd, steer_cmd, info=None, dist=None, extra=f"op={self.obstacle_point}")

            if self.obstacle_point == -1:
                self.static_done_pub.publish(Bool(data=True))
                self.latest_state_str = "CRUISE(AFTER_STATIC)"
                self.report("NONE", self.LANE_DRIVE_VEL, self.base_servo_center)

        else:
            if not self.dynamic_active:
                self.publish_cmd(speed_cmd, steer_cmd)
                self.report("NONE", speed_cmd, steer_cmd)
        self.state_pub.publish(String(self.latest_state_str))

        # 최근 값 저장
        self.latest_cmd_speed = speed_cmd
        self.latest_cmd_steer = steer_cmd

    def publish_cmd(self, speed, steer):
        self.cmd_speed_pub.publish(Float64(speed))
        self.cmd_steer_pub.publish(Float64(steer))

if __name__ == "__main__":
    ObstacleController()
    rospy.spin()