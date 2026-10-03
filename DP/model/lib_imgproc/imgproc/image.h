/**
 * @file    image.h
 * @brief   Pomocné funkce pro přístup k pixelům a aritmetiku sdílenou moduly lib_imgproc
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#ifndef LIB_IMGPROC_IMAGE_H_
#define LIB_IMGPROC_IMAGE_H_

#include <imgproc/types.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/// Inicializuje popis obrazu nad bufferem volajícího (stride = width * channels)
void imgproc_image_init(imgproc_image_t* img, uint8_t* data, uint32_t width, uint32_t height, uint8_t channels);

/// Ověří platnost popisu obrazu (při chybě volá IMGPROC_ASSERT)
void imgproc_image_check(const imgproc_image_t* img, uint8_t channels);

/// Vrátí ukazatel na pixel [x, y]
uint8_t* imgproc_image_pixel(const imgproc_image_t* img, uint32_t x, uint32_t y);

/// Načte složku pixelu se souřadnicemi i mimo obraz podle zvoleného okraje
uint8_t imgproc_image_fetch(const imgproc_image_t* img, int32_t x, int32_t y, uint8_t ch, imgproc_border_t border);

/// Saturace celého čísla do rozsahu 0..255
uint8_t imgproc_saturate_u8(int64_t value);

/// Dělení mocninou dvou se zaokrouhlením half-up (k +nekonečnu), bez UB pro záporná čísla
int64_t imgproc_round_shift(int64_t value, uint8_t shift);

#ifdef __cplusplus
}
#endif

#endif /* LIB_IMGPROC_IMAGE_H_ */
