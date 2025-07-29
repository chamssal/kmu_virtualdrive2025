import rospy

class PIDController:
    def __init__(self, Kp=1.0, Ki=0.0, Kd=0.05):
        self.Kp = Kp
        self.Ki = Ki
        self.Kd = Kd

        self.prev_error = 0.0
        self.integral = 0.0
        self.last_time = None

    def reset(self):
        self.prev_error = 0.0
        self.integral = 0.0
        self.last_time = None

    def compute(self, target, current):
        now = rospy.Time.now().to_sec()
        dt = now - self.last_time if self.last_time else 0.1
        self.last_time = now

        error = target - current
        self.integral += error * dt
        derivative = (error - self.prev_error) / dt if dt > 0 else 0.0

        output = self.Kp * error + self.Ki * self.integral + self.Kd * derivative
        self.prev_error = error
        return output
