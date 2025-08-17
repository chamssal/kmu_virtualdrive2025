#!/usr/bin/env python3
import rospy
from math import radians, sin, cos
from geometry_msgs.msg import Quaternion, PoseStamped
from morai_msgs.msg import ObjectStatusList
from std_msgs.msg import Int16MultiArray

import tf2_ros
import tf2_geometry_msgs   # PoseStamped 변환용


class DeliveryMissionDebug:
    def __init__(self):
        rospy.init_node("delivery_mission_debug")

        # ===== 파라미터 =====
        self.frame_id = rospy.get_param("~frame_id", "map")  # 변환할 목표 frame
        self.final_x  = rospy.get_param("~final_x", -9.588)
        self.final_y  = rospy.get_param("~final_y", -12.119)
        self.final_yaw= rospy.get_param("~final_yaw", 0.0)

        # ===== TF Buffer / Listener =====
        self.tf_buffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        # 좌표 저장 (world 좌표라고 가정)
        self.obj_poses = [None, None]  # obj1, obj2
        self.ped_pose  = None

        # 구독
        rospy.Subscriber("delivery_topic", ObjectStatusList, self.cb_objects, queue_size=1)
        rospy.Subscriber("delivery_reached", Int16MultiArray, self.cb_check, queue_size=1)

        self.rate = rospy.Rate(2)  # 2Hz 출력

    # ---------- 콜백 ----------
    def cb_objects(self, msg: ObjectStatusList):
        for ped in msg.pedestrian_list:
            self.ped_pose = (ped.position.x, ped.position.y)

        if len(msg.obstacle_list) >= 2:
            self.obj_poses[0] = (msg.obstacle_list[0].position.x,
                                 msg.obstacle_list[0].position.y)
            self.obj_poses[1] = (msg.obstacle_list[1].position.x,
                                 msg.obstacle_list[1].position.y)

    def cb_check(self, msg: Int16MultiArray):
        pass  # 도착 여부는 무시

    # ---------- 헬퍼 ----------
    def _yaw_to_quat(self, yaw_deg: float) -> Quaternion:
        yaw = radians(yaw_deg)
        q = Quaternion()
        q.z = sin(yaw / 2.0)
        q.w = cos(yaw / 2.0)
        return q

    def transform_pose(self, x, y, yaw_deg=0.0, from_frame="world", to_frame="map"):
        pose = PoseStamped()
        pose.header.stamp = rospy.Time.now()
        pose.header.frame_id = from_frame
        pose.pose.position.x = x
        pose.pose.position.y = y
        pose.pose.position.z = 0.0
        pose.pose.orientation = self._yaw_to_quat(yaw_deg)

        try:
            trans = self.tf_buffer.lookup_transform(to_frame, from_frame, rospy.Time(0), rospy.Duration(1.0))
            pose_out = tf2_geometry_msgs.do_transform_pose(pose, trans)
            return pose_out
        except Exception as e:
            rospy.logwarn_throttle(5.0, f"TF 변환 실패 ({from_frame}->{to_frame}): {e}")
            return None

    # ---------- 메인 루프 ----------
    def spin(self):
        while not rospy.is_shutdown():
            # Object1
            if self.obj_poses[0]:
                pose_map = self.transform_pose(*self.obj_poses[0])
                if pose_map:
                    rospy.loginfo(f"[Object1] map 좌표: ({pose_map.pose.position.x:.2f}, {pose_map.pose.position.y:.2f})")

            # Object2
            if self.obj_poses[1]:
                pose_map = self.transform_pose(*self.obj_poses[1])
                if pose_map:
                    rospy.loginfo(f"[Object2] map 좌표: ({pose_map.pose.position.x:.2f}, {pose_map.pose.position.y:.2f})")

            # Pedestrian
            if self.ped_pose:
                pose_map = self.transform_pose(*self.ped_pose)
                if pose_map:
                    rospy.loginfo(f"[Pedestrian] map 좌표: ({pose_map.pose.position.x:.2f}, {pose_map.pose.position.y:.2f})")

            # Final Goal
            pose_map = self.transform_pose(self.final_x, self.final_y, self.final_yaw)
            if pose_map:
                rospy.loginfo(f"[FinalGoal] map 좌표: ({pose_map.pose.position.x:.2f}, {pose_map.pose.position.y:.2f})")

            self.rate.sleep()


if __name__ == "__main__":
    try:
        node = DeliveryMissionDebug()
        node.spin()
    except rospy.ROSInterruptException:
        pass
