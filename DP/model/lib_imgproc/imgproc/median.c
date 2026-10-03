/**
 * @file    median.c
 * @brief   Mediánový filtr 3x3 (síť compare-exchange shodná s HW)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#include <imgproc/median.h>
#include <imgproc/image.h>

#include <stdint.h>

/* Seřazená trojice */
typedef struct
{
    uint8_t lo;
    uint8_t mid;
    uint8_t hi;
} median_sorted3_t;

/**
 * @brief Seřadí tři hodnoty (3 compare-exchange, shodně s HLS funkcí sort_three).
 * @param a První hodnota
 * @param b Druhá hodnota
 * @param c Třetí hodnota
 * @return Seřazená trojice
 */
static median_sorted3_t sort3(uint8_t a, uint8_t b, uint8_t c)
{
    const uint8_t lo_ab = (a < b) ? a : b;
    const uint8_t hi_ab = (a < b) ? b : a;
    median_sorted3_t result = { 0u, 0u, 0u };

    result.lo = (lo_ab < c) ? lo_ab : c;
    result.hi = (hi_ab > c) ? hi_ab : c;
    result.mid = (hi_ab < c) ? hi_ab : ((lo_ab > c) ? lo_ab : c);
    return result;
}

/**
 * @brief Medián 9 hodnot okna sítí compare-exchange.
 *
 * Poznámka k volbě sítě: optimální síť pro medián 9 prvků má 19 compare-exchange (Paeth),
 * tato má 21 (7x sort3). Je ale pravidelná (řádky -> sloupce -> diagonála), snadno se
 * pipelinuje po stupních a je totožná s HLS jádrem, takže srovnání HLS x VHDL je férové.
 * @param window Okno 3x3 uložené po řádcích (9 hodnot)
 * @return Medián
 */
uint8_t imgproc_median9(const uint8_t* window)
{
    const median_sorted3_t row0 = sort3(window[0], window[1], window[2]);
    const median_sorted3_t row1 = sort3(window[3], window[4], window[5]);
    const median_sorted3_t row2 = sort3(window[6], window[7], window[8]);
    const median_sorted3_t lows = sort3(row0.lo, row1.lo, row2.lo);
    const median_sorted3_t mids = sort3(row0.mid, row1.mid, row2.mid);
    const median_sorted3_t highs = sort3(row0.hi, row1.hi, row2.hi);
    const median_sorted3_t final = sort3(lows.hi, mids.mid, highs.lo);

    return final.mid;
}

/**
 * @brief Mediánový filtr 3x3 šedotónového obrazu.
 * @param src       Vstupní obraz (1 kanál)
 * @param dst       Výstupní obraz (1 kanál, stejné rozměry, nesmí být totožný se src)
 * @param border    Způsob doplnění okraje
 */
void imgproc_median3x3(const imgproc_image_t* src, const imgproc_image_t* dst, imgproc_border_t border)
{
    const int32_t radius = (int32_t)(IMGPROC_MEDIAN_SIZE / 2u);
    uint8_t window[IMGPROC_MEDIAN_COUNT] = { 0u };
    uint32_t x = 0u;
    uint32_t y = 0u;
    uint8_t r = 0u;
    uint8_t c = 0u;

    imgproc_image_check(src, 1u);
    imgproc_image_check(dst, 1u);
    IMGPROC_ASSERT((src->width == dst->width) && (src->height == dst->height));
    IMGPROC_ASSERT(src->data != dst->data);

    for (y = 0u; y < src->height; y++)
    {
        for (x = 0u; x < src->width; x++)
        {
            for (r = 0u; r < IMGPROC_MEDIAN_SIZE; r++)
            {
                for (c = 0u; c < IMGPROC_MEDIAN_SIZE; c++)
                {
                    const int32_t px = ((int32_t)x + (int32_t)c) - radius;
                    const int32_t py = ((int32_t)y + (int32_t)r) - radius;
                    window[(r * IMGPROC_MEDIAN_SIZE) + c] = imgproc_image_fetch(src, px, py, 0u, border);
                }
            }
            *imgproc_image_pixel(dst, x, y) = imgproc_median9(window);
        }
    }
}
