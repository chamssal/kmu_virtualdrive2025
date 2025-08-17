#!/usr/bin/env python3
import rospy
import tf2_ros
import geometry_msgs.msg
from math import radians, sin, cos

def publish_world_to_map():
    rospy.init_node("world_to_map_broadcaster")

    br = tf2_ros.TransformBroadcaster()
    t = geometry_msgs.msg.TransformStamped()

    t.header.frame_id = "world"
    t.child_frame_id = "map"

    # === 수동으로 넣은 변환 값 ===
    # Estimated transform: t=[-8.1835, -5.8647], yaw(deg)=33.92
    trans_x = -8.1835
    trans_y = -5.8647
    yaw_deg = 33.92
    yaw = radians(yaw_deg)

    # 쿼터니언 변환
    qz = sin(yaw / 2.0)
    qw = cos(yaw / 2.0)

    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        t.header.stamp = rospy.Time.now()

        t.transform.translation.x = trans_x
        t.transform.translation.y = trans_y
        t.transform.translation.z = 0.0

        t.transform.rotation.x = 0.0
        t.transform.rotation.y = 0.0
        t.transform.rotation.z = qz
        t.transform.rotation.w = qw

        br.sendTransform(t)
        rate.sleep()

if __name__ == "__main__":
    try:
        publish_world_to_map()
    except rospy.ROSInterruptException:
        pass
