/**
 * @file    hsv.c
 * @brief   Převody RGB <-> HSV v celočíselné aritmetice
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#include <imgproc/hsv.h>
#include <imgproc/image.h>

#include <stddef.h>
#include <stdint.h>

#define HSV_SDIV_NUMERATOR      (((int64_t)IMGPROC_PIXEL_MAX) << IMGPROC_HSV_SHIFT)       /* 255 << 12 */
#define HSV_HDIV_NUMERATOR      (((int64_t)IMGPROC_HSV_HUE_RANGE) << IMGPROC_HSV_SHIFT)   /* 180 << 12 */
#define HSV_SECTORS             (6)     /* počet šedesátistupňových sektorů */
#define HSV_SECTOR_G            (2)     /* offset sektoru pro maximum v G (x diff) */
#define HSV_SECTOR_B            (4)     /* offset sektoru pro maximum v B (x diff) */

#define HSV_SECTOR_WIDTH        (30u)   /* šířka sektoru v jednotkách H (60 stupňů / 2) */
#define HSV_SECTOR_RECIP        (2185u) /* round(2^16 / 30), převrácená hodnota šířky sektoru */
#define HSV_SECTOR_RECIP_SHIFT  (16u)   /* zlomkové bity HSV_SECTOR_RECIP */
#define HSV_FRACT_INT_SHIFT     (3u)    /* f = rem * 8.5 = (rem << 3) + (rem >> 1) */
#define HSV_DIV255_SHIFT        (8u)    /* x / 255 ~ (x + 1 + (x >> 8)) >> 8 */

/**
 * @brief Celočíselné dělení se zaokrouhlením k nejbližšímu (pro kladné operandy).
 * @param numerator     Dělenec (>= 0)
 * @param denominator   Dělitel (> 0)
 * @return round(numerator / denominator)
 */
static int32_t div_round(int64_t numerator, int64_t denominator)
{
    return (int32_t)((numerator + (denominator / 2)) / denominator);
}

/**
 * @brief Vrátí položku tabulky sdiv[i] = round((255 << 12) / i).
 *
 * OpenCV počítá saturate_cast<int>((255 << 12) / (1.0 * i)). Pro i < 256 nikdy nevzniká
 * přesná polovina (dělenec obsahuje faktor 2^12, výsledek by musel mít 2^13), takže
 * celočíselné zaokrouhlení je s OpenCV totožné.
 *
 * @param index Index 0..255
 * @return Hodnota tabulky (20 bitů)
 */
int32_t imgproc_hsv_sdiv(uint8_t index)
{
    int32_t result = 0;

    if (index != 0u)
    {
        result = div_round(HSV_SDIV_NUMERATOR, (int64_t)index);
    }
    return result;
}

/**
 * @brief Vrátí položku tabulky hdiv180[i] = round((180 << 12) / (6 * i)).
 * @param index Index 0..255
 * @return Hodnota tabulky (17 bitů)
 */
int32_t imgproc_hsv_hdiv180(uint8_t index)
{
    int32_t result = 0;

    if (index != 0u)
    {
        result = div_round(HSV_HDIV_NUMERATOR, ((int64_t)HSV_SECTORS) * (int64_t)index);
    }
    return result;
}

/**
 * @brief Převede pixel RGB na HSV podle algoritmu OpenCV RGB2HSV_b.
 *
 * Priorita při shodě maxim je R, pak G, pak B (shodně s OpenCV i s HW).
 *
 * Poznámka: dělení diff / v_max a h / diff se nahrazuje násobením převrácenou hodnotou z tabulky
 * (256 položek). V HW je to ROM (LUT/BRAM) + jeden DSP místo děličky s mnoha takty latence.
 * Tabulky musí být bitově stejné jako v OpenCV, jinak by výsledek nebyl shodný s cv::cvtColor.
 *
 * @param rgb   Vstup: rgb[IMGPROC_RGB_IDX_G], [IMGPROC_RGB_IDX_B], [IMGPROC_RGB_IDX_R]
 * @param hsv   Výstup: hsv[IMGPROC_HSV_IDX_H], [IMGPROC_HSV_IDX_S], [IMGPROC_HSV_IDX_V]
 */
void imgproc_rgb_to_hsv_pixel(const uint8_t* rgb, uint8_t* hsv)
{
    const int32_t r = (int32_t)rgb[IMGPROC_RGB_IDX_R];
    const int32_t g = (int32_t)rgb[IMGPROC_RGB_IDX_G];
    const int32_t b = (int32_t)rgb[IMGPROC_RGB_IDX_B];
    const int32_t v_max = (r > g) ? ((r > b) ? r : b) : ((g > b) ? g : b);
    const int32_t v_min = (r < g) ? ((r < b) ? r : b) : ((g < b) ? g : b);
    const int32_t diff = v_max - v_min;
    int32_t h = 0;
    int32_t s = 0;

    s = (int32_t)imgproc_round_shift(((int64_t)diff) * imgproc_hsv_sdiv((uint8_t)v_max), (uint8_t)IMGPROC_HSV_SHIFT);

    if (v_max == r)
    {
        h = g - b;
    }
    else if (v_max == g)
    {
        h = (b - r) + (HSV_SECTOR_G * diff);
    }
    else
    {
        h = (r - g) + (HSV_SECTOR_B * diff);
    }
    h = (int32_t)imgproc_round_shift(((int64_t)h) * imgproc_hsv_hdiv180((uint8_t)diff), (uint8_t)IMGPROC_HSV_SHIFT);
    if (h < 0)
    {
        h += (int32_t)IMGPROC_HSV_HUE_RANGE;
    }

    hsv[IMGPROC_HSV_IDX_H] = imgproc_saturate_u8(h);
    hsv[IMGPROC_HSV_IDX_S] = (uint8_t)s;
    hsv[IMGPROC_HSV_IDX_V] = (uint8_t)v_max;
}

/**
 * @brief Aproximace x / 255 bez dělení: (x + 1 + (x >> 8)) >> 8.
 * @param x Dělenec 0..65025
 * @return Přibližný podíl 0..255
 */
static uint32_t div255(uint32_t x)
{
    return (x + 1u + (x >> HSV_DIV255_SHIFT)) >> HSV_DIV255_SHIFT;
}

/**
 * @brief Převede pixel HSV na RGB (shodné s HLS jádrem hls_hsv_2_rgb).
 *
 * Poznámka: OpenCV počítá 8bitové HSV -> RGB přes float, takže bitová shoda s ním není možná.
 * Použit je proto vlastní celočíselný algoritmus bez dělení (x/255 aproximací, h/30 násobením
 * 2185 >> 16). Odchylka vůči OpenCV je max. 2 LSB (ověřeno na všech 2^24 vstupech).
 * @param hsv   Vstup: H 0..179 (vyšší hodnoty se berou jako 0), S, V
 * @param rgb   Výstup v pořadí UG934 (G, B, R)
 */
void imgproc_hsv_to_rgb_pixel(const uint8_t* hsv, uint8_t* rgb)
{
    const uint32_t h = (hsv[IMGPROC_HSV_IDX_H] >= IMGPROC_HSV_HUE_RANGE) ? 0u : (uint32_t)hsv[IMGPROC_HSV_IDX_H];
    const uint32_t s = (uint32_t)hsv[IMGPROC_HSV_IDX_S];
    const uint32_t v = (uint32_t)hsv[IMGPROC_HSV_IDX_V];
    const uint32_t region = (h * HSV_SECTOR_RECIP) >> HSV_SECTOR_RECIP_SHIFT;  /* h / 30 */
    const uint32_t rem = h - (region * HSV_SECTOR_WIDTH);
    const uint32_t f = (rem << HSV_FRACT_INT_SHIFT) + (rem >> 1u);             /* rem * 255 / 30 */
    const uint32_t p = div255(v * (IMGPROC_PIXEL_MAX - s));
    const uint32_t q = div255(v * (IMGPROC_PIXEL_MAX - div255(s * f)));
    const uint32_t t = div255(v * (IMGPROC_PIXEL_MAX - div255(s * (IMGPROC_PIXEL_MAX - f))));
    /* Pořadí v tabulce: R, G, B pro sektory 0..5 (0-60, 60-120, ... 300-360 stupňů) */
    const uint32_t sector_rgb[HSV_SECTORS][IMGPROC_CH_MAX] =
    {
        { v, t, p },
        { q, v, p },
        { p, v, t },
        { p, q, v },
        { t, p, v },
        { v, p, q },
    };
    const uint32_t sector = (region < (uint32_t)HSV_SECTORS) ? region : ((uint32_t)HSV_SECTORS - 1u);

    if (s == 0u)
    {
        rgb[IMGPROC_RGB_IDX_R] = (uint8_t)v;    /* odstín šedi */
        rgb[IMGPROC_RGB_IDX_G] = (uint8_t)v;
        rgb[IMGPROC_RGB_IDX_B] = (uint8_t)v;
    }
    else
    {
        rgb[IMGPROC_RGB_IDX_R] = (uint8_t)sector_rgb[sector][0];
        rgb[IMGPROC_RGB_IDX_G] = (uint8_t)sector_rgb[sector][1];
        rgb[IMGPROC_RGB_IDX_B] = (uint8_t)sector_rgb[sector][2];
    }
}

/**
 * @brief Aplikuje převod pixelu na celý tříkanálový obraz.
 * @param src       Vstupní obraz (3 kanály)
 * @param dst       Výstupní obraz (3 kanály, stejné rozměry)
 * @param convert   Funkce převodu jednoho pixelu
 */
static void convert_image(const imgproc_image_t* src, const imgproc_image_t* dst,
                          void (*convert)(const uint8_t* in, uint8_t* out))
{
    uint32_t x = 0u;
    uint32_t y = 0u;

    imgproc_image_check(src, (uint8_t)IMGPROC_CH_MAX);
    imgproc_image_check(dst, (uint8_t)IMGPROC_CH_MAX);
    IMGPROC_ASSERT((src->width == dst->width) && (src->height == dst->height));

    for (y = 0u; y < src->height; y++)
    {
        for (x = 0u; x < src->width; x++)
        {
            convert(imgproc_image_pixel(src, x, y), imgproc_image_pixel(dst, x, y));
        }
    }
}

/**
 * @brief Převede obraz RGB na HSV.
 * @param src   Vstupní obraz RGB (3 kanály, UG934)
 * @param dst   Výstupní obraz HSV (3 kanály)
 */
void imgproc_rgb_to_hsv(const imgproc_image_t* src, const imgproc_image_t* dst)
{
    convert_image(src, dst, imgproc_rgb_to_hsv_pixel);
}

/**
 * @brief Převede obraz HSV na RGB.
 * @param src   Vstupní obraz HSV (3 kanály)
 * @param dst   Výstupní obraz RGB (3 kanály, UG934)
 */
void imgproc_hsv_to_rgb(const imgproc_image_t* src, const imgproc_image_t* dst)
{
    convert_image(src, dst, imgproc_hsv_to_rgb_pixel);
}
