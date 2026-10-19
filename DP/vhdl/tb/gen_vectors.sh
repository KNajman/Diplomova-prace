#!/usr/bin/env bash
# =============================================================================
#  Vygeneruje testovací vektory pro VHDL testbenche do tb/data/ (gitem ignorováno).
#  Reference = golden model (DP/model, nástroj imgproc_cli). Spouštět z DP/vhdl/tb:
#      bash gen_vectors.sh          (malé testy, sekundy)
#      bash gen_vectors.sh --full   (+ všech 2^24 barev pro HSV ve 4 částech, ~470 MB, jen Ababel)
# =============================================================================
set -euo pipefail
FULL="${1:-}"
HERE="$(cd "$(dirname "$0")" && pwd)"
MODEL="$HERE/../../model"
make -s -C "$MODEL" cli
CLI="$MODEL/build/imgproc_cli"
mkdir -p "$HERE/data" && cd "$HERE/data"

# Testovací obraz 64x48: řádek 0 hraniční hodnoty, horní polovina gradient, dolní šum (jako tbv::fill_pattern)
python3 - <<'PY'
import random
random.seed(1)
W, H = 64, 48
EDGES = [0, 1, 127, 128, 254, 255]
px = []
for y in range(H):
    for x in range(W):
        if y == 0:
            px.append([EDGES[(x + 2 * c) % 6] for c in range(3)])
        elif y < H // 2:
            px.append([((x * (c + 1)) + y) & 255 for c in range(3)])
        else:
            px.append([random.getrandbits(8) for c in range(3)])
with open("test_64x48.ppm", "wb") as f:
    f.write(b"P6\n%d %d\n255\n" % (W, H))
    f.write(bytes(v for p in px for v in p))
# 256x256: R = x, G = y, B = (x + y) / 2 a v každém 4. řádku B = G -> všechna pořadí kanálů i shody
with open("ramp_256x256.ppm", "wb") as f:
    f.write(b"P6\n256 256\n255\n")
    data = bytearray()
    for y in range(256):
        for x in range(256):
            b = y if (y % 4 == 0) else (x + y) // 2
            data += bytes((x, y, b))
    f.write(bytes(data))
random.seed(5)
open("rand_16x8_rgb.hex", "w").write("".join("%06X\n" % random.getrandbits(24) for _ in range(16 * 8)))
PY

"$CLI" tohex test_64x48.ppm in_rgb
for p in rgb_to_gray_bt601 rgb_to_ycbcr_bt601_full rgb_to_ycbcr_bt709_full rgb_to_ycbcr_bt601_studio rgb_to_ycbcr_bt709_studio; do
    "$CLI" csc test_64x48.ppm "csc_$p" "$p"
done
"$CLI" tohex csc_rgb_to_gray_bt601.pgm in_gray
"$CLI" csc csc_rgb_to_gray_bt601.pgm csc_gray_to_rgb gray_to_rgb

# RGB <-> HSV
"$CLI" tohex ramp_256x256.ppm in_ramp
"$CLI" rgb2hsv test_64x48.ppm hsv_test
"$CLI" rgb2hsv ramp_256x256.ppm hsv_ramp
"$CLI" hsv2rgb hsv_test.ppm rgb_from_hsv_test
# HSV rampa 256x256 v surovém pořadí PPM (H, S, V): H = x (vč. neplatných 180..255), S = y (řádek 0: S = 0),
# V = (x + y) mod 256. Vstupní HEX = TDATA [7:0] H, [15:8] S, [23:16] V.
python3 - <<'PY'
with open("hsvin_256x256.ppm", "wb") as f, open("in_hsv_ramp.hex", "w") as h:
    f.write(b"P6\n256 256\n255\n")
    for y in range(256):
        for x in range(256):
            hue, sat, val = x, y, (x + y) % 256
            f.write(bytes((hue, sat, val)))
            h.write("%02X%02X%02X\n" % (val, sat, hue))
PY
"$CLI" hsv2rgb hsvin_256x256.ppm rgb_from_hsv_ramp

# Medián 3x3 (okénková jádra): obraz 64x48 (šedá z CSC) + malé a liché rozměry, oba okraje
python3 - <<'PY'
import random
random.seed(3)
for w, h in ((8, 1), (8, 2), (9, 3), (17, 5), (33, 4), (64, 48)):
    if (w, h) == (64, 48):
        continue
    with open("gray_%dx%d.pgm" % (w, h), "wb") as f:
        f.write(b"P5\n%d %d\n255\n" % (w, h))
        f.write(bytes(random.getrandbits(8) if (x + y) % 3 else (x * 37 + y * 11) & 255 for y in range(h) for x in range(w)))
PY
cp csc_rgb_to_gray_bt601.pgm gray_64x48.pgm
for size in 8x1 8x2 9x3 17x5 33x4 64x48; do
    "$CLI" tohex "gray_$size.pgm" "in_gray_$size"
    for border in constant replicate; do
        "$CLI" median "gray_$size.pgm" "median_${size}_$border" "$border"
    done
done

# Histogram: šedé obrazy výše + extrémy pro čítače: plochý obraz (všech 3072 px v jednom koši,
# inkrement každý takt) a vzor a,b,a,c (opakování koše ve vzdálenosti 1-4 jako test HLS forwardingu)
python3 - <<'PY'
with open("gray_flat_64x48.pgm", "wb") as f:
    f.write(b"P5\n64 48\n255\n" + bytes([200]) * (64 * 48))
pattern = (7, 7, 9, 7, 9, 11, 7, 255, 0, 0)
with open("gray_repeat_64x48.pgm", "wb") as f:
    f.write(b"P5\n64 48\n255\n" + bytes(pattern[i % len(pattern)] for i in range(64 * 48)))
PY
for name in gray_flat_64x48 gray_repeat_64x48; do
    "$CLI" tohex "$name.pgm" "in_$name"
done
for name in gray_64x48 gray_9x3 gray_8x1 gray_flat_64x48 gray_repeat_64x48; do
    "$CLI" hist "$name.pgm" "$name"
done

# 2D konvoluce: předvolby 3x3 (golden zapíše i <prefix>_kernel.txt pro testbench) + vlastní jádra 5x5 a 7x7
for kernel in identity mean sharpen sobel_x sobel_y; do
    for border in constant replicate; do
        "$CLI" filter gray_64x48.pgm "filter_${kernel}_64x48_$border" "$kernel" "$border"
    done
done
python3 - <<'PY'
import random
random.seed(7)
for k in (5, 7):
    coeff = [[random.randint(-8, 8) for _ in range(k)] for _ in range(k)]
    with open("kernel_k%d.txt" % k, "w") as f:
        f.write("%d %d %d\n" % (k, 1500 + 700 * k, 40 - 10 * k))
        for row in coeff:
            f.write(" ".join(str(v) for v in row) + "\n")
PY
for k in 5 7; do
    for size in 64x48 9x3 8x1; do
        for border in constant replicate; do
            "$CLI" filterk "gray_$size.pgm" "filter_k${k}_${size}_$border" "kernel_k$k.txt" "$border"
        done
    done
done

# Úplný test: všech 2^24 barev ve 4 částech 2048x2048 (golden model má max. 3840x2160).
# Část k: pixel i -> R = 64k + (i >> 16), G = (i >> 8) & 255, B = i & 255. Tytéž bajty čtené jako H, S, V
# dávají všechny kombinace H 0..255 x S x V pro HSV -> RGB.
if [ "$FULL" = "--full" ]; then
    for part in 0 1 2 3; do
        PART=$part python3 - <<'PY'
import os
part = int(os.environ["PART"])
with open("all_colors_%d.ppm" % part, "wb") as f, open("in_all_hsv_%d.hex" % part, "w") as h:
    f.write(b"P6\n2048 2048\n255\n")
    for r in range(64 * part, 64 * part + 64):
        row = bytes(v for g in range(256) for b in range(256) for v in (r, g, b))
        f.write(row)
        h.write("".join("%02X%02X%02X\n" % (b, g, r) for g in range(256) for b in range(256)))
PY
        "$CLI" tohex "all_colors_$part.ppm" "in_all_colors_$part"
        "$CLI" rgb2hsv "all_colors_$part.ppm" "hsv_all_colors_$part"
        "$CLI" hsv2rgb "all_colors_$part.ppm" "rgb_from_all_hsv_$part"
    done
fi
