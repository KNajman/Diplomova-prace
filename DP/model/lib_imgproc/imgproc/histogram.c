/**
 * @file    histogram.c
 * @brief   Histogram jasu šedotónového obrazu a Otsuův práh
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#include <imgproc/histogram.h>
#include <imgproc/image.h>

#include <stddef.h>
#include <stdint.h>

/**
 * @brief Spočítá histogram 256 košů.
 * @param src   Vstupní obraz (1 kanál)
 * @param hist  Výstup, pole IMGPROC_HIST_BINS položek (vynuluje se)
 */
void imgproc_histogram(const imgproc_image_t* src, uint32_t* hist)
{
    uint32_t x = 0u;
    uint32_t y = 0u;
    uint32_t i = 0u;

    imgproc_image_check(src, 1u);
    IMGPROC_ASSERT(hist != NULL);

    for (i = 0u; i < IMGPROC_HIST_BINS; i++)
    {
        hist[i] = 0u;
    }
    for (y = 0u; y < src->height; y++)
    {
        for (x = 0u; x < src->width; x++)
        {
            hist[*imgproc_image_pixel(src, x, y)]++;
        }
    }
}

/**
 * @brief Spočítá Otsuův práh (maximalizace mezitřídního rozptylu).
 *
 * Práh má stejný význam jako u cv::threshold s THRESH_OTSU: pixely > práh patří do popředí.
 * Počítá se v double - běží jen na ARM mezi snímky (256 iterací), v HW se neimplementuje.
 * Při shodě rozptylů se bere první (nejmenší) práh.
 *
 * @param hist Histogram IMGPROC_HIST_BINS položek
 * @return Práh 0..255
 */
uint8_t imgproc_otsu_threshold(const uint32_t* hist)
{
    double total = 0.0;
    double sum_all = 0.0;
    double weight_bg = 0.0;
    double sum_bg = 0.0;
    double best_var = -1.0;
    uint8_t best_t = 0u;
    uint32_t t = 0u;

    IMGPROC_ASSERT(hist != NULL);
    for (t = 0u; t < IMGPROC_HIST_BINS; t++)
    {
        total += (double)hist[t];
        sum_all += (double)t * (double)hist[t];
    }
    for (t = 0u; t < IMGPROC_HIST_BINS; t++)
    {
        const double weight_fg = total - (weight_bg + (double)hist[t]);
        weight_bg += (double)hist[t];
        sum_bg += (double)t * (double)hist[t];
        if ((weight_bg > 0.0) && (weight_fg > 0.0))
        {
            const double mean_bg = sum_bg / weight_bg;
            const double mean_fg = (sum_all - sum_bg) / weight_fg;
            const double var = weight_bg * weight_fg * (mean_bg - mean_fg) * (mean_bg - mean_fg);
            if (var > best_var)
            {
                best_var = var;
                best_t = (uint8_t)t;
            }
        }
    }
    return best_t;
}
