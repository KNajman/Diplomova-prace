/**
 * @file    main.c
 * @brief   Měřicí aplikace testovacího řetězce (bare-metal, Cortex-A53): HW (HLS i VHDL) × SW na 1080p
 * @author  Bc. Karel Najman
 * @date    2026-10-19
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Pro každé jádro v bitstreamu:
 *  1. nastaví cestu přepínači a registry jádra (stejná funkce pro HLS i VHDL - mapa registrů je shodná),
 *  2. pošle MEAS_FRAMES snímků přes VDMA, MEAS_RUNS opakování, medián doby na snímek -> fps,
 *  3. porovná výstup bit po bitu s golden modelem lib_imgproc spočítaným na ARM (a u histogramu i pole hist[]),
 *  4. jednou pro každý algoritmus změří SW (lib_imgproc na A53, medián z SW_RUNS běhů).
 * Výsledky jako CSV na UART (řádky "CSV,..."), aby šly přímo zkopírovat do DP/results.
 *
 * Poznámky k návrhu:
 *  - Šedotónová jádra jsou za převodníky RGB -> šedá a šedá -> RGB (VHDL csc_axil), golden je proto
 *    gray_to_rgb(op(rgb_to_gray(vstup))). Port 0 obou přepínačů = bypass pro změření režie řetězce.
 *  - SW čas je jen samotný algoritmus nad pamětí (bez převodníků), HW čas je celý průchod paměť -> paměť.
 *  - Úroveň optimalizace SW (-O0/-O2/-O3) se volí při překladu, aplikace ji vypíše (SW_OPT_LEVEL).
 */
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <xil_cache.h>
#include <xiltimer.h>   // 2025.2 (SDT): XTime, XTime_GetTime a COUNTS_PER_SECOND jsou zde, xtime_l.h se neexportuje

#include <imgproc.h>

#include "harness_hw.h"
#include "harness_map.h"

/*
 * Úroveň optimalizace předává build jako holý token (-DSW_OPT_LEVEL=O2): uvozovky v definici rozbíjí
 * UserConfig.cmake ve Vitis 2025.2, proto se na řetězec převádí až tady.
 */
#define SW_STRINGIFY_TOKEN(token)   #token
#define SW_STRINGIFY(token)         SW_STRINGIFY_TOKEN(token)
#ifdef SW_OPT_LEVEL
#define SW_OPT_LEVEL_NAME   SW_STRINGIFY(SW_OPT_LEVEL)
#else
#define SW_OPT_LEVEL_NAME   "?"
#endif

#define FRAME_WIDTH         (1920u)
#define FRAME_HEIGHT        (1080u)
#define FRAME_PIXELS        (FRAME_WIDTH * FRAME_HEIGHT)
#define RGB_BYTES           (3u)
#define MEAS_FRAMES         (10u)           ///< Snímků v jednom měření (VDMA se po nich zastaví)
#define MEAS_RUNS           (5u)            ///< Opakování měření HW (medián)
#define SW_RUNS             (10u)           ///< Opakování měření SW (medián)
#define MAX_RUNS            (10u)
#define HIST_BINS           (256u)
#define HIST_MEM_OFFSET     (0x400u)        ///< Pole hist[] v mapě HLS/VHDL histogramu
#define FILTER_STATUS_3X3   (0x80u)         ///< Registr status konvoluce 3x3 (za c0..c8)
#define MEDIAN_STATUS       (0x28u)

/* Snímkové buffery v DDR (zarovnání na řádek cache) */
static uint8_t g_input[FRAME_PIXELS * RGB_BYTES] __attribute__((aligned(64)));
static uint8_t g_hw_output[FRAME_PIXELS * RGB_BYTES] __attribute__((aligned(64)));
static uint8_t g_golden[FRAME_PIXELS * RGB_BYTES] __attribute__((aligned(64)));
static uint8_t g_gray[FRAME_PIXELS] __attribute__((aligned(64)));
static uint8_t g_gray_result[FRAME_PIXELS] __attribute__((aligned(64)));

/// Algoritmus (jeden golden + jedno SW měření, víc implementací HW)
typedef enum
{
    OP_RGB_BYPASS = 0,
    OP_CSC_YCBCR601,
    OP_RGB2HSV,
    OP_HSV2RGB,
    OP_GRAY_BYPASS,
    OP_THRESHOLD_OTSU,
    OP_MEDIAN,
    OP_FILTER_SOBEL_X,
    OP_HISTOGRAM,
    OP_COUNT
} op_t;

/// Jedna implementace v bitstreamu
typedef struct
{
    op_t op;
    const char* impl;           ///< "HLS", "VHDL" nebo "-" (bypass)
    uintptr_t base;             ///< Báze s_axi_control (0 = bez registrů)
    bool gray_lane;             ///< Za převodníky RGB -> šedá -> RGB
    uint32_t port;              ///< Port přepínače své větve
} hw_case_t;

static const char* const k_op_names[OP_COUNT] = {
    "bypass_rgb", "csc_ycbcr601", "rgb2hsv", "hsv2rgb", "bypass_gray", "threshold_otsu", "median3x3",
    "filter3x3_sobel_x", "histogram"
};

/* Seznam implementací podle toho, co build_harness.tcl do bitstreamu skutečně dal (HARNESS_HAS_*) */
static const hw_case_t k_cases[] = {
    { OP_RGB_BYPASS, "-", 0u, false, 0u },
#ifdef HARNESS_HAS_HLS_CSC_RGB
    { OP_CSC_YCBCR601, "HLS", HARNESS_HLS_CSC_RGB_BASEADDR, false, HARNESS_HLS_CSC_RGB_PORT },
#endif
#ifdef HARNESS_HAS_VHDL_CSC_RGB
    { OP_CSC_YCBCR601, "VHDL", HARNESS_VHDL_CSC_RGB_BASEADDR, false, HARNESS_VHDL_CSC_RGB_PORT },
#endif
#ifdef HARNESS_HAS_HLS_RGB2HSV
    { OP_RGB2HSV, "HLS", HARNESS_HLS_RGB2HSV_BASEADDR, false, HARNESS_HLS_RGB2HSV_PORT },
#endif
#ifdef HARNESS_HAS_VHDL_RGB2HSV
    { OP_RGB2HSV, "VHDL", HARNESS_VHDL_RGB2HSV_BASEADDR, false, HARNESS_VHDL_RGB2HSV_PORT },
#endif
#ifdef HARNESS_HAS_HLS_HSV2RGB
    { OP_HSV2RGB, "HLS", HARNESS_HLS_HSV2RGB_BASEADDR, false, HARNESS_HLS_HSV2RGB_PORT },
#endif
#ifdef HARNESS_HAS_VHDL_HSV2RGB
    { OP_HSV2RGB, "VHDL", HARNESS_VHDL_HSV2RGB_BASEADDR, false, HARNESS_VHDL_HSV2RGB_PORT },
#endif
    { OP_GRAY_BYPASS, "-", 0u, true, 0u },
#ifdef HARNESS_HAS_HLS_THRESHOLD
    { OP_THRESHOLD_OTSU, "HLS", HARNESS_HLS_THRESHOLD_BASEADDR, true, HARNESS_HLS_THRESHOLD_PORT },
#endif
#ifdef HARNESS_HAS_VHDL_THRESHOLD
    { OP_THRESHOLD_OTSU, "VHDL", HARNESS_VHDL_THRESHOLD_BASEADDR, true, HARNESS_VHDL_THRESHOLD_PORT },
#endif
#ifdef HARNESS_HAS_HLS_MEDIAN
    { OP_MEDIAN, "HLS", HARNESS_HLS_MEDIAN_BASEADDR, true, HARNESS_HLS_MEDIAN_PORT },
#endif
#ifdef HARNESS_HAS_VHDL_MEDIAN
    { OP_MEDIAN, "VHDL", HARNESS_VHDL_MEDIAN_BASEADDR, true, HARNESS_VHDL_MEDIAN_PORT },
#endif
#ifdef HARNESS_HAS_HLS_FILTER3X3
    { OP_FILTER_SOBEL_X, "HLS", HARNESS_HLS_FILTER3X3_BASEADDR, true, HARNESS_HLS_FILTER3X3_PORT },
#endif
#ifdef HARNESS_HAS_VHDL_FILTER3X3
    { OP_FILTER_SOBEL_X, "VHDL", HARNESS_VHDL_FILTER3X3_BASEADDR, true, HARNESS_VHDL_FILTER3X3_PORT },
#endif
#ifdef HARNESS_HAS_HLS_HISTOGRAM
    { OP_HISTOGRAM, "HLS", HARNESS_HLS_HISTOGRAM_BASEADDR, true, HARNESS_HLS_HISTOGRAM_PORT },
#endif
#ifdef HARNESS_HAS_VHDL_HISTOGRAM
    { OP_HISTOGRAM, "VHDL", HARNESS_VHDL_HISTOGRAM_BASEADDR, true, HARNESS_VHDL_HISTOGRAM_PORT },
#endif
};

static uint32_t g_hist_golden[HIST_BINS];
static uint8_t g_otsu_threshold = 0u;

/**
 * @brief Vygeneruje testovací snímek: plynulé přechody (CSC, HSV), hrany (Sobel) a šum (medián).
 */
static void make_test_frame(void)
{
    uint32_t x = 0u;
    uint32_t y = 0u;
    uint32_t lcg = 12345u;

    for (y = 0u; y < FRAME_HEIGHT; y++)
    {
        for (x = 0u; x < FRAME_WIDTH; x++)
        {
            uint8_t* p = &g_input[((y * FRAME_WIDTH) + x) * RGB_BYTES];
            const bool block = (((x / 64u) + (y / 64u)) % 2u) == 0u;
            lcg = (lcg * 1103515245u) + 12345u;
            p[IMGPROC_RGB_IDX_R] = (uint8_t)((x * 255u) / (FRAME_WIDTH - 1u));
            p[IMGPROC_RGB_IDX_G] = (uint8_t)((y * 255u) / (FRAME_HEIGHT - 1u));
            p[IMGPROC_RGB_IDX_B] = block ? (uint8_t)(lcg >> 24) : (uint8_t)(200u - ((x + y) % 64u));
        }
    }
}

/// Medián z n hodnot (n <= MAX_RUNS), vstup se seřadí
static uint64_t median_u64(uint64_t* values, uint32_t n)
{
    uint32_t i = 0u;
    uint32_t j = 0u;

    for (i = 1u; i < n; i++)
    {
        const uint64_t v = values[i];
        j = i;
        while ((j > 0u) && (values[j - 1u] > v))
        {
            values[j] = values[j - 1u];
            j--;
        }
        values[j] = v;
    }
    return values[n / 2u];
}

/// Převod tiků XTime na mikrosekundy
static uint64_t ticks_to_us(uint64_t ticks)
{
    return (ticks * 1000000u) / (uint64_t)COUNTS_PER_SECOND;
}

/**
 * @brief Nastaví převodník CSC (mapa csc_axil: koeficienty [výstup][vstup] po řádcích, pak offsety).
 */
static void configure_csc(uintptr_t base, imgproc_csc_preset_t preset)
{
    imgproc_csc_matrix_t m;
    uint32_t reg = 0u;
    uint32_t out_ch = 0u;
    uint32_t in_ch = 0u;

    imgproc_csc_make(preset, &m);
    for (out_ch = 0u; out_ch < m.ch_out; out_ch++)
    {
        for (in_ch = 0u; in_ch < m.ch_in; in_ch++)
        {
            hw_write(base, HW_REG_ARG(reg), (uint32_t)m.coeff[out_ch][in_ch]);
            reg++;
        }
    }
    for (out_ch = 0u; out_ch < m.ch_out; out_ch++)
    {
        hw_write(base, HW_REG_ARG(reg), (uint32_t)(int32_t)m.offset[out_ch]);
        reg++;
    }
}

/**
 * @brief Nastaví registry jádra pro daný algoritmus (shodné pro HLS i VHDL).
 */
static void configure_core(op_t op, uintptr_t base)
{
    imgproc_kernel_t kernel;
    uint32_t row = 0u;
    uint32_t col = 0u;

    switch (op)
    {
        case OP_CSC_YCBCR601:
            configure_csc(base, IMGPROC_CSC_RGB_TO_YCBCR_BT601_FULL);
            break;
        case OP_THRESHOLD_OTSU:
            hw_write(base, HW_REG_ARG(0u), g_otsu_threshold);           /* thresh */
            hw_write(base, HW_REG_ARG(1u), 255u);                       /* maxval */
            hw_write(base, HW_REG_ARG(2u), (uint32_t)IMGPROC_THRESH_BINARY);
            break;
        case OP_MEDIAN:
            hw_write(base, HW_REG_ARG(0u), FRAME_WIDTH);
            hw_write(base, HW_REG_ARG(1u), FRAME_HEIGHT);
            hw_write(base, HW_REG_ARG(2u), (uint32_t)IMGPROC_BORDER_REPLICATE);
            break;
        case OP_FILTER_SOBEL_X:
            imgproc_kernel_make(IMGPROC_KERNEL_SOBEL_X, &kernel);
            hw_write(base, HW_REG_ARG(0u), FRAME_WIDTH);
            hw_write(base, HW_REG_ARG(1u), FRAME_HEIGHT);
            hw_write(base, HW_REG_ARG(2u), (uint32_t)IMGPROC_BORDER_REPLICATE);
            hw_write(base, HW_REG_ARG(3u), (uint32_t)kernel.scale_q14);
            hw_write(base, HW_REG_ARG(4u), (uint32_t)(int32_t)kernel.delta);
            for (row = 0u; row < 3u; row++)
            {
                for (col = 0u; col < 3u; col++)
                {
                    hw_write(base, HW_REG_ARG(5u + (row * 3u) + col), (uint32_t)(int32_t)kernel.coeff[row][col]);
                }
            }
            break;
        case OP_HISTOGRAM:
            hw_write(base, HW_REG_ARG(0u), FRAME_HEIGHT);
            break;
        default:
            break;                          /* bypass, HSV: bez parametrů */
    }
}

/**
 * @brief Spočítá golden výstup řetězce do g_golden a vrátí dobu samotného algoritmu v SW [tiky].
 */
static uint64_t run_golden(op_t op)
{
    imgproc_image_t rgb_in;
    imgproc_image_t rgb_out;
    imgproc_image_t gray;
    imgproc_image_t gray_result;
    imgproc_csc_matrix_t m;
    imgproc_kernel_t kernel;
    XTime start = 0u;
    XTime end = 0u;
    bool gray_op = false;

    imgproc_image_init(&rgb_in, g_input, FRAME_WIDTH, FRAME_HEIGHT, 3u);
    imgproc_image_init(&rgb_out, g_golden, FRAME_WIDTH, FRAME_HEIGHT, 3u);
    imgproc_image_init(&gray, g_gray, FRAME_WIDTH, FRAME_HEIGHT, 1u);
    imgproc_image_init(&gray_result, g_gray_result, FRAME_WIDTH, FRAME_HEIGHT, 1u);

    gray_op = (op >= OP_GRAY_BYPASS);
    if (gray_op)
    {
        imgproc_csc_make(IMGPROC_CSC_RGB_TO_GRAY_BT601, &m);
        imgproc_csc(&rgb_in, &gray, &m);
    }

    XTime_GetTime(&start);
    switch (op)
    {
        case OP_RGB_BYPASS:
            (void)memcpy(g_golden, g_input, sizeof(g_golden));
            break;
        case OP_CSC_YCBCR601:
            imgproc_csc_make(IMGPROC_CSC_RGB_TO_YCBCR_BT601_FULL, &m);
            imgproc_csc(&rgb_in, &rgb_out, &m);
            break;
        case OP_RGB2HSV:
            imgproc_rgb_to_hsv(&rgb_in, &rgb_out);
            break;
        case OP_HSV2RGB:
            imgproc_hsv_to_rgb(&rgb_in, &rgb_out);      /* vstup se čte jako H, S, V */
            break;
        case OP_GRAY_BYPASS:
            (void)memcpy(g_gray_result, g_gray, sizeof(g_gray_result));
            break;
        case OP_THRESHOLD_OTSU:
            imgproc_threshold(&gray, &gray_result, g_otsu_threshold, 255u, IMGPROC_THRESH_BINARY);
            break;
        case OP_MEDIAN:
            imgproc_median3x3(&gray, &gray_result, IMGPROC_BORDER_REPLICATE);
            break;
        case OP_FILTER_SOBEL_X:
            imgproc_kernel_make(IMGPROC_KERNEL_SOBEL_X, &kernel);
            imgproc_filter2d(&gray, &gray_result, &kernel, IMGPROC_BORDER_REPLICATE);
            break;
        case OP_HISTOGRAM:
            (void)memset(g_hist_golden, 0, sizeof(g_hist_golden));
            imgproc_histogram(&gray, g_hist_golden);
            (void)memcpy(g_gray_result, g_gray, sizeof(g_gray_result));  /* video prochází beze změny */
            break;
        default:
            break;
    }
    XTime_GetTime(&end);

    if (gray_op)
    {
        imgproc_csc_make(IMGPROC_CSC_GRAY_TO_RGB, &m);
        imgproc_csc(&gray_result, &rgb_out, &m);
    }
    return (uint64_t)(end - start);
}

/// Počet rozdílných bajtů výstupu HW proti golden
static uint32_t count_mismatches(void)
{
    uint32_t i = 0u;
    uint32_t mismatches = 0u;

    for (i = 0u; i < sizeof(g_golden); i++)
    {
        if (g_hw_output[i] != g_golden[i])
        {
            if (mismatches < 3u)
            {
                printf("  rozdil px %lu kanal %lu: HW %u golden %u\r\n", (unsigned long)(i / RGB_BYTES),
                       (unsigned long)(i % RGB_BYTES), g_hw_output[i], g_golden[i]);
            }
            mismatches++;
        }
    }
    return mismatches;
}

/// Počet košů histogramu jádra rozdílných proti golden
static uint32_t check_histogram(uintptr_t base)
{
    uint32_t bin = 0u;
    uint32_t mismatches = 0u;

    for (bin = 0u; bin < HIST_BINS; bin++)
    {
        if (hw_read(base, HIST_MEM_OFFSET + (4u * bin)) != g_hist_golden[bin])
        {
            mismatches++;
        }
    }
    return mismatches;
}

/**
 * @brief Změří jednu implementaci a vypíše řádek CSV.
 */
static void measure_case(const hw_case_t* tc, uint64_t sw_ticks)
{
    uint64_t runs[MAX_RUNS];
    uint64_t frame_us = 0u;
    uint32_t run = 0u;
    uint32_t mismatches = 0u;
    uint32_t hist_mismatches = 0u;
    uint32_t status = 0u;
    bool ok = true;

    if (tc->gray_lane)
    {
        hw_route(HARNESS_RGB_SWITCH_IN_BASEADDR, HARNESS_RGB_SWITCH_OUT_BASEADDR, HARNESS_RGB_NUM_PORTS,
                 HARNESS_GRAY_LANE_PORT);
        hw_route(HARNESS_GRAY_SWITCH_IN_BASEADDR, HARNESS_GRAY_SWITCH_OUT_BASEADDR, HARNESS_GRAY_NUM_PORTS, tc->port);
    }
    else
    {
        hw_route(HARNESS_RGB_SWITCH_IN_BASEADDR, HARNESS_RGB_SWITCH_OUT_BASEADDR, HARNESS_RGB_NUM_PORTS, tc->port);
    }
    if (tc->base != 0u)
    {
        configure_core(tc->op, tc->base);
        hw_core_start(tc->base);
    }

    (void)memset(g_hw_output, 0, sizeof(g_hw_output));
    for (run = 0u; (run < MEAS_RUNS) && ok; run++)
    {
        ok = hw_vdma_run(HARNESS_AXI_VDMA_0_BASEADDR, g_input, g_hw_output, FRAME_WIDTH, FRAME_HEIGHT, MEAS_FRAMES,
                         &runs[run]);
    }
    if (ok)
    {
        frame_us = ticks_to_us(median_u64(runs, MEAS_RUNS)) / MEAS_FRAMES;
        mismatches = count_mismatches();
        if (tc->op == OP_HISTOGRAM)
        {
            hist_mismatches = check_histogram(tc->base);
        }
        if ((tc->op == OP_MEDIAN) || (tc->op == OP_FILTER_SOBEL_X))
        {
            status = hw_read(tc->base, (tc->op == OP_MEDIAN) ? MEDIAN_STATUS : FILTER_STATUS_3X3);
        }
    }
    if (tc->base != 0u)
    {
        hw_core_stop(tc->base);
    }

    /* CSV: algoritmus, implementace, us/snímek HW, fps HW, us SW, úroveň SW, chybné bajty, chybné koše, status */
    printf("CSV,%s,%s,%llu,%llu.%01llu,%llu,%s,%lu,%lu,0x%lX,%s\r\n", k_op_names[tc->op], tc->impl,
           (unsigned long long)frame_us, (unsigned long long)((frame_us > 0u) ? (1000000u / frame_us) : 0u),
           (unsigned long long)((frame_us > 0u) ? ((10000000u / frame_us) % 10u) : 0u),
           (unsigned long long)ticks_to_us(sw_ticks), SW_OPT_LEVEL_NAME, (unsigned long)mismatches,
           (unsigned long)hist_mismatches, (unsigned long)status,
           (ok && (mismatches == 0u) && (hist_mismatches == 0u) && (status == 0u)) ? "PASS" : "FAIL");
}

int main(void)
{
    uint64_t sw_runs[MAX_RUNS];
    uint64_t sw_ticks[OP_COUNT];
    uint32_t op = 0u;
    uint32_t run = 0u;
    uint32_t i = 0u;
    imgproc_image_t rgb_in;
    imgproc_image_t gray;
    imgproc_csc_matrix_t m;

    Xil_DCacheEnable();
    Xil_ICacheEnable();
    printf("\r\n== DP testovaci retezec: %lux%lu, %u snimku x %u mereni, SW %s ==\r\n", (unsigned long)FRAME_WIDTH,
           (unsigned long)FRAME_HEIGHT, MEAS_FRAMES, MEAS_RUNS, SW_OPT_LEVEL_NAME);
    make_test_frame();

    /* Otsuův práh šedého obrazu (ARM z histogramu - stejně jako by se použil za běhu) */
    imgproc_image_init(&rgb_in, g_input, FRAME_WIDTH, FRAME_HEIGHT, 3u);
    imgproc_image_init(&gray, g_gray, FRAME_WIDTH, FRAME_HEIGHT, 1u);
    imgproc_csc_make(IMGPROC_CSC_RGB_TO_GRAY_BT601, &m);
    imgproc_csc(&rgb_in, &gray, &m);
    (void)memset(g_hist_golden, 0, sizeof(g_hist_golden));
    imgproc_histogram(&gray, g_hist_golden);
    g_otsu_threshold = imgproc_otsu_threshold(g_hist_golden);
    printf("Otsuuv prah: %u\r\n", g_otsu_threshold);

    configure_csc(HARNESS_GRAY_IN_BASEADDR, IMGPROC_CSC_RGB_TO_GRAY_BT601);
    configure_csc(HARNESS_GRAY_OUT_BASEADDR, IMGPROC_CSC_GRAY_TO_RGB);
    hw_core_start(HARNESS_GRAY_IN_BASEADDR);
    hw_core_start(HARNESS_GRAY_OUT_BASEADDR);

    /* SW: každý algoritmus SW_RUNS krát (medián) */
    for (op = 0u; op < (uint32_t)OP_COUNT; op++)
    {
        for (run = 0u; run < SW_RUNS; run++)
        {
            sw_runs[run] = run_golden((op_t)op);
        }
        sw_ticks[op] = median_u64(sw_runs, SW_RUNS);
    }

    printf("CSV,algoritmus,implementace,hw_us_snimek,hw_fps,sw_us,sw_opt,chybne_bajty,chybne_kose,status,vysledek\r\n");
    for (i = 0u; i < (sizeof(k_cases) / sizeof(k_cases[0])); i++)
    {
        (void)run_golden(k_cases[i].op);
        measure_case(&k_cases[i], sw_ticks[k_cases[i].op]);
    }
    printf("== HOTOVO ==\r\n");
    return 0;
}
