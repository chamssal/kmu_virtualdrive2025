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
        p1.position.x = -14.201016426086426
        p1.position.y = -4.938479900360107
        p1.orientation.z = 0.0
        p1.orientation.w = 1.0
        goals.append(p1)
        
    
        # Goal 2
        p2 = Pose()
        p2.position.x = -10.714090347290039
        p2.position.y = -8.343365669250488
        p2.orientation.z = 0.0
        p2.orientation.w = 1.0
        goals.append(p2)

        # Goal 3 (예시로 배송지로 다시 돌아간다고 가정)
        p3 = Pose()
        p3.position.x = -13.778423309326172
        p3.position.y = -14.032683372497559
        p3.orientation.z = 0.0
        p3.orientation.w = 1.0
        goals.append(p3)
        
        
        p4 = Pose()
        p4.position.x = -7.388439178466797
        p4.position.y = -12.119901657104492
        p4.orientation.z = 0.0
        p4.orientation.w = 1.0
        goals.append(p4)
        
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
