# #!/usr/bin/env python3
# #-*-coding:utf-8-*-

# import rospy
# import numpy as np
# from visualization_msgs.msg import Marker
# from geometry_msgs.msg import Point
# from sensor_msgs.msg import LaserScan
# from obstacle_detect.msg import Rotary, RotaryArray
# from obstacle_detect.msg import LidarObstacleInfo, LidarObstacleInfoArray
# from bisect import bisect_left as lower_bound

# class LidarObstacle:
#     def __init__(self):
#         rospy.init_node("lidar_obstacle")
        
#         self.scan_msg = LaserScan()
#         rospy.Subscriber("/lidar2D", LaserScan, self.callback)
#         self.marker_pub = rospy.Publisher("/visualization_marker", Marker, queue_size=10)
#         self.obstacle_pub = rospy.Publisher("/lidar_obstacle_information", LidarObstacleInfoArray, queue_size=10)
#         self.rotary_pub = rospy.Publisher("/rotary_info", RotaryArray, queue_size=10)
#         self.degrees = range(-180, 180)

#     def callback(self, msg: LaserScan):
#         self.scan_msg = msg
#         is_searching_obstacle = False

#         obstacle_prev_deg = 0 
#         obstacle_start_deg = 0

#         obst_size = 0
#         obstacle_arr = LidarObstacleInfoArray()
#         ranges = self.scan_msg.ranges[:180][::-1] + self.scan_msg.ranges[180:][::-1]
        
#         for index, value in enumerate(ranges):
#             if self.degrees[index] < -115 or self.degrees[index] > 115:
#                 continue

#             if 0 <= value <= 2.5:
#                 if not is_searching_obstacle:
#                     is_searching_obstacle = True
#                     obst_size = 0
#                     obstacle_prev_deg = self.degrees[index]
#                     obstacle_prev_dist = ranges[index]
#                     obstacle_start_deg = self.degrees[index]
                    
#                 elif abs(ranges[index] - obstacle_prev_dist) < 1.:
#                     obst_size += 1
#                     obstacle_prev_deg = self.degrees[index]
#                     obstacle_prev_dist = ranges[index]
                
#                 elif abs(self.degrees[index] - obstacle_prev_deg) < 8:
#                     obst_size += 1
#                     obstacle_prev_deg = self.degrees[index]
#                     obstacle_prev_dist = ranges[index]
                
#             elif is_searching_obstacle:
#                 if obst_size < 2 or obst_size > 40:
#                     obst_size = 0
#                     is_searching_obstacle = False
#                 else:
#                     middle_index = (obstacle_start_deg + obstacle_prev_deg) / 2
#                     middle_value = ranges[min(lower_bound(self.degrees, int(middle_index)), 359)]

#                     if not np.isfinite(middle_value):
#                         is_searching_obstacle = False
#                         continue

#                     x = middle_value * np.sin(middle_index * np.pi / 180)
#                     y = middle_value * np.cos(middle_index * np.pi / 180)
                    
#                     obstacle_arr.obstacle_infos.append(LidarObstacleInfo(obst_x = x, obst_y = y))
                    
#                     # ✅ 장애물 로그 출력
#                     rospy.loginfo(f"📍 장애물 발견: x={x:.2f}, y={y:.2f}, 포인트 수={obst_size}")

#                     is_searching_obstacle = False

#         # ✅ 총 장애물 수 출력
#         rospy.loginfo(f"🔎 총 감지된 장애물 수: {len(obstacle_arr.obstacle_infos)}")

#         self.obstacle_pub.publish(obstacle_arr)
                
#         marker = Marker()
#         marker.header.frame_id = "base_link"
#         marker.header.stamp = rospy.Time.now()
#         marker.ns = "lidar_obstacles"
#         marker.id = 0
#         marker.type = Marker.SPHERE_LIST
#         marker.action = Marker.ADD
#         marker.pose.orientation.w = 1.0
#         marker.scale.x = 0.2
#         marker.scale.y = 0.2
#         marker.scale.z = 0.2
#         marker.color.a = 1.0
#         marker.color.r = 1.0
#         marker.color.g = 0.0
#         marker.color.b = 0.0

#         for info in obstacle_arr.obstacle_infos:
#             pt = Point()
#             pt.x = info.obst_x
#             pt.y = info.obst_y
#             pt.z = 0.0
#             marker.points.append(pt)

#         self.marker_pub.publish(marker)

#         rotary_infos = RotaryArray()

#         for info in obstacle_arr.obstacle_infos:
#             rotary = Rotary()
#             x, y = info.obst_x, info.obst_y
#             rotary.dis = np.hypot(x, y)
#             rotary.orientation = ord('l') if x < 0 else ord('r')
#             rotary_infos.moving_cars.append(rotary)

#         if not len(obstacle_arr.obstacle_infos):
#             rotary_infos.moving_cars.append(Rotary(dis=-10000, orientation=ord('n')))

#         self.rotary_pub.publish(rotary_infos)

# def main():
#     try:
#         _ = LidarObstacle()
#         rospy.spin()
#     except rospy.ROSInterruptException:
#         pass

# if __name__ == "__main__": 
#     main()
