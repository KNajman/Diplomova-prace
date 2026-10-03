/**
 * @file    threshold.c
 * @brief   Prahování šedotónového obrazu (5 typů shodných s cv::threshold)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#include <imgproc/threshold.h>
#include <imgproc/image.h>

#include <stdbool.h>
#include <stdint.h>

/**
 * @brief Prahuje jednu hodnotu.
 * @param value     Vstupní hodnota
 * @param thresh    Práh (porovnání je ostré: value > thresh, stejně jako cv::threshold)
 * @param maxval    Hodnota pro typy BINARY a BINARY_INV
 * @param type      Typ prahování
 * @return Výstupní hodnota
 */
uint8_t imgproc_threshold_pixel(uint8_t value, uint8_t thresh, uint8_t maxval, imgproc_thresh_type_t type)
{
    const bool above = (value > thresh);
    uint8_t result = 0u;

    switch (type)
    {
        case IMGPROC_THRESH_BINARY:
            result = above ? maxval : 0u;
            break;
        case IMGPROC_THRESH_BINARY_INV:
            result = above ? 0u : maxval;
            break;
        case IMGPROC_THRESH_TRUNC:
            result = above ? thresh : value;
            break;
        case IMGPROC_THRESH_TOZERO:
            result = above ? value : 0u;
            break;
        case IMGPROC_THRESH_TOZERO_INV:
            result = above ? 0u : value;
            break;
        default:
            IMGPROC_ASSERT(false);
            break;
    }
    return result;
}

/**
 * @brief Prahuje celý šedotónový obraz.
 * @param src       Vstupní obraz (1 kanál)
 * @param dst       Výstupní obraz (1 kanál, stejné rozměry)
 * @param thresh    Práh
 * @param maxval    Hodnota pro typy BINARY a BINARY_INV
 * @param type      Typ prahování
 */
void imgproc_threshold(const imgproc_image_t* src, const imgproc_image_t* dst, uint8_t thresh, uint8_t maxval,
                       imgproc_thresh_type_t type)
{
    uint32_t x = 0u;
    uint32_t y = 0u;

    imgproc_image_check(src, 1u);
    imgproc_image_check(dst, 1u);
    IMGPROC_ASSERT((src->width == dst->width) && (src->height == dst->height));

    for (y = 0u; y < src->height; y++)
    {
        for (x = 0u; x < src->width; x++)
        {
            *imgproc_image_pixel(dst, x, y) = imgproc_threshold_pixel(*imgproc_image_pixel(src, x, y), thresh,
                                                                      maxval, type);
        }
    }
}
