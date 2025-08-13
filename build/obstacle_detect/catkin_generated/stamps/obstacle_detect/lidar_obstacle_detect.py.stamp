#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy, numpy as np, math
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from sensor_msgs.msg import LaserScan
from obstacle_detect.msg import Rotary, RotaryArray, LidarObstacleInfo, LidarObstacleInfoArray
from obstacle_detector.msg import Obstacles, CircleObstacle
from std_msgs.msg import Header

class LidarObstacle:
    def __init__(self):
        rospy.init_node("lidar_obstacle")

        # ---- 파라미터 (필요하면 launch에서 바꿔서 튜닝) ----
        self.fov_deg         = rospy.get_param("~fov_deg", 230.0)     # 사용 FOV
        self.max_range       = rospy.get_param("~max_range", 2.5)     # m
        self.min_range       = rospy.get_param("~min_range", 0.05)    # m
        self.min_cluster_pts = rospy.get_param("~min_cluster_pts", 2)
        self.max_cluster_pts = rospy.get_param("~max_cluster_pts", 60)
        self.gap_deg_limit   = rospy.get_param("~gap_deg_limit", 8.0) # 연속 인덱스 간 최대 각도 간격(도)
        # 거리 점프 임계값: thr = base + scale * prev_r
        self.range_jump_base = rospy.get_param("~range_jump_base", 0.15)
        self.range_jump_scale= rospy.get_param("~range_jump_scale", 0.10)

        # ---- Pub/Sub ----
        rospy.Subscriber("/scan", LaserScan, self.callback, queue_size=1)
        self.marker_pub  = rospy.Publisher("/visualization_marker", Marker, queue_size=10)
        self.obstacle_pub= rospy.Publisher("/lidar_obstacle_information", LidarObstacleInfoArray, queue_size=10)
        self.rotary_pub  = rospy.Publisher("/rotary_info", RotaryArray, queue_size=10)
        self.circle_pub  = rospy.Publisher("/raw_obstacles", Obstacles, queue_size=10)  # 판단 노드가 원하면 이걸 input으로 사용

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

        def finalize_cluster(s_i, e_i):
            size = e_i - s_i + 1
            if size < self.min_cluster_pts or size > self.max_cluster_pts:
                return
            mid_i = (s_i + e_i) // 2
            mid_r = ranges[mid_i]
            if not np.isfinite(mid_r) or mid_r < self.min_range or mid_r > self.max_range:
                return
            mid_th = angle_min + mid_i * angle_inc
            # FOV 체크
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

def main():
    try:
        _ = LidarObstacle()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

if __name__ == "__main__":
    main()
