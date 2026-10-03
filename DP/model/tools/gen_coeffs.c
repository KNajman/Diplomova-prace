/**
 * @file    gen_coeffs.c
 * @brief   Generátor konstant (matice CSC, jádra filtrů, tabulky HSV) pro HLS (.h) a VHDL (package)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Jediný zdroj koeficientů je lib_imgproc. Výstupy se NIKDY NEUPRAVUJÍ ručně.
 * Použití: gen_coeffs <výstupní_adresář>
 *          -> <dir>/imgproc_coeffs.h, <dir>/imgproc_coeffs_pkg.vhd
 */

#include <gen_coeffs.h>
#include <imgproc.h>
#include <pc_file.h>

#include <ctype.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define GEN_PATH_MAX        (1024u)     /* maximální délka cesty k výstupnímu souboru */
#define GEN_TABLE_PER_LINE  (8u)        /* počet položek tabulky na řádek */
#define GEN_TABLE_SIZE      (256u)      /* velikost tabulek HSV */
#define GEN_NAME_MAX        (64u)       /* maximální délka názvu předvolby */

/**
 * @brief Převede název na velká písmena (pro názvy konstant).
 * @param name Název v snake_case
 * @return Ukazatel na statický buffer (platí do dalšího volání)
 */
static const char* gen_upper(const char* name)
{
    static char buffer[GEN_NAME_MAX];
    uint32_t i = 0u;

    for (i = 0u; (i < (GEN_NAME_MAX - 1u)) && (name[i] != '\0'); i++)
    {
        buffer[i] = (char)toupper((unsigned char)name[i]);
    }
    buffer[i] = '\0';
    return buffer;
}

/**
 * @brief Otevře výstupní soubor v adresáři.
 * @param dir   Adresář
 * @param name  Název souboru
 * @return Otevřený soubor (při chybě ukončí program)
 */
static FILE* open_output(const char* dir, const char* name)
{
    char path[GEN_PATH_MAX] = { 0 };
    FILE* file = NULL;

    (void)snprintf(path, sizeof(path), "%s/%s", dir, name);
    file = pc_file_open(path, "w");    /* Windows: fopen_s, Linux: fopen (viz pc_file.c) */
    if (file == NULL)
    {
        fprintf(stderr, "Nelze vytvořit %s\n", path);
        exit(EXIT_FAILURE);
    }
    printf("Generuji %s\n", path);
    return file;
}

/**
 * @brief Zapíše matice CSC do C hlavičky.
 * @param f Výstupní soubor
 */
static void write_c_csc(FILE* f)
{
    imgproc_csc_matrix_t m = { 0 };
    uint32_t p = 0u;
    uint8_t o = 0u;

    fprintf(f, "/* Matice CSC v Q.%u, [výstup][vstup], vstupy v pořadí paměti (UG934) */\n",
            IMGPROC_CSC_FRAC_BITS);
    for (p = 0u; p < (uint32_t)IMGPROC_CSC_PRESET_COUNT; p++)
    {
        imgproc_csc_make((imgproc_csc_preset_t)p, &m);
        const char* name = imgproc_csc_name((imgproc_csc_preset_t)p);
        fprintf(f, "/* %s: %u -> %u kanálů */\n", name, m.ch_in, m.ch_out);
        fprintf(f, "static const int32_t IMGPROC_CSC_%s_COEFF[3][3] =\n{\n", gen_upper(name));
        for (o = 0u; o < IMGPROC_CH_MAX; o++)
        {
            fprintf(f, "    { %7d, %7d, %7d },\n", m.coeff[o][0], m.coeff[o][1], m.coeff[o][2]);
        }
        fprintf(f, "};\nstatic const int16_t IMGPROC_CSC_%s_OFFSET[3] = { %d, %d, %d };\n\n",
                gen_upper(name), m.offset[0], m.offset[1], m.offset[2]);
    }
}

/**
 * @brief Zapíše tabulku 256 položek ve formátu C nebo VHDL.
 * @param f         Výstupní soubor
 * @param getter    Funkce vracející položku tabulky
 */
static void write_table(FILE* f, int32_t (*getter)(uint8_t index))
{
    uint32_t i = 0u;

    for (i = 0u; i < GEN_TABLE_SIZE; i++)
    {
        const bool last = (i == (GEN_TABLE_SIZE - 1u));
        fprintf(f, "%s%7d%s", ((i % GEN_TABLE_PER_LINE) == 0u) ? "        " : " ", getter((uint8_t)i),
                last ? "" : ",");
        if (((i % GEN_TABLE_PER_LINE) == (GEN_TABLE_PER_LINE - 1u)) || last)
        {
            fprintf(f, "\n");
        }
    }
}

/**
 * @brief Vygeneruje C hlavičku imgproc_coeffs.h.
 * @param dir Výstupní adresář
 */
static void write_c_header(const char* dir)
{
    FILE* f = open_output(dir, "imgproc_coeffs.h");
    imgproc_kernel_t k = { 0 };
    uint32_t p = 0u;
    uint8_t r = 0u;

    fprintf(f, "/**\n * @file    imgproc_coeffs.h\n * @brief   VYGENEROVÁNO nástrojem gen_coeffs z lib_imgproc "
               "- NEUPRAVOVAT RUČNĚ\n */\n\n#ifndef IMGPROC_COEFFS_H_\n#define IMGPROC_COEFFS_H_\n\n"
               "#include <stdint.h>\n\n");
    write_c_csc(f);
    fprintf(f, "/* Jádra 3x3: koeficienty + scale v Q.%u */\n", IMGPROC_SCALE_FRAC_BITS);
    for (p = 0u; p < (uint32_t)IMGPROC_KERNEL_PRESET_COUNT; p++)
    {
        const char* name = imgproc_kernel_name((imgproc_kernel_preset_t)p);
        imgproc_kernel_make((imgproc_kernel_preset_t)p, &k);
        fprintf(f, "static const int8_t IMGPROC_KERNEL_%s[3][3] = {", gen_upper(name));
        for (r = 0u; r < 3u; r++)
        {
            fprintf(f, " { %2d, %2d, %2d }%s", k.coeff[r][0], k.coeff[r][1], k.coeff[r][2], (r < 2u) ? "," : "");
        }
        fprintf(f, " };\n#define IMGPROC_KERNEL_%s_SCALE (%d)\n", gen_upper(name), k.scale_q14);
    }
    fprintf(f, "\n/* Tabulky RGB->HSV (OpenCV, shift %u) */\nstatic const int32_t IMGPROC_HSV_SDIV[256] =\n{\n",
            IMGPROC_HSV_SHIFT);
    write_table(f, imgproc_hsv_sdiv);
    fprintf(f, "};\nstatic const int32_t IMGPROC_HSV_HDIV180[256] =\n{\n");
    write_table(f, imgproc_hsv_hdiv180);
    fprintf(f, "};\n\n#endif /* IMGPROC_COEFFS_H_ */\n");
    (void)fclose(f);
}

/**
 * @brief Vygeneruje VHDL package imgproc_coeffs_pkg.vhd.
 * @param dir Výstupní adresář
 */
static void write_vhdl_package(const char* dir)
{
    FILE* f = open_output(dir, "imgproc_coeffs_pkg.vhd");
    imgproc_csc_matrix_t m = { 0 };
    uint32_t p = 0u;
    uint8_t o = 0u;

    fprintf(f, "-- VYGENEROVÁNO nástrojem gen_coeffs z lib_imgproc - NEUPRAVOVAT RUČNĚ\n"
               "library ieee;\nuse ieee.std_logic_1164.all;\n\npackage imgproc_coeffs_pkg is\n\n"
               "    constant C_CSC_FRAC_BITS : natural := %u;\n    constant C_HSV_SHIFT     : natural := %u;\n\n"
               "    type t_csc_coeff  is array (0 to 2, 0 to 2) of integer;\n"
               "    type t_csc_offset is array (0 to 2) of integer;\n"
               "    type t_int_table  is array (0 to 255) of integer;\n\n",
            IMGPROC_CSC_FRAC_BITS, IMGPROC_HSV_SHIFT);
    for (p = 0u; p < (uint32_t)IMGPROC_CSC_PRESET_COUNT; p++)
    {
        const char* name = imgproc_csc_name((imgproc_csc_preset_t)p);
        imgproc_csc_make((imgproc_csc_preset_t)p, &m);
        fprintf(f, "    -- %s\n    constant C_CSC_%s_COEFF : t_csc_coeff := (\n", name, gen_upper(name));
        for (o = 0u; o < IMGPROC_CH_MAX; o++)
        {
            fprintf(f, "        (%7d, %7d, %7d)%s\n", m.coeff[o][0], m.coeff[o][1], m.coeff[o][2],
                    (o < 2u) ? "," : ");");
        }
        fprintf(f, "    constant C_CSC_%s_OFFSET : t_csc_offset := (%d, %d, %d);\n\n",
                gen_upper(name), m.offset[0], m.offset[1], m.offset[2]);
    }
    fprintf(f, "    -- sdiv[i] = round((255 << 12) / i)\n    constant C_HSV_SDIV : t_int_table := (\n");
    write_table(f, imgproc_hsv_sdiv);
    fprintf(f, "    );\n\n    -- hdiv180[i] = round((180 << 12) / (6 * i))\n");
    fprintf(f, "    constant C_HSV_HDIV180 : t_int_table := (\n");
    write_table(f, imgproc_hsv_hdiv180);
    fprintf(f, "    );\n\nend package imgproc_coeffs_pkg;\n");
    (void)fclose(f);
}

/**
 * @brief Vstupní bod generátoru.
 * @param argc Počet argumentů
 * @param argv argv[1] = výstupní adresář
 * @return EXIT_SUCCESS / EXIT_FAILURE
 */
int main(int argc, char** argv)
{
    int result = EXIT_SUCCESS;

    if (argc != 2)
    {
        fprintf(stderr, "Použití: %s <výstupní_adresář>\n", argv[0]);
        result = EXIT_FAILURE;
    }
    else
    {
        write_c_header(argv[1]);
        write_vhdl_package(argv[1]);
    }
    return result;
}
