/**
 * @file    csc.c
 * @brief   Lineární převod barevných prostorů (color space conversion) maticí 3x3 v Q2.15
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */

#include <imgproc/csc.h>
#include <imgproc/image.h>

#include <math.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define CSC_ONE         ((int32_t)1 << IMGPROC_CSC_FRAC_BITS)  /* 1.0 v Q2.15 */
#define CSC_FULL_RANGE      (255.0)     /* plný rozsah 8bitové složky */
#define CSC_STUDIO_Y_RANGE  (219.0)     /* rozsah Y ve studio rozsahu (16..235) */
#define CSC_STUDIO_C_RANGE  (224.0)     /* rozsah Cb/Cr ve studio rozsahu (16..240) */
#define CSC_STUDIO_Y_OFFSET (16)        /* černá úroveň Y ve studio rozsahu */
#define CSC_CHROMA_OFFSET   (128)       /* nulová úroveň Cb/Cr */

#define CSC_BT601_KR        (0.299)     /* ITU-R BT.601 */
#define CSC_BT601_KB        (0.114)
#define CSC_BT709_KR        (0.2126)    /* ITU-R BT.709 */
#define CSC_BT709_KB        (0.0722)

/* Logické pořadí složek v definičních vzorcích (R, G, B) */
#define CSC_LOG_R           (0u)
#define CSC_LOG_G           (1u)
#define CSC_LOG_B           (2u)

/* Definice standardu pro výpočet matice */
typedef struct
{
    double kr;          /* váha červené v jasu */
    double kb;          /* váha modré v jasu */
    bool studio;        /* true = studio rozsah, false = plný rozsah */
} csc_standard_t;

/* Matice v plovoucí čárce, sloupce v logickém pořadí R, G, B */
typedef struct
{
    double coeff[IMGPROC_CH_MAX][IMGPROC_CH_MAX];
    int16_t offset[IMGPROC_CH_MAX];
} csc_float_matrix_t;

static const char* const CSC_NAMES[IMGPROC_CSC_PRESET_COUNT] =
{
    "rgb_to_gray_bt601",
    "rgb_to_ycbcr_bt601_full",
    "rgb_to_ycbcr_bt709_full",
    "rgb_to_ycbcr_bt601_studio",
    "rgb_to_ycbcr_bt709_studio",
    "gray_to_rgb",
};

/* Převod logického indexu (R, G, B) na index v paměti (UG934: G, B, R) */
static const uint8_t CSC_LOG_TO_MEM[IMGPROC_CH_MAX] = { IMGPROC_RGB_IDX_R, IMGPROC_RGB_IDX_G, IMGPROC_RGB_IDX_B };

/**
 * @brief Sestaví matici RGB -> YCbCr v plovoucí čárce.
 * @param std   Definice standardu
 * @param fm    Výstupní matice (řádky Y, Cb, Cr; sloupce R, G, B)
 */
static void build_ycbcr(const csc_standard_t* std, csc_float_matrix_t* fm)
{
    /*
     * Definiční vztahy (R, G, B v rozsahu 0..255):
     *   Y  = Kr*R + Kg*G + Kb*B,                 Kg = 1 - Kr - Kb
     *   Cb = 128 + 0.5 * (B - Y) / (1 - Kb)      (rozsah +-127.5 kolem 128)
     *   Cr = 128 + 0.5 * (R - Y) / (1 - Kr)
     * Studio rozsah zúží Y na 219 kroků (16..235) a Cb/Cr na 224 kroků (16..240), proto se
     * řádky násobí 219/255, resp. 224/255 a Y dostane offset 16.
     */
    const double kg = 1.0 - std->kr - std->kb;
    const double y_gain = std->studio ? (CSC_STUDIO_Y_RANGE / CSC_FULL_RANGE) : 1.0;
    const double c_gain = std->studio ? (CSC_STUDIO_C_RANGE / CSC_FULL_RANGE) : 1.0;
    const double cb_scale = (0.5 / (1.0 - std->kb)) * c_gain;
    const double cr_scale = (0.5 / (1.0 - std->kr)) * c_gain;
    const double y_row[IMGPROC_CH_MAX] = { std->kr, kg, std->kb };
    uint8_t i = 0u;

    for (i = 0u; i < IMGPROC_CH_MAX; i++)
    {
        const double blue = (i == CSC_LOG_B) ? 1.0 : 0.0;
        const double red = (i == CSC_LOG_R) ? 1.0 : 0.0;
        fm->coeff[IMGPROC_YUV_IDX_Y][i] = y_row[i] * y_gain;
        fm->coeff[IMGPROC_YUV_IDX_CB][i] = (blue - y_row[i]) * cb_scale;
        fm->coeff[IMGPROC_YUV_IDX_CR][i] = (red - y_row[i]) * cr_scale;
    }
    fm->offset[IMGPROC_YUV_IDX_Y] = std->studio ? CSC_STUDIO_Y_OFFSET : 0;
    fm->offset[IMGPROC_YUV_IDX_CB] = CSC_CHROMA_OFFSET;
    fm->offset[IMGPROC_YUV_IDX_CR] = CSC_CHROMA_OFFSET;
}

/**
 * @brief Najde koeficient pro korekci součtu řádku (metoda největšího zbytku).
 * @param err   Chyby zaokrouhlení q - x jednotlivých koeficientů
 * @param down  true = hledá se nejvíc zaokrouhlený nahoru (pro snížení o 1 LSB)
 * @return Logický index koeficientu
 */
static uint8_t pick_correction(const double* err, bool down)
{
    uint8_t pick = 0u;
    uint8_t i = 0u;

    for (i = 1u; i < IMGPROC_CH_MAX; i++)
    {
        if ((down && (err[i] > err[pick])) || ((!down) && (err[i] < err[pick])))
        {
            pick = i;
        }
    }
    return pick;
}

/**
 * @brief Kvantuje jeden řádek matice do Q2.15 a dorovná součet řádku.
 *
 * Každý koeficient se zaokrouhlí zvlášť, takže součet řádku se může od přesné hodnoty
 * lišit o +-1 LSB (bílá by pak dala 254 nebo 256). Rozdíl se odečte/přičte u koeficientu
 * s největší chybou zaokrouhlení v daném směru (metoda největšího zbytku), čímž se
 * minimalizuje maximální chyba kvantizace. Stejné pravidlo používá OpenCV (B2YF = 1 - R - G).
 *
 * @param row_float Řádek v plovoucí čárce (logické pořadí R, G, B)
 * @param row_fixed   Výstupní řádek v Q2.15 (pořadí v paměti G, B, R)
 */
static void quantize_row(const double* row_float, int32_t* row_fixed)
{
    double err[IMGPROC_CH_MAX] = { 0.0 };
    int32_t q[IMGPROC_CH_MAX] = { 0 };
    double sum_float = 0.0;
    int32_t diff = 0;
    uint8_t i = 0u;

    for (i = 0u; i < IMGPROC_CH_MAX; i++)
    {
        const double scaled = row_float[i] * (double)CSC_ONE;
        q[i] = (int32_t)lround(scaled);
        err[i] = (double)q[i] - scaled;
        sum_float += scaled;
        diff -= q[i];
    }
    diff += (int32_t)lround(sum_float);

    while (diff != 0)
    {
        const bool down = (diff < 0);
        const uint8_t pick = pick_correction(err, down);
        q[pick] += down ? -1 : 1;
        err[pick] += down ? -1.0 : 1.0;
        diff += down ? 1 : -1;
    }

    for (i = 0u; i < IMGPROC_CH_MAX; i++)
    {
        IMGPROC_ASSERT((q[i] >= IMGPROC_CSC_COEFF_MIN) && (q[i] <= IMGPROC_CSC_COEFF_MAX));
        row_fixed[CSC_LOG_TO_MEM[i]] = q[i];
    }
}

/**
 * @brief Vyplní matici pro předvolbu RGB -> YCbCr / šedá.
 * @param std       Definice standardu
 * @param ch_out    Počet výstupních kanálů (1 = jen Y, 3 = YCbCr)
 * @param matrix    Výstupní matice
 */
static void make_from_standard(const csc_standard_t* std, uint8_t ch_out, imgproc_csc_matrix_t* matrix)
{
    csc_float_matrix_t fm = { 0 };
    uint8_t o = 0u;

    build_ycbcr(std, &fm);
    matrix->ch_in = (uint8_t)IMGPROC_CH_MAX;
    matrix->ch_out = ch_out;
    for (o = 0u; o < ch_out; o++)
    {
        quantize_row(fm.coeff[o], matrix->coeff[o]);
        matrix->offset[o] = fm.offset[o];
    }
}

/**
 * @brief Vypočítá matici předvolby z definičních konstant standardu a kvantuje ji do Q2.15.
 *
 * Koeficienty se nikde neopisují ručně - jediným zdrojem pravdy jsou Kr a Kb z norem
 * ITU-R BT.601 a BT.709. Stejnou funkci volá generátor hlaviček pro HLS a VHDL.
 *
 * @param preset    Požadovaná předvolba
 * @param matrix    Výstupní matice (vynulovaná a vyplněná)
 */
void imgproc_csc_make(imgproc_csc_preset_t preset, imgproc_csc_matrix_t* matrix)
{
    static const csc_standard_t BT601_FULL = { CSC_BT601_KR, CSC_BT601_KB, false };
    static const csc_standard_t BT709_FULL = { CSC_BT709_KR, CSC_BT709_KB, false };
    static const csc_standard_t BT601_STUDIO = { CSC_BT601_KR, CSC_BT601_KB, true };
    static const csc_standard_t BT709_STUDIO = { CSC_BT709_KR, CSC_BT709_KB, true };
    static const imgproc_csc_matrix_t ZERO = { 0 };
    uint8_t o = 0u;

    IMGPROC_ASSERT(matrix != NULL);
    *matrix = ZERO;
    switch (preset)
    {
        case IMGPROC_CSC_RGB_TO_GRAY_BT601:
            make_from_standard(&BT601_FULL, 1u, matrix);
            break;
        case IMGPROC_CSC_RGB_TO_YCBCR_BT601_FULL:
            make_from_standard(&BT601_FULL, (uint8_t)IMGPROC_CH_MAX, matrix);
            break;
        case IMGPROC_CSC_RGB_TO_YCBCR_BT709_FULL:
            make_from_standard(&BT709_FULL, (uint8_t)IMGPROC_CH_MAX, matrix);
            break;
        case IMGPROC_CSC_RGB_TO_YCBCR_BT601_STUDIO:
            make_from_standard(&BT601_STUDIO, (uint8_t)IMGPROC_CH_MAX, matrix);
            break;
        case IMGPROC_CSC_RGB_TO_YCBCR_BT709_STUDIO:
            make_from_standard(&BT709_STUDIO, (uint8_t)IMGPROC_CH_MAX, matrix);
            break;
        case IMGPROC_CSC_GRAY_TO_RGB:
            matrix->ch_in = 1u;
            matrix->ch_out = (uint8_t)IMGPROC_CH_MAX;
            for (o = 0u; o < IMGPROC_CH_MAX; o++)
            {
                matrix->coeff[o][0] = CSC_ONE;
            }
            break;
        default:
            IMGPROC_ASSERT(false);
            break;
    }
}

/**
 * @brief Vrátí textový název předvolby.
 * @param preset Předvolba
 * @return Název (snake_case), nebo "unknown"
 */
const char* imgproc_csc_name(imgproc_csc_preset_t preset)
{
    const char* name = "unknown";

    if ((uint32_t)preset < (uint32_t)IMGPROC_CSC_PRESET_COUNT)
    {
        name = CSC_NAMES[preset];
    }
    return name;
}

/**
 * @brief Převede jeden pixel.
 * @param matrix    Matice převodu
 * @param in        Vstupní složky (matrix->ch_in bajtů)
 * @param out       Výstupní složky (matrix->ch_out bajtů)
 */
void imgproc_csc_pixel(const imgproc_csc_matrix_t* matrix, const uint8_t* in, uint8_t* out)
{
    uint8_t o = 0u;
    uint8_t i = 0u;

    /*
     * Poznámka: offset se přičítá v akumulátoru (posunutý o 15 bitů) PŘED zaokrouhlením.
     * Výsledek je tak zaokrouhlen jen jednou. Kdyby se offset přičetl až po posunu (jako
     * v původním HLS jádře), byl by výsledek stejný jen díky celočíselnému offsetu - takto je
     * výpočet obecně správný i pro neceločíselný offset a HW má jednu sčítačku navíc v DSP (PCIN).
     * Akumulátor je int64 kvůli bezpečnosti v C; v HW stačí 18 + 8 + 2 = 28 bitů (48bitový DSP).
     */
    for (o = 0u; o < matrix->ch_out; o++)
    {
        int64_t acc = ((int64_t)matrix->offset[o]) * (int64_t)CSC_ONE;
        for (i = 0u; i < matrix->ch_in; i++)
        {
            acc += ((int64_t)matrix->coeff[o][i]) * (int64_t)in[i];
        }
        out[o] = imgproc_saturate_u8(imgproc_round_shift(acc, (uint8_t)IMGPROC_CSC_FRAC_BITS));
    }
}

/**
 * @brief Převede celý obraz.
 * @param src       Vstupní obraz (channels == matrix->ch_in)
 * @param dst       Výstupní obraz (channels == matrix->ch_out, stejné rozměry)
 * @param matrix    Matice převodu
 */
void imgproc_csc(const imgproc_image_t* src, const imgproc_image_t* dst, const imgproc_csc_matrix_t* matrix)
{
    uint32_t x = 0u;
    uint32_t y = 0u;

    IMGPROC_ASSERT(matrix != NULL);
    imgproc_image_check(src, matrix->ch_in);
    imgproc_image_check(dst, matrix->ch_out);
    IMGPROC_ASSERT((src->width == dst->width) && (src->height == dst->height));

    for (y = 0u; y < src->height; y++)
    {
        for (x = 0u; x < src->width; x++)
        {
            imgproc_csc_pixel(matrix, imgproc_image_pixel(src, x, y), imgproc_image_pixel(dst, x, y));
        }
    }
}
