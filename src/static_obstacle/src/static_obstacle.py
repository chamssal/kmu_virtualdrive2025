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
        self.use_circles  = rospy.get_param("~use_circles", True)
        self.use_segments = rospy.get_param("~use_segments", False)

        # 전방=fwd=x, 좌우=lat=y
        self.front_roi_min_x = rospy.get_param("~front_roi_min_x", 0.5)   # ★ 전방 ROI 시작 (m)
        self.front_roi_max_x = rospy.get_param("~front_roi_max_x", 8.0)   # ★ 전방 ROI 끝   (m)

        # 사다리꼴 ROI 파라미터(멀수록 좁게)
        self.roi_half_width_near = rospy.get_param("~roi_half_width_near", 0.8)  # x≈0일 때 좌우 반폭
        self.roi_half_width_far  = rospy.get_param("~roi_half_width_far",  0.45) # x≈front_roi_max_x일 때 좌우 반폭

        # 동적 판정/액션 파라미터
        self.speed_thr       = rospy.get_param("~speed_threshold_dynamic", 0.3)
        self.yield_distance  = rospy.get_param("~yield_distance", 2.5)
        self.stop_distance   = rospy.get_param("~stop_distance", 1.2)
        self.lane_escape_lat = rospy.get_param("~lane_escape_lat", 0.9)    # ★ 차선 밖(y)
        self.hold_time_yield = rospy.get_param("~hold_time_yield", 1.5)
        self.target_speed_yield = rospy.get_param("~target_speed_yield", 0.5)

        # 벽/잡음 억제 필터
        self.max_circle_radius = rospy.get_param("~max_circle_radius", 0.6)      # ★ 큰 원형 클러스터 제외
        self.max_segment_len   = rospy.get_param("~max_segment_len",   1.2)      # ★ 긴 선분(벽) 제외
        self.max_segment_side_deg = rospy.get_param("~max_segment_side_deg", 60) # ★ 측면 각도(>60°) 제외

        self.pub = rospy.Publisher("/dynamic_obstacle/decision", ObstacleDecision, queue_size=1)
        rospy.Subscriber(self.input_topic, Obstacles, self.cb, queue_size=1)

        self.prev_tracks = []

    def estimate_speed(self, x, y, now):
        if not self.prev_tracks: return 0.0
        best = min(self.prev_tracks, key=lambda tr: (tr.x - x)**2 + (tr.y - y)**2)
        dt = (now - best.t).to_sec()
        if dt <= 1e-3: return 0.0
        return math.hypot((x - best.x)/dt, (y - best.y)/dt)

    # ★ 사다리꼴 ROI: x가 멀수록 허용 좌우 폭을 선형으로 줄임
    def in_trapezoid(self, fwd, lat):
        if fwd < self.front_roi_min_x or fwd > self.front_roi_max_x:
            return False
        alpha = (fwd - self.front_roi_min_x) / max(1e-6, (self.front_roi_max_x - self.front_roi_min_x))
        w = self.roi_half_width_near + (self.roi_half_width_far - self.roi_half_width_near) * max(0.0, min(1.0, alpha))
        return abs(lat) <= w

    def cb(self, msg: Obstacles):
        now = msg.header.stamp if hasattr(msg, "header") else rospy.Time.now()
        reps = []

        # 원형 객체 처리
        if self.use_circles:
            for c in msg.circles:
                fwd = c.center.x   # x = 전방(+)
                lat = c.center.y   # y = 좌우(좌+)
                # ★ 큰 반지름(벽 근처 군집) 제외
                if hasattr(c, "radius") and c.radius > self.max_circle_radius:
                    continue
                # ★ 사다리꼴 ROI 적용
                if not self.in_trapezoid(fwd, lat):
                    continue
                spd = self.estimate_speed(fwd, lat, now)
                reps.append((math.hypot(fwd, lat), fwd, lat, spd))

        # 선분 객체 처리(옵션)
        if self.use_segments:
            side_th = math.radians(self.max_segment_side_deg)
            for s in msg.segments:
                x1, y1 = s.first_point.x, s.first_point.y
                x2, y2 = s.last_point.x,  s.last_point.y
                cx, cy = 0.5*(x1+x2), 0.5*(y1+y2)
                fwd, lat = cx, cy
                # ★ 긴 선분은 벽으로 간주하여 제외
                seg_len = math.hypot(x2-x1, y2-y1)
                if seg_len > self.max_segment_len:
                    continue
                # ★ 측면 각도(진행방향과 평행한 벽) 제외
                theta = abs(math.atan2(y2-y1, x2-x1))  # 0=전방, ~pi/2=측면
                if theta > side_th:
                    continue
                if not self.in_trapezoid(fwd, lat):
                    continue
                spd = self.estimate_speed(fwd, lat, now)
                reps.append((math.hypot(fwd, lat), fwd, lat, spd))

        # 추적 버퍼 갱신
        self.prev_tracks = [Track(x=r[1], y=r[2], t=now) for r in reps]

        # 기본 결정 초기화
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

        # (거리↑, 속도↓) 우선
        reps.sort(key=lambda r: (r[0], -r[3]))
        dist, fwd, lat, spd = reps[0]

        # ★ 차선 밖으로 충분히 벗어났으면 간섭하지 않음(좌우 기준)
        if abs(lat) >= self.lane_escape_lat:
            self.pub.publish(dec); return

        # 동적성/거리 기반 액션
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
