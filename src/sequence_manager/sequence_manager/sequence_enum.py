from enum import IntEnum

class SequenceState(IntEnum):
    SLAM = -1
    IDLE = 0
    LANE_FOLLOWING = 1
    LANE_OBSTACLE = 2
    STATIC_OBSTACLE = 3
    DYNAMIC_OBSTACLE = 4
    TRAFFIC_LIGHT = 5
    TURN_LEFT = 6
    TURN_RIGHT = 7
    ROTARY = 8
    ROTARY_ENTRY = 9
    # 필요 시 이후 상태 계속 추가 가능
