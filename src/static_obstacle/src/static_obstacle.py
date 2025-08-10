#!/usr/bin/env python3
import math, rospy
from collections import namedtuple
from std_msgs.msg import Header
from obstacle_detector.msg import Obstacles          
from obstacle_msgs.msg import ObstacleDecision

Track = namedtuple("Track", ["x","y","t"])

class DynamicJudge:
    def __init__(self):
        rospy.init_node("dynamic_obstacle")

        self.input_topic = rospy.get_param("~input_topic", "/obstacles")
        self.use_circles = rospy.get_param("~use_circles", True)
        self.use_segments = rospy.get_param("~use_segments", False)

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
        rospy.Subscriber(self.input_topic, Obstacles, self.cb, queue_size=1)

        self.prev_tracks = []

    def estimate_speed(self, x, y, now):
        if not self.prev_tracks: return 0.0
        best = min(self.prev_tracks, key=lambda tr: (tr.x - x)**2 + (tr.y - y)**2)
        dt = (now - best.t).to_sec()
        if dt <= 1e-3: return 0.0
        return math.hypot((x - best.x)/dt, (y - best.y)/dt)

    def cb(self, msg: Obstacles):
        now = msg.header.stamp if hasattr(msg, "header") else rospy.Time.now()
        reps = []

        if self.use_circles:
            for c in msg.circles:
                x, y = c.center.x, c.center.y
                if self.front_roi_min_y <= y <= self.front_roi_max_y and abs(x) <= self.roi_half_width:
                    spd = self.estimate_speed(x, y, now)
                    reps.append((math.hypot(x,y), x, y, spd))

        if self.use_segments:
            for s in msg.segments:
                cx = 0.5*(s.first_point.x + s.last_point.x)
                cy = 0.5*(s.first_point.y + s.last_point.y)
                if self.front_roi_min_y <= cy <= self.front_roi_max_y and abs(cx) <= self.roi_half_width:
                    spd = self.estimate_speed(cx, cy, now)
                    reps.append((math.hypot(cx,cy), cx, cy, spd))

        self.prev_tracks = [Track(x=r[1], y=r[2], t=now) for r in reps]

        dec = ObstacleDecision()
        dec.header = msg.header if hasattr(msg,"header") else Header(stamp=now)
        dec.type = ObstacleDecision.DYNAMIC
        dec.action = ObstacleDecision.ACT_NONE
        dec.target_speed = -1.0
        dec.lateral_offset = 0.0
        dec.hold_time = rospy.Duration(0.0)
        dec.confidence = 0.0

        if not reps:
            self.pub.publish(dec); return

        reps.sort(key=lambda r: (r[0], -r[3]))   # (거리↑, 속도↓)
        dist, x, y, spd = reps[0]

        if abs(x) >= self.lane_escape_x:
            self.pub.publish(dec); return

        if spd >= self.speed_thr:
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
                dec.confidence = 0.4
        else:
            dec.confidence = 0.2

        self.pub.publish(dec)

if __name__ == "__main__":
    DynamicJudge()
    rospy.spin()
