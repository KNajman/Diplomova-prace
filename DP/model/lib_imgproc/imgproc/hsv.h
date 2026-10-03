/**
 * @file    hsv.h
 * @brief   Převody RGB <-> HSV v celočíselné aritmetice
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * RGB -> HSV: celočíselný algoritmus OpenCV (RGB2HSV_b, hsv_shift = 12, tabulky sdiv a hdiv180),
 *             výsledek je bitově shodný s cv::cvtColor(..., COLOR_RGB2HSV) pro 8bitový obraz.
 * HSV -> RGB: vlastní celočíselný algoritmus bez dělení (aproximace x/255), shodný s HLS jádrem.
 * Rozsahy: H 0..179 (2 stupně na LSB), S 0..255, V 0..255.
 */

#ifndef LIB_IMGPROC_HSV_H_
#define LIB_IMGPROC_HSV_H_

#include <imgproc/types.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define IMGPROC_HSV_SHIFT       (12u)   ///< Počet zlomkových bitů tabulek převrácených hodnot (OpenCV)

/// Vrátí položku tabulky sdiv[i] = round((255 << 12) / i), sdiv[0] = 0 (pro HW a generátory)
int32_t imgproc_hsv_sdiv(uint8_t index);

/// Vrátí položku tabulky hdiv180[i] = round((180 << 12) / (6 * i)), hdiv180[0] = 0
int32_t imgproc_hsv_hdiv180(uint8_t index);

/// Převede jeden pixel RGB (pořadí UG934: G, B, R) na HSV (H, S, V)
void imgproc_rgb_to_hsv_pixel(const uint8_t* rgb, uint8_t* hsv);

/// Převede jeden pixel HSV (H, S, V) na RGB (pořadí UG934: G, B, R)
void imgproc_hsv_to_rgb_pixel(const uint8_t* hsv, uint8_t* rgb);

/// Převede obraz RGB na HSV (oba 3 kanály, stejné rozměry)
void imgproc_rgb_to_hsv(const imgproc_image_t* src, const imgproc_image_t* dst);

/// Převede obraz HSV na RGB (oba 3 kanály, stejné rozměry)
void imgproc_hsv_to_rgb(const imgproc_image_t* src, const imgproc_image_t* dst);

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_HSV_H_ */
