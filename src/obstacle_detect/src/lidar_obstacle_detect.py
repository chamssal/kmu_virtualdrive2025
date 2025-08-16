#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy, numpy as np, math
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from sensor_msgs.msg import LaserScan
from obstacle_detect.msg import Rotary, RotaryArray, LidarObstacleInfo, LidarObstacleInfoArray
from obstacle_detector.msg import Obstacles, CircleObstacle
from std_msgs.msg import Header
from visualization_msgs.msg import Marker, MarkerArray

class LidarObstacle:
    def __init__(self):
        rospy.init_node("lidar_obstacle")

        # ---- 파라미터 ----
        self.fov_deg         = rospy.get_param("~fov_deg", 230.0)     
        self.max_range       = rospy.get_param("~max_range", 2.0)     
        self.min_range       = rospy.get_param("~min_range", 0.05)    
        self.min_cluster_pts = rospy.get_param("~min_cluster_pts", 2) 
        self.max_cluster_pts = rospy.get_param("~max_cluster_pts", 60) 
        self.gap_deg_limit   = rospy.get_param("~gap_deg_limit", 8.0)  
        self.range_jump_base = rospy.get_param("~range_jump_base", 0.15)
        self.range_jump_scale= rospy.get_param("~range_jump_scale", 0.10)
        
        """        
        original
        self.fov_deg         = rospy.get_param("~fov_deg", 230.0)     
        self.max_range       = rospy.get_param("~max_range", 4.0)     
        self.min_range       = rospy.get_param("~min_range", 0.05)    
        self.min_cluster_pts = rospy.get_param("~min_cluster_pts", 2) 
        self.max_cluster_pts = rospy.get_param("~max_cluster_pts", 60)
        self.gap_deg_limit   = rospy.get_param("~gap_deg_limit", 8.0)  
        self.range_jump_base = rospy.get_param("~range_jump_base", 0.15)
        self.range_jump_scale= rospy.get_param("~range_jump_scale", 0.10)
        """

        # ---- Pub/Sub ----
        rospy.Subscriber("/scan", LaserScan, self.callback, queue_size=1)
        self.marker_pub  = rospy.Publisher("/visualization_marker", Marker, queue_size=10)
        self.obstacle_pub= rospy.Publisher("/lidar_obstacle_information", LidarObstacleInfoArray, queue_size=10)
        self.rotary_pub  = rospy.Publisher("/rotary_info", RotaryArray, queue_size=10)
        self.circle_pub  = rospy.Publisher("/raw_obstacles", Obstacles, queue_size=10)  # 판단 노드가 원하면 이걸 input으로 사용
        self.marker_array_pub = rospy.Publisher("/lidar_obstacle_markers", MarkerArray, queue_size=10)  # ★ 추가

    def callback(self, msg: LaserScan):
        ranges = np.array(msg.ranges, dtype=float)
        n = len(ranges)
        angle_min, angle_inc = msg.angle_min, msg.angle_increment

        fov_half = math.radians(self.fov_deg * 0.5)
        gap_rad_limit = math.radians(self.gap_deg_limit)

        obstacle_arr = LidarObstacleInfoArray()
        is_open = False
        start_i = prev_i = None
        prev_r = None
        prev_th = None

        # def finalize_cluster(s_i, e_i):
        #     size = e_i - s_i + 1
        #     if size < self.min_cluster_pts or size > self.max_cluster_pts:
        #         return
        #     mid_i = (s_i + e_i) // 2
        #     mid_r = ranges[mid_i]
        #     if not np.isfinite(mid_r) or mid_r < self.min_range or mid_r > self.max_range:
        #         return
        #     mid_th = angle_min + mid_i * angle_inc
        #     # FOV 체크
        #     if abs(mid_th) > fov_half:
        #         return
        #     x = mid_r * math.cos(mid_th)
        #     y = mid_r * math.sin(mid_th)
        #     obstacle_arr.obstacle_infos.append(LidarObstacleInfo(obst_x=x, obst_y=y))
        
        
        def finalize_cluster(s_i, e_i):
            size = e_i - s_i + 1
            if size < self.min_cluster_pts or size > self.max_cluster_pts:
                return

            # 양 끝점 좌표와 span 계산
            r_s = ranges[s_i]; th_s = angle_min + s_i * angle_inc
            r_e = ranges[e_i]; th_e = angle_min + e_i * angle_inc
            if not (np.isfinite(r_s) and np.isfinite(r_e)):
                return
            xs, ys = r_s * math.cos(th_s), r_s * math.sin(th_s)
            xe, ye = r_e * math.cos(th_e), r_e * math.sin(th_e)
            span = math.hypot(xe - xs, ye - ys)

            if span >= 1.0: #0.5
                return
            mid_i = (s_i + e_i) // 2
            mid_r = ranges[mid_i]
            if not np.isfinite(mid_r) or mid_r < self.min_range or mid_r > self.max_range:
                return
            mid_th = angle_min + mid_i * angle_inc
            if abs(mid_th) > fov_half:
                return
            x = mid_r * math.cos(mid_th)
            y = mid_r * math.sin(mid_th)
            obstacle_arr.obstacle_infos.append(LidarObstacleInfo(obst_x=x, obst_y=y))

        for i in range(n):
            r = ranges[i]
            th = angle_min + i * angle_inc

            valid = (np.isfinite(r) and (self.min_range <= r <= self.max_range) and (abs(th) <= fov_half))

            if not valid:
                if is_open:
                    finalize_cluster(start_i, prev_i)
                    is_open = False
                continue

            if not is_open:
                is_open = True
                start_i = prev_i = i
                prev_r = r
                prev_th = th
            else:
                thr = self.range_jump_base + self.range_jump_scale * prev_r
                gap_ok = (abs(th - prev_th) <= gap_rad_limit)
                if abs(r - prev_r) < thr and gap_ok:
                    prev_i = i
                    prev_r = r
                    prev_th = th
                else:
                    finalize_cluster(start_i, prev_i)
                    is_open = True
                    start_i = prev_i = i
                    prev_r = r
                    prev_th = th
        if is_open:
            finalize_cluster(start_i, prev_i)
        self.obstacle_pub.publish(obstacle_arr)

        self.publish_markers(obstacle_arr)
        self.publish_rotary(obstacle_arr)
        self.publish_circles(obstacle_arr)
        rospy.loginfo_throttle(1.0, f"[lidar_obstacle] clusters={len(obstacle_arr.obstacle_infos)}")

    def publish_markers(self, obstacle_arr):
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
        marker.color.r = 0.0
        marker.color.g = 0.0
        marker.color.b = 1.0
        for info in obstacle_arr.obstacle_infos:
            p = Point(x=info.obst_x, y=info.obst_y, z=0.0)
            marker.points.append(p)
        self.marker_pub.publish(marker)

    def publish_rotary(self, obstacle_arr):
        infos = RotaryArray()
        if obstacle_arr.obstacle_infos:
            for info in obstacle_arr.obstacle_infos:
                r = Rotary()
                r.dis = math.hypot(info.obst_x, info.obst_y)
                r.orientation = ord('l') if info.obst_x < 0 else ord('r')
                infos.moving_cars.append(r)
        else:
            infos.moving_cars.append(Rotary(dis=-10000, orientation=ord('n')))
        self.rotary_pub.publish(infos)

    def publish_circles(self, obstacle_arr):
        msg = Obstacles()
        msg.header = Header(stamp=rospy.Time.now(), frame_id="base_link")
        for info in obstacle_arr.obstacle_infos:
            c = CircleObstacle()
            c.center.x, c.center.y, c.center.z = info.obst_x, info.obst_y, 0.0
            c.radius = 0.3
            c.velocity.x = 0.0
            c.velocity.y = 0.0
            msg.circles.append(c)
        self.circle_pub.publish(msg)
        
    def publish_lidar_info_markers(self, obstacle_arr):
        """
        /lidar_obstacle_information (LidarObstacleInfoArray)을
        RViz MarkerArray로 예쁘게 시각화.
        - 파란 점(SPHERE_LIST): 클러스터 중심
        - 회색 선(LINE_LIST): 원점(0,0) → 장애물
        - 흰색 텍스트(TEXT_VIEW_FACING): 인덱스와 좌표, 거리
        RViz에서 'MarkerArray'로 /lidar_obstacle_markers 구독하면 보임.
        """
        ma = MarkerArray()
        now = rospy.Time.now()
        frame = "base_link"

        # (A) 점들: SPHERE_LIST 하나로 모두
        pts = Marker()
        pts.header.frame_id = frame
        pts.header.stamp = now
        pts.ns = "lidar_pts"
        pts.id = 0
        pts.type = Marker.SPHERE_LIST
        pts.action = Marker.ADD
        pts.pose.orientation.w = 1.0
        pts.scale.x = pts.scale.y = pts.scale.z = 0.18  # 점 크기
        pts.color.a = 1.0
        pts.color.r = 0.1
        pts.color.g = 0.4
        pts.color.b = 1.0   # 파란 느낌

        # (B) 선들: LINE_LIST로 원점↔장애물 연결
        lines = Marker()
        lines.header.frame_id = frame
        lines.header.stamp = now
        lines.ns = "lidar_rays"
        lines.id = 1
        lines.type = Marker.LINE_LIST
        lines.action = Marker.ADD
        lines.pose.orientation.w = 1.0
        lines.scale.x = 0.02  # 선 굵기
        lines.color.a = 0.8
        lines.color.r = 0.7
        lines.color.g = 0.7
        lines.color.b = 0.7   # 회색

        # (C) 텍스트: 각 점마다 TEXT_VIEW_FACING
        text_id_base = 1000
        text_scale = 0.18

        # 데이터 채우기
        for i, info in enumerate(obstacle_arr.obstacle_infos):
            x = float(info.obst_x)
            y = float(info.obst_y)
            d = math.hypot(x, y)

            # 점
            p = Point(x=x, y=y, z=0.0)
            pts.points.append(p)

            # 선 (원점 → 점)
            lines.points.append(Point(x=0.0, y=0.0, z=0.0))
            lines.points.append(p)

            # 텍스트
            txt = Marker()
            txt.header.frame_id = frame
            txt.header.stamp = now
            txt.ns = "lidar_text"
            txt.id = text_id_base + i
            txt.type = Marker.TEXT_VIEW_FACING
            txt.action = Marker.ADD
            txt.pose.position.x = x
            txt.pose.position.y = y
            txt.pose.position.z = 0.25  # 점 위에
            txt.scale.z = text_scale
            txt.color.a = 1.0
            txt.color.r = 1.0
            txt.color.g = 1.0
            txt.color.b = 1.0
            txt.text = f"{i}: ({x:.2f},{y:.2f}) d={d:.2f}m"
            ma.markers.append(txt)

        # SPHERE_LIST / LINE_LIST 추가
        ma.markers.append(pts)
        ma.markers.append(lines)

        # 퍼블리시
        self.marker_array_pub.publish(ma)


def main():
    try:
        _ = LidarObstacle()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

if __name__ == "__main__":
    main()
