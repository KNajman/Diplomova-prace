/**
 * @file    imgproc_cli.c
 * @brief   Nástroj pro PC: aplikuje golden model na obrázek a generuje data pro testbenche (PPM/PGM + HEX)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Použití:  imgproc_cli <operace> <vstup.ppm|pgm> <výstupní_prefix> [parametry]
 * Výstup:   <prefix>.ppm/.pgm (náhled) a <prefix>.hex (1 pixel na řádek = TDATA v hex, UG934)
 */

#include <imgproc_cli.h>
#include <imgproc.h>
#include <pc_file.h>

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CLI_MAX_BYTES   (IMGPROC_MAX_WIDTH * IMGPROC_MAX_HEIGHT * IMGPROC_CH_MAX)
#define CLI_PATH_MAX    (1024u)
#define CLI_ARG_OP      (1)     /* index argumentu s operací */
#define CLI_ARG_IN      (2)     /* index argumentu se vstupním souborem */
#define CLI_ARG_OUT     (3)     /* index argumentu s výstupním prefixem */
#define CLI_ARG_P1      (4)     /* první parametr operace */
#define CLI_ARG_P2      (5)
#define CLI_ARG_P3      (6)
#define CLI_MIN_ARGS    (4)
#define CLI_PNM_MAXVAL  (255)
#define CLI_MAGNITUDE_COUNT (5u)    /* počet metod magnitudy (l1, linf, ambm1, ambm2, l2) */

static uint8_t g_src_buf[CLI_MAX_BYTES];
static uint8_t g_dst_buf[CLI_MAX_BYTES];

/**
 * @brief Ukončí program s chybovou hláškou.
 * @param msg Zpráva
 */
static _Noreturn void fail(const char* msg)
{
    fprintf(stderr, "CHYBA: %s\n", msg);
    exit(EXIT_FAILURE);
}

/**
 * @brief Načte obrázek PPM (P6) nebo PGM (P5) s maxval 255; RGB převede do pořadí UG934.
 * @param path  Cesta k souboru
 * @param img   Výstupní popis obrazu nad g_src_buf
 */
static void read_pnm(const char* path, imgproc_image_t* img)
{
    FILE* f = pc_file_open(path, "rb");
    char magic[3] = { 0 };
    unsigned int w = 0u;
    unsigned int h = 0u;
    int maxval = 0;
    uint8_t channels = 0u;
    size_t bytes = 0u;
    size_t i = 0u;

    if (f == NULL)
    {
        fail("nelze otevřít vstupní soubor");
    }
    if ((fscanf(f, "%2s %u %u %d", magic, &w, &h, &maxval) != 4) || (maxval != CLI_PNM_MAXVAL) || (fgetc(f) == EOF))
    {
        fail("nepodporovaná hlavička PNM (jen P5/P6, maxval 255, bez komentářů)");
    }
    channels = (strcmp(magic, "P6") == 0) ? (uint8_t)IMGPROC_CH_MAX : ((strcmp(magic, "P5") == 0) ? 1u : 0u);
    if ((channels == 0u) || (w > IMGPROC_MAX_WIDTH) || (h > IMGPROC_MAX_HEIGHT))
    {
        fail("nepodporovaný formát nebo rozměr");
    }
    bytes = (size_t)w * h * channels;
    if (fread(g_src_buf, 1u, bytes, f) != bytes)
    {
        fail("soubor je zkrácený");
    }
    (void)fclose(f);
    for (i = 0u; (channels == IMGPROC_CH_MAX) && (i < bytes); i += IMGPROC_CH_MAX)    /* R,G,B -> G,B,R */
    {
        const uint8_t r = g_src_buf[i];
        g_src_buf[i + IMGPROC_RGB_IDX_G] = g_src_buf[i + 1u];
        g_src_buf[i + IMGPROC_RGB_IDX_B] = g_src_buf[i + 2u];
        g_src_buf[i + IMGPROC_RGB_IDX_R] = r;
    }
    imgproc_image_init(img, g_src_buf, w, h, channels);
}

/**
 * @brief Uloží obraz jako PGM/PPM a jako HEX soubor pro testbenche.
 * @param img       Obraz
 * @param prefix    Výstupní prefix
 * @param is_rgb    true = 3 kanály v pořadí UG934 se převedou na R,G,B (jinak surové pořadí)
 */
static void write_outputs(const imgproc_image_t* img, const char* prefix, bool is_rgb)
{
    char path[CLI_PATH_MAX] = { 0 };
    const bool color = (img->channels == IMGPROC_CH_MAX);
    FILE* pnm = NULL;
    FILE* hex = NULL;
    uint32_t x = 0u;
    uint32_t y = 0u;

    (void)snprintf(path, sizeof(path), "%s.%s", prefix, color ? "ppm" : "pgm");
    pnm = pc_file_open(path, "wb");
    (void)snprintf(path, sizeof(path), "%s.hex", prefix);
    hex = pc_file_open(path, "w");
    if ((pnm == NULL) || (hex == NULL))
    {
        fail("nelze vytvořit výstupní soubory");
    }
    fprintf(pnm, "%s\n%u %u\n%d\n", color ? "P6" : "P5", img->width, img->height, CLI_PNM_MAXVAL);
    for (y = 0u; y < img->height; y++)
    {
        for (x = 0u; x < img->width; x++)
        {
            const uint8_t* p = imgproc_image_pixel(img, x, y);
            if (color)
            {
                const uint8_t out[IMGPROC_CH_MAX] = { is_rgb ? p[IMGPROC_RGB_IDX_R] : p[0],
                                                      is_rgb ? p[IMGPROC_RGB_IDX_G] : p[1],
                                                      is_rgb ? p[IMGPROC_RGB_IDX_B] : p[2] };
                (void)fwrite(out, 1u, sizeof(out), pnm);
                fprintf(hex, "%02X%02X%02X\n", p[2], p[1], p[0]);  /* TDATA[23:0], bajt 0 = [7:0] */
            }
            else
            {
                (void)fwrite(p, 1u, 1u, pnm);
                fprintf(hex, "%02X\n", p[0]);
            }
        }
    }
    (void)fclose(pnm);
    (void)fclose(hex);
    printf("Zapsáno %s.%s a %s.hex (%ux%u, %u kanál/y)\n", prefix, color ? "ppm" : "pgm", prefix, img->width,
           img->height, img->channels);
}

/**
 * @brief Najde index názvu v tabulce řetězců.
 * @param name  Hledaný název
 * @param count Počet položek
 * @param get   Funkce vracející název položky
 * @return Index, nebo ukončí program
 */
static uint32_t find_name(const char* name, uint32_t count, const char* (*get)(uint32_t index))
{
    uint32_t i = 0u;

    for (i = 0u; i < count; i++)
    {
        if (strcmp(name, get(i)) == 0)
        {
            return i;
        }
    }
    fail("neznámý název předvolby");
    return 0u;
}

/**
 * @brief Adaptér názvu předvolby CSC.
 * @param index Index předvolby
 * @return Název
 */
static const char* csc_name_at(uint32_t index)
{
    return imgproc_csc_name((imgproc_csc_preset_t)index);
}

/**
 * @brief Adaptér názvu předvolby jádra.
 * @param index Index předvolby
 * @return Název
 */
static const char* kernel_name_at(uint32_t index)
{
    return imgproc_kernel_name((imgproc_kernel_preset_t)index);
}

/**
 * @brief Adaptér názvu metody magnitudy.
 * @param index Index metody
 * @return Název
 */
static const char* magnitude_name_at(uint32_t index)
{
    static const char* const NAMES[] = { "l1", "linf", "ambm1", "ambm2", "l2" };
    return (index < (sizeof(NAMES) / sizeof(NAMES[0]))) ? NAMES[index] : "";
}

/**
 * @brief Přečte volitelný parametr okraje.
 * @param argc  Počet argumentů
 * @param argv  Argumenty
 * @param index Index parametru
 * @return Zvolený okraj (výchozí CONSTANT)
 */
static imgproc_border_t parse_border(int argc, char** argv, int index)
{
    imgproc_border_t border = IMGPROC_BORDER_CONSTANT;

    if ((argc > index) && (strcmp(argv[index], "replicate") == 0))
    {
        border = IMGPROC_BORDER_REPLICATE;
    }
    return border;
}

/**
 * @brief Vyžádá daný počet parametrů operace.
 * @param argc  Počet argumentů
 * @param count Počet potřebných parametrů operace
 */
static void require_params(int argc, int count)
{
    if (argc < (CLI_MIN_ARGS + count))
    {
        fail("chybí parametry operace (viz nápověda)");
    }
}

/**
 * @brief Provede bodovou operaci (CSC, HSV, prahování).
 * @param argc  Počet argumentů
 * @param argv  Argumenty
 * @param src   Vstupní obraz
 * @param dst   Výstupní obraz (popis se vyplní)
 * @return true = výstup je RGB v pořadí UG934
 */
static bool run_point_op(int argc, char** argv, const imgproc_image_t* src, imgproc_image_t* dst)
{
    const char* op = argv[CLI_ARG_OP];
    bool is_rgb = false;

    if (strcmp(op, "csc") == 0)
    {
        imgproc_csc_matrix_t m = { 0 };
        uint32_t preset = 0u;
        require_params(argc, 1);
        preset = find_name(argv[CLI_ARG_P1], (uint32_t)IMGPROC_CSC_PRESET_COUNT, csc_name_at);
        imgproc_csc_make((imgproc_csc_preset_t)preset, &m);
        imgproc_image_init(dst, g_dst_buf, src->width, src->height, m.ch_out);
        imgproc_csc(src, dst, &m);
        is_rgb = (m.ch_in == 1u);
    }
    else if (strcmp(op, "rgb2hsv") == 0)
    {
        imgproc_image_init(dst, g_dst_buf, src->width, src->height, (uint8_t)IMGPROC_CH_MAX);
        imgproc_rgb_to_hsv(src, dst);
    }
    else if (strcmp(op, "hsv2rgb") == 0)
    {
        imgproc_image_init(dst, g_dst_buf, src->width, src->height, (uint8_t)IMGPROC_CH_MAX);
        imgproc_hsv_to_rgb(src, dst);
        is_rgb = true;
    }
    else    /* thresh */
    {
        int type = 0;
        require_params(argc, 3);
        type = atoi(argv[CLI_ARG_P1]);
        imgproc_image_init(dst, g_dst_buf, src->width, src->height, 1u);
        imgproc_threshold(src, dst, (uint8_t)atoi(argv[CLI_ARG_P2]), (uint8_t)atoi(argv[CLI_ARG_P3]),
                          (imgproc_thresh_type_t)type);
    }
    return is_rgb;
}

/**
 * @brief Provede okénkovou operaci (filtr, gradient, medián) na šedotónovém obrazu.
 * @param argc  Počet argumentů
 * @param argv  Argumenty
 * @param src   Vstupní obraz (1 kanál)
 * @param dst   Výstupní obraz (popis se vyplní)
 */
static void run_window_op(int argc, char** argv, const imgproc_image_t* src, imgproc_image_t* dst)
{
    const char* op = argv[CLI_ARG_OP];
    imgproc_kernel_t kx = { 0 };
    imgproc_kernel_t ky = { 0 };

    imgproc_image_init(dst, g_dst_buf, src->width, src->height, 1u);
    if (strcmp(op, "filter") == 0)
    {
        require_params(argc, 1);
        const uint32_t preset = find_name(argv[CLI_ARG_P1], (uint32_t)IMGPROC_KERNEL_PRESET_COUNT, kernel_name_at);
        imgproc_kernel_make((imgproc_kernel_preset_t)preset, &kx);
        imgproc_filter2d(src, dst, &kx, parse_border(argc, argv, CLI_ARG_P2));
    }
    else if (strcmp(op, "gradient") == 0)
    {
        const bool prewitt = (argc > CLI_ARG_P1) && (strcmp(argv[CLI_ARG_P1], "prewitt") == 0);
        uint32_t method = 0u;
        require_params(argc, 2);
        method = find_name(argv[CLI_ARG_P2], CLI_MAGNITUDE_COUNT, magnitude_name_at);
        imgproc_kernel_make(prewitt ? IMGPROC_KERNEL_PREWITT_X : IMGPROC_KERNEL_SOBEL_X, &kx);
        imgproc_kernel_make(prewitt ? IMGPROC_KERNEL_PREWITT_Y : IMGPROC_KERNEL_SOBEL_Y, &ky);
        imgproc_gradient(src, dst, &kx, &ky, (imgproc_magnitude_t)method, parse_border(argc, argv, CLI_ARG_P3));
    }
    else    /* median */
    {
        imgproc_median3x3(src, dst, parse_border(argc, argv, CLI_ARG_P1));
    }
}

/**
 * @brief Spočítá histogram a zapíše ho jako text (256 řádků) a HEX (32bit hodnoty).
 * @param src       Vstupní obraz (1 kanál)
 * @param prefix    Výstupní prefix
 */
static void run_histogram(const imgproc_image_t* src, const char* prefix)
{
    uint32_t hist[IMGPROC_HIST_BINS] = { 0u };
    char path[CLI_PATH_MAX] = { 0 };
    FILE* f = NULL;
    uint32_t i = 0u;

    imgproc_histogram(src, hist);
    (void)snprintf(path, sizeof(path), "%s_hist.hex", prefix);
    f = pc_file_open(path, "w");
    if (f == NULL)
    {
        fail("nelze vytvořit výstup histogramu");
    }
    for (i = 0u; i < IMGPROC_HIST_BINS; i++)
    {
        fprintf(f, "%08X\n", hist[i]);
    }
    (void)fclose(f);
    printf("Zapsáno %s (Otsuův práh = %u)\n", path, imgproc_otsu_threshold(hist));
}

/**
 * @brief Vypíše nápovědu.
 * @param name Název programu
 */
static void print_usage(const char* name)
{
    printf("Použití: %s <operace> <vstup.ppm|pgm> <výstupní_prefix> [parametry]\n"
           "  tohex                                 vstup -> HEX (stimulus pro testbench)\n"
           "  csc <předvolba>                       rgb_to_gray_bt601, rgb_to_ycbcr_bt601_full, ..., gray_to_rgb\n"
           "  rgb2hsv | hsv2rgb\n"
           "  thresh <typ 0-4> <práh> <maxval>      BINARY, BINARY_INV, TRUNC, TOZERO, TOZERO_INV\n"
           "  filter <jádro> [constant|replicate]   identity, mean, sharpen, sobel_x, sobel_y, prewitt_x, prewitt_y\n"
           "  gradient <sobel|prewitt> <l1|linf|ambm1|ambm2|l2> [constant|replicate]\n"
           "  median [constant|replicate]\n"
           "  hist                                  histogram -> <prefix>_hist.hex + Otsuův práh\n", name);
}

/**
 * @brief Vstupní bod nástroje.
 * @param argc Počet argumentů
 * @param argv Argumenty
 * @return EXIT_SUCCESS / EXIT_FAILURE
 */
int main(int argc, char** argv)
{
    imgproc_image_t src = { 0 };
    imgproc_image_t dst = { 0 };
    const char* op = (argc > CLI_ARG_OP) ? argv[CLI_ARG_OP] : "";
    const bool point = (strcmp(op, "csc") == 0) || (strcmp(op, "rgb2hsv") == 0) || (strcmp(op, "hsv2rgb") == 0)
                       || (strcmp(op, "thresh") == 0);
    const bool window = (strcmp(op, "filter") == 0) || (strcmp(op, "gradient") == 0) || (strcmp(op, "median") == 0);

    if ((argc < CLI_MIN_ARGS) || ((!point) && (!window) && (strcmp(op, "tohex") != 0) && (strcmp(op, "hist") != 0)))
    {
        print_usage(argv[0]);
        return EXIT_FAILURE;
    }
    read_pnm(argv[CLI_ARG_IN], &src);
    if (point)
    {
        write_outputs(&dst, argv[CLI_ARG_OUT], run_point_op(argc, argv, &src, &dst));
    }
    else if (window)
    {
        run_window_op(argc, argv, &src, &dst);
        write_outputs(&dst, argv[CLI_ARG_OUT], false);
    }
    else if (strcmp(op, "hist") == 0)
    {
        run_histogram(&src, argv[CLI_ARG_OUT]);
    }
    else
    {
        write_outputs(&src, argv[CLI_ARG_OUT], true);
    }
    return EXIT_SUCCESS;
}
