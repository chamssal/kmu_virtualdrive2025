#!/usr/bin/env python3
import numpy as np
from math import atan2, sqrt

# ==== 대응되는 세 점 (world ↔ map) ====
world = np.array([
    [-3.2349, -2.8635],
    [ 2.1020, -5.9220],
    [ 0.4750, -11.5160],
])

map_ = np.array([
    [-13.7143,  -4.2128],
    [ -9.8645,  -9.3855],
    [-12.7574, -13.6951],
])

# --- 중심 이동 (mean-centered) ---
wc = world.mean(axis=0)
mc = map_.mean(axis=0)

Wc = world - wc
Mc = map_  - mc

# --- 회전 구하기 (SVD) ---
H = Wc.T @ Mc
U, S, Vt = np.linalg.svd(H)
R = Vt.T @ U.T

if np.linalg.det(R) < 0:  # reflection 방지
    Vt[1,:] *= -1
    R = Vt.T @ U.T

t = mc - R @ wc   # 평행이동

# --- yaw 회전각도 ---
yaw = atan2(R[1,0], R[0,0])

# quaternion (2D 회전만 고려 → qz, qw)
qz = np.sin(yaw/2.0)
qw = np.cos(yaw/2.0)

print("=== world → map 변환 ===")
print(f"Translation: tx={t[0]:.3f}, ty={t[1]:.3f}")
print(f"Rotation (yaw) = {yaw:.3f} rad")
print(f"Quaternion: qz={qz:.6f}, qw={qw:.6f}")

print("\nROS static_transform_publisher line:")
print(f'<node pkg="tf2_ros" type="static_transform_publisher" name="world_to_map" '
      f'args="{t[0]:.3f} {t[1]:.3f} 0 0 0 {qz:.6f} {qw:.6f} world map"/>')
