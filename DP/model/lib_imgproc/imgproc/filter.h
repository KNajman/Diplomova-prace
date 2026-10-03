/**
 * @file    filter.h
 * @brief   2D konvoluční filtr (mean, zostření, ...) a gradientní filtr (Sobel, Prewitt) s magnitudou
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Sémantika odpovídá cv::filter2D (korelace - jádro se NEotáčí, kotva ve středu):
 *   acc = sum_{r,c}(kernel[r][c] * src[y + r - R][x + c - R])          přesně, bez zaokrouhlení
 *   out = saturate_0_255(((acc * scale_q14 + 2^13) >> 14) + delta)
 * Okraj: IMGPROC_BORDER_CONSTANT (nuly) nebo IMGPROC_BORDER_REPLICATE, výstup má stejnou
 * velikost jako vstup (režim SAME).
 */

#ifndef LIB_IMGPROC_FILTER_H_
#define LIB_IMGPROC_FILTER_H_

#include <imgproc/types.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define IMGPROC_KERNEL_SIZE_MAX     (7u)        ///< Maximální velikost jádra (K x K)
#define IMGPROC_SCALE_FRAC_BITS     (14u)       ///< Zlomkové bity normalizačního koeficientu
#define IMGPROC_SCALE_ONE           (16384)     ///< scale = 1.0 v Q.14
#define IMGPROC_SCALE_MAX           (131071)    ///< Max. scale (18 bitů se znaménkem)

/// Konvoluční jádro s normalizací
typedef struct
{
    uint8_t size;                                                   ///< K (liché, 1..7)
    int8_t coeff[IMGPROC_KERNEL_SIZE_MAX][IMGPROC_KERNEL_SIZE_MAX]; ///< Koeficienty [řádek][sloupec]
    int32_t scale_q14;                                              ///< Normalizace, Q.14 (0..131071)
    int16_t delta;                                                  ///< Offset přičtený před saturací
} imgproc_kernel_t;

/// Předdefinovaná jádra 3x3
typedef enum
{
    IMGPROC_KERNEL_IDENTITY = 0,    ///< Identita (test průchodu)
    IMGPROC_KERNEL_MEAN,            ///< Průměrovací filtr: jedničky, scale = round(2^14 / 9)
    IMGPROC_KERNEL_SHARPEN,         ///< Zostření: [0 -1 0; -1 5 -1; 0 -1 0]
    IMGPROC_KERNEL_SOBEL_X,         ///< Sobel, derivace podle x (svislé hrany)
    IMGPROC_KERNEL_SOBEL_Y,         ///< Sobel, derivace podle y (vodorovné hrany)
    IMGPROC_KERNEL_PREWITT_X,       ///< Prewitt, derivace podle x
    IMGPROC_KERNEL_PREWITT_Y,       ///< Prewitt, derivace podle y
    IMGPROC_KERNEL_PRESET_COUNT     ///< Počet předvoleb (není platná předvolba)
} imgproc_kernel_preset_t;

/// Způsob výpočtu velikosti gradientu z Gx a Gy (otevřená volba - viz plán DP)
typedef enum
{
    IMGPROC_MAG_L1 = 0,     ///< |Gx| + |Gy|                          (max. chyba +41 %)
    IMGPROC_MAG_LINF,       ///< max(|Gx|, |Gy|)                       (max. chyba -29 %)
    IMGPROC_MAG_AMBM_1,     ///< max + (min >> 1)          alpha=1, beta=1/2        (~12 %)
    IMGPROC_MAG_AMBM_2,     ///< (15*max >> 4) + (15*min >> 5)  alpha=15/16, beta=15/32 (~6 %)
    IMGPROC_MAG_L2,         ///< round(sqrt(Gx^2 + Gy^2))  (přesná reference)
} imgproc_magnitude_t;

/// Vyplní jádro předvolby
void imgproc_kernel_make(imgproc_kernel_preset_t preset, imgproc_kernel_t* kernel);

/// Vrátí textový název předvolby jádra
const char* imgproc_kernel_name(imgproc_kernel_preset_t preset);

/// Spočítá nesaturovanou hodnotu filtru v bodě [x, y] bez delta: (acc * scale + 2^13) >> 14
int32_t imgproc_filter_point(const imgproc_image_t* src, const imgproc_kernel_t* kernel, uint32_t x, uint32_t y,
                             imgproc_border_t border);

/// 2D konvoluční filtr šedotónového obrazu (1 kanál, stejné rozměry)
void imgproc_filter2d(const imgproc_image_t* src, const imgproc_image_t* dst, const imgproc_kernel_t* kernel,
                      imgproc_border_t border);

/// Spojí dvě složky gradientu do velikosti podle zvolené metody (bez saturace)
int32_t imgproc_magnitude(int32_t gx, int32_t gy, imgproc_magnitude_t method);

/// Gradientní filtr: dvě jádra nad stejným oknem, výstup = saturate(magnitude(Gx, Gy) + delta z kernel_x)
void imgproc_gradient(const imgproc_image_t* src, const imgproc_image_t* dst, const imgproc_kernel_t* kernel_x,
                      const imgproc_kernel_t* kernel_y, imgproc_magnitude_t method, imgproc_border_t border);

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_FILTER_H_ */
