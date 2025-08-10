uint8 UNKNOWN=0
uint8 STATIC=1
uint8 DYNAMIC=2

uint8 ACT_NONE=0
uint8 ACT_STOP=1
uint8 ACT_YIELD=2
uint8 ACT_AVOID_LEFT=3
uint8 ACT_AVOID_RIGHT=4
uint8 ACT_SLOW=5

std_msgs/Header header
uint8 type
uint8 action
float64 target_speed
float64 lateral_offset
duration hold_time
float64 confidence
