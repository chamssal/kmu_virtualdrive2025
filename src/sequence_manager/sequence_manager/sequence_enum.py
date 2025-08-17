from enum import IntEnum

class SequenceState(IntEnum):
    SLAM = -1
    IDLE = 0
    LANE_FOLLOWING = 1
    LANE_OBSTACLE = 2
    STATIC_OBSTACLE = 3
    DYNAMIC_OBSTACLE = 4
    TRAFFIC_LIGHT = 5
    TRAFFIC_LIGHT_GO = 6
    TURN_LEFT = 7
    TURN_RIGHT = 8
    ROTARY = 9
    ROTARY_ENTRY = 10
    ROTARY_OUT = 11
    FORCED_STRAIGHT = 12
    # 필요 시 이후 상태 계속 추가 가능
