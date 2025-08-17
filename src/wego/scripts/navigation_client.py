#!/usr/bin/env python3
import rospy
import actionlib
import tf2_ros
import tf2_geometry_msgs

from math import radians, sin, cos
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Quaternion, PoseStamped
from std_msgs.msg import Bool, Int16MultiArray
from morai_msgs.msg import ObjectStatusList
from actionlib_msgs.msg import GoalStatus


class DeliveryMission:
    def __init__(self):
        rospy.init_node("delivery_mission")

        # == PARAMS ==
        self.frame_id = rospy.get_param("~frame_id", "map")
        self.final_x  = rospy.get_param("~final_x", -9.588)
        self.final_y  = rospy.get_param("~final_y", -12.119)
        self.final_yaw= rospy.get_param("~final_yaw", 0.0)

        # TF
        self.tf_buf = tf2_ros.Buffer()
        self.listener = tf2_ros.TransformListener(self.tf_buf)
        rospy.sleep(0.5)

        # MoveBase
        self.client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        rospy.loginfo("Waiting for move_base server...")
        self.client.wait_for_server()

        # FSM
        self.state = 0
        self.sent_goal = False

        self.obj_poses = [None, None]   # world 좌표
        self.ped_pose  = None

        self.reach_flags = [0,0,0]
        self.done_pub = rospy.Publisher("/sequence/slam_done", Bool, queue_size=1, latch=True)

        rospy.Subscriber("/delivery_object", ObjectStatusList, self.cb_objects, queue_size=1)
        rospy.Subscriber("/delivery_check", Int16MultiArray, self.cb_check, queue_size=1)

        self.rate = rospy.Rate(10)

    def cb_objects(self, msg):
        for ped in msg.pedestrian_list:
            self.ped_pose = (ped.position.x, ped.position.y)

        if len(msg.obstacle_list) >= 2:
            self.obj_poses[0] = (msg.obstacle_list[0].position.x, msg.obstacle_list[0].position.y)
            self.obj_poses[1] = (msg.obstacle_list[1].position.x, msg.obstacle_list[1].position.y)

    def cb_check(self, msg):
        self.reach_flags = msg.data

    # ==================
    def _yaw_to_quat(self, yaw_deg):
        yaw = radians(yaw_deg)
        q = Quaternion()
        q.x = 0.0
        q.y = 0.0
        q.z = sin(yaw/2.0)
        q.w = cos(yaw/2.0)
        return q

    def transform_world_to_map(self, x, y, yaw=0.0):
        """TF 기반 world→map 변환. 실패 시 None반환"""
        pose_w = PoseStamped()
        pose_w.header.frame_id = "world"
        pose_w.header.stamp = rospy.Time(0)
        pose_w.pose.position.x = x
        pose_w.pose.position.y = y
        pose_w.pose.orientation = self._yaw_to_quat(yaw)

        try:
            trans = self.tf_buf.lookup_transform('map', 'world', rospy.Time(0), rospy.Duration(0.2))
            pose_m = tf2_geometry_msgs.do_transform_pose(pose_w, trans)
            xm, ym = pose_m.pose.position.x, pose_m.pose.position.y
            rospy.loginfo(f"[transform] world({x:.2f},{y:.2f}) → map({xm:.2f},{ym:.2f})")
            return xm, ym
        except Exception as e:
            rospy.logwarn(f"TF 변환 실패 world→map : {e}")
            return None

    def send_goal(self, x_map, y_map, yaw=0.0):
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = x_map
        goal.target_pose.pose.position.y = y_map
        goal.target_pose.pose.orientation = self._yaw_to_quat(yaw)
        self.client.send_goal(goal)
        rospy.loginfo(f"[GOAL → move_base] {x_map:.2f}, {y_map:.2f}")
        self.sent_goal = True

    # ==================
    def spin(self):
        while not rospy.is_shutdown():
            state = self.client.get_state()

            if self.state == 0:
                if not self.sent_goal and self.obj_poses[0]:
                    res = self.transform_world_to_map(*self.obj_poses[0])
                    if res:
                        self.send_goal(*res)
                elif state == GoalStatus.SUCCEEDED or self.reach_flags[1] == 1:
                    rospy.loginfo("Reached obj1")
                    self.sent_goal = False
                    self.state = 1

            elif self.state == 1:
                if not self.sent_goal and self.obj_poses[1]:
                    res = self.transform_world_to_map(*self.obj_poses[1])
                    if res:
                        self.send_goal(*res)
                elif state == GoalStatus.SUCCEEDED or self.reach_flags[2] == 1:
                    rospy.loginfo("Reached obj2")
                    self.sent_goal = False
                    self.state = 2

            elif self.state == 2:
                if not self.sent_goal and self.ped_pose:
                    res = self.transform_world_to_map(*self.ped_pose)
                    if res:
                        self.send_goal(*res)
                elif state == GoalStatus.SUCCEEDED or self.reach_flags[0] > 0:
                    rospy.loginfo("Reached pedestrian")
                    self.sent_goal = False
                    self.state = 3

            elif self.state == 3:
                if not self.sent_goal:
                    self.send_goal(self.final_x, self.final_y, self.final_yaw)
                elif state == GoalStatus.SUCCEEDED:
                    rospy.loginfo("✅ Mission Done")
                    self.done_pub.publish(True)
                    break

            self.rate.sleep()


if __name__ == "__main__":
    try:
        node = DeliveryMission()
        node.spin()
    except rospy.ROSInterruptException:
        pass
