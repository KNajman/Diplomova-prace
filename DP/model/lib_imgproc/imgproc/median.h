/**
 * @file    median.h
 * @brief   Mediánový filtr 3x3 (síť compare-exchange shodná s HW)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Síť: seřadit řádky -> sloupce -> medián z (max minim, medián mediánů, min maxim),
 * 7x sort3 = 21 compare-exchange. Výsledek je přesný medián 9 hodnot.
 * S IMGPROC_BORDER_REPLICATE je výstup bitově shodný s cv::medianBlur(src, dst, 3).
 */

#ifndef LIB_IMGPROC_MEDIAN_H_
#define LIB_IMGPROC_MEDIAN_H_

#include <imgproc/types.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define IMGPROC_MEDIAN_SIZE     (3u)    ///< Velikost okna mediánu
#define IMGPROC_MEDIAN_COUNT    (9u)    ///< Počet prvků okna

/// Medián 9 hodnot okna (řádky za sebou) sítí compare-exchange
uint8_t imgproc_median9(const uint8_t* window);

/// Mediánový filtr 3x3 šedotónového obrazu (1 kanál, stejné rozměry)
void imgproc_median3x3(const imgproc_image_t* src, const imgproc_image_t* dst, imgproc_border_t border);

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_MEDIAN_H_ */
