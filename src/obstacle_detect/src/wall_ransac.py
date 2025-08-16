#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import math
import numpy as np
import rospy
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Bool, Float32MultiArray

def polar_to_xy(r, ang):
    return r * math.cos(ang), r * math.sin(ang)

def line_from_two_points(p, q):
    # 일반형 Ax + By + C = 0, (A^2 + B^2) = 1로 정규화
    x1, y1 = p; x2, y2 = q
    A = y1 - y2
    B = x2 - x1
    C = (x1 * y2) - (x2 * y1)
    norm = math.hypot(A, B)
    if norm < 1e-9:
        return None
    return (A / norm, B / norm, C / norm)

def point_line_distance(A, B, C, pts):
    return np.abs(A*pts[:,0] + B*pts[:,1] + C)

def ransac_line(points_xy, dist_thresh=0.03, iters=300, min_inliers=40, rng=None):
    if rng is None:
        rng = np.random.default_rng()
    N = points_xy.shape[0]
    if N < 2:
        return None, []

    best_model = None
    best_inliers = []

    for _ in range(iters):
        i1, i2 = rng.choice(N, size=2, replace=False)
        model = line_from_two_points(points_xy[i1], points_xy[i2])
        if model is None:
            continue
        A, B, C = model
        d = point_line_distance(A, B, C, points_xy)
        inliers = np.where(d <= dist_thresh)[0]
        if inliers.size > len(best_inliers):
            best_inliers = inliers
            best_model = model
            if inliers.size >= max(min_inliers*2, int(0.7*N)):
                break

    if best_model is None or len(best_inliers) < min_inliers:
        return None, []
    return best_model, best_inliers

class FrontWallDetector(object):
    def __init__(self):
        # 토픽/범위/FOV
        self.topic = rospy.get_param("~topic", "/scan")
        self.min_range = rospy.get_param("~min_range", 0.05)
        self.max_range = rospy.get_param("~max_range", 7.0)
        self.fov_deg   = rospy.get_param("~fov_deg",   180.0)  # 정면 ±60°

        # RANSAC 파라미터
        self.ransac_iters  = int(rospy.get_param("~ransac_iters", 100))
        self.inlier_thresh = rospy.get_param("~inlier_thresh", 0.03)  # m
        self.min_inliers   = int(rospy.get_param("~min_inliers", 40))

        # 각도 기반 판정: x축과 수직(= 방향각 ≈ 90°) 허용 오차 [deg]
        self.angle_tol_deg = rospy.get_param("~angle_tol_deg", 2.5)
        # 수학적으로는 |B| <= sin(delta) 또는 |A| >= cos(delta)
        self.sin_delta = math.sin(math.radians(self.angle_tol_deg))
        self.cos_delta = math.cos(math.radians(self.angle_tol_deg))

        # 전방 제한 (선택)
        self.front_x_min = rospy.get_param("~front_x_min", 0.0)
        self.front_x_max = rospy.get_param("~front_x_max", self.max_range)
        self.front_y_half_width = rospy.get_param("~front_y_half_width", 5.0)

        # Pub/Sub
        self.pub_detect = rospy.Publisher("front_wall_detected", Bool, queue_size=1)
        # 디버그: [direction_angle_deg, inlier_count, A, B]
        self.pub_angle  = rospy.Publisher("front_wall_angle", Float32MultiArray, queue_size=1)

        self.sub = rospy.Subscriber(self.topic, LaserScan, self.laser_cb, queue_size=1)
        self.rng = np.random.default_rng()

        rospy.loginfo("FrontWallDetector(angle-based) ready: angle_tol=±%.1f°, RANSAC iters=%d, thr=%.3f, min_inliers=%d",
                      self.angle_tol_deg, self.ransac_iters, self.inlier_thresh, self.min_inliers)

    def laser_cb(self, msg):
        half_fov = math.radians(self.fov_deg * 0.5)
        pts = []

        angle = msg.angle_min
        for r in msg.ranges:
            if math.isfinite(r) and (self.min_range <= r <= self.max_range) and (-half_fov <= angle <= half_fov):
                x, y = polar_to_xy(r, angle)
                if (self.front_x_min <= x <= self.front_x_max) and (abs(y) <= self.front_y_half_width):
                    pts.append((x, y))
            angle += msg.angle_increment

        if not pts:
            self.pub_detect.publish(Bool(data=False))
            return

        points_xy = np.asarray(pts, dtype=np.float32)

        model, inliers = ransac_line(points_xy,
                                     dist_thresh=self.inlier_thresh,
                                     iters=self.ransac_iters,
                                     min_inliers=self.min_inliers,
                                     rng=self.rng)
        if model is None:
            self.pub_detect.publish(Bool(data=False))
            # angle 디버그도 함께 발행 (NaN)
            self.pub_angle.publish(Float32MultiArray(data=[float('nan'), 0.0, float('nan'), float('nan')]))
            return

        A, B, C = model  # (정규화됨)

        # 방향 벡터 t = (-B, A), 방향각 θ = atan2(t_y, t_x) = atan2(A, -B) ∈ (-π, π]
        theta = math.atan2(A, -B)
        if theta < 0.0:
            theta += math.pi  # 0~π 로 정규화 (선 방향은 부호무관)

        theta_deg = math.degrees(theta)

        # 판정: x축과 ‘수직’(= 방향각 ≈ 90°)인지
        # 등가 조건: |B| <= sin(delta)  또는  |A| >= cos(delta)
        detected = (abs(B) <= self.sin_delta)  # 또는: abs(A) >= self.cos_delta

        self.pub_detect.publish(Bool(data=detected))
        dbg = Float32MultiArray()
        dbg.data = [theta_deg, float(len(inliers)), A, B]
        self.pub_angle.publish(dbg)

        rospy.loginfo_throttle(1.0,
            "[FrontWall-ANGLE] det=%s | θ=%.1f° (to x-axis) | inliers=%d | A=%.3f B=%.3f",
            str(detected), theta_deg, len(inliers), A, B
        )

def main():
    rospy.init_node("front_wall_detector_angle")
    FrontWallDetector()
    rospy.spin()

if __name__ == "__main__":
    main()
