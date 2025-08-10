# 장애물 판단 메시지

# 타입 구분
uint8 UNKNOWN=0
uint8 STATIC=1
uint8 DYNAMIC=2

# 행동 명령
uint8 ACT_NONE=0
uint8 ACT_STOP=1
uint8 ACT_YIELD=2
uint8 ACT_AVOID_LEFT=3
uint8 ACT_AVOID_RIGHT=4
uint8 ACT_SLOW=5

std_msgs/Header header      # ROS 표준 헤더
uint8 type                  # STATIC or DYNAMIC
uint8 action                # STOP, YIELD, ...
float64 target_speed        # 권고 속도 (m/s)
float64 lateral_offset      # 좌우 회피 오프셋 (m)
duration hold_time          # 정지/양보 유지 시간
float64 confidence          # 판단 신뢰도 0~1
