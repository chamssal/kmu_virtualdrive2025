from std_msgs.msg import String  # 추가

class RotaryDetectorNode:
    def __init__(self):
        rospy.init_node("rotary_obstacle", anonymous=False)

        # 기존 파라미터들 ...
        self.front_deg_min = np.deg2rad(-115.0)
        self.front_deg_max = np.deg2rad(+115.0)
        self.max_dist      = rospy.get_param("~max_dist", 2.5)
        self.max_gap_deg   = rospy.get_param("~max_gap_deg", 8.0)
        self.min_cluster   = rospy.get_param("~min_cluster", 2)
        self.max_cluster   = rospy.get_param("~max_cluster", 40)

        # Subs/Pubs
        rospy.Subscriber("/lidar2D", LaserScan, self.callback, queue_size=1)
        self.obstacle_pub = rospy.Publisher("/lidar_obstacle_information", LidarObstacleInfoArray, queue_size=10)
        self.rotary_pub   = rospy.Publisher("/rotary_info", RotaryArray, queue_size=10)
        self.marker_pub   = rospy.Publisher("/visualization_marker", Marker, queue_size=10)
        self.circle_pub   = rospy.Publisher("/obstacles", Obstacles, queue_size=10)
        
        # 🚀 새 퍼블리셔 추가
        self.enter_pub    = rospy.Publisher("/rotary/enter", String, queue_size=10)

        rospy.loginfo("[rotary_obstacle] ready")

    def callback(self, scan: LaserScan):
        # 기존 코드 그대로...
        ranges = scan.ranges
        n = len(ranges)
        ang_min = scan.angle_min
        ang_inc = scan.angle_increment

        obstacle_arr = LidarObstacleInfoArray()
        searching = False
        cluster_idx0 = -1
        prev_ang = None
        prev_r   = None
        count    = 0

        def finish_cluster(i_start, i_end):
            if i_start < 0 or i_end < 0:
                return
            size = (i_end - i_start + 1)
            if size < self.min_cluster or size > self.max_cluster:
                return
            mid = (i_start + i_end) // 2
            ang = ang_min + mid * ang_inc
            r   = ranges[mid]
            if not (isfinite(r) and r > scan.range_min and r < scan.range_max):
                return
            x = r * np.cos(ang)
            y = r * np.sin(ang)
            info = LidarObstacleInfo(obst_x=float(x), obst_y=float(y))
            obstacle_arr.obstacle_infos.append(info)

        # 클러스터링 로직...
        for i in range(n):
            r = ranges[i]
            if not (isfinite(r) and r > scan.range_min and r < scan.range_max):
                if searching:
                    finish_cluster(cluster_idx0, i-1)
                    searching = False
                continue

            ang = ang_min + i * ang_inc
            if ang < self.front_deg_min or ang > self.front_deg_max:
                if searching:
                    finish_cluster(cluster_idx0, i-1)
                    searching = False
                continue

            if 0.0 <= r <= self.max_dist:
                if not searching:
                    searching = True
                    cluster_idx0 = i
                    count = 1
                else:
                    gap_deg = abs((ang - prev_ang) * 180.0 / np.pi) if prev_ang is not None else 0.0
                    if gap_deg <= self.max_gap_deg:
                        count += 1
                    else:
                        finish_cluster(cluster_idx0, i-1)
                        cluster_idx0 = i
                        count = 1
                prev_ang = ang
                prev_r   = r
            else:
                if searching:
                    finish_cluster(cluster_idx0, i-1)
                    searching = False
                    count = 0
                    prev_ang = None
                    prev_r   = None

        if searching:
            finish_cluster(cluster_idx0, n-1)

        # 기존 퍼블리시
        self.obstacle_pub.publish(obstacle_arr)
        marker = Marker()
        marker.header.frame_id = "base_link"
        marker.header.stamp = rospy.Time.now()
        marker.ns = "lidar_obstacles"
        marker.id = 0
        marker.type = Marker.SPHERE_LIST
        marker.action = Marker.ADD
        marker.pose.orientation.w = 1.0
        marker.scale.x = marker.scale.y = marker.scale.z = 0.2
        marker.color.a = 1.0
        marker.color.b = 1.0
        marker.color.r = marker.color.g = 0.0

        for info in obstacle_arr.obstacle_infos:
            marker.points.append(Point(x=info.obst_x, y=info.obst_y, z=0.0))
        self.marker_pub.publish(marker)

        rot_arr = RotaryArray()
        min_dist = float("inf")  # 🚀 가장 가까운 장애물 거리 기록
        if obstacle_arr.obstacle_infos:
            for info in obstacle_arr.obstacle_infos:
                x, y = info.obst_x, info.obst_y
                r = float(np.hypot(x, y))
                if r < min_dist:
                    min_dist = r
                orient = ord('l') if y > 0 else ord('r')
                rot = RotaryMsg(dis=r, orientation=orient)
                rot_arr.moving_cars.append(rot)
        else:
            rot_arr.moving_cars.append(RotaryMsg(dis=-10000.0, orientation=ord('n')))
        
        self.rotary_pub.publish(rot_arr)

        obst_msg = Obstacles()
        obst_msg.header.stamp = rospy.Time.now()
        obst_msg.header.frame_id = "base_link"
        for info in obstacle_arr.obstacle_infos:
            circ = CircleObstacle()
            circ.center.x = info.obst_x
            circ.center.y = info.obst_y
            circ.center.z = 0.0
            circ.radius   = 0.3
            obst_msg.circles.append(circ)
        self.circle_pub.publish(obst_msg)

        # 🚀 진입 가능 여부 퍼블리시
        msg = String()
        if min_dist <= 1.0:  # 1m 이내
            msg.data = "deny"
        else:
            msg.data = "allow"
        self.enter_pub.publish(msg)
