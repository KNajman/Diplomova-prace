#!/usr/bin/env bash
# =============================================================================
#  Vygeneruje testovací vektory pro VHDL testbenche do tb/data/ (gitem ignorováno).
#  Reference = golden model (DP/model, nástroj imgproc_cli). Spouštět z DP/vhdl/tb:
#      bash gen_vectors.sh          (malé testy, sekundy)
#      bash gen_vectors.sh --full   (+ všech 2^24 barev pro HSV, ~240 MB, jen Ababel)
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

# Úplný test: všech 2^24 barev v obraze 4096x4096 (pixel i: R = i >> 16, G = (i >> 8) & 255, B = i & 255)
if [ "$FULL" = "--full" ]; then
    python3 - <<'PY'
with open("all_colors_4096.ppm", "wb") as f:
    f.write(b"P6\n4096 4096\n255\n")
    for r in range(256):
        f.write(bytes(v for g in range(256) for b in range(256) for v in (r, g, b)))
PY
    "$CLI" tohex all_colors_4096.ppm in_all_colors
    "$CLI" rgb2hsv all_colors_4096.ppm hsv_all_colors
    # všechny kombinace H 0..255 x S x V (stejný soubor, bajty čteny jako H, S, V)
    python3 - <<'PY'
with open("all_colors_4096.ppm", "rb") as f, open("in_all_hsv.hex", "w") as h:
    f.readline(); f.readline(); f.readline()
    data = f.read()
    for i in range(0, len(data), 3):
        h.write("%02X%02X%02X\n" % (data[i + 2], data[i + 1], data[i]))
PY
    "$CLI" hsv2rgb all_colors_4096.ppm rgb_from_all_hsv
fi
