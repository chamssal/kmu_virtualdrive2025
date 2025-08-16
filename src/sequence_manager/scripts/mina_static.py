#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy, math
from obstacle_detect.msg import LidarObstacleInfoArray
from std_msgs.msg import Float64, Bool

class StaticObstacleAvoidance:
    def __init__(self):
        rospy.init_node("static_obstacle_controller")

        # === 파라미터 ===
        self.safe_distance = rospy.get_param("~safe_distance", 1.5)   # 장애물 감지 거리
        self.lane_width    = rospy.get_param("~lane_width", 1.0)     # 차선 간격
        self.default_speed = rospy.get_param("~default_speed", 1000)
        self.avoid_speed   = rospy.get_param("~avoid_speed", 800)
        self.default_steer = rospy.get_param("~default_steer", 0.5)  # 직진
        self.steer_gain    = rospy.get_param("~steer_gain", 0.4)     # 차선 변경 강도

        # === Publisher ===
        self.speed_pub = rospy.Publisher("/static/speed", Float64, queue_size=1)
        self.steer_pub = rospy.Publisher("/static/steer", Float64, queue_size=1)
        self.done_pub  = rospy.Publisher("/sequence/static_done", Bool, queue_size=1)

        # === Subscriber ===
        rospy.Subscriber("/lidar_obstacle_information", LidarObstacleInfoArray, self.obstacle_cb, queue_size=1)

        # 상태 변수
        self.on_left_lane = False  # True=1차선, False=2차선(기본)

        rospy.loginfo("[StaticObstacleController] 노드 시작")
        rospy.spin()

    def obstacle_cb(self, msg: LidarObstacleInfoArray):
        # 기본값
        speed_cmd = self.default_speed
        steer_cmd = self.default_steer

        # 장애물 감지
        obs_in_lane2 = False
        obs_in_lane1 = False
        for obs in msg.obstacle_infos:
            d = math.hypot(obs.obst_x, obs.obst_y)
            y = obs.obst_y
            if d < self.safe_distance:
                if abs(y) < self.lane_width * 0.5:
                    obs_in_lane2 = True
                elif y > self.lane_width * 0.5:
                    obs_in_lane1 = True

        # === FSM 로직 ===
        if not self.on_left_lane:
            # 현재 2차선 주행 중
            if obs_in_lane2:
                # 장애물 발견 → 1차선으로 이동
                rospy.loginfo("[StaticObstacleController] 2차선 장애물 → 1차선 회피")
                steer_cmd = self.default_steer - self.steer_gain
                speed_cmd = self.avoid_speed
                self.on_left_lane = True
            else:
                # 평상시 직진
                steer_cmd = self.default_steer
                speed_cmd = self.default_speed

        else:
            # 현재 1차선 주행 중
            if obs_in_lane1 or not obs_in_lane2:
                # ① 1차선에 장애물이 있거나
                # ② 2차선이 깨끗하면
                # 무조건 2차선 복귀
                rospy.loginfo("[StaticObstacleController] 복귀 조건 만족 → 2차선 복귀")
                steer_cmd = self.default_steer + self.steer_gain
                speed_cmd = self.avoid_speed
                self.on_left_lane = False
            else:
                # 1차선 계속 유지
                steer_cmd = self.default_steer - self.steer_gain
                speed_cmd = self.avoid_speed

        # 퍼블리시
        self.speed_pub.publish(Float64(speed_cmd))
        self.steer_pub.publish(Float64(steer_cmd))

        # 미션 종료 신호: 장애물이 일정 시간 전혀 없을 때
        if not obs_in_lane1 and not obs_in_lane2:
            self.done_pub.publish(Bool(data=True))
        else:
            self.done_pub.publish(Bool(data=False))


if __name__ == "__main__":
    try:
        StaticObstacleAvoidance()
    except rospy.ROSInterruptException:
        pass
