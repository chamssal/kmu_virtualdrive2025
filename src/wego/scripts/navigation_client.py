#!/usr/bin/env python3
import rospy
import actionlib
from math import radians, sin, cos
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Quaternion
from std_msgs.msg import Bool, Int16MultiArray
from morai_msgs.msg import ObjectStatusList
from actionlib_msgs.msg import GoalStatus

class DeliveryMission:
    def __init__(self):
        rospy.init_node("delivery_mission")

        # ===== 파라미터 =====
        self.frame_id = rospy.get_param("~frame_id", "map")
        self.final_x  = rospy.get_param("~final_x", -9.588)
        self.final_y  = rospy.get_param("~final_y", -12.119)
        self.final_yaw= rospy.get_param("~final_yaw", 0.0)

        # ===== MoveBase 액션 클라이언트 =====
        self.client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        rospy.loginfo("Waiting for move_base...")
        self.client.wait_for_server()

        # ===== 상태 =====
        self.state = 0  # 0=obj1, 1=obj2, 2=pedestrian, 3=final
        self.sent_goal = False

        # 좌표 저장 (map 좌표 그대로 저장)
        self.obj_poses = [None, None]  # obj1, obj2
        self.ped_pose  = None

        # 완료 신호
        self.done_pub = rospy.Publisher("/sequence/slam_done", Bool, queue_size=1, latch=True)

        # 구독
        rospy.Subscriber("/delivery_object", ObjectStatusList, self.cb_objects, queue_size=1)
        rospy.Subscriber("/delivery_check", Int16MultiArray, self.cb_check, queue_size=1)

        self.reach_flags = [0, 0, 0]

        self.rate = rospy.Rate(10)

    # ---------- 콜백 ----------
    def cb_objects(self, msg: ObjectStatusList):
        """delivery_object에서 좌표 추출 (이미 map 기준)"""
        for ped in msg.pedestrian_list:
            self.ped_pose = (ped.position.x, ped.position.y)

        if len(msg.obstacle_list) >= 2:
            self.obj_poses[0] = (msg.obstacle_list[0].position.x,
                                 msg.obstacle_list[0].position.y)
            self.obj_poses[1] = (msg.obstacle_list[1].position.x,
                                 msg.obstacle_list[1].position.y)

    def cb_check(self, msg: Int16MultiArray):
        self.reach_flags = msg.data

    # ---------- 헬퍼 ----------
    def _yaw_to_quat(self, yaw_deg: float) -> Quaternion:
        from math import radians, sin, cos
        yaw = radians(yaw_deg)
        q = Quaternion()
        q.z = sin(yaw / 2.0)
        q.w = cos(yaw / 2.0)
        return q

    def publish_goal(self, x, y, yaw_deg=0.0):
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = self.frame_id
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = x
        goal.target_pose.pose.position.y = y
        goal.target_pose.pose.position.z = 0.0
        goal.target_pose.pose.orientation = self._yaw_to_quat(yaw_deg)
        self.client.send_goal(goal)
        rospy.loginfo(f"[GOAL SENT] x={x:.2f}, y={y:.2f}")
        self.sent_goal = True

    # ---------- 메인 루프 ----------
    def spin(self):
        while not rospy.is_shutdown():
            state = self.client.get_state()

            if self.state == 0:
                if not self.sent_goal and self.obj_poses[0]:
                    self.publish_goal(*self.obj_poses[0])
                elif state == GoalStatus.SUCCEEDED or self.reach_flags[1] == 1:
                    rospy.loginfo("[REACHED] Object1")
                    self.sent_goal = False
                    self.state = 1

            elif self.state == 1:
                if not self.sent_goal and self.obj_poses[1]:
                    self.publish_goal(*self.obj_poses[1])
                elif state == GoalStatus.SUCCEEDED or self.reach_flags[2] == 1:
                    rospy.loginfo("[REACHED] Object2")
                    self.sent_goal = False
                    self.state = 2

            elif self.state == 2:
                if not self.sent_goal and self.ped_pose:
                    self.publish_goal(*self.ped_pose)
                elif state == GoalStatus.SUCCEEDED or self.reach_flags[0] > 0:
                    rospy.loginfo("[REACHED] Pedestrian")
                    self.sent_goal = False
                    self.state = 3

            elif self.state == 3:
                if not self.sent_goal:
                    self.publish_goal(self.final_x, self.final_y, self.final_yaw)
                elif state == GoalStatus.SUCCEEDED:
                    rospy.loginfo("✅ Final Goal Reached. Mission Complete.")
                    self.done_pub.publish(Bool(True))
                    break

            self.rate.sleep()


if __name__ == "__main__":
    try:
        node = DeliveryMission()
        node.spin()
    except rospy.ROSInterruptException:
        pass
