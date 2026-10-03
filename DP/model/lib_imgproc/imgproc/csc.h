/**
 * @file    csc.h
 * @brief   Lineární převod barevných prostorů (color space conversion) maticí 3x3 v Q2.15
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Výpočet pro každý výstupní kanál o (shodně v C modelu, HLS i VHDL):
 *   acc = sum_i(coeff[o][i] * in[i]) + (offset[o] << 15)
 *   out = saturate_0_255((acc + 2^14) >> 15)
 * Koeficienty jsou 18bitové se znaménkem (Q2.15, port B násobičky DSP48E2).
 * Sloupce matice odpovídají pořadí složek v paměti (UG934: G, B, R).
 *
 * Poznámka k volbě formátu Q2.15 (2 celé bity včetně znaménka, 15 zlomkových, celkem 18 bitů):
 *  - 18 bitů je šířka portu B násobičky DSP48E2 (27 x 18), takže jeden koeficient = jeden DSP
 *    bez ohledu na to, kolik zlomkových bitů použijeme. Přesnost navíc je v HW zadarmo.
 *  - Rozsah +-4 stačí: všechny koeficienty převodů RGB <-> YCbCr mají absolutní hodnotu < 1.
 *  - OpenCV 4.x počítá RGB -> šedá také s 15 zlomkovými bity (9798, 19235, 3735), takže
 *    převod na šedou je s cv::cvtColor bitově shodný (ověřeno na všech 2^24 barvách).
 *  - Původní Q3.14 dávala vůči OpenCV odchylku +-1 u 0,26 % barev.
 */

#ifndef LIB_IMGPROC_CSC_H_
#define LIB_IMGPROC_CSC_H_

#include <imgproc/types.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define IMGPROC_CSC_FRAC_BITS   (15u)       ///< Počet zlomkových bitů koeficientů (Q2.15)
#define IMGPROC_CSC_COEFF_MIN   (-131072)   ///< Minimální koeficient (18 b se znaménkem, -4.0 v Q2.15)
#define IMGPROC_CSC_COEFF_MAX   (131071)    ///< Maximální koeficient (18 b se znaménkem, +3.99997 v Q2.15)

/// Předdefinované konfigurace převodu
typedef enum
{
    IMGPROC_CSC_RGB_TO_GRAY_BT601 = 0,      ///< RGB -> Y (BT.601), 3 -> 1 kanál, shodné s cv::COLOR_RGB2GRAY
    IMGPROC_CSC_RGB_TO_YCBCR_BT601_FULL,    ///< RGB -> YCbCr BT.601, plný rozsah 0..255 (JPEG)
    IMGPROC_CSC_RGB_TO_YCBCR_BT709_FULL,    ///< RGB -> YCbCr BT.709, plný rozsah 0..255
    IMGPROC_CSC_RGB_TO_YCBCR_BT601_STUDIO,  ///< RGB -> YCbCr BT.601, studio rozsah (Y 16..235, C 16..240)
    IMGPROC_CSC_RGB_TO_YCBCR_BT709_STUDIO,  ///< RGB -> YCbCr BT.709, studio rozsah (Y 16..235, C 16..240)
    IMGPROC_CSC_GRAY_TO_RGB,                ///< Y -> RGB (R = G = B = Y), 1 -> 3 kanály
    IMGPROC_CSC_PRESET_COUNT                ///< Počet předvoleb (není platná předvolba)
} imgproc_csc_preset_t;

/// Matice převodu v pevné řádové čárce
typedef struct
{
    uint8_t ch_in;                                          ///< Počet vstupních kanálů (1 nebo 3)
    uint8_t ch_out;                                         ///< Počet výstupních kanálů (1 nebo 3)
    int32_t coeff[IMGPROC_CH_MAX][IMGPROC_CH_MAX];          ///< Koeficienty [výstup][vstup], Q2.15
    int16_t offset[IMGPROC_CH_MAX];                         ///< Celočíselný offset výstupu (0..255)
} imgproc_csc_matrix_t;

/// Vypočítá matici předvolby z definičních konstant standardu (Kr, Kb) a kvantuje ji do Q2.15
void imgproc_csc_make(imgproc_csc_preset_t preset, imgproc_csc_matrix_t* matrix);

/// Vrátí textový název předvolby (pro generátory a výpisy)
const char* imgproc_csc_name(imgproc_csc_preset_t preset);

/// Převede jeden pixel
void imgproc_csc_pixel(const imgproc_csc_matrix_t* matrix, const uint8_t* in, uint8_t* out);

/// Převede celý obraz (src->channels == ch_in, dst->channels == ch_out, stejné rozměry)
void imgproc_csc(const imgproc_image_t* src, const imgproc_image_t* dst, const imgproc_csc_matrix_t* matrix);

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_CSC_H_ */
