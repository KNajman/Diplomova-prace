/**
 * @file    test_imgproc.c
 * @brief   Unit testy golden modelu lib_imgproc (bez závislosti na OpenCV, běží i na cíli)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#include <imgproc.h>

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TEST_W              (64u)       /* šířka testovacího obrazu */
#define TEST_H              (48u)       /* výška testovacího obrazu */
#define TEST_RANDOM_WINDOWS (1000000u)  /* počet náhodných oken pro test mediánu */
#define TEST_LCG_MUL        (1103515245u)
#define TEST_LCG_ADD        (12345u)
#define TEST_LCG_SHIFT      (16u)

static uint32_t g_failures = 0u;
static uint32_t g_checks = 0u;
static uint32_t g_lcg_state = 1u;

/* Zaznamená výsledek kontroly a při chybě vypíše místo selhání */
#define TEST_CHECK(cond)                                                            \
    do                                                                              \
    {                                                                               \
        g_checks++;                                                                 \
        if (!(cond))                                                                \
        {                                                                           \
            g_failures++;                                                           \
            printf("FAIL %s:%d: %s\n", __FILE__, __LINE__, #cond);                 \
        }                                                                           \
    } while (0)

/**
 * @brief Jednoduchý deterministický generátor náhodných bajtů (LCG).
 * @return Pseudonáhodný bajt
 */
static uint8_t random_u8(void)
{
    g_lcg_state = (g_lcg_state * TEST_LCG_MUL) + TEST_LCG_ADD;
    return (uint8_t)(g_lcg_state >> TEST_LCG_SHIFT);
}

/**
 * @brief Test zaokrouhlení half-up a saturace.
 */
static void test_arithmetic(void)
{
    TEST_CHECK(imgproc_round_shift(8191, 14u) == 0);
    TEST_CHECK(imgproc_round_shift(8192, 14u) == 1);       /* 0.5 -> 1 */
    TEST_CHECK(imgproc_round_shift(-8192, 14u) == 0);      /* -0.5 -> 0 (half-up) */
    TEST_CHECK(imgproc_round_shift(-8193, 14u) == -1);
    TEST_CHECK(imgproc_round_shift(-24576, 14u) == -1);    /* -1.5 -> -1 */
    TEST_CHECK(imgproc_saturate_u8(-5) == 0u);
    TEST_CHECK(imgproc_saturate_u8(300) == 255u);
    TEST_CHECK(imgproc_saturate_u8(128) == 128u);
}

/**
 * @brief Test matic převodu barev: součty řádků, bílá, černá, šedá.
 */
static void test_csc(void)
{
    const uint8_t white[IMGPROC_CH_MAX] = { 255u, 255u, 255u };
    const uint8_t black[IMGPROC_CH_MAX] = { 0u, 0u, 0u };
    const uint8_t mid_gray[IMGPROC_CH_MAX] = { 128u, 128u, 128u };
    imgproc_csc_matrix_t m = { 0 };
    uint8_t out[IMGPROC_CH_MAX] = { 0u };
    uint32_t p = 0u;

    for (p = 0u; p < (uint32_t)IMGPROC_CSC_GRAY_TO_RGB; p++)
    {
        const bool studio = (p == (uint32_t)IMGPROC_CSC_RGB_TO_YCBCR_BT601_STUDIO)
                            || (p == (uint32_t)IMGPROC_CSC_RGB_TO_YCBCR_BT709_STUDIO);
        imgproc_csc_make((imgproc_csc_preset_t)p, &m);
        imgproc_csc_pixel(&m, white, out);
        TEST_CHECK(out[IMGPROC_YUV_IDX_Y] == (studio ? 235u : 255u));
        imgproc_csc_pixel(&m, black, out);
        TEST_CHECK(out[IMGPROC_YUV_IDX_Y] == (studio ? 16u : 0u));
        if (m.ch_out == IMGPROC_CH_MAX)
        {
            imgproc_csc_pixel(&m, mid_gray, out);
            TEST_CHECK((out[IMGPROC_YUV_IDX_CB] == 128u) && (out[IMGPROC_YUV_IDX_CR] == 128u));
            TEST_CHECK((m.coeff[1][0] + m.coeff[1][1] + m.coeff[1][2]) == 0);
            TEST_CHECK((m.coeff[2][0] + m.coeff[2][1] + m.coeff[2][2]) == 0);
        }
    }
    imgproc_csc_make(IMGPROC_CSC_RGB_TO_GRAY_BT601, &m);
    TEST_CHECK((m.ch_in == 3u) && (m.ch_out == 1u));
    TEST_CHECK((m.coeff[0][0] + m.coeff[0][1] + m.coeff[0][2]) == (1 << IMGPROC_CSC_FRAC_BITS));
}

/**
 * @brief Test RGB -> HSV na základních barvách a rozsahu H přes všech 2^24 barev.
 */
static void test_hsv(void)
{
    uint8_t rgb[IMGPROC_CH_MAX] = { 0u };
    uint8_t hsv[IMGPROC_CH_MAX] = { 0u };
    uint8_t back[IMGPROC_CH_MAX] = { 0u };
    uint32_t c = 0u;
    uint8_t max_h = 0u;

    rgb[IMGPROC_RGB_IDX_R] = 255u;      /* čistá červená */
    imgproc_rgb_to_hsv_pixel(rgb, hsv);
    TEST_CHECK((hsv[IMGPROC_HSV_IDX_H] == 0u) && (hsv[IMGPROC_HSV_IDX_S] == 255u) && (hsv[IMGPROC_HSV_IDX_V] == 255u));
    rgb[IMGPROC_RGB_IDX_R] = 0u;
    rgb[IMGPROC_RGB_IDX_G] = 255u;      /* čistá zelená */
    imgproc_rgb_to_hsv_pixel(rgb, hsv);
    TEST_CHECK(hsv[IMGPROC_HSV_IDX_H] == 60u);
    rgb[IMGPROC_RGB_IDX_G] = 0u;
    rgb[IMGPROC_RGB_IDX_B] = 255u;      /* čistá modrá */
    imgproc_rgb_to_hsv_pixel(rgb, hsv);
    TEST_CHECK(hsv[IMGPROC_HSV_IDX_H] == 120u);
    imgproc_hsv_to_rgb_pixel(hsv, back);
    TEST_CHECK((back[IMGPROC_RGB_IDX_B] == 255u) && (back[IMGPROC_RGB_IDX_R] == 0u) && (back[IMGPROC_RGB_IDX_G] == 0u));

    for (c = 0u; c < (1u << 24u); c++)  /* úplný test: H musí být vždy 0..179 */
    {
        rgb[0] = (uint8_t)c;
        rgb[1] = (uint8_t)(c >> 8u);
        rgb[2] = (uint8_t)(c >> 16u);
        imgproc_rgb_to_hsv_pixel(rgb, hsv);
        max_h = (hsv[IMGPROC_HSV_IDX_H] > max_h) ? hsv[IMGPROC_HSV_IDX_H] : max_h;
    }
    TEST_CHECK(max_h == 179u);
    TEST_CHECK(imgproc_hsv_sdiv(1u) == 1044480);    /* 255 << 12 */
    TEST_CHECK(imgproc_hsv_hdiv180(1u) == 122880);  /* (180 << 12) / 6 */
}

/**
 * @brief Porovná medián sítě s mediánem získaným řazením.
 * @param window 9 hodnot
 * @return Medián řazením
 */
static uint8_t median_by_sort(const uint8_t* window)
{
    uint8_t sorted[IMGPROC_MEDIAN_COUNT] = { 0u };
    uint8_t i = 0u;
    uint8_t j = 0u;

    memcpy(sorted, window, sizeof(sorted));
    for (i = 1u; i < IMGPROC_MEDIAN_COUNT; i++)
    {
        for (j = i; (j > 0u) && (sorted[j - 1u] > sorted[j]); j--)
        {
            const uint8_t tmp = sorted[j];
            sorted[j] = sorted[j - 1u];
            sorted[j - 1u] = tmp;
        }
    }
    return sorted[IMGPROC_MEDIAN_COUNT / 2u];
}

/**
 * @brief Test sítě mediánu na milionu náhodných oken (včetně oken s opakujícími se hodnotami).
 */
static void test_median(void)
{
    uint8_t window[IMGPROC_MEDIAN_COUNT] = { 0u };
    uint32_t mismatches = 0u;
    uint32_t n = 0u;
    uint8_t i = 0u;

    for (n = 0u; n < TEST_RANDOM_WINDOWS; n++)
    {
        for (i = 0u; i < IMGPROC_MEDIAN_COUNT; i++)
        {
            window[i] = ((n % 2u) == 0u) ? random_u8() : (uint8_t)(random_u8() & 0x3u);  /* i duplicity */
        }
        if (imgproc_median9(window) != median_by_sort(window))
        {
            mismatches++;
        }
    }
    TEST_CHECK(mismatches == 0u);
}

/**
 * @brief Test filtrů: identita, průměr konstantního obrazu, okraje, histogram.
 */
static void test_filters(void)
{
    static uint8_t src_buf[TEST_W * TEST_H];
    static uint8_t dst_buf[TEST_W * TEST_H];
    imgproc_image_t src = { 0 };
    imgproc_image_t dst = { 0 };
    imgproc_kernel_t kernel = { 0 };
    uint32_t hist[IMGPROC_HIST_BINS] = { 0u };
    uint32_t i = 0u;
    uint32_t sum = 0u;

    imgproc_image_init(&src, src_buf, TEST_W, TEST_H, 1u);
    imgproc_image_init(&dst, dst_buf, TEST_W, TEST_H, 1u);
    for (i = 0u; i < (TEST_W * TEST_H); i++)
    {
        src_buf[i] = random_u8();
    }
    imgproc_kernel_make(IMGPROC_KERNEL_IDENTITY, &kernel);
    imgproc_filter2d(&src, &dst, &kernel, IMGPROC_BORDER_CONSTANT);
    TEST_CHECK(memcmp(src_buf, dst_buf, sizeof(src_buf)) == 0);

    memset(src_buf, 90, sizeof(src_buf));
    imgproc_kernel_make(IMGPROC_KERNEL_MEAN, &kernel);
    imgproc_filter2d(&src, &dst, &kernel, IMGPROC_BORDER_CONSTANT);
    TEST_CHECK(*imgproc_image_pixel(&dst, 10u, 10u) == 90u);   /* uvnitř */
    TEST_CHECK(*imgproc_image_pixel(&dst, 0u, 0u) == 40u);     /* roh: 4 * 90 / 9 = 40 */
    imgproc_filter2d(&src, &dst, &kernel, IMGPROC_BORDER_REPLICATE);
    TEST_CHECK(*imgproc_image_pixel(&dst, 0u, 0u) == 90u);

    imgproc_median3x3(&src, &dst, IMGPROC_BORDER_CONSTANT);
    TEST_CHECK(*imgproc_image_pixel(&dst, 0u, 0u) == 0u);      /* roh: 5 nul z 9 */
    imgproc_median3x3(&src, &dst, IMGPROC_BORDER_REPLICATE);
    TEST_CHECK(*imgproc_image_pixel(&dst, 0u, 0u) == 90u);

    imgproc_histogram(&src, hist);
    for (i = 0u; i < IMGPROC_HIST_BINS; i++)
    {
        sum += hist[i];
    }
    TEST_CHECK((sum == (TEST_W * TEST_H)) && (hist[90] == (TEST_W * TEST_H)));
    TEST_CHECK(imgproc_magnitude(3, -4, IMGPROC_MAG_L2) == 5);
    TEST_CHECK(imgproc_magnitude(3, -4, IMGPROC_MAG_L1) == 7);
}

/**
 * @brief Spustí všechny testy.
 * @return EXIT_SUCCESS, pokud vše prošlo
 */
int main(void)
{
    test_arithmetic();
    test_csc();
    test_hsv();
    test_median();
    test_filters();
    printf("%u/%u kontrol prošlo\n", g_checks - g_failures, g_checks);
    return (g_failures == 0u) ? EXIT_SUCCESS : EXIT_FAILURE;
}
