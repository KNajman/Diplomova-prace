/**
 * @file    tb_median.cpp
 * @brief   Testbench HLS jádra mediánu 3x3 proti golden modelu (imgproc_median3x3)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Testuje zároveň společnou šablonu hlsv::window_frame (okraje, flush, resynchronizace):
 *  1. 64x48, replikace, dva snímky za sebou; nulový okraj,
 *  2. malé a liché rozměry včetně výšky 1 a 2 (horní a dolní okraj se překrývají), oba okraje,
 *  3. 7 pixelů bez TUSER před snímkem -> zahozeny, status SKIPPED, výstup správný,
 *  4. TLAST v řádku 5 o 3 pixely dřív -> status EARLY_EOL | LATE_EOL, geometrie z čítačů, výstup správný.
 */

#include "hls_median.hpp"
#include "../common/tb_video.hpp"

#include <cstdio>

namespace
{

/// Porucha vstupního streamu pro testy resynchronizace
struct Fault
{
    uint32_t garbage_before;    ///< počet pixelů bez TUSER před snímkem
    int32_t early_last_row;     ///< řádek s TLAST o 3 px dřív (-1 = žádný)
};

/**
 * @brief Zapíše snímek do streamu s volitelnou poruchou.
 * @param image Snímek
 * @param fault Porucha
 * @param in    Stream
 */
void push_faulty(const tbv::Image& image, const Fault& fault, hlsv::stream_gray_t& in)
{
    for (uint32_t i = 0u; i < fault.garbage_before; i++)
    {
        hlsv::axis_gray_t pkt;
        pkt.data = 0xA5;
        pkt.keep = -1;
        pkt.strb = -1;
        pkt.user = 0;
        pkt.last = (i == (fault.garbage_before - 1u)) ? 1 : 0;
        in.write(pkt);
    }
    const uint32_t w = image.img.width;
    for (uint32_t y = 0u; y < image.img.height; y++)
    {
        for (uint32_t x = 0u; x < w; x++)
        {
            hlsv::axis_gray_t pkt;
            pkt.data = *imgproc_image_pixel(&image.img, x, y);
            pkt.keep = -1;
            pkt.strb = -1;
            pkt.user = ((x == 0u) && (y == 0u)) ? 1 : 0;
            const uint32_t eol = (static_cast<int32_t>(y) == fault.early_last_row) ? (w - 4u) : (w - 1u);
            pkt.last = (x == eol) ? 1 : 0;
            in.write(pkt);
        }
    }
}

/**
 * @brief Jeden test: snímek přes jádro, porovnání s golden modelem a kontrola statusu.
 * @param width      Šířka
 * @param height     Výška
 * @param border     Okraj (golden model)
 * @param seed       Semínko vzoru
 * @param fault      Porucha vstupu
 * @param exp_status Očekávaný status
 * @param name       Název testu
 * @return Počet chyb
 */
uint32_t run_test(uint32_t width, uint32_t height, imgproc_border_t border, uint32_t seed, const Fault& fault,
                  unsigned exp_status, const char* name)
{
    tbv::Image src(width, height, 1u);
    tbv::Image expected(width, height, 1u);
    tbv::fill_pattern(src, seed);
    imgproc_median3x3(&src.img, &expected.img, border);

    hlsv::stream_gray_t in;
    hlsv::stream_gray_t out;
    push_faulty(src, fault, in);
    hlsv::win_status_t status = 0;
    hls_median(in, out, width, height, (border == IMGPROC_BORDER_REPLICATE) ? 1 : 0, status);

    char label[64];
    std::snprintf(label, sizeof(label), "%s %ux%u %s", name, width, height,
                  (border == IMGPROC_BORDER_REPLICATE) ? "repl" : "nuly");
    uint32_t errors = tbv::check_frame<1>(out, expected, label);
    if (status != exp_status)
    {
        std::printf("FAIL    status %u, očekáváno %u\n", static_cast<unsigned>(status), exp_status);
        errors++;
    }
    if (!in.empty())
    {
        std::printf("FAIL    jádro nepřečetlo celý vstup\n");
        errors++;
    }
    return errors;
}

} // namespace

int main()
{
    const Fault none = { 0u, -1 };
    uint32_t errors = 0u;

    errors += run_test(64u, 48u, IMGPROC_BORDER_REPLICATE, 1u, none, 0u, "snímek 1");
    errors += run_test(64u, 48u, IMGPROC_BORDER_REPLICATE, 2u, none, 0u, "snímek 2");
    errors += run_test(64u, 48u, IMGPROC_BORDER_CONSTANT, 3u, none, 0u, "snímek 3");

    static const uint32_t SIZES[][2] = { { 8u, 1u }, { 8u, 2u }, { 9u, 3u }, { 17u, 5u }, { 33u, 4u } };
    for (const auto& s : SIZES)
    {
        errors += run_test(s[0], s[1], IMGPROC_BORDER_REPLICATE, s[0] + s[1], none, 0u, "rozměr");
        errors += run_test(s[0], s[1], IMGPROC_BORDER_CONSTANT, s[0] * s[1], none, 0u, "rozměr");
    }

    const Fault garbage = { 7u, -1 };
    errors += run_test(32u, 16u, IMGPROC_BORDER_REPLICATE, 5u, garbage, hlsv::WIN_STATUS_SKIPPED, "resync");
    const Fault bad_eol = { 0u, 5 };
    errors += run_test(32u, 16u, IMGPROC_BORDER_REPLICATE, 6u, bad_eol,
                       hlsv::WIN_STATUS_EARLY_EOL | hlsv::WIN_STATUS_LATE_EOL, "TLAST mimo");

    std::printf("\nVYSLEDEK: %s (%u chyb)\n", (errors == 0u) ? "PASS" : "FAIL", errors);
    return (errors == 0u) ? 0 : 1;
}
