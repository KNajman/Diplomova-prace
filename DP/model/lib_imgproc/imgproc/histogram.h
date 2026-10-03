/**
 * @file    histogram.h
 * @brief   Histogram jasu šedotónového obrazu a Otsuův práh
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#ifndef LIB_IMGPROC_HISTOGRAM_H_
#define LIB_IMGPROC_HISTOGRAM_H_

#include <imgproc/types.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/// Spočítá histogram 256 košů (pole se vynuluje); obdoba nulování při SOF v HW
void imgproc_histogram(const imgproc_image_t* src, uint32_t* hist);

/// Spočítá Otsuův práh z histogramu (bonus: ARM -> registr prahování pro další snímek)
uint8_t imgproc_otsu_threshold(const uint32_t* hist);

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_HISTOGRAM_H_ */
