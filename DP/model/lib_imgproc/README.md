# lib_imgproc – golden model algoritmů DP

Referenční (golden) model všech algoritmů diplomové práce v C11. Stejný kód slouží jako:

1. **reference pro verifikaci HW:** HLS i VHDL jádra se s ním musí shodovat **bitově**,
2. **SW řešení na Cortex-A53:** bare-metal, bez alokací a bez stdio, měří se jeho rychlost,
3. **zdroj pravdy pro konstanty:** matice CSC, jádra filtrů a tabulky HSV generuje `tools/gen_coeffs`.

## Algoritmy a konvence

| Modul | Funkce | Konvence / shoda |
|---|---|---|
| `csc` | lineární převod barev 3×3 | koeficienty Q2.15 (18 b), zaokrouhlení half-up, saturace 0–255, offset se přičítá před posunem; matice se počítají z Kr/Kb (BT.601, BT.709), plný i studio rozsah |
| `hsv` | RGB→HSV, HSV→RGB | RGB→HSV = celočíselný algoritmus OpenCV (shift 12), **bitově shodný s `cv::cvtColor`**; H 0–179 |
| `threshold` | 5 typů prahování | **bitově shodné s `cv::threshold`** |
| `filter` | 2D konvoluce, gradient (Sobel/Prewitt) | sémantika `cv::filter2D` (korelace), `scale` v Q.14, `delta`, nulový padding nebo replikace, režim SAME; 5 metod magnitudy (L1, L∞, α-max-β-min ×2, L2) |
| `median` | medián 3×3 | síť 7× sort3 (shodná s HLS a VHDL); s replikací **bitově shodné s `cv::medianBlur`** |
| `histogram` | histogram 256 košů, Otsuův práh | Otsu shodný s `cv::THRESH_OTSU` |

**Paměťový formát (UG934):** RGB = bajty G, B, R (TDATA[7:0] = G), YCbCr = Y, Cb, Cr, HSV = H, S, V, šedá = 1 bajt.

## Struktura

```
lib_imgproc/
  imgproc.h               hlavní include
  imgproc/*.h, *.c        moduly
  template/imgproc_custom.h   konfigurace (IMGPROC_ASSERT, IMGPROC_MAX_WIDTH) - zkopírovat do projektu
  test/test_imgproc.c     unit testy (běží i na cíli)
  test/verify_opencv.py   porovnání s OpenCV (PC)
```

## Použití

Do include cest přidat `lib_imgproc` a adresář s `imgproc_custom.h`, pak `#include <imgproc.h>`.

```c
imgproc_image_t src, dst;
imgproc_csc_matrix_t m;
imgproc_image_init(&src, rgb_buffer, 1920u, 1080u, 3u);
imgproc_image_init(&dst, gray_buffer, 1920u, 1080u, 1u);
imgproc_csc_make(IMGPROC_CSC_RGB_TO_GRAY_BT601, &m);
imgproc_csc(&src, &dst, &m);
```

## Překlad a testy (z adresáře `DP/model`)

**CMake (doporučeno, Windows: clang / MinGW / MSVC, Linux: gcc / clang):**

```
cmake -S . -B build -G Ninja
cmake --build build
ctest --test-dir build --output-on-failure     # unit testy + porovnání s OpenCV (pokud je Python + cv2)
cmake --build build --target gen               # generated/imgproc_coeffs.h + imgproc_coeffs_pkg.vhd
```

CMake vytvoří `build/compile_commands.json`, ze kterého clangd ve VS Code bere include cesty.

**Makefile (rychlá varianta pro Linux/Ababel):** `make test`, `make verify`, `make gen`, `make cli`.

## Závislosti

Jen standardní knihovna C (`stdint.h`, `stdbool.h`, `math.h` pro `lround`/`fabs` v `imgproc_csc_make`).
