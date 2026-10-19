/**
 * @file    tb_threshold.cpp
 * @brief   Testbench HLS jádra prahování proti golden modelu (všechny typy, hraniční prahy, 2 maxval)
 * @author  Bc. Karel Najman
 * @date    2026-10-19
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Stejné kombinace jako VHDL tb_threshold: 5 typů x prahy {0, 1, 127, 254, 255} x maxval {255, 77}
 * na testovacím vzoru (obsahuje všechny hraniční hodnoty), plus neplatné typy 5..7 (výstup 0).
 * Každá kombinace 2 snímky za sebou (jádro nesmí držet stav).
 */

#include "hls_threshold.hpp"
#include "../common/tb_video.hpp"

#include <cstdio>
#include <cstring>

namespace
{

constexpr uint32_t TB_WIDTH = 64u;
constexpr uint32_t TB_HEIGHT = 48u;
constexpr uint32_t TB_FRAMES = 2u;
constexpr uint32_t TB_TYPES = 8u;       ///< 0..4 platné, 5..7 neplatné
const uint8_t TB_THRESHOLDS[] = { 0u, 1u, 127u, 254u, 255u };
const uint8_t TB_MAXVALS[] = { 255u, 77u };

uint32_t test_combination(uint32_t type, uint8_t thresh, uint8_t maxval, uint32_t seed)
{
    tbv::Image src(TB_WIDTH, TB_HEIGHT, 1u);
    tbv::Image expected(TB_WIDTH, TB_HEIGHT, 1u);
    tbv::fill_pattern(src, seed);
    if (type <= static_cast<uint32_t>(IMGPROC_THRESH_TOZERO_INV))
    {
        imgproc_threshold(&src.img, &expected.img, thresh, maxval, static_cast<imgproc_thresh_type_t>(type));
    }
    else
    {
        std::memset(expected.buf.data(), 0, expected.buf.size());     // neplatný typ -> 0
    }

    hlsv::stream_gray_t in;
    hlsv::stream_gray_t out;
    tbv::push_frame<1>(src, in);
    while (!in.empty())
    {
        hls_threshold(in, out, thresh, maxval, type);
    }
    char name[64];
    std::snprintf(name, sizeof(name), "threshold typ %u prah %u maxval %u", type, thresh, maxval);
    return tbv::check_frame<1>(out, expected, name);
}

} // namespace

int main()
{
    uint32_t errors = 0u;
    uint32_t combinations = 0u;

    for (uint32_t frame = 0u; frame < TB_FRAMES; frame++)
    {
        for (uint32_t type = 0u; type < TB_TYPES; type++)
        {
            for (const uint8_t thresh : TB_THRESHOLDS)
            {
                for (const uint8_t maxval : TB_MAXVALS)
                {
                    errors += test_combination(type, thresh, maxval, (frame * 7919u) + combinations);
                    combinations++;
                }
            }
        }
    }
    std::printf("\nVYSLEDEK: %s (%u kombinaci, %u chyb)\n", (errors == 0u) ? "PASS" : "FAIL", combinations, errors);
    return (errors == 0u) ? 0 : 1;
}
