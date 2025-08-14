#!/usr/bin/env python3
import rospy
import actionlib
from math import radians, sin, cos
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Pose, PoseArray, PoseStamped, PoseWithCovarianceStamped, Quaternion
from std_msgs.msg import Bool
from actionlib_msgs.msg import GoalStatus

# (선택) frame 변환이 필요할 수 있어서 tf2를 시도하되, 없으면 건너뜀
try:
    import tf2_ros
    from tf2_geometry_msgs import do_transform_pose
    TF2_OK = True
except Exception:
    TF2_OK = False


def is_quat_zero(q: Quaternion) -> bool:
    return abs(q.x) + abs(q.y) + abs(q.z) + abs(q.w) < 1e-9


class DeliveryMissionFromTopic:
    def __init__(self):
        rospy.init_node("delivery_mission_from_topic")

        # ===== 파라미터 =====
        self.goals_topic      = rospy.get_param("~goals_topic", "/delivery/goals")   # PoseArray
        self.frame_id         = rospy.get_param("~frame_id", "map")                  # move_base가 쓰는 프레임
        self.accept_updates   = rospy.get_param("~accept_updates", False)            # True면 이후 PoseArray도 갱신
        self.wait_amcl        = rospy.get_param("~wait_amcl", True)                  # AMCL 준비 대기
        self.start_delay_sec  = rospy.get_param("~start_delay", 2.0)                 # AMCL 수신 후 추가 대기

        # p4(추가 최종 목적지) 파라미터 — 기본값은 네가 준 좌표
        self.use_final_goal   = rospy.get_param("~use_final_goal", True)
        self.final_x          = rospy.get_param("~final_x", -9.588439178466797)
        self.final_y          = rospy.get_param("~final_y", -12.119901657104492)
        self.final_yaw_deg    = rospy.get_param("~final_yaw", 0.0)

        # ===== MoveBase 액션 클라이언트 =====
        self.client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        rospy.loginfo("Waiting for move_base...")
        self.client.wait_for_server()

        # ===== 상태 =====
        self.goals = []                 # type: list[Pose]
        self.current_index = 0
        self.sent_goal = False
        self.mission_active = False
        self.received_once = False      # 첫 PoseArray만 수용
        self.mission_start_time = None
        self.final_goal_appended = False

        # ===== 완료 신호 =====
        self.slam_done_pub = rospy.Publisher("/sequence/slam_done", Bool, queue_size=1, latch=True)

        # ===== (선택) TF 준비 =====
        if TF2_OK:
            self.tfbuf = tf2_ros.Buffer()
            self.tflis = tf2_ros.TransformListener(self.tfbuf)
        else:
            self.tfbuf = None

        # ===== AMCL 준비 대기(비차단) =====
        self.amcl_ok = (not self.wait_amcl)  # 대기 안 하면 True로 시작
        if self.wait_amcl:
            rospy.Subscriber("/amcl_pose", PoseWithCovarianceStamped, self._amcl_cb, queue_size=1)

        # ===== 좌표 구독 (PoseArray 권장) =====
        self.sub_pa = rospy.Subscriber(self.goals_topic, PoseArray, self.cb_pose_array, queue_size=1)

        rospy.loginfo("Started. Waiting goals on %s", self.goals_topic)
        self.rate = rospy.Rate(10)

    # ---------- 콜백/헬퍼 ----------
    def _amcl_cb(self, _):
        if not self.amcl_ok:
            self.amcl_ok = True
            self.amcl_ready_time = rospy.Time.now()
            rospy.loginfo("AMCL pose received. Will start after %.1fs delay.", self.start_delay_sec)

    def _fix_pose(self, p: Pose) -> Pose:
        # z는 명시적으로 0, quaternion 비어 있으면 w=1
        p.position.z = 0.0
        if is_quat_zero(p.orientation):
            p.orientation.w = 1.0
        return p

    def _yaw_to_quat(self, yaw_deg: float) -> Quaternion:
        yaw = radians(yaw_deg)
        q = Quaternion()
        q.z = sin(yaw / 2.0)
        q.w = cos(yaw / 2.0)
        return q

    def _build_final_pose(self) -> Pose:
        p = Pose()
        p.position.x = self.final_x
        p.position.y = self.final_y
        p.position.z = 0.0
        p.orientation = self._yaw_to_quat(self.final_yaw_deg)
        return p

    def _maybe_transform(self, p: Pose, src_frame: str) -> Pose:
        """src_frame != self.frame_id일 때 tf2로 변환 시도. 실패 시 에러 로그 후 None 반환."""
        if src_frame is None or src_frame == "" or src_frame == self.frame_id:
            return p
        if not TF2_OK:
            rospy.logerr("TF2 not available but frame differs (%s -> %s).", src_frame, self.frame_id)
            return None
        try:
            ps = PoseStamped()
            ps.header.frame_id = src_frame
            ps.header.stamp = rospy.Time(0)  # 최신
            ps.pose = p
            tr = self.tfbuf.lookup_transform(self.frame_id, src_frame, rospy.Time(0), rospy.Duration(1.0))
            out = do_transform_pose(ps, tr).pose
            return out
        except Exception as e:
            rospy.logerr("TF transform failed %s -> %s: %s", src_frame, self.frame_id, e)
            return None

    # ---------- 구독 콜백 ----------
    def cb_pose_array(self, msg: PoseArray):
        # 라치 토픽 재전달/중복 수신 차단
        if self.received_once and not self.accept_updates:
            rospy.logwarn("PoseArray already received; ignoring (accept_updates=false).")
            return

        if not msg.poses:
            rospy.logwarn("Received empty PoseArray.")
            return

        src_frame = msg.header.frame_id or self.frame_id

        new_goals = []
        for p in msg.poses:
            p = self._fix_pose(p)
            p2 = self._maybe_transform(p, src_frame)
            if p2 is None:
                rospy.logerr("Dropping goals due to frame transform failure.")
                return
            new_goals.append(p2)

        # 저장만(Manual과 동일), 이후 구독 끊음
        self.goals = new_goals
        self.current_index = 0
        self.sent_goal = False
        self.mission_active = True
        self.received_once = True
        self.mission_start_time = rospy.Time.now()
        self.final_goal_appended = False  # 새 미션마다 초기화

        if not self.accept_updates:
            self.sub_pa.unregister()

        rospy.loginfo("Loaded %d goals (from %s, running in %s).",
                      len(self.goals), src_frame, self.frame_id)

    # ---------- 액션 전송 ----------
    def publish_goal(self, pose: Pose):
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = self.frame_id
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose = pose
        self.client.send_goal(goal)
        rospy.loginfo("[GOAL SENT] x=%.2f, y=%.2f", pose.position.x, pose.position.y)

    # ---------- 메인 루프 ----------
    def spin(self):
        while not rospy.is_shutdown():
            if not self.mission_active:
                self.rate.sleep()
                continue

            # AMCL 준비 대기 + 시작 딜레이
            if not self.amcl_ok:
                rospy.loginfo_throttle(2.0, "Waiting for /amcl_pose ...")
                self.rate.sleep()
                continue
            if (rospy.Time.now() - getattr(self, "amcl_ready_time", rospy.Time.now())).to_sec() < self.start_delay_sec:
                self.rate.sleep()
                continue

            # 모든 목표 완료 → p4(최종 목적지) 한 번만 주입
            if self.current_index >= len(self.goals):
                if self.use_final_goal and not self.final_goal_appended:
                    final_pose = self._build_final_pose()
                    self.goals = [final_pose]
                    self.current_index = 0
                    self.sent_goal = False
                    self.final_goal_appended = True
                    rospy.loginfo("All primary goals done. Proceeding to FINAL goal (p4).")
                    self.rate.sleep()
                    continue

                rospy.loginfo("✅ All deliveries completed (including final).")
                self.slam_done_pub.publish(Bool(True))
                break

            state = self.client.get_state()

            if not self.sent_goal:
                self.publish_goal(self.goals[self.current_index])
                self.sent_goal = True

            elif state == GoalStatus.SUCCEEDED:
                rospy.loginfo("[REACHED] Goal %d", self.current_index + 1)
                self.current_index += 1
                self.sent_goal = False

            elif state in [GoalStatus.ABORTED, GoalStatus.REJECTED]:
                rospy.logwarn("⚠️ Failed to reach goal. Skipping.")
                self.current_index += 1
                self.sent_goal = False

            self.rate.sleep()


if __name__ == "__main__":
    try:
        node = DeliveryMissionFromTopic()
        node.spin()
    except rospy.ROSInterruptException:
        pass
