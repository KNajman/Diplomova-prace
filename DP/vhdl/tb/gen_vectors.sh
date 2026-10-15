#!/usr/bin/env bash
# =============================================================================
#  Vygeneruje testovací vektory pro VHDL testbenche do tb/data/ (gitem ignorováno).
#  Reference = golden model (DP/model, nástroj imgproc_cli). Spouštět z DP/vhdl/tb:
#      bash gen_vectors.sh
# =============================================================================
set -euo pipefail
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
random.seed(5)
open("rand_16x8_rgb.hex", "w").write("".join("%06X\n" % random.getrandbits(24) for _ in range(16 * 8)))
PY

"$CLI" tohex test_64x48.ppm in_rgb
for p in rgb_to_gray_bt601 rgb_to_ycbcr_bt601_full rgb_to_ycbcr_bt709_full rgb_to_ycbcr_bt601_studio rgb_to_ycbcr_bt709_studio; do
    "$CLI" csc test_64x48.ppm "csc_$p" "$p"
done
"$CLI" tohex csc_rgb_to_gray_bt601.pgm in_gray
"$CLI" csc csc_rgb_to_gray_bt601.pgm csc_gray_to_rgb gray_to_rgb
