#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 반드시 navigation launch랑 같이 실행해야함

import rospy
import numpy as np
from math import isfinite
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Point
from visualization_msgs.msg import Marker
from obstacle_detect.msg import Rotary, RotaryArray, LidarObstacleInfo, LidarObstacleInfoArray
from obstacle_detector.msg import Obstacles, CircleObstacle
from std_msgs.msg import Bool

class RotaryDetectorNode:
    def __init__(self):
        rospy.init_node("rotary_obstacle", anonymous=False)

        # 파라미터
        self.front_deg_min = np.deg2rad(-70.0)
        self.front_deg_max = np.deg2rad(+50.0)
        self.max_dist      = rospy.get_param("~max_dist", 5.0)
        self.max_gap_deg   = rospy.get_param("~max_gap_deg", 8.0)
        self.min_cluster   = rospy.get_param("~min_cluster", 20)
        self.max_cluster   = rospy.get_param("~max_cluster", 60)

        # Subs / Pubs
        rospy.Subscriber("/scan", LaserScan, self.callback, queue_size=1)
        self.obstacle_pub = rospy.Publisher("/lidar_obstacle_information", LidarObstacleInfoArray, queue_size=10)
        self.rotary_pub   = rospy.Publisher("/rotary_info", RotaryArray, queue_size=10)
        self.marker_pub   = rospy.Publisher("/rotary_visualization_marker", Marker, queue_size=10)
        self.circle_pub   = rospy.Publisher("/obstacles", Obstacles, queue_size=10)
        self.enter_pub    = rospy.Publisher("/rotary/enter", Bool, queue_size=10)

        rospy.loginfo("[rotary_obstacle] ready")

    def callback(self, scan: LaserScan):
        ranges  = scan.ranges
        n       = len(ranges)
        ang_min = scan.angle_min
        ang_inc = scan.angle_increment

        obstacle_arr = LidarObstacleInfoArray()

        searching    = False
        cluster_idx0 = -1
        prev_ang     = None

        def finish_cluster(i_start, i_end):
            if i_start < 0 or i_end < 0:
                return
            size = (i_end - i_start + 1)
            if size < self.min_cluster or size > self.max_cluster:
                return
            mid = (i_start + i_end) // 2
            r   = ranges[mid]
            if not (isfinite(r) and scan.range_min < r < scan.range_max):
                return
            ang = ang_min + mid * ang_inc
            if ang < self.front_deg_min or ang > self.front_deg_max:
                return
            x = r * np.cos(ang); y = r * np.sin(ang)
            obstacle_arr.obstacle_infos.append(LidarObstacleInfo(obst_x=float(x), obst_y=float(y)))

        # 라이다 스캔 → 간단 클러스터링
        for i in range(n):
            r = ranges[i]
            if not (isfinite(r) and scan.range_min < r < scan.range_max):
                if searching:
                    finish_cluster(cluster_idx0, i-1); searching = False
                continue

            ang = ang_min + i * ang_inc
            if ang < self.front_deg_min or ang > self.front_deg_max:
                if searching:
                    finish_cluster(cluster_idx0, i-1); searching = False
                continue

            if 0.0 <= r <= self.max_dist:
                if not searching:
                    searching = True
                    cluster_idx0 = i
                else:
                    gap_deg = abs((ang - (prev_ang if prev_ang is not None else ang)) * 180.0 / np.pi)
                    if gap_deg > self.max_gap_deg:
                        finish_cluster(cluster_idx0, i-1)
                        cluster_idx0 = i
                prev_ang = ang
            else:
                if searching:
                    finish_cluster(cluster_idx0, i-1); searching = False; prev_ang = None

        if searching:
            finish_cluster(cluster_idx0, n-1)

        # 1) 커스텀 장애물 목록
        self.obstacle_pub.publish(obstacle_arr)

        # 3) RotaryArray + 최소거리 계산
        rot_arr  = RotaryArray()
        min_dist = float("inf")
        if obstacle_arr.obstacle_infos:
            for info in obstacle_arr.obstacle_infos:
                r = float(np.hypot(info.obst_x, info.obst_y))
                if r < min_dist:
                    min_dist = r
                orient = ord('l') if info.obst_y > 0 else ord('r')
                rot_arr.moving_cars.append(Rotary(dis=r, orientation=orient))
        else:
            rot_arr.moving_cars.append(Rotary(dis=-10000.0, orientation=ord('n')))
        self.rotary_pub.publish(rot_arr)

        # 4) obstacle_detector 호환 메시지
        obst_msg = Obstacles()
        obst_msg.header.stamp = rospy.Time.now()
        obst_msg.header.frame_id = "base_link"
        for info in obstacle_arr.obstacle_infos:
            c = CircleObstacle()
            c.center.x = info.obst_x; c.center.y = info.obst_y; c.center.z = 0.0
            c.radius = 0.3
            obst_msg.circles.append(c)
        self.circle_pub.publish(obst_msg)

        # 5) 회전교차로 진입 가능 여부
        enter_msg = Bool()
        if obstacle_arr.obstacle_infos:  # 장애물 감지 시
            enter_msg.data = (min_dist > 0.6)
        else:  # 처음 또는 감지 안 된 경우
            enter_msg.data = False
        self.enter_pub.publish(enter_msg)

        # 2) 시각화 마커 (enter 여부에 따른 색상)
        marker = Marker()
        marker.header.frame_id = "base_link"
        marker.header.stamp = rospy.Time.now()
        marker.ns = "lidar_obstacles"
        marker.id = 0
        marker.type = Marker.SPHERE_LIST
        marker.action = Marker.ADD
        marker.pose.orientation.w = 1.0
        marker.scale.x = marker.scale.y = marker.scale.z = 0.2
        marker.color.a = 1.0

        if enter_msg.data:
            marker.color.r = 0.0
            marker.color.g = 0.0
            marker.color.b = 1.0  # 파란색
        else:
            marker.color.r = 1.0
            marker.color.g = 0.0
            marker.color.b = 0.0  # 빨간색

        for info in obstacle_arr.obstacle_infos:
            marker.points.append(Point(x=info.obst_x, y=info.obst_y, z=0.0))
        self.marker_pub.publish(marker)

        rospy.loginfo_throttle(
            1.0,
            f"[rotary_obstacle] clusters={len(obstacle_arr.obstacle_infos)} min_d={min_dist:.2f}m enter={enter_msg.data}"
        )

def main():
    RotaryDetectorNode()
    rospy.spin()  # 노드 유지

if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        pass
