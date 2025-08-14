#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import PoseArray, Pose, Quaternion
import tf.transformations as tft
from math import radians

def quat_from_yaw(yaw_deg=0.0):
    q = tft.quaternion_from_euler(0.0, 0.0, radians(yaw_deg))
    return Quaternion(x=q[0], y=q[1], z=q[2], w=q[3])

if __name__ == "__main__":
    rospy.init_node("test_publish_goals")
    pub = rospy.Publisher("/delivery/goals", PoseArray, queue_size=1, latch=True)
    rospy.sleep(0.5)

    pa = PoseArray()
    pa.header.frame_id = "map"
    pa.header.stamp = rospy.Time.now()

    def add(x, y, yaw_deg=0.0):
        p = Pose()
        p.position.x = x
        p.position.y = y
        p.position.z = 0.0
        p.orientation = quat_from_yaw(yaw_deg)  # yaw 없으면 0으로
        pa.poses.append(p)

    # (이미 map 좌표라면) 그대로 사용
    add(-14.201016426086426, -4.938479900360107, 0.0)
    add(-10.714090347290039, -8.343365669250488,  0.0)
    add(-13.778423309326172, -14.032683372497559, 0.0)

    pub.publish(pa)
    rospy.loginfo("Published %d goals on /delivery/goals", len(pa.poses))
    rospy.spin()
