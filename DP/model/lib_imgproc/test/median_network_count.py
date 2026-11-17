#!/usr/bin/env python3
"""Počet porovnání v třídicí síti mediánu 3 × 3 (stejná struktura jako median.c, hls_median.cpp, median_core.vhd).

Síť je zapsaná jako 7 × sort3 (21 porovnání). Z posledních čtyř sort3 se ale používá jen jeden výstup
(z minim maximum, z maxim minimum, ze středních hodnot a z poslední trojice medián), takže syntéza nepoužitou
logiku odstraní. Skript počítá porovnání jen pro výstupy, které se opravdu použijí, a ověřuje správnost:
všech 2^9 binárních vstupů (princip 0-1 pro komparátorové sítě) a náhodné 8bitové vstupy.

V softwaru se porovnání v med3 může přeskočit (rozhodnuto dřív), proto počet vychází 17 až 19;
v hardwaru existují všechny komparátory současně, tedy 19 (9 + 2 + 2 + 3 + 3).
Paeth (Graphics Gems, 1990) uvádí pro svou síť 20 porovnání.
"""

import itertools
import random

POCET = 0


def mensi(a, b):
    global POCET
    POCET += 1
    return a < b


def sort3(a, b, c):
    """Plné sort3 (řádky okna): 3 porovnání, výstup (min, medián, max)."""
    ab = mensi(a, b)
    lo_ab, hi_ab = (a, b) if ab else (b, a)
    hi_c = mensi(hi_ab, c)
    lo_c = mensi(lo_ab, c)
    lo = lo_ab if lo_c else c
    hi = c if hi_c else hi_ab
    mid = hi_ab if hi_c else (c if lo_c else lo_ab)
    return lo, mid, hi


def max3(a, b, c):
    """Jen výstup .hi ze sort3: 2 porovnání."""
    hi_ab = b if mensi(a, b) else a
    return c if mensi(hi_ab, c) else hi_ab


def min3(a, b, c):
    """Jen výstup .lo ze sort3: 2 porovnání."""
    lo_ab = a if mensi(a, b) else b
    return lo_ab if mensi(lo_ab, c) else c


def med3(a, b, c):
    """Jen výstup .mid ze sort3: 3 porovnání."""
    ab = mensi(a, b)
    lo_ab, hi_ab = (a, b) if ab else (b, a)
    if mensi(hi_ab, c):
        return hi_ab
    return c if mensi(lo_ab, c) else lo_ab


def med9(okno):
    radky = [sort3(*okno[0:3]), sort3(*okno[3:6]), sort3(*okno[6:9])]
    max_minim = max3(radky[0][0], radky[1][0], radky[2][0])
    med_medianu = med3(radky[0][1], radky[1][1], radky[2][1])
    min_maxim = min3(radky[0][2], radky[1][2], radky[2][2])
    return med3(max_minim, med_medianu, min_maxim)


def main():
    global POCET
    spravne = True
    pocty = set()
    vstupy = [list(w) for w in itertools.product((0, 1), repeat=9)]
    vstupy += [[random.randrange(256) for _ in range(9)] for _ in range(200000)]
    for okno in vstupy:
        POCET = 0
        spravne &= med9(okno) == sorted(okno)[4]
        pocty.add(POCET)
    print('medián správně: {}, porovnání na jeden medián (SW): {}–{}, v HW: 19'.format(
        spravne, min(pocty), max(pocty)))
    return 0 if spravne and max(pocty) == 19 else 1


if __name__ == '__main__':
    raise SystemExit(main())
