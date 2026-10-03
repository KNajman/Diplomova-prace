/**
 * @file    filter.c
 * @brief   2D konvoluční filtr (mean, zostření, ...) a gradientní filtr (Sobel, Prewitt) s magnitudou
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#include <imgproc/filter.h>
#include <imgproc/image.h>

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define FILTER_SIZE_3X3         (3u)    /* velikost předdefinovaných jader */
#define FILTER_MEAN_COUNT       (9)     /* počet prvků průměrovacího jádra 3x3 */
#define FILTER_AMBM2_ALPHA_NUM  (15)    /* alpha = 15/16 */
#define FILTER_AMBM2_ALPHA_SH   (4u)
#define FILTER_AMBM2_BETA_NUM   (15)    /* beta = 15/32 */
#define FILTER_AMBM2_BETA_SH    (5u)
#define FILTER_SQRT_BITS        (62u)   /* nejvyšší sudý bit pro celočíselnou odmocninu int64 */

static const char* const KERNEL_NAMES[IMGPROC_KERNEL_PRESET_COUNT] =
{
    "identity", "mean", "sharpen", "sobel_x", "sobel_y", "prewitt_x", "prewitt_y",
};

static const int8_t KERNEL_3X3[IMGPROC_KERNEL_PRESET_COUNT][FILTER_SIZE_3X3][FILTER_SIZE_3X3] =
{
    { {  0,  0,  0 }, {  0,  1,  0 }, {  0,  0,  0 } },     /* identity */
    { {  1,  1,  1 }, {  1,  1,  1 }, {  1,  1,  1 } },     /* mean */
    { {  0, -1,  0 }, { -1,  5, -1 }, {  0, -1,  0 } },     /* sharpen */
    { { -1,  0,  1 }, { -2,  0,  2 }, { -1,  0,  1 } },     /* sobel_x */
    { { -1, -2, -1 }, {  0,  0,  0 }, {  1,  2,  1 } },     /* sobel_y */
    { { -1,  0,  1 }, { -1,  0,  1 }, { -1,  0,  1 } },     /* prewitt_x */
    { { -1, -1, -1 }, {  0,  0,  0 }, {  1,  1,  1 } },     /* prewitt_y */
};

/**
 * @brief Vyplní jádro předvolby.
 * @param preset    Předvolba
 * @param kernel    Výstupní jádro
 */
void imgproc_kernel_make(imgproc_kernel_preset_t preset, imgproc_kernel_t* kernel)
{
    static const imgproc_kernel_t ZERO = { 0 };
    uint8_t r = 0u;
    uint8_t c = 0u;

    IMGPROC_ASSERT(kernel != NULL);
    IMGPROC_ASSERT((uint32_t)preset < (uint32_t)IMGPROC_KERNEL_PRESET_COUNT);
    *kernel = ZERO;
    kernel->size = (uint8_t)FILTER_SIZE_3X3;
    kernel->scale_q14 = IMGPROC_SCALE_ONE;
    for (r = 0u; r < FILTER_SIZE_3X3; r++)
    {
        for (c = 0u; c < FILTER_SIZE_3X3; c++)
        {
            kernel->coeff[r][c] = KERNEL_3X3[preset][r][c];
        }
    }
    if (preset == IMGPROC_KERNEL_MEAN)
    {
        kernel->scale_q14 = (IMGPROC_SCALE_ONE + (FILTER_MEAN_COUNT / 2)) / FILTER_MEAN_COUNT;    /* 1820 */
    }
}

/**
 * @brief Vrátí textový název předvolby jádra.
 * @param preset Předvolba
 * @return Název, nebo "unknown"
 */
const char* imgproc_kernel_name(imgproc_kernel_preset_t preset)
{
    const char* name = "unknown";

    if ((uint32_t)preset < (uint32_t)IMGPROC_KERNEL_PRESET_COUNT)
    {
        name = KERNEL_NAMES[preset];
    }
    return name;
}

/**
 * @brief Ověří platnost jádra.
 * @param kernel Jádro
 */
static void kernel_check(const imgproc_kernel_t* kernel)
{
    IMGPROC_ASSERT(kernel != NULL);
    IMGPROC_ASSERT((kernel->size >= 1u) && (kernel->size <= IMGPROC_KERNEL_SIZE_MAX));
    IMGPROC_ASSERT((kernel->size % 2u) == 1u);
    IMGPROC_ASSERT((kernel->scale_q14 >= 0) && (kernel->scale_q14 <= IMGPROC_SCALE_MAX));
}

/**
 * @brief Spočítá hodnotu filtru v bodě [x, y] před přičtením delta a saturací.
 *
 * Poznámky k návrhu:
 *  - Počítá se KORELACE (jádro se neotáčí), stejně jako cv::filter2D a jako HW. Pro symetrická
 *    jádra (mean) je to totéž co konvoluce; u Sobela se otočením jen změní znaménko.
 *  - Akumulace je přesná (bez zaokrouhlení) a normalizace scale se aplikuje až jednou na konci,
 *    takže vzniká jediná zaokrouhlovací chyba. V HW: K*K násobiček + sčítací strom + 1 DSP pro scale.
 *  - scale je v Q.14 (ne Q2.15 jako CSC), protože potřebuje rozsah až do 8 (zesílení), ale
 *    přesnost 1/16384 stačí: průměrovací filtr je i tak bitově shodný s cv::filter2D.
 * @param src       Vstupní obraz (1 kanál)
 * @param kernel    Jádro
 * @param x         Sloupec středu okna
 * @param y         Řádek středu okna
 * @param border    Způsob doplnění okraje
 * @return (acc * scale_q14 + 2^13) >> 14
 */
int32_t imgproc_filter_point(const imgproc_image_t* src, const imgproc_kernel_t* kernel, uint32_t x, uint32_t y,
                             imgproc_border_t border)
{
    const int32_t radius = (int32_t)(kernel->size / 2u);
    int64_t acc = 0;
    uint8_t r = 0u;
    uint8_t c = 0u;

    for (r = 0u; r < kernel->size; r++)
    {
        for (c = 0u; c < kernel->size; c++)
        {
            const int32_t px = ((int32_t)x + (int32_t)c) - radius;
            const int32_t py = ((int32_t)y + (int32_t)r) - radius;
            acc += ((int64_t)kernel->coeff[r][c]) * (int64_t)imgproc_image_fetch(src, px, py, 0u, border);
        }
    }
    return (int32_t)imgproc_round_shift(acc * (int64_t)kernel->scale_q14, (uint8_t)IMGPROC_SCALE_FRAC_BITS);
}

/**
 * @brief 2D konvoluční filtr šedotónového obrazu.
 * @param src       Vstupní obraz (1 kanál)
 * @param dst       Výstupní obraz (1 kanál, stejné rozměry, nesmí být totožný se src)
 * @param kernel    Jádro
 * @param border    Způsob doplnění okraje
 */
void imgproc_filter2d(const imgproc_image_t* src, const imgproc_image_t* dst, const imgproc_kernel_t* kernel,
                      imgproc_border_t border)
{
    uint32_t x = 0u;
    uint32_t y = 0u;

    kernel_check(kernel);
    imgproc_image_check(src, 1u);
    imgproc_image_check(dst, 1u);
    IMGPROC_ASSERT((src->width == dst->width) && (src->height == dst->height));
    IMGPROC_ASSERT(src->data != dst->data);

    for (y = 0u; y < src->height; y++)
    {
        for (x = 0u; x < src->width; x++)
        {
            const int64_t value = (int64_t)imgproc_filter_point(src, kernel, x, y, border) + kernel->delta;
            *imgproc_image_pixel(dst, x, y) = imgproc_saturate_u8(value);
        }
    }
}

/**
 * @brief Celočíselná odmocnina zaokrouhlená k nejbližšímu celému číslu.
 * @param value Nezáporné číslo
 * @return round(sqrt(value))
 */
static int64_t isqrt_round(int64_t value)
{
    uint64_t rem = (uint64_t)value;
    uint64_t root = 0u;
    uint64_t bit = ((uint64_t)1u) << FILTER_SQRT_BITS;

    while (bit > rem)
    {
        bit >>= 2u;
    }
    while (bit != 0u)
    {
        if (rem >= (root + bit))
        {
            rem -= (root + bit);
            root = (root >> 1u) + bit;
        }
        else
        {
            root >>= 1u;
        }
        bit >>= 2u;
    }
    if (rem > root)     /* value - floor^2 > floor  <=>  value > (floor + 0.5)^2 */
    {
        root++;
    }
    return (int64_t)root;
}

/**
 * @brief Spojí dvě složky gradientu do velikosti.
 *
 * Volba metody je v plánu DP otevřená, proto model počítá všechny. Chyby vůči přesné L2:
 * L1 +41 %, Linf -29 %, AMBM_1 0..+12 %, AMBM_2 -7..+5 %. AMBM (alpha-max-plus-beta-min,
 * R. Lyons) potřebuje jen komparátor, posuny a sčítačky - v HW žádný DSP.
 * @param gx        Složka x
 * @param gy        Složka y
 * @param method    Metoda výpočtu
 * @return Velikost gradientu (bez saturace)
 */
int32_t imgproc_magnitude(int32_t gx, int32_t gy, imgproc_magnitude_t method)
{
    const int64_t ax = (gx < 0) ? -(int64_t)gx : (int64_t)gx;
    const int64_t ay = (gy < 0) ? -(int64_t)gy : (int64_t)gy;
    const int64_t mx = (ax > ay) ? ax : ay;
    const int64_t mn = (ax > ay) ? ay : ax;
    int64_t result = 0;

    switch (method)
    {
        case IMGPROC_MAG_L1:
            result = ax + ay;
            break;
        case IMGPROC_MAG_LINF:
            result = mx;
            break;
        case IMGPROC_MAG_AMBM_1:
            result = mx + (mn >> 1u);
            break;
        case IMGPROC_MAG_AMBM_2:
            result = ((mx * FILTER_AMBM2_ALPHA_NUM) >> FILTER_AMBM2_ALPHA_SH)
                     + ((mn * FILTER_AMBM2_BETA_NUM) >> FILTER_AMBM2_BETA_SH);
            break;
        case IMGPROC_MAG_L2:
            result = isqrt_round((ax * ax) + (ay * ay));
            break;
        default:
            IMGPROC_ASSERT(false);
            break;
    }
    return (int32_t)result;
}

/**
 * @brief Gradientní filtr se dvěma jádry nad stejným oknem.
 * @param src       Vstupní obraz (1 kanál)
 * @param dst       Výstupní obraz (1 kanál, stejné rozměry, nesmí být totožný se src)
 * @param kernel_x  Jádro pro Gx (jeho delta se přičte k velikosti)
 * @param kernel_y  Jádro pro Gy (stejná velikost jako kernel_x)
 * @param method    Metoda výpočtu velikosti
 * @param border    Způsob doplnění okraje
 */
void imgproc_gradient(const imgproc_image_t* src, const imgproc_image_t* dst, const imgproc_kernel_t* kernel_x,
                      const imgproc_kernel_t* kernel_y, imgproc_magnitude_t method, imgproc_border_t border)
{
    uint32_t x = 0u;
    uint32_t y = 0u;

    kernel_check(kernel_x);
    kernel_check(kernel_y);
    IMGPROC_ASSERT(kernel_x->size == kernel_y->size);
    imgproc_image_check(src, 1u);
    imgproc_image_check(dst, 1u);
    IMGPROC_ASSERT((src->width == dst->width) && (src->height == dst->height));
    IMGPROC_ASSERT(src->data != dst->data);

    for (y = 0u; y < src->height; y++)
    {
        for (x = 0u; x < src->width; x++)
        {
            const int32_t gx = imgproc_filter_point(src, kernel_x, x, y, border);
            const int32_t gy = imgproc_filter_point(src, kernel_y, x, y, border);
            const int64_t value = (int64_t)imgproc_magnitude(gx, gy, method) + kernel_x->delta;
            *imgproc_image_pixel(dst, x, y) = imgproc_saturate_u8(value);
        }
    }
}
