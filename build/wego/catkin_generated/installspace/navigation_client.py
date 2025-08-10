# import rospy

# from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
# from actionlib_msgs.msg import GoalStatus
# import actionlib

# class NavigationClient():
#     def __init__(self):
#         self.client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
#         self.client.wait_for_server()
        
#         self.goal_list = list()
    
        
#         # 위치 
#         self.waypoint_1 = MoveBaseGoal()
#         self.waypoint_1.target_pose.header.frame_id = "map"
#         self.waypoint_1.target_pose.pose.position.x = 18.601542942942007
#         self.waypoint_1.target_pose.pose.position.y = -9.865300329485445
#         self.waypoint_1.target_pose.pose.orientation.w = 0.9999894849385434
#         self.waypoint_1.target_pose.pose.orientation.z = -0.004585849141274627
        
#         self.goal_list.append(self.waypoint_1)
        
#         self.sequence = 0
#         self.start_time = rospy.Time.now()
        
#     def run(self):
#         if self.client.get_state() != GoalStatus.ACTIVE:
#             self.start_time = rospy.Time.now()
#             self.sequence = (self.sequence + 1) % 1
            
#             self.goal_list[self.sequence].target_pose.header.stamp = rospy.Time.now()
            
#             self.client.send_goal(self.goal_list[self.sequence])
            
#         else:
#             if (rospy.Time.now().to_sec() - self.start_time.to_sec()) > 30.0:
#                 self.stop()
    
#     def stop(self):
#         self.client.cancel_all_goals()
        
# def main():
#     rospy.init_node("navigation_client")
#     nc = NavigationClient()
#     rate = rospy.Rate(30)
    
#     while not rospy.is_shutdown():
#         nc.run()
#         rate.sleep()
    
# if __name__ == "__main__":
#     main()




# # topic ver 
# #!/usr/bin/env python3
# import rospy
# import actionlib
# from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
# from geometry_msgs.msg import PoseArray, Pose
# from std_msgs.msg import Int32MultiArray
# from actionlib_msgs.msg import GoalStatus

# class DeliveryMission:
#     def __init__(self):
#         rospy.init_node("delivery_mission_node")

#         # MoveBase action client
#         self.client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
#         self.client.wait_for_server()

#         # 목표 지점들 (물건1, 물건2, 배송지)
#         self.goals = []
#         self.reached = [0, 0, 0]  # 도달 여부 (0: 아직, 1: 도달함)
#         self.current_index = 0
#         self.sent_goal = False

#         # Subscribers
#         rospy.Subscriber("/delivery_object", PoseArray, self.object_callback)
#         rospy.Subscriber("/delivery_check", Int32MultiArray, self.check_callback)

#         rospy.loginfo("Delivery mission node started.")
#         self.rate = rospy.Rate(10)

#     def object_callback(self, msg: PoseArray):
#         if len(msg.poses) != 3:
#             rospy.logwarn("/delivery_object must contain exactly 3 poses.")
#             return

#         self.goals = msg.poses
#         rospy.loginfo("Received delivery goals.")

#     def check_callback(self, msg: Int32MultiArray):
#         if len(msg.data) == 3:
#             self.reached = msg.data

#     def publish_goal(self, pose: Pose):
#         goal = MoveBaseGoal()
#         goal.target_pose.header.frame_id = "map"
#         goal.target_pose.header.stamp = rospy.Time.now()
#         goal.target_pose.pose = pose
#         self.client.send_goal(goal)
#         rospy.loginfo(f"Sent goal to x={pose.position.x:.2f}, y={pose.position.y:.2f}")

#     def run(self):
#         while not rospy.is_shutdown():
#             if len(self.goals) != 3:
#                 self.rate.sleep()
#                 continue

#             # 현재 목표에 도달하지 않았다면 목표 전송
#             if self.reached[self.current_index] == 0 and not self.sent_goal:
#                 self.publish_goal(self.goals[self.current_index])
#                 self.sent_goal = True

#             # 도달하면 다음 목표로 넘어감
#             if self.reached[self.current_index] == 1:
#                 rospy.loginfo(f"Reached point {self.current_index + 1}")
#                 self.current_index += 1
#                 self.sent_goal = False

#             # 모든 목표에 도달한 경우 종료
#             if self.current_index >= 3:
#                 rospy.loginfo("All deliveries completed.")
#                 break

#             self.rate.sleep()

# if __name__ == "__main__":
#     try:
#         mission = DeliveryMission()
#         mission.run()
#     except rospy.ROSInterruptException:
#         pass



#!/usr/bin/env python3
import rospy
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Pose
from std_msgs.msg import Int32MultiArray
from actionlib_msgs.msg import GoalStatus

class DeliveryMissionManual:
    def __init__(self):
        rospy.init_node("delivery_mission_manual_node")

        # MoveBase action client
        self.client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        self.client.wait_for_server()

        # 목표 지점들 (배송지, 물건1, 물건2 순서로 테스트 가능)
        self.goals = self.set_manual_goals()

        # 도달 여부 수동 관리
        self.reached = [0, 0, 0]
        self.current_index = 0
        self.sent_goal = False

        rospy.loginfo("Manual delivery mission node started.")
        self.rate = rospy.Rate(10)

    def set_manual_goals(self):
        goals = []

        # === ⬇ 여기 좌표만 바꾸면 됨! RViz에서 땄던 좌표 넣기 ===

        # Goal 1
        p1 = Pose()
        p1.position.x = -13.742
        p1.position.y = -4.293
        p1.orientation.z = 0.0
        p1.orientation.w = 1.0
        goals.append(p1)

        # Goal 2
        p2 = Pose()
        p2.position.x = -13.193
        p2.position.y = -13.884
        p2.orientation.z = 0.0
        p2.orientation.w = 1.0
        goals.append(p2)

        # Goal 3 (예시로 배송지로 다시 돌아간다고 가정)
        p3 = Pose()
        p3.position.x = -13.742
        p3.position.y = -4.293
        p3.orientation.z = 0.0
        p3.orientation.w = 1.0
        goals.append(p3)

        return goals

    def publish_goal(self, pose: Pose):
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose = pose
        self.client.send_goal(goal)
        rospy.loginfo(f"[GOAL SENT] x={pose.position.x:.2f}, y={pose.position.y:.2f}")

    def run(self):
        while not rospy.is_shutdown():
            if self.current_index >= len(self.goals):
                rospy.loginfo("✅ All deliveries completed.")
                break

            state = self.client.get_state()

            if not self.sent_goal:
                self.publish_goal(self.goals[self.current_index])
                self.sent_goal = True

            elif state == GoalStatus.SUCCEEDED:
                rospy.loginfo(f"[REACHED] Goal {self.current_index + 1}")
                self.reached[self.current_index] = 1
                self.current_index += 1
                self.sent_goal = False

            elif state in [GoalStatus.ABORTED, GoalStatus.REJECTED]:
                rospy.logwarn("⚠️ Failed to reach goal. Skipping.")
                self.current_index += 1
                self.sent_goal = False

            self.rate.sleep()

if __name__ == "__main__":
    try:
        mission = DeliveryMissionManual()
        mission.run()
    except rospy.ROSInterruptException:
        pass
