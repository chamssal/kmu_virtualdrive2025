#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import numpy as np
from math import isfinite

from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from sensor_msgs.msg import LaserScan

# 메시지 별칭으로 충돌 방지
from obstacle_detect.msg import Rotary as RotaryMsg, RotaryArray
from obstacle_detect.msg import LidarObstacleInfo, LidarObstacleInfoArray
from obstacle_detector.msg import Obstacles, CircleObstacle

class RotaryDetectorNode:
    def __init__(self):
        rospy.init_node("rotary_obstacle", anonymous=False)

        # Params
        self.front_deg_min = np.deg2rad(-115.0)
        self.front_deg_max = np.deg2rad(+115.0)
        self.max_dist      = rospy.get_param("~max_dist", 2.5)   # m
        self.max_gap_deg   = rospy.get_param("~max_gap_deg", 8.0) # deg, 클러스터 이어붙이기 허용 간격
        self.min_cluster   = rospy.get_param("~min_cluster", 2)   # 최소 포인트 수
        self.max_cluster   = rospy.get_param("~max_cluster", 40)  # 최대 포인트 수

        # Subs/Pubs
        rospy.Subscriber("/lidar2D", LaserScan, self.callback, queue_size=1)
        self.obstacle_pub = rospy.Publisher("/lidar_obstacle_information", LidarObstacleInfoArray, queue_size=10)
        self.rotary_pub   = rospy.Publisher("/rotary_info", RotaryArray, queue_size=10)
        self.marker_pub   = rospy.Publisher("/visualization_marker", Marker, queue_size=10)
        self.circle_pub   = rospy.Publisher("/obstacles", Obstacles, queue_size=10)  # obstacle_detector용

        rospy.loginfo("[rotary_obstacle] ready")

    def callback(self, scan: LaserScan):
        ranges = scan.ranges
        n = len(ranges)
        ang_min = scan.angle_min
        ang_inc = scan.angle_increment

        obstacle_arr = LidarObstacleInfoArray()

        # 클러스터링 상태 변수
        searching = False
        cluster_idx0 = -1
        prev_ang = None
        prev_r   = None
        count    = 0

        def finish_cluster(i_start, i_end):
            """클러스터 마감: 중앙 인덱스로 대표점 생성"""
            if i_start < 0 or i_end < 0:
                return
            size = (i_end - i_start + 1)
            if size < self.min_cluster or size > self.max_cluster:
                return
            mid = (i_start + i_end) // 2
            ang = ang_min + mid * ang_inc
            r   = ranges[mid]
            if not (isfinite(r) and r > scan.range_min and r < scan.range_max):
                return

            # 극좌표 -> base_link 좌표 (x: 전방, y: 좌측)
            x = r * np.cos(ang)
            y = r * np.sin(ang)

            info = LidarObstacleInfo(obst_x=float(x), obst_y=float(y))
            obstacle_arr.obstacle_infos.append(info)

        for i in range(n):
            r = ranges[i]
            if not (isfinite(r) and r > scan.range_min and r < scan.range_max):
                # 스캔 불량 → 클러스터 종료
                if searching:
                    finish_cluster(cluster_idx0, i-1)
                    searching = False
                continue

            ang = ang_min + i * ang_inc
            if ang < self.front_deg_min or ang > self.front_deg_max:
                # 전방 범위 외 → 클러스터 종료
                if searching:
                    finish_cluster(cluster_idx0, i-1)
                    searching = False
                continue

            if 0.0 <= r <= self.max_dist:
                if not searching:
                    # 새 클러스터 시작
                    searching = True
                    cluster_idx0 = i
                    count = 1
                else:
                    # 포인트 간 각도/거리 급변 여부 검사 (간단히 각도만)
                    gap_deg = abs((ang - prev_ang) * 180.0 / np.pi) if prev_ang is not None else 0.0
                    if gap_deg <= self.max_gap_deg:
                        count += 1
                    else:
                        # 이전 클러스터 마감 후 새로 시작
                        finish_cluster(cluster_idx0, i-1)
                        cluster_idx0 = i
                        count = 1
                prev_ang = ang
                prev_r   = r
            else:
                if searching:
                    finish_cluster(cluster_idx0, i-1)
                    searching = False
                    count = 0
                    prev_ang = None
                    prev_r   = None

        # 마지막 포인트가 클러스터 중이었으면 마감
        if searching:
            finish_cluster(cluster_idx0, n-1)

        # 1) 로우 레벨 장애물 정보 publish
        self.obstacle_pub.publish(obstacle_arr)

        # 2) 시각화 (Marker)
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
        marker.color.b = 1.0  # 파랑
        marker.color.r = marker.color.g = 0.0

        for info in obstacle_arr.obstacle_infos:
            marker.points.append(Point(x=info.obst_x, y=info.obst_y, z=0.0))

        self.marker_pub.publish(marker)

        # 3) RotaryArray 생성 (왼/오 구분)
        rot_arr = RotaryArray()
        if obstacle_arr.obstacle_infos:
            for info in obstacle_arr.obstacle_infos:
                x, y = info.obst_x, info.obst_y
                r = float(np.hypot(x, y))
                orient = ord('l') if y > 0 else ord('r')  # base_link에서 y>0 = 좌측
                rot = RotaryMsg(dis=r, orientation=orient)
                rot_arr.moving_cars.append(rot)
        else:
            rot_arr.moving_cars.append(RotaryMsg(dis=-10000.0, orientation=ord('n')))

        self.rotary_pub.publish(rot_arr)

        # 4) obstacle_detector 포맷 (원한다면)
        obst_msg = Obstacles()
        obst_msg.header.stamp = rospy.Time.now()
        obst_msg.header.frame_id = "base_link"
        for info in obstacle_arr.obstacle_infos:
            circ = CircleObstacle()
            circ.center.x = info.obst_x
            circ.center.y = info.obst_y
            circ.center.z = 0.0
            circ.radius   = 0.3
            obst_msg.circles.append(circ)
        self.circle_pub.publish(obst_msg)

def main():
    try:
        node = RotaryDetectorNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

if __name__ == "__main__":
    main()
