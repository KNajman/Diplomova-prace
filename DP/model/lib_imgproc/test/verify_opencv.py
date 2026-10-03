#!/usr/bin/env python3
"""
Ověření golden C modelu (lib_imgproc) proti OpenCV.
Překlad sdílené knihovny:  gcc -O2 -shared -fPIC -I. -Itemplate imgproc/*.c -lm -o libimgproc.so
Spuštění:                  python3 test/verify_opencv.py <cesta k libimgproc.so>
"""
import ctypes as C
import sys
import numpy as np
import cv2

lib = C.CDLL(sys.argv[1] if len(sys.argv) > 1 else "./libimgproc.so")

class Image(C.Structure):
    _fields_ = [("data", C.POINTER(C.c_uint8)), ("width", C.c_uint32), ("height", C.c_uint32),
                ("stride", C.c_uint32), ("channels", C.c_uint8)]

class CscMatrix(C.Structure):
    _fields_ = [("ch_in", C.c_uint8), ("ch_out", C.c_uint8), ("coeff", (C.c_int32 * 3) * 3),
                ("offset", C.c_int16 * 3)]

class Kernel(C.Structure):
    _fields_ = [("size", C.c_uint8), ("coeff", (C.c_int8 * 7) * 7), ("scale_q14", C.c_int32), ("delta", C.c_int16)]

_keep = []     # drží numpy pole naživu, dokud na ně ukazuje C struktura

def img(arr):
    arr = np.ascontiguousarray(arr)
    _keep.append(arr)
    if len(_keep) > 16:
        del _keep[0]
    ch = 1 if arr.ndim == 2 else arr.shape[2]
    return Image(arr.ctypes.data_as(C.POINTER(C.c_uint8)), arr.shape[1], arr.shape[0], arr.shape[1] * ch, ch), arr

def rgb_to_mem(rgb):      # OpenCV RGB (R,G,B) -> paměť UG934 (G,B,R)
    return np.ascontiguousarray(rgb[..., [1, 2, 0]])

def mem_to_rgb(mem):
    return np.ascontiguousarray(mem[..., [2, 0, 1]])

def all_colors_chunks():
    allc = np.arange(1 << 24, dtype=np.uint32)
    rgb = np.stack([(allc >> 16) & 255, (allc >> 8) & 255, allc & 255], axis=-1).astype(np.uint8)
    for k in range(4):
        yield rgb[k * (1 << 22):(k + 1) * (1 << 22)].reshape(2048, 2048, 3)

def report(name, a, b, expect_exact):
    d = np.abs(a.astype(np.int32) - b.astype(np.int32))
    ok = (d.max() == 0) if expect_exact else True
    print(f"{'PASS' if ok else 'FAIL'}  {name:42s} max|diff|={d.max():3d}  mismatch={np.count_nonzero(d)}/{d.size}")
    return ok

results = []

# --- 1) RGB -> GRAY, vsech 2^24 barev ---------------------------------------
m = CscMatrix(); lib.imgproc_csc_make(0, C.byref(m))
mx = 0; mism = 0; total = 0
for rgb in all_colors_chunks():
    src, s_arr = img(rgb_to_mem(rgb)); dst_arr = np.zeros(rgb.shape[:2], np.uint8); dst, _ = img(dst_arr)
    lib.imgproc_csc(C.byref(src), C.byref(dst), C.byref(m))
    d = np.abs(dst_arr.astype(int) - cv2.cvtColor(rgb, cv2.COLOR_RGB2GRAY).astype(int))
    mx = max(mx, d.max()); mism += np.count_nonzero(d); total += d.size
print(f"{'PASS' if mx == 0 else 'FAIL'}  {'RGB->GRAY BT.601 vs cv2 (2^24 barev)':42s} max|diff|={mx:3d}  mismatch={mism}/{total}")
results.append(mx == 0)

# --- 2) RGB -> HSV, vsech 2^24 barev -----------------------------------------
mx = 0; mism = 0; total = 0
for rgb in all_colors_chunks():
    src, _ = img(rgb_to_mem(rgb)); dst_arr = np.zeros_like(rgb); dst, _ = img(dst_arr)
    lib.imgproc_rgb_to_hsv(C.byref(src), C.byref(dst))
    d = np.abs(dst_arr.astype(int) - cv2.cvtColor(rgb, cv2.COLOR_RGB2HSV).astype(int))
    mx = max(mx, d.max()); mism += np.count_nonzero(d); total += d.size
print(f"{'PASS' if mx == 0 else 'FAIL'}  {'RGB->HSV vs cv2 (2^24 barev)':42s} max|diff|={mx:3d}  mismatch={mism}/{total}")
results.append(mx == 0)

# --- 3) HSV -> RGB vs cv2 (jen informativně) a round-trip --------------------
mx = 0; mx_rt = 0
for rgb in all_colors_chunks():
    hsv = cv2.cvtColor(rgb, cv2.COLOR_RGB2HSV)
    src, _ = img(hsv); dst_arr = np.zeros_like(rgb); dst, _ = img(dst_arr)
    lib.imgproc_hsv_to_rgb(C.byref(src), C.byref(dst))
    mine = mem_to_rgb(dst_arr)
    mx = max(mx, np.abs(mine.astype(int) - cv2.cvtColor(hsv, cv2.COLOR_HSV2RGB).astype(int)).max())
    mx_rt = max(mx_rt, np.abs(mine.astype(int) - rgb.astype(int)).max())
print(f"INFO  {'HSV->RGB vs cv2 (2^24)':42s} max|diff|={mx:3d}")
print(f"INFO  {'RGB->HSV->RGB round-trip (2^24)':42s} max|diff|={mx_rt:3d}  (kvantizace H na 2 stupne)")

# --- 4) RGB -> YCrCb BT.601 full vs cv2 (informativně) -----------------------
m = CscMatrix(); lib.imgproc_csc_make(1, C.byref(m))
mx = 0
for rgb in all_colors_chunks():
    src, _ = img(rgb_to_mem(rgb)); dst_arr = np.zeros_like(rgb); dst, _ = img(dst_arr)
    lib.imgproc_csc(C.byref(src), C.byref(dst), C.byref(m))
    ref = cv2.cvtColor(rgb, cv2.COLOR_RGB2YCrCb)[..., [0, 2, 1]]     # Y,Cr,Cb -> Y,Cb,Cr (UG934)
    mx = max(mx, np.abs(dst_arr.astype(int) - ref.astype(int)).max())
print(f"INFO  {'RGB->YCbCr BT.601 full vs cv2 (2^24)':42s} max|diff|={mx:3d}")

# --- 5) Prahování -----------------------------------------------------------
rng = np.random.default_rng(1)
gray = rng.integers(0, 256, (480, 640), dtype=np.uint8)
ok = True
for t in (0, 1, 77, 128, 254, 255):
    for typ in range(5):
        src, _ = img(gray); dst_arr = np.zeros_like(gray); dst, _ = img(dst_arr)
        lib.imgproc_threshold(C.byref(src), C.byref(dst), C.c_uint8(t), C.c_uint8(200), typ)
        ok &= np.array_equal(dst_arr, cv2.threshold(gray, t, 200, typ)[1])
print(f"{'PASS' if ok else 'FAIL'}  {'threshold 5 typu x 6 prahu vs cv2':42s}")
results.append(ok)

# --- 6) Median 3x3 REPLICATE vs cv2.medianBlur ------------------------------
src, _ = img(gray); dst_arr = np.zeros_like(gray); dst, _ = img(dst_arr)
lib.imgproc_median3x3(C.byref(src), C.byref(dst), 1)
results.append(report("median3x3 REPLICATE vs cv2.medianBlur", dst_arr, cv2.medianBlur(gray, 3), True))

# --- 7) filter2D vs cv2.filter2D (BORDER_CONSTANT) -------------------------
names = ["identity", "mean", "sharpen", "sobel_x", "sobel_y"]
for p, n in enumerate(names):
    k = Kernel(); lib.imgproc_kernel_make(p, C.byref(k))
    kf = np.array([[k.coeff[r][c] for c in range(3)] for r in range(3)], np.float64) * (k.scale_q14 / 16384.0)
    src, _ = img(gray); dst_arr = np.zeros_like(gray); dst, _ = img(dst_arr)
    lib.imgproc_filter2d(C.byref(src), C.byref(dst), C.byref(k), 0)
    ref = cv2.filter2D(gray, cv2.CV_8U, kf, borderType=cv2.BORDER_CONSTANT)
    exact = n in ("identity", "sharpen", "sobel_x", "sobel_y")
    results.append(report(f"filter2d {n} vs cv2.filter2D", dst_arr, ref, exact))

# --- 8) Chyba metod magnitudy vuci presne L2 (Sobel, realny obraz) -----------
lib.imgproc_magnitude.restype = C.c_int32
gx = rng.integers(-1020, 1021, 200000); gy = rng.integers(-1020, 1021, 200000)
l2 = np.sqrt(gx.astype(float) ** 2 + gy.astype(float) ** 2)
sel = l2 > 64
for meth, n in enumerate(["L1", "Linf", "AMBM a=1 b=1/2", "AMBM a=15/16 b=15/32", "L2 (int)"]):
    v = np.array([lib.imgproc_magnitude(int(a), int(b), meth) for a, b in zip(gx[:20000], gy[:20000])], float)
    rel = (v - l2[:20000])[sel[:20000]] / l2[:20000][sel[:20000]]
    print(f"INFO  magnituda {n:24s} rel. chyba min={rel.min()*100:+6.1f} %  max={rel.max()*100:+6.1f} %")

print("\nVYSLEDEK:", "VSE PROSLO" if all(results) else "NEKTERE TESTY SELHALY")
sys.exit(0 if all(results) else 1)
