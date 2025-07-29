#!/usr/bin/env python3

import rospy
from std_msgs.msg import Float64
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu
from pid_controller import PIDController
import numpy as np

class ControllerNode:
    def __init__(self):
        rospy.init_node('controller_node')

        # PID 컨트롤러 인스턴스
        self.steer_pid = PIDController(Kp=1.2, Ki=0.0, Kd=0.05)
        self.speed_pid = PIDController(Kp=1.0, Ki=0.1, Kd=0.01)

        # 타겟값 (Perception/Planning 등에서 받음)
        self.target_steer = 0.0
        self.target_speed = 0.0

        # 현재값 (IMU/Odom에서 계산)
        self.current_steer = 0.0  # 각속도 기반 조향 추정 시 사용 가능
        self.current_speed = 0.0  # Odom 기반 선속도

        # 퍼블리셔
        self.pub_steer = rospy.Publisher('/cmd_steer', Float64, queue_size=10)
        self.pub_speed = rospy.Publisher('/cmd_speed', Float64, queue_size=10)

        # 서브스크라이버
        rospy.Subscriber('/steering_angle', Float64, self.steer_callback)
        rospy.Subscriber('/target_speed', Float64, self.speed_callback)
        rospy.Subscriber('/odom', Odometry, self.odom_callback)
        rospy.Subscriber('/imu', Imu, self.imu_callback)

        self.control_rate = rospy.Rate(20)  # 20 Hz 제어 루프

    def steer_callback(self, msg):
        self.target_steer = msg.data

    def speed_callback(self, msg):
        self.target_speed = msg.data

    def odom_callback(self, msg):
        self.current_speed = msg.twist.twist.linear.x

    def imu_callback(self, msg):
        # IMU angular velocity를 조향값에 대응시키려면 보정 필요
        # 여기서는 단순 예시
        self.current_steer = msg.angular_velocity.z

    def run(self):
        while not rospy.is_shutdown():
            steer_cmd = self.steer_pid.compute(self.target_steer, self.current_steer)
            speed_cmd = self.speed_pid.compute(self.target_speed, self.current_speed)

            steer_cmd = np.clip(steer_cmd, -1.0, 1.0)
            speed_cmd = max(0.0, speed_cmd)  # 속도는 음수가 안 되도록 제한

            self.pub_steer.publish(Float64(steer_cmd))
            self.pub_speed.publish(Float64(speed_cmd))

            rospy.loginfo(f"[Controller] Steer: {steer_cmd:.3f} | Speed: {speed_cmd:.2f}")
            self.control_rate.sleep()

if __name__ == '__main__':
    try:
        node = ControllerNode()
        node.run()
    except rospy.ROSInterruptException:
        pass
