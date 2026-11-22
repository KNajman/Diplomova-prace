#!/usr/bin/env python3
"""
@file    gen_test_images.py
@brief   Generátor testovacích snímků: všech 2^24 barev ve 4 snímcích 2048 x 2048 a šum salt-and-pepper
@author  Bc. Karel Najman
@date    2026-11-22
@copyright Bc. Karel Najman, Technická univerzita v Liberci

Režimy:
  colors <adresář> [--size N]
      Všech 2^24 barev RGB, každá právě jednou, ve 4 snímcích N x N (výchozí 2048, 4 * 2048^2 = 2^24).
      Snímek q, pixel (x, y): index = (q << 22) | (y << 11) | x, R = index[23:16], G = index[15:8], B = index[7:0].
      Menší N (mocnina 2) dá prvních 4 * N^2 barev - pro rychlé testy. Výstup colors_q<q>.ppm (P6).
  saltpepper <vstup> <adresář> [--density 5 10 20] [--seed 1] [--size WxH]
      Šedý snímek (BT.601, zaokrouhlení) + šum salt-and-pepper: s pravděpodobností density % je pixel
      nahrazen 0 nebo 255 (půl na půl). Výstup sp_clean_<W>x<H>.pgm a sp_<density>_<W>x<H>.pgm (P5).
      --size ořízne střed snímku (např. 64x48 pro rychlou simulaci).

Převod na HEX pro testbenche (TDATA v pořadí UG934) a golden výstupy dělá imgproc_cli (tohex, median),
viz DP/vhdl/tb/gen_vectors.sh. Výstupy jsou deterministické (pevné semínko).
"""

import argparse
import os
import sys

import numpy as np
from PIL import Image

COLOR_BITS = 24
QUADRANTS = 4


def write_pnm(path, pixels):
    """Zapíše uint8 pole H x W (P5) nebo H x W x 3 (P6) jako binární PNM."""
    height, width = pixels.shape[:2]
    magic = b"P6" if pixels.ndim == 3 else b"P5"
    with open(path, "wb") as f:
        f.write(magic + b"\n%d %d\n255\n" % (width, height))
        f.write(np.ascontiguousarray(pixels, dtype=np.uint8).tobytes())


def generate_colors(out_dir, size):
    """Všechny barvy (pro size = 2048) ve 4 snímcích, kontrola jedinečnosti."""
    if (size & (size - 1)) != 0 or size > 2048:
        sys.exit("--size musí být mocnina 2 a nejvýš 2048")
    coord_bits = size.bit_length() - 1
    y, x = np.mgrid[0:size, 0:size].astype(np.uint32)
    seen = np.zeros(1 << COLOR_BITS, dtype=bool)
    for quadrant in range(QUADRANTS):
        index = (np.uint32(quadrant) << np.uint32(2 * coord_bits)) | (y << np.uint32(coord_bits)) | x
        if coord_bits < 11:
            # menší snímky: indexy rozprostřít přes celý rozsah (krok), aby se pokryly všechny bity složek
            index = index * np.uint32(1 << (2 * (11 - coord_bits)))
        if seen[index].any():
            sys.exit("CHYBA: barva se opakuje")
        seen[index] = True
        rgb = np.stack(((index >> 16) & 0xFF, (index >> 8) & 0xFF, index & 0xFF), axis=-1).astype(np.uint8)
        path = os.path.join(out_dir, "colors_q%d.ppm" % quadrant)
        write_pnm(path, rgb)
        print("Zapsáno %s (%dx%d)" % (path, size, size))
    print("Barev celkem: %d z %d%s" % (seen.sum(), 1 << COLOR_BITS, " (všechny)" if seen.all() else ""))


def to_gray(image):
    """Šedá BT.601 s celočíselným zaokrouhlením: (77 R + 150 G + 29 B + 128) >> 8 (jen příprava vstupu)."""
    rgb = np.asarray(image.convert("RGB"), dtype=np.uint32)
    return ((77 * rgb[..., 0] + 150 * rgb[..., 1] + 29 * rgb[..., 2] + 128) >> 8).astype(np.uint8)


def crop_center(pixels, size):
    """Ořízne střed snímku na W x H."""
    width, height = (int(v) for v in size.lower().split("x"))
    top = (pixels.shape[0] - height) // 2
    left = (pixels.shape[1] - width) // 2
    if top < 0 or left < 0:
        sys.exit("--size je větší než vstupní snímek")
    return pixels[top:top + height, left:left + width]


def generate_salt_pepper(input_path, out_dir, densities, seed, size):
    """Čistý šedý snímek a jeho zašuměné verze."""
    clean = to_gray(Image.open(input_path))
    if size:
        clean = crop_center(clean, size)
    height, width = clean.shape
    suffix = "%dx%d" % (width, height)
    write_pnm(os.path.join(out_dir, "sp_clean_%s.pgm" % suffix), clean)
    rng = np.random.default_rng(seed)
    for density in densities:
        noisy = clean.copy()
        hit = rng.random(clean.shape) < (density / 100.0)
        salt = rng.random(clean.shape) < 0.5
        noisy[hit & salt] = 255
        noisy[hit & ~salt] = 0
        path = os.path.join(out_dir, "sp_%d_%s.pgm" % (density, suffix))
        write_pnm(path, noisy)
        print("Zapsáno %s (%s, šum %d %%, zasaženo %d px)" % (path, suffix, density, int(hit.sum())))


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="mode", required=True)
    colors = sub.add_parser("colors", help="všech 2^24 barev ve 4 snímcích")
    colors.add_argument("out_dir")
    colors.add_argument("--size", type=int, default=2048)
    noise = sub.add_parser("saltpepper", help="šedý snímek se šumem salt-and-pepper")
    noise.add_argument("input")
    noise.add_argument("out_dir")
    noise.add_argument("--density", type=int, nargs="+", default=[5, 10, 20])
    noise.add_argument("--seed", type=int, default=1)
    noise.add_argument("--size", default="")
    args = parser.parse_args()

    os.makedirs(args.out_dir, exist_ok=True)
    if args.mode == "colors":
        generate_colors(args.out_dir, args.size)
    else:
        generate_salt_pepper(args.input, args.out_dir, args.density, args.seed, args.size)


if __name__ == "__main__":
    main()
