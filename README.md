# Implementace vybraných algoritmů zpracování obrazu v hradlovém poli

Autor: Bc. Karel Najman
Vedoucí práce: Ing. Martin Rozkovec, Ph.D.

## Zadání práce

Seznamte se s vývojovými nástroji AMD Vitis, Vitis HLS, Vivado a s platformou AMD KV260
Proveďte rešerši základních operací počítačového zpracování obrazu a analýzu jejich realizace v HW
Vybrané algoritmy implementujte v SW a HW a to pomocí jazyka VHDL a vysokoúrovňové syntézy
Výsledky HW implementací porovnejte se SW rešením

## Doporučená literatura

ŠONKA, Milan a HLAVÁČ, Václav. Počítačové vidění. V Praze: Grada, 1992. ISBN 80-85424-67-3
HARRIS, David and HARRIS, Sarah, Digital Design and Computer Architecture, Second Edition. V San Francisco. Morgan Kaufmann Publishers Inc., 2012,
ISBN 9789382291527.
AMD, Inc. Vitis High-Level Synthesis User Guilde (UG1399). 2025. Dostupné také z: [AMD, Inc. Vitis High-Level Synthesis User Guide (UG1399)](https://docs.amd.com/r/en-US/ug1399-vitis-hls/)

## Seznam vybraných algoritmů

Převod do různých barevných prostorů (RGB, HSV, YUV, YCbCr)
Prahování obrazu
Konvoluce
Histogram jasu
Detekce hran (Sobelův filtr)
Průměrovací filter - mean filter
Mediánový filter

## Poznámky k práci

Zde jsou uvedeny poznámky k implementaci jednotlivých algoritmů, které byly použity při zpracování obrazu v hradlovém poli.

### Převod do různých barevných prostorů

#### Vzorečky pro převod

RGB na HSV:
$$
R = R / 255
G = G / 255
B = B / 255

Cmax = max(R, G, B)
Cmin = min(R, G, B)

\delta = Cmax - Cmin
if \delta == 0:
    H = 0
elif Cmax == R:
    H = 60 * (((G - B) / \delta) % 6)
elif Cmax == G:
    H = 60 * (((B - R) / \delta) + 2)
elif Cmax == B:
    H = 60 * (((R - G) / \delta) + 4)

if Cmax == 0:
    S = 0
else:
    S = \delta / Cmax

V = Cmax
$$

RGB na YUV:

$$
Y = 0.299R + 0.587G + 0.114B
U = 0.492(B - Y)
V = 0.877(R - Y)
$$

RGB na YCbCr:
$$
Y  =  16 + (65.481 * R) + (128.553 * G) + (24.966 * B)
Cb = 128 - (37.797 * R) - (74.203 * G) + (112.0 * B)
Cr = 128 + (112.0 * R) - (93.786 * G) - (18.214 * B)
$$