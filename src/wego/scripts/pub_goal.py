#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import PoseArray, Pose, Quaternion
from math import radians
import tf.transformations as tft

def quat_from_yaw(yaw_deg=0.0) -> Quaternion:
    """yaw(deg)를 받아 Quaternion으로 변환"""
    q = tft.quaternion_from_euler(0.0, 0.0, radians(yaw_deg))
    return Quaternion(x=q[0], y=q[1], z=q[2], w=q[3])

if __name__ == "__main__":
    rospy.init_node("pub_goal")   # 노드 이름
    pub = rospy.Publisher("/delivery/goals", PoseArray, queue_size=1, latch=True)
    rospy.sleep(0.5)  # 퍼블리셔 준비 대기

    pa = PoseArray()
    pa.header.frame_id = "map"  # DeliveryMissionFromTopic도 frame_id=map 기준
    pa.header.stamp = rospy.Time.now()

    def add_goal(x, y, yaw_deg=0.0):
        """목표 좌표 하나 추가"""
        p = Pose()
        p.position.x = x
        p.position.y = y
        p.position.z = 0.0
        p.orientation = quat_from_yaw(yaw_deg)
        pa.poses.append(p)

    # ========== 여기서 원하는 좌표들을 추가 ==========
    add_goal(-14.201016426086426, -4.938479900360107, 0.0)
    add_goal(-10.714090347290039, -8.343365669250488, 0.0)
    add_goal(-13.778423309326172, -14.032683372497559, 0.0)
    # ==============================================

    pub.publish(pa)
    rospy.loginfo("✅ Published %d goals on /delivery/goals", len(pa.poses))

    rospy.spin()
