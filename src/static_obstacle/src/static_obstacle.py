#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import math
import numpy as np
import rospy
import tf

from std_msgs.msg import Float64
from nav_msgs.msg import Odometry

# 장애물 메시지들
from obstacle_detect.msg import ObstacleInfoArray
from obstacle_detector.msg import Obstacles


class TotalStaticNoAMCL:
    def __init__(self):
        rospy.init_node("total_static_no_amcl")

        # ===== Params =====
        self.debug = rospy.get_param("~debug", True)

        # ESC/서보 명령 스케일(기존 Total과 동일)
        self.LANE_DRIVE_VEL = rospy.get_param("~lane_drive_vel_cmd", 1800.0)
        self.OBST_VEL       = rospy.get_param("~obst_vel_cmd",        602.0)
        self.base_servo_center = rospy.get_param("~servo_center", 0.5)

        # 조향 맵핑 범위(라디안 → 0..1)
        self.map_from_min = rospy.get_param("~map_from_min", -0.25992659995162515)
        self.map_from_max = rospy.get_param("~map_from_max",  0.25992659995162515)

        # 회피/판단 임계값(기존 Total 그대로)
        self.stop_trigger_dist  = rospy.get_param("~stop_trigger_dist", 1.2)  # 1.2m 이상이면 행동 안함
        self.engage_dist_static = rospy.get_param("~engage_dist_static", 0.7) # 0.7m 이내면 회피 착수
        self.near_y_min         = rospy.get_param("~near_y_min", 0.2)         # 너무 가까운 전방 무시
        self.first_lane         = rospy.get_param("~first_lane", True)        # 우측차선이면 False → angle< -pi/18 무시

        # 라디안 제한(안전)
        self.max_steer_rad = rospy.get_param("~max_steer_rad", math.pi/6.0)

        # ===== Publishers =====
        self.vel_pub   = rospy.Publisher("/commands/motor/speed", Float64, queue_size=1)
        self.steer_pub = rospy.Publisher("/commands/servo/position", Float64, queue_size=1)

        # ===== Subscribers =====
        rospy.Subscriber("/odometry/filtered", Odometry, self.odom_cb, queue_size=1)

        # obstacle_detect 쪽(두 이름 모두 지원)
        rospy.Subscriber("/lidar_obstacle_information", ObstacleInfoArray, self.obst_cb, queue_size=1)
        rospy.Subscriber("/obstacle_information",       ObstacleInfoArray, self.obst_cb, queue_size=1)

        # obstacle_detector(Clusters)
        rospy.Subscriber("/raw_obstacles", Obstacles, self.raw_obst_cb, queue_size=1)

        # ===== States =====
        self.now_orientation = None     # odom orientation만 사용
        self.last_odom_time  = None
        self.last_obst_time  = None

        self.direction   = 0           # 1:위, 2:왼, 3:아래 (Total 기준 분류)
        self.obstacle_point = -1       # -1=비활성, 6→…→0 진행
        self.move_left   = [0.0, 0.0, 0.0]
        self.move_right  = [0.0, 0.0, 0.0]
        self.return_ok   = False
        self.stop_flag   = False
        self.target_vel  = self.LANE_DRIVE_VEL

        # 타이머(제어/하트비트)
        rate = rospy.get_param("~rate", 20.0)
        self.ctrl_timer = rospy.Timer(rospy.Duration(1.0 / rate), self.run)
        self.hb_timer   = rospy.Timer(rospy.Duration(1.0), self.heartbeat)

        rospy.loginfo("[TotalStaticNoAMCL] ready. Waiting for /odometry/filtered and obstacle topics...")

    # ----------------- Utils -----------------
    def odom_cb(self, msg: Odometry):
        self.now_orientation = msg.pose.pose.orientation
        self.last_odom_time = rospy.Time.now()
        if self.debug:
            rospy.loginfo_throttle(5.0, "[TotalStaticNoAMCL] /odometry/filtered received")

    def get_yaw(self):
        if self.now_orientation is None:
            return None
        q = self.now_orientation
        euler = tf.transformations.euler_from_quaternion([q.x, q.y, q.z, q.w])
        return euler[2]  # yaw

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

    # ----------------- Total: 회피 시퀀스 생성 -----------------
    def static_obst(self, key, yaw, info):
        """key: 1(위), 2(왼), 3(아래) 방향별 목표 yaw 배열 생성 (Total 동일)"""
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

    # ----------------- 공통 처리 (x,y 한 쌍 → Total 정적 판단) -----------------
    def handle_xy_candidate(self, x, y):
        self.last_obst_time = rospy.Time.now()

        yaw = self.get_yaw()
        if yaw is None:
            rospy.logwarn_throttle(2.0, "[TotalStaticNoAMCL] waiting yaw from /odometry/filtered ...")
            return

        # 회피 시퀀스 중에는 판단 생략
        if self.obstacle_point > 0:
            return

        # Total: 가장 가까운 장애물로 가정하여 dist 계산(0.21m 여유)
        dist = max(0.0, math.hypot(x, y) - 0.21)

        # 진행방향 분류 (Total 동일)
        ayaw = abs(yaw)
        if ayaw < math.pi/4:   self.direction = 1
        elif ayaw < 2.6:       self.direction = 2
        else:                  self.direction = 3

        # 무시 조건(전방 너무 가까움 / 우측차선에서 오른쪽 각도)
        angle = math.atan2(x, y)
        if y < self.near_y_min:
            rospy.loginfo("[TotalStaticNoAMCL] ignore: too near in y (%.2f < %.2f)", y, self.near_y_min)
            return
        if (not self.first_lane) and (angle < -math.pi/18.0):
            self.stop_flag = False
            rospy.loginfo("[TotalStaticNoAMCL] ignore: not first_lane & angle %.2f < -pi/18", angle)
            return

        rospy.loginfo("[TotalStaticNoAMCL] Detected 1 candidates")
        rospy.loginfo("  dist=%.2f m, x=%.2f, y=%.2f", dist, x, y)

        # 거리 기반 행동 결정 (Total 동일)
        if dist > self.stop_trigger_dist:
            self.stop_flag = False
            rospy.loginfo("[TotalStaticNoAMCL] far (%.2f>%.2f) → no action", dist, self.stop_trigger_dist)
            return

        if dist > self.engage_dist_static:
            self.stop_flag = False
            rospy.loginfo("[TotalStaticNoAMCL] static or slow → keep moving (%.2f>%.2f)", dist, self.engage_dist_static)
            return

        # 착수
        self.stop_flag = True
        self.vel_pub.publish(Float64(0.0))
        rospy.loginfo("[TotalStaticNoAMCL] close → START BYPASS")

        if self.obstacle_point == -1:
            dummy = type("Info", (), {})()
            dummy.x, dummy.y = x, y
            self.static_obst(self.direction, ayaw, dummy)
            self.obstacle_point = 6
            self.target_vel = self.OBST_VEL
            self.stop_flag = False
            self.return_ok = False

    # ----------------- Subscribers: 두 타입 모두 처리 -----------------
    def obst_cb(self, msg: ObstacleInfoArray):
        """obstacle_detect/ObstacleInfoArray → 가장 가까운 항목 1개로 처리"""
        self.last_obst_time = rospy.Time.now()
        if self.obstacle_point > 0:
            return
        if not msg.obstacles:
            if self.obstacle_point == -1:
                self.return_ok = True
            rospy.loginfo_throttle(5.0, "[TotalStaticNoAMCL] no obstacles")
            return
        dists = np.array([math.hypot(o.x, o.y) for o in msg.obstacles])
        idx = int(np.argmin(dists))
        info = msg.obstacles[idx]
        self.handle_xy_candidate(info.x, info.y)

    def raw_obst_cb(self, msg: Obstacles):
        """obstacle_detector/Obstacles → circles/segments 대표 1개로 처리"""
        reps = []
        for c in msg.circles:
            fx, fy = c.center.x, c.center.y
            reps.append((math.hypot(fx, fy), fx, fy))
        for s in msg.segments:
            cx = 0.5 * (s.first_point.x + s.last_point.x)
            cy = 0.5 * (s.first_point.y + s.last_point.y)
            reps.append((math.hypot(cx, cy), cx, cy))
        if not reps:
            return
        reps.sort(key=lambda r: r[0])  # 거리 가까운 것 우선
        _, x, y = reps[0]
        self.handle_xy_candidate(x, y)

    # ----------------- Control Loop (Total: obstacle_point 시퀀스) -----------------
    def run(self, _evt):
        steering_cmd = self.base_servo_center

        if self.obstacle_point >= 0:
            now_yaw = self.get_yaw()
            if now_yaw is not None:
                if self.obstacle_point > 3:
                    diff = self.move_left[self.obstacle_point % 3] - now_yaw
                    if abs(diff) < (math.pi / 36.0):  # 약 5도
                        self.obstacle_point -= 1
                elif self.return_ok:
                    diff = self.move_right[self.obstacle_point % 3] - now_yaw
                    if abs(diff) < (math.pi / 36.0):
                        self.obstacle_point -= 1
                else:
                    diff = 0.0 - now_yaw

                steer_rad = np.clip(diff * 1.815, -self.max_steer_rad, self.max_steer_rad)
                steering_cmd = self.mapping01(steer_rad, self.map_from_min, self.map_from_max)

                if self.obstacle_point == -1:
                    self.target_vel = self.LANE_DRIVE_VEL

        if not self.stop_flag:
            self.vel_pub.publish(Float64(self.target_vel))
            self.steer_pub.publish(Float64(steering_cmd))
            rospy.loginfo_throttle(1.0, "[Publish] speed_cmd=%.0f, steer_cmd=%.3f", self.target_vel, steering_cmd)
        else:
            self.vel_pub.publish(Float64(0.0))
            self.steer_pub.publish(Float64(self.base_servo_center))
            rospy.loginfo_throttle(1.0, "[Publish] speed_cmd=0, steer_cmd=%.3f (hold)", self.base_servo_center)

    # ----------------- Heartbeat -----------------
    def heartbeat(self, _evt):
        if not self.debug:
            return
        now = rospy.Time.now()
        odom_age = (now - self.last_odom_time).to_sec() if self.last_odom_time else None
        obst_age = (now - self.last_obst_time).to_sec() if self.last_obst_time else None
        rospy.loginfo_throttle(
            1.0,
            "[HB] odom_age=%s, obst_age=%s, state: obstacle_point=%d, stop_flag=%s, target_vel=%.0f",
            f"{odom_age:.1f}s" if odom_age is not None else "None",
            f"{obst_age:.1f}s" if obst_age is not None else "None",
            self.obstacle_point, self.stop_flag, self.target_vel
        )


if __name__ == "__main__":
    TotalStaticNoAMCL()
    rospy.spin()
