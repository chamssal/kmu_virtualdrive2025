#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy, math
from visualization_msgs.msg import Marker, MarkerArray
from obstacle_detect.msg import ObstacleInfoArray

class ObstacleViz:
    def __init__(self):
        rospy.init_node("obstacle_viz")
        self.frame_id = rospy.get_param("~frame_id", "base_link")  # RViz Fixed Frame과 맞추세요
        self.pub = rospy.Publisher("/obstacle/viz", MarkerArray, queue_size=1)
        rospy.Subscriber("/obstacle_information", ObstacleInfoArray, self.cb, queue_size=1)
        rospy.loginfo("[obstacle_viz] ready. Subscribing /obstacle_information → /obstacle/viz")

    def cb(self, msg: ObstacleInfoArray):
        arr = MarkerArray()
        stamp = rospy.Time.now()

        clear = Marker()
        clear.action = Marker.DELETEALL
        arr.markers.append(clear)

        base_id = 1
        for i, o in enumerate(msg.obstacles):
            # 점 마커
            m = Marker()
            m.header.frame_id = self.frame_id
            m.header.stamp = stamp
            m.ns = "obstacles"
            m.id = base_id + i
            m.type = Marker.SPHERE
            m.action = Marker.ADD
            m.pose.position.x = float(o.y)  
            m.pose.position.y = float(o.x)
            m.pose.position.z = 0.1
            m.scale.x = m.scale.y = m.scale.z = 0.15

            if getattr(o, "is_dynamic", False):
                # 빨강 = 동적
                m.color.r, m.color.g, m.color.b, m.color.a = 1.0, 0.2, 0.2, 1.0
            else:
                # 파랑 = 정적
                m.color.r, m.color.g, m.color.b, m.color.a = 0.2, 0.4, 1.0, 1.0

            arr.markers.append(m)

            # 텍스트(선택)
            t = Marker()
            t.header.frame_id = self.frame_id
            t.header.stamp = stamp
            t.ns = "labels"
            t.id = 1000 + i
            t.type = Marker.TEXT_VIEW_FACING
            t.action = Marker.ADD
            t.pose.position.x = m.pose.position.x
            t.pose.position.y = m.pose.position.y
            t.pose.position.z = 0.5
            d = math.hypot(o.x, o.y)
            t.text = ("DYN" if getattr(o, "is_dynamic", False) else "STA") + f"  d={d:.2f}"
            t.scale.z = 0.2
            t.color.r, t.color.g, t.color.b, t.color.a = 1,1,1,1
            arr.markers.append(t)

        self.pub.publish(arr)

if __name__ == "__main__":
    ObstacleViz()
    rospy.spin()
