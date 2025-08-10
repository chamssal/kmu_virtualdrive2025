#!/usr/bin/env python3
import math, rospy
from std_msgs.msg import Header
from obstacle_detect.msg import ObstacleInfoArray
from obstacle_msgs.msg import ObstacleDecision
from collections import namedtuple

Track = namedtuple("Track", ["x","y","t"])

class DynamicJudge:
    def __init__(self):
        rospy.init_node("dynamic_obstacle")

        self.front_roi_min_y = rospy.get_param("~front_roi_min_y", 0.2)
        self.front_roi_max_y = rospy.get_param("~front_roi_max_y", 8.0)
        self.roi_half_width  = rospy.get_param("~roi_half_width", 0.9)
        self.speed_thr       = rospy.get_param("~speed_threshold_dynamic", 0.3)
        self.yield_distance  = rospy.get_param("~yield_distance", 2.5)
        self.stop_distance   = rospy.get_param("~stop_distance", 1.2)
        self.lane_escape_x   = rospy.get_param("~lane_escape_x", 0.8)
        self.hold_time_yield = rospy.get_param("~hold_time_yield", 1.5)
        self.target_speed_yield = rospy.get_param("~target_speed_yield", 0.5)

        self.pub = rospy.Publisher("/dynamic_obstacle/decision", ObstacleDecision, queue_size=1)
        rospy.Subscriber("/obstacle_information", ObstacleInfoArray, self.cb, queue_size=1)

        self.prev_tracks = []

    def estimate_speed(self, x, y, stamp):
        if not self.prev_tracks:
            return 0.0
        best = min(self.prev_tracks, key=lambda tr: (tr.x - x)**2 + (tr.y - y)**2)
        dt = (stamp - best.t).to_sec()
        if dt <= 1e-3: return 0.0
        vx = (x - best.x) / dt
        vy = (y - best.y) / dt
        return math.hypot(vx, vy)

    def cb(self, msg):
        now = msg.header.stamp if hasattr(msg, "header") else rospy.Time.now()
        candidates = []
        for o in msg.obstacles:
            x, y = o.x, o.y
            if self.front_roi_min_y <= y <= self.front_roi_max_y and abs(x) <= self.roi_half_width:
                spd = self.estimate_speed(x, y, now)
                candidates.append((math.hypot(x, y), x, y, spd))

        self.prev_tracks = [Track(x=c[1], y=c[2], t=now) for c in candidates]

        dec = ObstacleDecision()
        dec.header = msg.header if hasattr(msg,"header") else Header(stamp=now)
        dec.type = ObstacleDecision.DYNAMIC
        dec.action = ObstacleDecision.ACT_NONE
        dec.target_speed = -1.0
        dec.lateral_offset = 0.0
        dec.hold_time = rospy.Duration(0.0)
        dec.confidence = 0.0

        if not candidates:
            self.pub.publish(dec)
            return

        candidates.sort(key=lambda c: (c[0], -c[3]))
        dist, x, y, spd = candidates[0]

        if abs(x) >= self.lane_escape_x:
            self.pub.publish(dec)
            return

        is_dyn = spd >= self.speed_thr

        if is_dyn:
            if dist <= self.stop_distance:
                dec.action = ObstacleDecision.ACT_STOP
                dec.target_speed = 0.0
                dec.hold_time = rospy.Duration(self.hold_time_yield)
                dec.confidence = 0.9
            elif dist <= self.yield_distance:
                dec.action = ObstacleDecision.ACT_YIELD
                dec.target_speed = self.target_speed_yield
                dec.hold_time = rospy.Duration(self.hold_time_yield)
                dec.confidence = 0.7
            else:
                dec.action = ObstacleDecision.ACT_NONE
                dec.confidence = 0.4
        else:
            dec.action = ObstacleDecision.ACT_NONE
            dec.confidence = 0.2

        self.pub.publish(dec)

if __name__ == "__main__":
    DynamicJudge()
    rospy.spin()
