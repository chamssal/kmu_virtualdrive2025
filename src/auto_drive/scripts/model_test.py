import cv2
import numpy as np
import math
import os

def resize_and_pad(img, new_shape=(640, 640), color=114):
    """레터박스 리사이즈: 이미지를 new_shape 크기로 리사이즈하고 패딩을 추가합니다."""
    shape = img.shape[:2]  # (높이, 너비)
    r = min(new_shape[0] / shape[0], new_shape[1] / shape[1])
    # 리사이즈 후 패딩 전 크기 계산
    new_unpad = (int(round(shape[1] * r)), int(round(shape[0] * r)))  # (w, h)
    # 패딩 크기 계산
    dw, dh = new_shape[1] - new_unpad[0], new_shape[0] - new_unpad[1]
    dw //= 2; dh //= 2

    # 이미지 리사이즈
    img = cv2.resize(img, new_unpad, interpolation=cv2.INTER_AREA)
    # 전체 캔버스 생성 및 패딩 색 채우기
    canvas = np.full((new_shape[0], new_shape[1], 3), color, dtype=np.uint8)
    # 리사이즈된 이미지를 가운데에 붙이기
    canvas[dh:dh + new_unpad[1], dw:dw + new_unpad[0]] = img
    return canvas, r, dw, dh, new_unpad

def compute_steering(offset, focal_length=1.0):
    """
    픽셀 오프셋을 스티어링 각도로 변환합니다.
    (단순 비례 모델; focal_length는 필요에 따라 조정하세요.)
    """
    # atan2(offset, focal_length*640)로 비례각 계산 후 도(degree) 단위로 변환
    return math.degrees(math.atan2(offset, focal_length * 640))

def annotate_image(img_bgr, lane_mask, steer_angle, offset_px):
    """이미지 위에 차선, 중심선, 조향 화살표, 텍스트를 그려 반환합니다."""
    h, w = img_bgr.shape[:2]
    # 차선 마스크가 0이 아닌 픽셀의 좌표 찾기
    ys, xs = np.where(lane_mask > 0)
    if len(xs) == 0:
        return img_bgr  # 차선 픽셀이 없으면 원본 반환
    # 차선 중심 x 좌표 계산
    lane_x = int(xs.mean())
    # 이미지 가로 중앙
    mid_x = w // 2

    # 마젠타 색상의 오버레이 생성
    overlay = img_bgr.copy()
    overlay[lane_mask > 0] = (255, 0, 255)
    # 오버레이 합성
    result = cv2.addWeighted(img_bgr, 0.7, overlay, 0.3, 0)

    # 차량 중심(노랑선)과 차선 중심(빨강선) 그리기
    cv2.line(result, (mid_x, 0), (mid_x, h), (0, 255, 255), 2)
    cv2.line(result, (lane_x, 0), (lane_x, h), (0, 0, 255), 2)

    # 조향 화살표 그리기
    arrow_tip  = (mid_x, int(h * 0.7))
    arrow_base = (lane_x, int(h * 0.7))
    cv2.arrowedLine(result, arrow_tip, arrow_base, (0, 255, 0), 4, tipLength=0.2)

    # 스티어링 각도 텍스트 추가
    text1 = f"Steering Angle: {steer_angle:.2f} deg"
    cv2.putText(result, text1, (10, 30),
                cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
    # 오프셋 텍스트 추가
    text2 = f"Offset: {offset_px:.1f} px"
    cv2.putText(result, text2, (10, 70),
                cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)

    return result

def main():
    # 모델과 입력/출력 파일 경로 설정
    model_path = '/models/yolop-640-640.onnx'
    # 테스트용 640×480 JPG 파일 (경로를 실제 파일명으로 수정하세요)
    img_path   = '/image/test_image1.webp'
    out_path   = '/image/test_done_1.jpg'

    # ONNX 모델 로드
    net = cv2.dnn.readNet(model_path)

    # 입력 이미지 읽기
    img_bgr = cv2.imread(img_path)
    if img_bgr is None:
        raise FileNotFoundError(f"이미지를 찾을 수 없습니다: {img_path}")
    h, w = img_bgr.shape[:2]

    # BGR→RGB 변환 후 전처리
    img_rgb = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2RGB)
    canvas, r, dw, dh, (unpad_w, unpad_h) = resize_and_pad(img_rgb, (640, 640))
    # 정규화 (0~1) 및 ImageNet 평균/표준편차 적용
    blob = canvas.astype(np.float32) / 255.0
    mean = np.array([0.485, 0.456, 0.406], dtype=np.float32)
    std  = np.array([0.229, 0.224, 0.225], dtype=np.float32)
    blob = (blob - mean) / std
    # (H,W,C)->(C,H,W)로 차원 이동 후 배치 차원 추가
    blob = blob.transpose(2, 0, 1)[None, ...]

    # 추론 실행
    net.setInput(blob)
    det_out, da_seg, ll_seg = net.forward(['det_out', 'drive_area_seg', 'lane_line_seg'])

    # 차선(seg channel=1) 마스크 추출
    ll_seg = ll_seg[0, 1, :, :]            # (640×640)
    ll_mask = (ll_seg > 0.5).astype(np.uint8) * 255
    # 패딩 제거 및 원본 크기로 리사이즈
    ll_mask = ll_mask[dh:dh+unpad_h, dw:dw+unpad_w]
    ll_mask = cv2.resize(ll_mask, (w, h), interpolation=cv2.INTER_LINEAR)

    # 오프셋 및 스티어링 각도 계산
    xs = np.where(ll_mask > 0)[1]
    offset_px   = xs.mean() - (w / 2) if len(xs) > 0 else 0
    steer_angle = compute_steering(offset_px)

    # 결과 이미지에 시각화 후 저장
    vis = annotate_image(img_bgr, ll_mask, steer_angle, offset_px)
    cv2.imwrite(out_path, vis)
    print(f"저장 완료: {out_path} — Steering: {steer_angle:.2f}°, Offset: {offset_px:.1f}px")

if __name__ == '__main__':
    main()
