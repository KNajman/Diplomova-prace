/**
 * @file    types.h
 * @brief   Společné datové typy a konstanty knihovny lib_imgproc
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Obraz je v paměti uložen prokládaně (interleaved) po bajtech přesně tak, jak ho
 * čte/zapisuje VDMA do AXI4-Stream Video podle UG934:
 *  - RGB:     bajt 0 = G, bajt 1 = B, bajt 2 = R   (TDATA[7:0] = G, [15:8] = B, [23:16] = R)
 *  - YCbCr:   bajt 0 = Y, bajt 1 = Cb, bajt 2 = Cr (UG934 YUV 4:4:4)
 *  - HSV:     bajt 0 = H, bajt 1 = S, bajt 2 = V   (vlastní konvence, H v rozsahu 0..179)
 *  - Šedá:    1 bajt na pixel
 */

#ifndef LIB_IMGPROC_TYPES_H_
#define LIB_IMGPROC_TYPES_H_

#include <stdint.h>
#include <stdbool.h>
#include <imgproc_custom.h>

#ifdef __cplusplus
extern "C" {
#endif

#define IMGPROC_PIXEL_MAX       (255u)  ///< Maximální hodnota 8bitové složky
#define IMGPROC_CH_MAX          (3u)    ///< Maximální počet kanálů na pixel
#define IMGPROC_HIST_BINS       (256u)  ///< Počet košů histogramu 8bitového obrazu

#define IMGPROC_RGB_IDX_G       (0u)    ///< Index složky G v RGB pixelu (UG934)
#define IMGPROC_RGB_IDX_B       (1u)    ///< Index složky B v RGB pixelu (UG934)
#define IMGPROC_RGB_IDX_R       (2u)    ///< Index složky R v RGB pixelu (UG934)

#define IMGPROC_YUV_IDX_Y       (0u)    ///< Index složky Y v YCbCr pixelu (UG934)
#define IMGPROC_YUV_IDX_CB      (1u)    ///< Index složky Cb v YCbCr pixelu (UG934)
#define IMGPROC_YUV_IDX_CR      (2u)    ///< Index složky Cr v YCbCr pixelu (UG934)

#define IMGPROC_HSV_IDX_H       (0u)    ///< Index složky H v HSV pixelu
#define IMGPROC_HSV_IDX_S       (1u)    ///< Index složky S v HSV pixelu
#define IMGPROC_HSV_IDX_V       (2u)    ///< Index složky V v HSV pixelu
#define IMGPROC_HSV_HUE_RANGE   (180u)  ///< Rozsah H (0..179), konvence OpenCV pro 8 bitů

/// Popis obrazu v paměti (data vlastní volající, knihovna nealokuje)
typedef struct
{
    uint8_t* data;      ///< Ukazatel na první bajt prvního řádku
    uint32_t width;     ///< Šířka v pixelech
    uint32_t height;    ///< Výška v pixelech
    uint32_t stride;    ///< Délka řádku v bajtech (>= width * channels)
    uint8_t channels;   ///< Počet kanálů na pixel (1 nebo 3)
} imgproc_image_t;

/// Způsob doplnění pixelů mimo obraz u okénkových operací
typedef enum
{
    IMGPROC_BORDER_CONSTANT = 0,    ///< Pixely mimo obraz = 0 (cv::BORDER_CONSTANT, value 0)
    IMGPROC_BORDER_REPLICATE,       ///< Nejbližší pixel na okraji (cv::BORDER_REPLICATE)
} imgproc_border_t;

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_TYPES_H_ */
