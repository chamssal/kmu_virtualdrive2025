#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import math
import rospy
from collections import namedtuple
from std_msgs.msg import Header
from obstacle_detector.msg import Obstacles         # 입력
from obstacle_msgs.msg import ObstacleDecision      # 출력

Track = namedtuple("Track", ["x","y","t"])

class DynamicJudgeLikeTotal:
    """
    Total과 같은 철학:
      - (근거리에서) 동적이면 -> 차선 안에 있는 동안은 STOP, 차선 밖으로 빠지면 ACT_NONE
      - YIELD/감속 없음
      - is_dynamic 대신 속도 추정으로 동적 판정
    """
    def __init__(self):
        rospy.init_node("dynamic_obstacle_like_total")

        # ===== 파라미터 =====
        self.input_topic  = rospy.get_param("~input_topic", "/raw_obstacles")

        # 전방 ROI (y=전방, x=좌우)
        self.front_roi_min_y = rospy.get_param("~front_roi_min_y", 0.2)
        self.front_roi_max_y = rospy.get_param("~front_roi_max_y", 8.0)
        self.roi_half_width  = rospy.get_param("~roi_half_width", 0.9)

        # 동적 판정
        self.speed_thr = rospy.get_param("~speed_thr", 0.3)  # m/s 이상이면 "동적"
        # Total에서 타입 분류는 1.2m 근방에서만 일어났던 것에 맞춤
        self.classify_distance = rospy.get_param("~classify_distance", 1.2)

        # 차선 안/밖 임계 (Total의 x 경계와 동일 기본값)
        self.inlane_x_left  = rospy.get_param("~inlane_x_left",  -0.65)
        self.inlane_x_right = rospy.get_param("~inlane_x_right",  0.25)

        # 동적 상태 보존 시간 (Total의 obstacle_time과 유사)
        self.dynamic_hold_sec = rospy.get_param("~dynamic_hold_sec", 5.0)

        # ===== Pub/Sub =====
        rospy.Subscriber(self.input_topic, Obstacles, self.cb, queue_size=1)
        self.pub = rospy.Publisher("/dynamic_obstacle/decision", ObstacleDecision, queue_size=1)

        # ===== 내부 상태 =====
        self.prev_tracks = []          # 속도 추정용
        self.obstacle_time = None      # 최근 동적 감지 시각
        self.dynamic_active = False    # 동적 상태 유지 플래그

        rospy.loginfo("[DynamicJudgeLikeTotal] start (Total-style dynamic logic) input=%s", self.input_topic)

    def estimate_speed(self, x, y, now):
        if not self.prev_tracks:
            return 0.0
        best = min(self.prev_tracks, key=lambda tr: (tr.x - x)**2 + (tr.y - y)**2)
        dt = (now - best.t).to_sec()
        if dt <= 1e-3: return 0.0
        return math.hypot((x - best.x)/dt, (y - best.y)/dt)

    def in_front_roi(self, x, y):
        return (self.front_roi_min_y <= y <= self.front_roi_max_y) and (abs(x) <= self.roi_half_width)

    def is_in_lane(self, x):
        return (self.inlane_x_left <= x <= self.inlane_x_right)

    def cb(self, msg: Obstacles):
        now = msg.header.stamp if hasattr(msg, "header") else rospy.Time.now()

        # 동적 상태 만료 처리 (Total의 obstacle_time 리셋과 유사)
        if self.obstacle_time and (now.to_sec() - self.obstacle_time >= self.dynamic_hold_sec):
            self.dynamic_active = False
            self.obstacle_time = None

        # 후보 수집 (원형만 사용; 필요시 segment도 추가 가능)
        cands = []
        for c in msg.circles:
            x, y = c.center.x, c.center.y
            if not self.in_front_roi(x, y):
                continue
            spd = self.estimate_speed(x, y, now)
            dist = math.hypot(x, y)
            cands.append((dist, x, y, spd))

        print(f"[DynamicObstacle] Detected {len(cands)} candidates")
        for d, cx, cy, sp in cands:
            print(f"  dist={d:.2f} m, x={cx:.2f}, y={cy:.2f}, speed={sp:.2f} m/s")

        # 속도 추정용 버퍼 갱신
        self.prev_tracks = [Track(x=c[1], y=c[2], t=now) for c in cands]

        # 기본 결정
        dec = ObstacleDecision()
        dec.header = msg.header if hasattr(msg,"header") else Header(stamp=now)
        dec.type = ObstacleDecision.DYNAMIC
        dec.action = ObstacleDecision.ACT_NONE
        dec.target_speed = -1.0
        dec.lateral_offset = 0.0
        dec.hold_time = rospy.Duration(0.0)
        dec.confidence = 0.0

        if not cands:
            # 후보가 없으면 동적 상태만 유예(타임아웃 전까지 유지 가능)
            if not self.dynamic_active:
                print("[DynamicObstacle] No obstacle in ROI → ACT_NONE")
                self.pub.publish(dec)
                return
            # dynamic_active일 때도 in-lane 조건이 없으면 NONE
            self.pub.publish(dec)
            return

        # 가장 가까운 것 1개 (Total도 가까운 애 하나만 사용)
        cands.sort(key=lambda c: c[0])
        dist, x, y, spd = cands[0]

        # Total: 타입 분류는 근거리에서만 — 여기서도 동일하게 적용
        is_dynamic = spd >= self.speed_thr and dist <= self.classify_distance

        if is_dynamic:
            self.dynamic_active = True
            self.obstacle_time = now.to_sec()

        # Total 스타일의 행동:
        # - 동적 상태이고 차선 "안"이면 STOP 유지
        # - x가 차선 "밖"(> right or < left)이면 NONE (통과)
        if self.dynamic_active:
            if self.is_in_lane(x):
                dec.action = ObstacleDecision.ACT_STOP
                dec.target_speed = 0.0
                dec.hold_time = rospy.Duration(0.2)  # 짧게 유지, 콜백 주기마다 연장됨
                dec.confidence = 0.9
                print(f"[DynamicObstacle] DYNAMIC in-lane → STOP (x={x:.2f})")
            else:
                # 차선 밖 → 통과
                dec.action = ObstacleDecision.ACT_NONE
                dec.confidence = 0.6
                print(f"[DynamicObstacle] DYNAMIC out-of-lane → ACT_NONE (x={x:.2f})")
        else:
            # 동적으로 확정되지 않았거나, 너무 멀다면 아무 것도 안함
            print("[DynamicObstacle] Not dynamic or too far → ACT_NONE")

        self.pub.publish(dec)


if __name__ == "__main__":
    DynamicJudgeLikeTotal()
    rospy.spin()
