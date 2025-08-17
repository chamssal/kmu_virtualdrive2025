#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
world_to_map_bridge
- world↔map 대응점(최소 2쌍, 권장 3쌍+)로 SE(2) 추정 (Procrustes/SVD)
- 실패 시 파라미터(tx, ty, yaw_deg 또는 쿼터니언) fallback
- world 기준 Pose/Odom을 map 기준으로 변환해 재배포
- (옵션) world->map static TF 브로드캐스트 (broadcast_tf=true일 때)
"""

import math
import rospy
import tf
import tf2_ros
import numpy as np
from geometry_msgs.msg import PoseStamped, TransformStamped
from nav_msgs.msg import Odometry

def estimate_se2(world_pts, map_pts):
    W = np.asarray(world_pts, dtype=float)
    M = np.asarray(map_pts, dtype=float)
    if W.shape != M.shape or W.ndim != 2 or W.shape[1] != 2 or W.shape[0] < 2:
        raise ValueError("Invalid correspondences")

    cw, cm = W.mean(axis=0), M.mean(axis=0)
    Wc, Mc = W - cw, M - cm
    H = Wc.T @ Mc
    U, S, Vt = np.linalg.svd(H)
    R = Vt.T @ U.T
    if np.linalg.det(R) < 0:
        Vt[1, :] *= -1
        R = Vt.T @ U.T
    yaw = math.atan2(R[1, 0], R[0, 0])
    t = cm - R @ cw
    return float(t[0]), float(t[1]), float(yaw)

def quat_from_yaw(yaw):
    q = tf.transformations.quaternion_from_euler(0.0, 0.0, yaw)
    return q

class WorldToMapBridge:
    def __init__(self):
        rospy.init_node("world_to_map_bridge")

        # --- Params ---
        self.pose_in  = rospy.get_param("~pose_in",  "/world_pose")
        self.odom_in  = rospy.get_param("~odom_in",  "/world_odom")
        self.pose_out = rospy.get_param("~pose_out", "/map_pose")
        self.odom_out = rospy.get_param("~odom_out", "/map_odom")

        world_pts = rospy.get_param("~world_points", [])
        map_pts   = rospy.get_param("~map_points",   [])

        tx = rospy.get_param("~tx", -9.702108)
        ty = rospy.get_param("~ty", -2.770499)
        yaw_deg = rospy.get_param("~yaw_deg", -18.99486)

        use_quat = rospy.get_param("~use_quat", False)
        qx = rospy.get_param("~qx", 0.0)
        qy = rospy.get_param("~qy", 0.0)
        qz = rospy.get_param("~qz", -0.16500337)
        qw = rospy.get_param("~qw", 0.98629300)

        self.broadcast_tf = rospy.get_param("~broadcast_tf", False)  # 기본: False (launch 최소 수정)

        # --- Estimate transform ---
        try:
            if len(world_pts) >= 2 and len(world_pts) == len(map_pts):
                est_tx, est_ty, est_yaw = estimate_se2(world_pts, map_pts)
                tx, ty, yaw_deg = est_tx, est_ty, math.degrees(est_yaw)
                q = quat_from_yaw(est_yaw)
                rospy.loginfo("[w2m] using CORRESPONDENCE: tx=%.3f ty=%.3f yaw=%.3fdeg",
                              tx, ty, yaw_deg)
            else:
                raise ValueError("No/invalid correspondences")
        except Exception as e:
            rospy.logwarn("[w2m] correspondence estimation failed (%s), fallback to params", str(e))
            if use_quat:
                q = (qx, qy, qz, qw)
            else:
                q = quat_from_yaw(math.radians(yaw_deg))
            rospy.loginfo("[w2m] PARAM fallback: tx=%.3f ty=%.3f yaw=%.3fdeg", tx, ty, yaw_deg)

        self.T = (tx, ty, 0.0, q[0], q[1], q[2], q[3])  # world->map

        # --- Publishers/Subscribers ---
        self.pose_pub = rospy.Publisher(self.pose_out, PoseStamped, queue_size=20)
        self.odom_pub = rospy.Publisher(self.odom_out, Odometry, queue_size=20)

        rospy.Subscriber(self.pose_in, PoseStamped, self.pose_cb, queue_size=50)
        rospy.Subscriber(self.odom_in, Odometry, self.odom_cb, queue_size=50)

        # --- Optional static TF broadcast ---
        if self.broadcast_tf:
            br = tf2_ros.StaticTransformBroadcaster()
            st = TransformStamped()
            st.header.stamp = rospy.Time.now()
            st.header.frame_id = "world"
            st.child_frame_id = "map"
            st.transform.translation.x = tx
            st.transform.translation.y = ty
            st.transform.translation.z = 0.0
            st.transform.rotation.x = q[0]
            st.transform.rotation.y = q[1]
            st.transform.rotation.z = q[2]
            st.transform.rotation.w = q[3]
            br.sendTransform(st)
            rospy.loginfo("[w2m] broadcast static TF world->map")

        rospy.loginfo("[w2m] ready. in: (%s,%s)  out: (%s,%s)",
                      self.pose_in, self.odom_in, self.pose_out, self.odom_out)
        rospy.spin()

    @staticmethod
    def apply_T(T, pose_msg):
        tx, ty, tz, qx, qy, qz, qw = T
        Tw2m = tf.transformations.concatenate_matrices(
            tf.transformations.translation_matrix((tx, ty, tz)),
            tf.transformations.quaternion_matrix((qx, qy, qz, qw))
        )
        p = pose_msg.pose
        Tw2b = tf.transformations.concatenate_matrices(
            tf.transformations.translation_matrix((p.position.x, p.position.y, p.position.z)),
            tf.transformations.quaternion_matrix((p.orientation.x, p.orientation.y, p.orientation.z, p.orientation.w))
        )
        Tm2b = tf.transformations.concatenate_matrices(Tw2m, Tw2b)
        t_out = tf.transformations.translation_from_matrix(Tm2b)
        q_out = tf.transformations.quaternion_from_matrix(Tm2b)
        return t_out, q_out

    def pose_cb(self, msg: PoseStamped):
        out = PoseStamped()
        out.header = msg.header
        out.header.frame_id = "map"
        t_out, q_out = self.apply_T(self.T, msg)
        out.pose.position.x, out.pose.position.y, out.pose.position.z = t_out
        out.pose.orientation.x, out.pose.orientation.y, out.pose.orientation.z, out.pose.orientation.w = q_out
        self.pose_pub.publish(out)

    def odom_cb(self, msg: Odometry):
        out = Odometry()
        out.header = msg.header
        out.header.frame_id = "map"
        out.child_frame_id = msg.child_frame_id  # 보통 base_link

        ps = PoseStamped()
        ps.header = msg.header
        ps.pose = msg.pose.pose
        t_out, q_out = self.apply_T(self.T, ps)

        out.pose = msg.pose
        out.pose.pose.position.x, out.pose.pose.position.y, out.pose.pose.position.z = t_out
        out.pose.pose.orientation.x, out.pose.pose.orientation.y, out.pose.pose.orientation.z, out.pose.pose.orientation.w = q_out

        out.twist = msg.twist
        self.odom_pub.publish(out)

if __name__ == "__main__":
    WorldToMapBridge()
