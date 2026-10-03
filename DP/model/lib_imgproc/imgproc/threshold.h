/**
 * @file    threshold.h
 * @brief   Prahování šedotónového obrazu (5 typů shodných s cv::threshold)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#ifndef LIB_IMGPROC_THRESHOLD_H_
#define LIB_IMGPROC_THRESHOLD_H_

#include <imgproc/types.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/// Typ prahování (číselné hodnoty shodné s cv::ThresholdTypes a s registrem v HW)
typedef enum
{
    IMGPROC_THRESH_BINARY = 0,      ///< src > t ? maxval : 0
    IMGPROC_THRESH_BINARY_INV = 1,  ///< src > t ? 0 : maxval
    IMGPROC_THRESH_TRUNC = 2,       ///< src > t ? t : src
    IMGPROC_THRESH_TOZERO = 3,      ///< src > t ? src : 0
    IMGPROC_THRESH_TOZERO_INV = 4,  ///< src > t ? 0 : src
} imgproc_thresh_type_t;

/// Prahuje jednu hodnotu
uint8_t imgproc_threshold_pixel(uint8_t value, uint8_t thresh, uint8_t maxval, imgproc_thresh_type_t type);

/// Prahuje celý šedotónový obraz (1 kanál, stejné rozměry)
void imgproc_threshold(const imgproc_image_t* src, const imgproc_image_t* dst, uint8_t thresh, uint8_t maxval,
                       imgproc_thresh_type_t type);

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_THRESHOLD_H_ */
