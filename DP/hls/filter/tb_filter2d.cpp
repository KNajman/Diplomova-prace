/**
 * @file    tb_filter2d.cpp
 * @brief   Testbench HLS jader 2D konvoluce proti golden modelu (imgproc_filter2d)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Testy (všechny tři top funkce v C-sim, v cosim se ověřuje syntetizovaná):
 *  1. 3x3: předvolby identity, mean, sharpen, sobel_x, sobel_y x oba okraje, 64x48 + 9x3 + 8x1,
 *  2. 5x5 a 7x7: pseudonáhodná jádra (int8 -8..8, scale, delta) x oba okraje, 64x48 + 9x3 + 8x1
 *     (výška menší než jádro -> horní a dolní okraj se překrývají).
 * Jádra se berou z golden modelu (imgproc_kernel_make), nikde se neopisují.
 */

#include "hls_filter2d.hpp"
#include "../common/tb_video.hpp"

#include <cstdio>

namespace
{

struct TestSize
{
    uint32_t width;
    uint32_t height;
};
const TestSize SIZES[] = { { 64u, 48u }, { 9u, 3u }, { 8u, 1u } };

/**
 * @brief Pseudonáhodné jádro K x K (deterministické podle seed).
 */
void make_random_kernel(uint8_t size, uint32_t seed, imgproc_kernel_t& kernel)
{
    uint32_t state = seed;
    kernel = {};
    kernel.size = size;
    for (uint8_t row = 0u; row < size; row++)
    {
        for (uint8_t col = 0u; col < size; col++)
        {
            state = (state * 1103515245u) + 12345u;
            kernel.coeff[row][col] = static_cast<int8_t>(static_cast<int32_t>((state >> 16u) % 17u) - 8);
        }
    }
    kernel.scale_q14 = 1500 + (700 * size);
    kernel.delta = static_cast<int16_t>(40 - (10 * size));
}

/**
 * @brief Jeden test: snímek přes zvolenou top funkci, porovnání s golden modelem.
 */
uint32_t run_test(const imgproc_kernel_t& kernel, const TestSize& size, imgproc_border_t border, const char* name)
{
    tbv::Image src(size.width, size.height, 1u);
    tbv::Image expected(size.width, size.height, 1u);
    tbv::fill_pattern(src, size.width * 31u + size.height);
    imgproc_filter2d(&src.img, &expected.img, &kernel, border);

    hlsv::stream_gray_t in;
    hlsv::stream_gray_t out;
    tbv::push_frame<1>(src, in);
    hlsv::win_status_t status = 0;
    const ap_uint<1> replicate = (border == IMGPROC_BORDER_REPLICATE) ? 1 : 0;
    if (kernel.size == 3u)
    {
        hls_filter2d_3x3(in, out, size.width, size.height, replicate, kernel.scale_q14, kernel.delta,
                         kernel.coeff[0][0], kernel.coeff[0][1], kernel.coeff[0][2], kernel.coeff[1][0],
                         kernel.coeff[1][1], kernel.coeff[1][2], kernel.coeff[2][0], kernel.coeff[2][1],
                         kernel.coeff[2][2], status);
    }
    else
    {
        hlsf::coeff_t coeff[49];
        for (uint32_t tap = 0u; tap < static_cast<uint32_t>(kernel.size * kernel.size); tap++)
        {
            coeff[tap] = kernel.coeff[tap / kernel.size][tap % kernel.size];
        }
        if (kernel.size == 5u)
        {
            hls_filter2d_5x5(in, out, size.width, size.height, replicate, kernel.scale_q14, kernel.delta, coeff, status);
        }
        else
        {
            hls_filter2d_7x7(in, out, size.width, size.height, replicate, kernel.scale_q14, kernel.delta, coeff, status);
        }
    }

    char label[80];
    std::snprintf(label, sizeof(label), "%s %ux%u %s", name, size.width, size.height,
                  (border == IMGPROC_BORDER_REPLICATE) ? "repl" : "nuly");
    uint32_t errors = tbv::check_frame<1>(out, expected, label);
    if (status != 0)
    {
        std::printf("FAIL    status %u\n", static_cast<unsigned>(status));
        errors++;
    }
    return errors;
}

} // namespace

int main()
{
    static const imgproc_kernel_preset_t PRESETS[] = { IMGPROC_KERNEL_IDENTITY, IMGPROC_KERNEL_MEAN,
                                                       IMGPROC_KERNEL_SHARPEN, IMGPROC_KERNEL_SOBEL_X,
                                                       IMGPROC_KERNEL_SOBEL_Y };
    static const imgproc_border_t BORDERS[] = { IMGPROC_BORDER_REPLICATE, IMGPROC_BORDER_CONSTANT };
    uint32_t errors = 0u;

    for (const imgproc_kernel_preset_t preset : PRESETS)
    {
        imgproc_kernel_t kernel = {};
        imgproc_kernel_make(preset, &kernel);
        for (const imgproc_border_t border : BORDERS)
        {
            for (const TestSize& size : SIZES)
            {
                errors += run_test(kernel, size, border, imgproc_kernel_name(preset));
            }
        }
    }
    for (const uint8_t kernel_size : { static_cast<uint8_t>(5u), static_cast<uint8_t>(7u) })
    {
        imgproc_kernel_t kernel = {};
        make_random_kernel(kernel_size, 7u * kernel_size, kernel);
        for (const imgproc_border_t border : BORDERS)
        {
            for (const TestSize& size : SIZES)
            {
                errors += run_test(kernel, size, border, (kernel_size == 5u) ? "nahodne 5x5" : "nahodne 7x7");
            }
        }
    }

    std::printf("\nVYSLEDEK: %s (%u chyb)\n", (errors == 0u) ? "PASS" : "FAIL", errors);
    return (errors == 0u) ? 0 : 1;
}
