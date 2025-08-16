#!/usr/bin/env python3
#-*-coding:utf-8-*-

import cv2
import rospy
import numpy as np
from cv_bridge import CvBridge

from sensor_msgs.msg import CompressedImage

from obstacle_detect.msg import LidarObstacleInfoArray
from obstacle_detect.msg import ObstacleInfo, ObstacleInfoArray

from sensor_msgs.msg import Image 

def rotation_from_euler(roll=1., pitch=1., yaw=1.):
    si, sj, sk = np.sin(roll), np.sin(pitch), np.sin(yaw)
    ci, cj, ck = np.cos(roll), np.cos(pitch), np.cos(yaw)
    cc, cs = ci * ck, ci * sk
    sc, ss = si * ck, si * sk

    R = np.identity(4)
    R[0, 0] = cj * ck
    R[0, 1] = sj * sc - cs
    R[0, 2] = sj * cc + ss
    R[1, 0] = cj * sk
    R[1, 1] = sj * ss + cc
    R[1, 2] = sj * cs - sc
    R[2, 0] = -sj
    R[2, 1] = cj * si
    R[2, 2] = cj * ci
    return R

def translation_matrix(vector):
    M = np.identity(4)
    M[:3, 3] = vector[:3]
    return M

class CamObstacleDetect:
    def __init__(self):
        rospy.init_node('camera_obstacle')

        rospy.Subscriber('/lidar_obstacle_information', LidarObstacleInfoArray, self.lidar_obstacle_callback)
        rospy.Subscriber('/image_jpeg/compressed', CompressedImage, self.camera_obstacle_callback)

        self.obstacles_pub = rospy.Publisher('/obstacle_information', ObstacleInfoArray, queue_size=10)
        self.crop_pub = rospy.Publisher("/obstacle_crop", Image, queue_size=1)
        self.bridge = CvBridge()


        self.img, self.hsv, self.gray = None, None, None
        self.obstacle_info = None
        
        self.bridge = CvBridge()
        self.get_image = lambda msg: self.bridge.compressed_imgmsg_to_cv2(msg)

        self.kernel3 = cv2.getStructuringElement(cv2.MORPH_RECT, (3,3))
        self.kernel5 = cv2.getStructuringElement(cv2.MORPH_RECT, (5,5))

        fx, fy = 320., 320.
        u0, v0 = 320., 240.

        intrinsic = np.array([[fx, 0., u0, 0.],
                              [0., fy, v0, 0.],
                              [0., 0., 1., 0.],
                              [0., 0., 0., 1.]], dtype=np.float32)

        # R = np.array([[0., 1., 0., 0.],
        #               [0., 0., -1., 0.],
        #               [-1., 0., 0., 0.],
        #               [0., 0., 0., 1.]], dtype=np.float32)
        R = np.array([
            [1., 0., 0., 0.],
            [0., 0., -1., 0.],
            [0., 1., 0., 0.],
            [0., 0., 0., 1.]
        ], dtype=np.float32)


        roll, pitch, yaw = 0., 0., -0.14
        x, y, z = 0.17, 0., -0.02

        R_veh2cam = np.transpose(rotation_from_euler(roll, pitch, yaw))
        T_veh2cam = translation_matrix((-x, -y, -z))

        extrinsic = R @ R_veh2cam @ T_veh2cam

        self.ipm_matrix = intrinsic @ extrinsic
        self.ipm_matrix_reverse = np.linalg.inv(self.ipm_matrix)
        
        
    def lidar_obstacle_callback(self, msg: LidarObstacleInfoArray):
        if self.hsv is None or self.img is None or self.gray is None:
            return

        rows = [[info.obst_y, -info.obst_x, 0.0, 1.0] for info in msg.obstacle_infos]
        self.obstacle_info = np.asarray(rows, dtype=np.float32).reshape(-1, 4)

    def camera_obstacle_callback(self, msg: CompressedImage):
        self.img = self.get_image(msg)
        self.h, self.w, _ = self.img.shape
        self.hsv = cv2.cvtColor(self.img, cv2.COLOR_BGR2HSV)
        self.gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)

        data = ObstacleInfoArray()

        if self.obstacle_info is None or self.obstacle_info.shape[0] == 0:
            self.obstacles_pub.publish(data)
            return

        obs = np.array(self.obstacle_info, copy=True)  # (N,4)
        N = obs.shape[0]

        # ⬇⬇⬇ 여기부터 추가: '당기기' (radial shrink)
        # delta = 0.  # 당길 거리[m], 필요에 맞게 0.1~0.5 등으로 조절
        # v = obs[:, :3]                             # (x,y,z)
        # r = np.linalg.norm(v, axis=1)              # 각 점의 거리
        # r_safe = np.maximum(r, 1e-6)
        # scale = np.clip((r - delta) / r_safe, 0.05 / r_safe, 1.0)  # 최소 5cm는 남기기
        # obs[:, 0] *= scale; obs[:, 1] *= scale; obs[:, 2] *= scale
        # ⬆⬆⬆ 추가 끝

        pts = obs.T
        proj = self.ipm_matrix @ pts
        denom = proj[2, :]

        valid_denom = np.isfinite(denom) & (np.abs(denom) > 1e-6)
        if not np.any(valid_denom):
            self.obstacles_pub.publish(data)
            return

        uv_all = np.full((N, 2), np.nan, dtype=np.float32)
        uv_all[valid_denom, 0] = proj[0, valid_denom] / denom[valid_denom]
        uv_all[valid_denom, 1] = proj[1, valid_denom] / denom[valid_denom]

        in_img = (
            np.isfinite(uv_all[:, 0]) & np.isfinite(uv_all[:, 1]) &
            (uv_all[:, 0] >= 0) & (uv_all[:, 0] < self.w) &
            (uv_all[:, 1] >= 0) & (uv_all[:, 1] < self.h)
        )
        valid_idx = np.where(in_img)[0]

        for k in valid_idx:
            x_pix = int(uv_all[k, 0])
            y_pix = int(uv_all[k, 1])

            x0 = max(0, x_pix - 20); x1 = min(self.w, x_pix + 20)
            y0 = max(0, y_pix - 30); y1 = min(self.h, y_pix + 10)

            # ROI 이미지 크롭
            cropped_img = self.img[y0:y1, x0:x1].copy()
            if cropped_img.size > 0:
                crop_msg = self.bridge.cv2_to_imgmsg(cropped_img, encoding="bgr8")
                self.crop_pub.publish(crop_msg)

            # 기존 로직 유지
            is_white = self.find_white_car(x_pix, y_pix)
            is_white = self.find_white_car_new(cropped_img)
            _x = -float(obs[k, 1])
            _y =  float(obs[k, 0])
            if not np.isfinite(_x) or not np.isfinite(_y):
                continue
            is_dyn = not is_white
            
            dist = float(np.hypot(_x, _y))


            data.obstacles.append(
                ObstacleInfo(x=_x, y=_y, distance=float(np.hypot(_x, _y)), is_dynamic=bool(is_dyn))
            )
        
            if is_dyn:
                color = (0, 0, 255)   # 빨간색 (동적)
            else:
                color = (0, 255, 0)   # 초록색 (정적)
            cv2.circle(self.img, (x_pix, y_pix), 5, color, -1)
            cv2.putText(self.img, f"{dist:.1f}m",
                        (x_pix + 5, y_pix - 5),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 1)

        # ---- 루프 끝난 후 전체 이미지 표시 ----
        cv2.imshow("Obstacle Visualization", self.img)
        cv2.waitKey(1)

        self.obstacles_pub.publish(data)


    # 사람은 바지색 보고 판단하기
    def find_person(self, x, y):
        # 남색 영역(바지)에 대한 색상범위
        # 90, 110, 160, 0, 255
        b_lo = np.array([90, 160, 0])
        b_hi = np.array([110, 255, 255])

        # 색상범위에 대한 mask 값
        b_mask = cv2.inRange(self.hsv, b_lo, b_hi)
        # cv2.imshow('b_mask', b_mask) # DEBUG
        
        person = cv2.bitwise_and(self.gray, self.gray, mask=b_mask)
        # 후추 제거 후 빈칸 채우기 - 필요하지 않을 수도 있음
        erode = cv2.morphologyEx(person, cv2.MORPH_ERODE, self.kernel3)
        # cv2.imshow('erode', erode) # DEBUG
        
        person = cv2.morphologyEx(erode, cv2.MORPH_DILATE, self.kernel5) # 최종 출력
        person[person > 0] = 255
        
        # cv2.imshow('person', person)

        # print(len(person[y-30:y + 10, x - 20:x + 20].nonzero()[0]))

        return len(person[y - 50:y + 40, x - 20:x +20].nonzero()[0]) > 500
    
    # 사람은 바지색 보고 판단하기
    def find_white_car(self, x, y):
        # 남색 영역(바지)에 대한 색상범위
        # 90, 110, 160, 0, 255
        w_lo = np.array([0, 34, 80])
        w_hi = np.array([179, 255, 255])
        
        w_lo = np.array([0,0,200])
        w_hi = np.array([179,60,255])

        # 색상범위에 대한 mask 값
        w_mask = cv2.inRange(self.hsv, w_lo, w_hi)
        
        cv2.imshow("hi", self.hsv)

        
        car = cv2.bitwise_and(self.gray, self.gray, mask=w_mask)
        # 후추 제거 후 빈칸 채우기 - 필요하지 않을 수도 있음
        erode = cv2.morphologyEx(car, cv2.MORPH_ERODE, self.kernel3)
        # cv2.imshow('erode', erode) # DEBUG
        
        car = cv2.morphologyEx(erode, cv2.MORPH_DILATE, self.kernel5) # 최종 출력
        car[car > 0] = 255

        #cv2.imshow('car', car[y - 20:y + 20, x - 20:x +20])
        #cv2.waitKey(1)



        # print(len(car[y - 20:y + 20, x - 20:x +20].nonzero()[0]))
        return len(car[y - 20:y + 20, x - 20:x +20].nonzero()[0]) > 500
    
        # 사람은 바지색 보고 판단하기
    def find_white_car_new(self, img_roi, show=True):
        if img_roi is None or img_roi.size == 0:
            return False, (0,0,0), None

        hsv = cv2.cvtColor(img_roi, cv2.COLOR_BGR2HSV)
        
        v_min = 80  # 높을수록 더 밝은 흰색을 봄
        s_max = 90   # 낮을수록 더 하양으로 보는 컷이 낮아짐
        ratio_thr = 0.45
        
        
        # 흰색: S 낮고 V 높음 (H는 무시)
        lower = np.array([0,   0,    v_min], dtype=np.uint8)
        upper = np.array([179, s_max, 255  ], dtype=np.uint8)
        mask = cv2.inRange(hsv, lower, upper)

        # (선택) 작은 잡음 정리
        kernel = getattr(self, "kernel3", cv2.getStructuringElement(cv2.MORPH_RECT, (3,3)))
        mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel, iterations=1)
        mask = cv2.morphologyEx(mask, cv2.MORPH_DILATE, kernel, iterations=1)

        white_px = int(cv2.countNonZero(mask))

        # 임계치 결정: px_thr가 주어지지 않으면 비율 기반으로 계산
        h, w = mask.shape
        px_thr = int(ratio_thr * h * w)

        is_white = (white_px >= px_thr)
        print(f"{white_px}, {px_thr}, {h*w}")
            
        if show:
            cv2.imshow("roi", img_roi)
            cv2.imshow("white_mask", mask)
            cv2.waitKey(1)

        return bool(is_white)


if __name__ == '__main__':
    try:
        pub = CamObstacleDetect()
        rospy.spin()

    except rospy.ROSInterruptException:
        pass