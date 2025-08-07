#!/usr/bin/env python3
#-*-coding:utf-8-*-

import rospy
import numpy as np
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from sensor_msgs.msg import LaserScan
from obstacle_detect.msg import Rotary, RotaryArray
from obstacle_detect.msg import LidarObstacleInfo, LidarObstacleInfoArray
from bisect import bisect_left as lower_bound

from obstacle_detector.msg import Obstacles, CircleObstacle


class LidarObstacle:
    def __init__(self):
        rospy.init_node("lidar_obstacle")
        
        self.scan_msg = LaserScan()
        rospy.Subscriber("/scan", LaserScan, self.callback)  # sub 하는 토픽 바꾸지 마세요
        self.marker_pub = rospy.Publisher("/visualization_marker", Marker, queue_size=10)
        self.obstacle_pub = rospy.Publisher("/lidar_obstacle_information", LidarObstacleInfoArray, queue_size=10)
        self.rotary_pub = rospy.Publisher("/rotary_info", RotaryArray, queue_size=10)
        self.degrees = range(-180, 180)
        self.circle_pub = rospy.Publisher("/raw_obstacles", Obstacles, queue_size=10)

    def callback(self, msg: LaserScan):
        self.scan_msg = msg
        is_searching_obstacle = False

        obstacle_prev_deg = 0 
        obstacle_start_deg = 0

        obst_size = 0
        obstacle_arr = LidarObstacleInfoArray()
        #ranges = self.scan_msg.ranges[:180][::-1] + self.scan_msg.ranges[180:][::-1]
        ranges = msg.ranges  #
        for index, value in enumerate(ranges):
            if self.degrees[index] < -115 or self.degrees[index] > 115:
                continue

            if 0 <= value <= 2.5:
                if not is_searching_obstacle:
                    is_searching_obstacle = True
                    obst_size = 0
                    obstacle_prev_deg = self.degrees[index]
                    obstacle_prev_dist = ranges[index]
                    obstacle_start_deg = self.degrees[index]
                    
                elif abs(ranges[index] - obstacle_prev_dist) < 1.:
                    obst_size += 1
                    obstacle_prev_deg = self.degrees[index]
                    obstacle_prev_dist = ranges[index]
                
                elif abs(self.degrees[index] - obstacle_prev_deg) < 8:
                    obst_size += 1
                    obstacle_prev_deg = self.degrees[index]
                    obstacle_prev_dist = ranges[index]
                
            elif is_searching_obstacle:
                if obst_size < 2 or obst_size > 40:
                    obst_size = 0
                    is_searching_obstacle = False
                else:
                    middle_index = (obstacle_start_deg + obstacle_prev_deg) / 2
                    middle_value = ranges[min(lower_bound(self.degrees, int(middle_index)), 359)]

                    if not np.isfinite(middle_value):
                        is_searching_obstacle = False
                        continue

                    x = middle_value * np.cos(middle_index * np.pi / 180)
                    y = middle_value * np.sin(middle_index * np.pi / 180)
                    obstacle_arr.obstacle_infos.append(LidarObstacleInfo(obst_x = x, obst_y = y))
                    is_searching_obstacle = False
        self.obstacle_pub.publish(obstacle_arr)
                
        marker = Marker()
        marker.header.frame_id = "base_link"
        marker.header.stamp = rospy.Time.now()
        marker.ns = "lidar_obstacles"
        marker.id = 0
        marker.type = Marker.SPHERE_LIST
        marker.action = Marker.ADD
        marker.pose.orientation.w = 1.0
        marker.scale.x = 0.2
        marker.scale.y = 0.2
        marker.scale.z = 0.2
        marker.color.a = 1.0
        marker.color.r = 0.0
        marker.color.g = 0.0
        marker.color.b = 1.0

        for info in obstacle_arr.obstacle_infos:
            pt = Point()
            pt.x = info.obst_x
            pt.y = info.obst_y
            pt.z = 0.0
            marker.points.append(pt)

        self.marker_pub.publish(marker)

        rotary_infos = RotaryArray()

        for info in obstacle_arr.obstacle_infos:
            rotary = Rotary()
            x, y = info.obst_x, info.obst_y
            rotary.dis = np.hypot(x, y)
            rotary.orientation = ord('l') if x < 0 else ord('r')
            rotary_infos.moving_cars.append(rotary)

        if not len(obstacle_arr.obstacle_infos):
            rotary_infos.moving_cars.append(Rotary(dis=-10000, orientation=ord('n')))

        self.rotary_pub.publish(rotary_infos)
        
        obstacle_msg = Obstacles()
        obstacle_msg.header.stamp = rospy.Time.now()
        obstacle_msg.header.frame_id = "base_link"

        for info in obstacle_arr.obstacle_infos:
            circ = CircleObstacle()
            circ.center.x = info.obst_x
            circ.center.y = info.obst_y
            circ.center.z = 0.0
            circ.radius = 0.3  
            circ.velocity.x = 0.0
            circ.velocity.y = 0.0
            obstacle_msg.circles.append(circ)

        self.circle_pub.publish(obstacle_msg)


def main():
    try:
        _ = LidarObstacle()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

if __name__ == "__main__": 
    main()