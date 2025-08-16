#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import math
import numpy as np
import rospy
import tf
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
        self.stop_trigger_dist  = float(rospy.get_param("~stop_trigger_dist", 3.0))
        self.engage_dist_static = float(rospy.get_param("~engage_dist_static", 2.5))
        self.near_y_min         = float(rospy.get_param("~near_y_min", 0.2))
        self.first_lane         = bool(rospy.get_param("~first_lane", True))
        self.max_steer_rad      = float(rospy.get_param("~max_steer_rad", math.pi/6.0))
        self.ignore_first_secs  = float(rospy.get_param("~ignore_first_secs", 1.0))

        # dynamic obstacle params
        self.dynamic_center_x    = float(rospy.get_param("~dynamic_center_x",   2.0))
        self.dynamic_engage_dist = float(rospy.get_param("~dynamic_engage_dist",2.0))
        self.dynamic_clear_left  = float(rospy.get_param("~dynamic_clear_left", 0.25))
        self.dynamic_clear_right = float(rospy.get_param("~dynamic_clear_right",-0.65))

        self.cmd_speed_topic = rospy.get_param("~cmd_speed_topic", "/commands/motor/speed")
        self.cmd_steer_topic = rospy.get_param("~cmd_steer_topic", "/commands/servo/position")

        # ===== Publishers =====
        # self.cmd_speed_pub = rospy.Publisher(self.cmd_speed_topic, Float64, queue_size=1)
        # self.cmd_steer_pub = rospy.Publisher(self.cmd_steer_topic, Float64, queue_size=1)
        self.static_done_pub = rospy.Publisher("/sequence/static_done", Bool, queue_size=1)
        self.dynamic_stop_pub = rospy.Publisher("/dynamic/stop", Bool, queue_size=1)
        self.dynamic_done_pub = rospy.Publisher("/sequence/dynamic_done", Bool, queue_size=1)
        self.state_pub = rospy.Publisher("/obstacle_controller/state", String, queue_size=1)

        self.static_speed_pub = rospy.Publisher("/static/speed", Float64, queue_size=1)
        self.static_steer_pub = rospy.Publisher("/static/steer", Float64, queue_size=1)

        # ===== Subscribers =====
        rospy.Subscriber("/odometry/filtered", Odometry, self.odom_cb, queue_size=1)
        rospy.Subscriber("/obstacle_information", ObstacleInfoArray, self.obst_cb, queue_size=1)
        # (옵션) 카메라에서 lane_steer 받는 토픽
        # rospy.Subscriber("/lane_steer", Float64, self.lane_steer_cb, queue_size=1)

        # ===== Internal states =====
        self.now_orientation = None
        self.last_obst_time  = None
        self.start_time      = rospy.Time.now()

        # StaticObstacle 로직 변수
        self.avoid_state = -1
        self.lane_steer = 0.5
        self.straight_yaw = 0
        self.one_line = False
        self.yellow_lane_detected = False
        self.front_obstacle_detected = False
        self.narrow_front_obstacle_detected = False
        self.narrow_front2_obstacle_detected = False
        self.narrow_front3_obstacle_detected = False
        self.far_front_obstacle_detected = False
        self.front_obstacle_distance = -1

        # dynamic 관련
        self.type = "NONE"
        self.typeQueue = []
        self.typeThreshold = 5
        self.dynamic_active = False

        # control outputs
        self.latest_cmd_speed = self.LANE_DRIVE_VEL
        self.latest_cmd_steer = self.base_servo_center
        self.latest_state_str = "CRUISE"

        rate = float(rospy.get_param("~rate", 20.0))
        self.ctrl_timer = rospy.Timer(rospy.Duration(1.0 / rate), self.run)

    # ---------- Utils ----------
    def odom_cb(self, msg: Odometry):
        self.now_orientation = msg.pose.pose.orientation

    def get_yaw(self):
        if self.now_orientation is None:
            return None
        q = self.now_orientation
        e = tf.transformations.euler_from_quaternion([q.x, q.y, q.z, q.w])
        return e[2]

    def mapping01(self, value, from_min=None, from_max=None, to_min=0.0, to_max=1.0):
        if from_min is None: from_min = self.map_from_min
        if from_max is None: from_max = self.map_from_max
        v = max(from_min, min(from_max, value))
        return ((v - from_min) / (from_max - from_min)) * (to_max - to_min) + to_min

    # ---------- Obstacle handling ----------
    def obst_cb(self, msg: ObstacleInfoArray):
        self.last_obst_time = rospy.Time.now()
        if not msg.obstacles:
            self.type = "NONE"
            return

        dists = np.array([math.hypot(o.x, o.y) for o in msg.obstacles])
        idx = int(np.argmin(dists))
        info = msg.obstacles[idx]
        dist = max(0.0, dists[idx] - 0.21)

        if dist >= self.dynamic_engage_dist:
            self.type = "NONE"
            return

        is_dyn = bool(getattr(info, "is_dynamic", False))
        new_type = "DYNAMIC" if is_dyn else "STATIC"
        self.typeQueue.append(new_type)

        if len(self.typeQueue) > self.typeThreshold:
            self.typeQueue.pop(0)

        dynamic_cnt = self.typeQueue.count("DYNAMIC")
        static_cnt = self.typeQueue.count("STATIC")
        if dynamic_cnt >= 1:
            self.type = "DYNAMIC"
        elif static_cnt >= 2:
            self.type = "STATIC"
        else:
            self.type = "NONE"

        if self.type == "STATIC":
            self.handle_static(info, dist)

    def handle_static(self, info, dist):
        yaw = self.get_yaw()
        if yaw is None:
            return

        if self.avoid_state == -1:
            self.straight_yaw = yaw

        # 장애물 감지 플래그 설정 (StaticObstacle lidar_callback 단순화)
        self.front_obstacle_detected = (dist <= 1.3)
        self.front_obstacle_distance = dist if self.front_obstacle_detected else -1
        self.narrow_front_obstacle_detected = (1.3 < dist < 1.4)
        self.narrow_front2_obstacle_detected = (1.2 < dist < 1.4)
        self.narrow_front3_obstacle_detected = (0 < dist < 1.4 and info.x > 0)
        self.far_front_obstacle_detected = (6 < dist < 10)

    # ---------- StaticObstacle Avoid Logic ----------
    def avoid(self):
        yaw = self.get_yaw()
        if yaw is None:
            return

        if self.avoid_state == -1:
            if self.one_line:
                if (self.narrow_front2_obstacle_detected or self.narrow_front3_obstacle_detected) \
                        and abs(self.straight_yaw - yaw) <= 0.1:
                    self.avoid_state = 0
                    self.latest_cmd_steer = 0.3
                    self.one_line = False
                else:
                    self.latest_cmd_steer = self.lane_steer
            else:
                if not self.narrow_front_obstacle_detected and abs(self.straight_yaw - yaw) < 0.1:
                    self.latest_cmd_steer = self.lane_steer
                    self.avoid_state = -1
                    self.one_line = True
                elif self.front_obstacle_detected:
                    self.avoid_state = 0
                    self.latest_cmd_steer = 0.3

        elif self.avoid_state == 0:
            self.latest_cmd_speed = 1200
            if 0 < self.front_obstacle_distance < 1.5:
                self.latest_cmd_steer = min(self.front_obstacle_distance ** 2 * 0.15, 0.3)
            if self.straight_yaw - yaw > 0.1:
                if self.yellow_lane_detected:
                    self.latest_cmd_steer = self.lane_steer
                elif abs(self.straight_yaw - yaw) > 0.13:
                    self.latest_cmd_steer = 0.4
            # front_right_obstacle_detected 로직은 필요시 추가
            self.avoid_state = 1

        elif self.avoid_state == 1:
            if abs(self.straight_yaw - yaw) > 0.1:
                self.latest_cmd_steer = 1
            else:
                self.latest_cmd_steer = 0.8
                self.avoid_state = 2

        elif self.avoid_state == 2:
            # back_right_obstacle_detected 조건 필요시 추가
            if abs(self.straight_yaw - yaw) > 0.08:
                self.avoid_state = 3

        elif self.avoid_state == 3:
            self.latest_cmd_steer = 0.2
            self.avoid_state = -1  # 복귀 완료

    # ---------- Control loop ----------
    def run(self, _evt):
        if self.type == "STATIC":
            self.avoid()
            self.static_speed_pub.publish(Float64(self.latest_cmd_speed))
            self.static_steer_pub.publish(Float64(self.latest_cmd_steer))
        else:
            # 장애물 없을 때도 기본 주행값 계속 발행
            self.latest_cmd_speed = self.LANE_DRIVE_VEL
            self.latest_cmd_steer = self.lane_steer
            self.static_speed_pub.publish(Float64(self.latest_cmd_speed))
            self.static_steer_pub.publish(Float64(self.latest_cmd_steer))

    # def publish_cmd(self, speed, steer):
    #     self.cmd_speed_pub.publish(Float64(speed))
    #     self.cmd_steer_pub.publish(Float64(steer))

if __name__ == "__main__":
    ObstacleController()
    rospy.spin()
