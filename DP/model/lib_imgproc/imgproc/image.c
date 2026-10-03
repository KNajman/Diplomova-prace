/**
 * @file    image.c
 * @brief   Pomocné funkce pro přístup k pixelům a aritmetiku sdílenou moduly lib_imgproc
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#include <imgproc/image.h>

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

/**
 * @brief Inicializuje popis obrazu nad bufferem volajícího.
 * @param img       Popis obrazu k vyplnění
 * @param data      Buffer o velikosti alespoň width * height * channels bajtů
 * @param width     Šířka v pixelech (1..IMGPROC_MAX_WIDTH)
 * @param height    Výška v pixelech (1..IMGPROC_MAX_HEIGHT)
 * @param channels  Počet kanálů (1 nebo 3)
 */
void imgproc_image_init(imgproc_image_t* img, uint8_t* data, uint32_t width, uint32_t height, uint8_t channels)
{
    IMGPROC_ASSERT(img != NULL);
    img->data = data;
    img->width = width;
    img->height = height;
    img->channels = channels;
    img->stride = width * (uint32_t)channels;
    imgproc_image_check(img, channels);
}

/**
 * @brief Ověří platnost popisu obrazu.
 * @param img       Popis obrazu
 * @param channels  Očekávaný počet kanálů
 */
void imgproc_image_check(const imgproc_image_t* img, uint8_t channels)
{
    IMGPROC_ASSERT(img != NULL);
    IMGPROC_ASSERT(img->data != NULL);
    IMGPROC_ASSERT(img->channels == channels);
    IMGPROC_ASSERT((img->width > 0u) && (img->width <= IMGPROC_MAX_WIDTH));
    IMGPROC_ASSERT((img->height > 0u) && (img->height <= IMGPROC_MAX_HEIGHT));
    IMGPROC_ASSERT(img->stride >= (img->width * (uint32_t)img->channels));
}

/**
 * @brief Vrátí ukazatel na pixel [x, y].
 * @param img   Popis obrazu
 * @param x     Sloupec (0..width-1)
 * @param y     Řádek (0..height-1)
 * @return Ukazatel na první složku pixelu
 */
uint8_t* imgproc_image_pixel(const imgproc_image_t* img, uint32_t x, uint32_t y)
{
    return &img->data[((size_t)y * img->stride) + ((size_t)x * img->channels)];
}

/**
 * @brief Omezí souřadnici do intervalu 0..(limit - 1).
 * @param coord Souřadnice
 * @param limit Velikost rozměru
 * @return Omezená souřadnice
 */
static int32_t clamp_coord(int32_t coord, uint32_t limit)
{
    int32_t result = coord;

    if (result < 0)
    {
        result = 0;
    }
    else if (result >= (int32_t)limit)
    {
        result = (int32_t)limit - 1;
    }
    else
    {
        /* souřadnice je uvnitř obrazu */
    }
    return result;
}

/**
 * @brief Načte složku pixelu se souřadnicemi i mimo obraz.
 *
 * V HW odpovídá multiplexoru v posuvném okně: buňka mimo obraz dostane buď konstantu 0,
 * nebo (u replikace) hodnotu sousední buňky na okraji - ořezání souřadnice (clamp).
 * @param img       Popis obrazu
 * @param x         Sloupec (může být mimo obraz)
 * @param y         Řádek (může být mimo obraz)
 * @param ch        Index kanálu
 * @param border    Způsob doplnění pixelů mimo obraz
 * @return Hodnota složky
 */
uint8_t imgproc_image_fetch(const imgproc_image_t* img, int32_t x, int32_t y, uint8_t ch, imgproc_border_t border)
{
    uint8_t result = 0u;
    const bool inside = (x >= 0) && (y >= 0) && (x < (int32_t)img->width) && (y < (int32_t)img->height);

    if (inside)
    {
        result = imgproc_image_pixel(img, (uint32_t)x, (uint32_t)y)[ch];
    }
    else if (border == IMGPROC_BORDER_REPLICATE)
    {
        const int32_t cx = clamp_coord(x, img->width);
        const int32_t cy = clamp_coord(y, img->height);
        result = imgproc_image_pixel(img, (uint32_t)cx, (uint32_t)cy)[ch];
    }
    else
    {
        result = 0u;    /* IMGPROC_BORDER_CONSTANT s hodnotou 0 */
    }
    return result;
}

/**
 * @brief Saturace do rozsahu 0..255.
 * @param value Vstupní hodnota
 * @return Saturovaná hodnota
 */
uint8_t imgproc_saturate_u8(int64_t value)
{
    uint8_t result = 0u;

    if (value <= 0)
    {
        result = 0u;
    }
    else if (value >= (int64_t)IMGPROC_PIXEL_MAX)
    {
        result = (uint8_t)IMGPROC_PIXEL_MAX;
    }
    else
    {
        result = (uint8_t)value;
    }
    return result;
}

/**
 * @brief Vydělí 2^shift se zaokrouhlením half-up: floor((value + 2^(shift-1)) / 2^shift).
 *
 * Odpovídá HW operaci "přičti 2^(shift-1) a aritmeticky posuň vpravo". Posun záporného
 * čísla je v C implementačně definovaný, proto se záporná větev počítá přes absolutní hodnotu.
 *
 * Poznámka k volbě zaokrouhlení half-up (místo half-even nebo ořezání):
 *  - v HW je nejlevnější: jedna konstanta přičtená v DSP (nebo do akumulátoru) + posun = přeznačení vodičů,
 *  - používá ho OpenCV ve všech celočíselných cestách: (x + (1 << (n - 1))) >> n,
 *  - ořezání (prosté >> n) by výsledek systematicky posunulo o -0,5 LSB (původní chyba HLS jádra).
 *
 * @param value Dělenec
 * @param shift Exponent dělitele (1..62)
 * @return Zaokrouhlený podíl
 */
int64_t imgproc_round_shift(int64_t value, uint8_t shift)
{
    const int64_t half = ((int64_t)1) << (shift - 1u);
    const int64_t biased = value + half;
    int64_t result = 0;

    if (biased >= 0)
    {
        result = biased >> shift;
    }
    else
    {
        const int64_t divisor_minus_one = (((int64_t)1) << shift) - 1;
        result = -((-biased + divisor_minus_one) >> shift);    /* floor pro záporná čísla */
    }
    return result;
}
