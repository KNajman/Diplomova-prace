/**
 * @file    tb_csc.cpp
 * @brief   Testbench HLS jádra převodu barev proti golden modelu (všechny předvolby, 3 varianty jádra)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Testuje všechny tři top funkce bez ohledu na to, která je syn.top - C-sim tak ověří celý
 * zdroj najednou. Při co-simulaci se ověřuje jen syntetizovaná top funkce (viz TB_COSIM_TOP).
 */

#include "hls_csc.hpp"
#include "../common/tb_video.hpp"

#include <cstdio>

namespace
{

constexpr uint32_t TB_WIDTH = 64u;      ///< Malé rozlišení = rychlá C-sim i cosim
constexpr uint32_t TB_HEIGHT = 48u;
constexpr uint32_t TB_FRAMES = 2u;      ///< Dva snímky za sebou ověří, že jádro nedrží stav

/**
 * @brief Spustí jádro hls_csc_rgb nad jedním snímkem.
 * @param m     Matice golden modelu (3 -> 3)
 * @param src   Vstupní obraz
 * @param out   Výstupní stream
 */
void run_rgb(const imgproc_csc_matrix_t& m, const tbv::Image& src, hlsv::stream_rgb_t& out)
{
    hlsv::stream_rgb_t in;
    tbv::push_frame<hlsv::RGB_CHANNELS>(src, in);
    while (!in.empty())
    {
        hls_csc_rgb(in, out, m.coeff[0][0], m.coeff[0][1], m.coeff[0][2], m.coeff[1][0], m.coeff[1][1],
                    m.coeff[1][2], m.coeff[2][0], m.coeff[2][1], m.coeff[2][2], m.offset[0], m.offset[1],
                    m.offset[2]);
    }
}

/**
 * @brief Otestuje jednu předvolbu proti golden modelu.
 * @param preset    Předvolba převodu
 * @param seed      Semínko testovacího obrazu
 * @return Počet chyb
 */
uint32_t test_preset(imgproc_csc_preset_t preset, uint32_t seed)
{
    imgproc_csc_matrix_t m = {};
    imgproc_csc_make(preset, &m);
    tbv::Image src(TB_WIDTH, TB_HEIGHT, m.ch_in);
    tbv::Image expected(TB_WIDTH, TB_HEIGHT, m.ch_out);
    tbv::fill_pattern(src, seed);
    imgproc_csc(&src.img, &expected.img, &m);

    uint32_t errors = 0u;
    if ((m.ch_in == 3u) && (m.ch_out == 3u))
    {
        hlsv::stream_rgb_t out;
        run_rgb(m, src, out);
        errors = tbv::check_frame<hlsv::RGB_CHANNELS>(out, expected, imgproc_csc_name(preset));
    }
    else if (m.ch_out == 1u)
    {
        hlsv::stream_rgb_t in;
        hlsv::stream_gray_t out;
        tbv::push_frame<hlsv::RGB_CHANNELS>(src, in);
        while (!in.empty())
        {
            hls_csc_rgb_to_gray(in, out, m.coeff[0][0], m.coeff[0][1], m.coeff[0][2], m.offset[0]);
        }
        errors = tbv::check_frame<1>(out, expected, imgproc_csc_name(preset));
    }
    else
    {
        hlsv::stream_gray_t in;
        hlsv::stream_rgb_t out;
        tbv::push_frame<1>(src, in);
        while (!in.empty())
        {
            hls_csc_gray_to_rgb(in, out, m.coeff[0][0], m.coeff[1][0], m.coeff[2][0], m.offset[0], m.offset[1],
                                m.offset[2]);
        }
        errors = tbv::check_frame<hlsv::RGB_CHANNELS>(out, expected, imgproc_csc_name(preset));
    }
    return errors;
}

} // namespace

int main()
{
    uint32_t errors = 0u;

    for (uint32_t frame = 0u; frame < TB_FRAMES; frame++)
    {
        for (int p = 0; p < static_cast<int>(IMGPROC_CSC_PRESET_COUNT); p++)
        {
            errors += test_preset(static_cast<imgproc_csc_preset_t>(p), (frame * 7919u) + static_cast<uint32_t>(p));
        }
    }
    std::printf("\nVYSLEDEK: %s (%u chyb)\n", (errors == 0u) ? "PASS" : "FAIL", errors);
    return (errors == 0u) ? 0 : 1;
}
