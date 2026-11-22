/**
 * @file    tb_passthrough.cpp
 * @brief   Testbench HLS propusti: výstup = vstup, poruchy streamu, maximální rozměr, všechny barvy
 * @author  Bc. Karel Najman
 * @date    2026-11-22
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Testy (každý snímek = jedno volání jádra):
 *  1. 64x48 dva snímky za sebou (jádro nesmí držet stav), malé rozměry včetně 1x1, 1x8 a 8x1,
 *  2. 7 pixelů bez TUSER před snímkem -> zahozeny, status SKIPPED,
 *  3. TLAST v řádku 5 o 3 pixely dřív -> status EARLY_EOL | LATE_EOL, geometrie z čítačů,
 *  4. TUSER uprostřed snímku -> status EARLY_SOF, snímek se dokončí v plném rozměru.
 * TB_PASSTHROUGH_FULL=1 v prostředí (jen C-sim, v cosim by trval hodiny): navíc maximální rozměr
 * 3840 x 2160 a všech 2^24 barev ve 4 snímcích 2048 x 2048 (stejné snímky jako gen_test_images.py colors).
 */

#include "hls_passthrough.hpp"
#include "../common/tb_video.hpp"

#include <cstdio>
#include <cstdlib>

namespace // anonymní namespace, jen pro vnitřní linkování
{

/// Porucha vstupního streamu
struct Fault
{
    uint32_t garbage_before;    ///< počet pixelů bez TUSER před snímkem
    int32_t early_last_row;     ///< řádek s TLAST o 3 px dřív (-1 = žádný)
    int32_t extra_sof_row;      ///< řádek s TUSER na prvním pixelu uprostřed snímku (-1 = žádný)
};

constexpr Fault NO_FAULT = { 0u, -1, -1 };
constexpr uint32_t COLOR_SIZE = 2048u;     ///< strana snímku testu všech barev (4 x 2048^2 = 2^24)
constexpr uint32_t COLOR_FRAMES = 4u;

/**
 * @brief Zapíše snímek do streamu s volitelnou poruchou.
 * @param image   Snímek
 * @param fault   Porucha
 * @param stream  Stream
 */
void push_faulty(const tbv::Image& image, const Fault& fault, hls_video::stream_rgb_t& stream)
{
    for (uint32_t i = 0u; i < fault.garbage_before; i++)
    {
        hls_video::axis_rgb_t packet;
        packet.data = 0xA5A5A5;
        packet.keep = -1;
        packet.strb = -1;
        packet.user = 0;
        packet.last = (i == (fault.garbage_before - 1u)) ? 1 : 0;
        stream.write(packet);
    }

    const uint32_t width = image.img.width;
    for (uint32_t y = 0u; y < image.img.height; y++)
    {
        for (uint32_t x = 0u; x < width; x++)
        {
            const uint8_t* pixel = imgproc_image_pixel(&image.img, x, y);
            hls_video::axis_rgb_t packet;
            packet.data = (static_cast<uint32_t>(pixel[2]) << 16) | (static_cast<uint32_t>(pixel[1]) << 8) | pixel[0];
            packet.keep = -1;
            packet.strb = -1;
            const bool sof = ((x == 0u) && (y == 0u)) || ((x == 0u) && (static_cast<int32_t>(y) == fault.extra_sof_row));
            packet.user = sof ? 1 : 0;
            const uint32_t eol = ((static_cast<int32_t>(y) == fault.early_last_row) && (width >= 4u)) ? (width - 4u)
                                                                                                       : (width - 1u);
            packet.last = (x == eol) ? 1 : 0;
            stream.write(packet);
        }
    }
}

/**
 * @brief Jeden snímek přes jádro, porovnání s očekávaným (= vstupem) a kontrola statusu.
 * @param image       Vstupní snímek (zároveň očekávaný výstup)
 * @param fault       Porucha vstupu
 * @param exp_status  Očekávaný status
 * @param name        Název testu
 * @return Počet chyb
 */
uint32_t run_frame(const tbv::Image& image, const Fault& fault, unsigned exp_status, const char* name)
{
    hls_video::stream_rgb_t in;
    hls_video::stream_rgb_t out;
    push_faulty(image, fault, in);
    hls_video::win_status_t status = 0;
    hls_passthrough(in, out, image.img.width, image.img.height, status);

    char label[64];
    std::snprintf(label, sizeof(label), "%s %ux%u", name, image.img.width, image.img.height);
    uint32_t errors = tbv::check_frame<hls_video::PIXEL_CHANNELS>(out, image, label);
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

/**
 * @brief Test se vzorem tbv::fill_pattern.
 * @return Počet chyb
 */
uint32_t run_pattern(uint32_t width, uint32_t height, uint32_t seed, const Fault& fault, unsigned exp_status,
                     const char* name)
{
    tbv::Image image(width, height, hls_video::PIXEL_CHANNELS);
    tbv::fill_pattern(image, seed);
    return run_frame(image, fault, exp_status, name);
}

/**
 * @brief Všech 2^24 barev ve 4 snímcích 2048 x 2048: index = (snímek << 22) | (y << 11) | x,
 *        R = index[23:16], G = index[15:8], B = index[7:0] (jako gen_test_images.py colors).
 * @return Počet chyb
 */
uint32_t run_all_colors()
{
    uint32_t errors = 0u;
    tbv::Image image(COLOR_SIZE, COLOR_SIZE, hls_video::PIXEL_CHANNELS);
    for (uint32_t quadrant = 0u; quadrant < COLOR_FRAMES; quadrant++)
    {
        for (uint32_t y = 0u; y < COLOR_SIZE; y++)
        {
            for (uint32_t x = 0u; x < COLOR_SIZE; x++)
            {
                const uint32_t index = (quadrant << 22) | (y << 11) | x;
                uint8_t* pixel = imgproc_image_pixel(&image.img, x, y);
                pixel[IMGPROC_RGB_IDX_R] = static_cast<uint8_t>(index >> 16);
                pixel[IMGPROC_RGB_IDX_G] = static_cast<uint8_t>(index >> 8);
                pixel[IMGPROC_RGB_IDX_B] = static_cast<uint8_t>(index);
            }
        }

        char name[32];
        std::snprintf(name, sizeof(name), "barvy q%u", quadrant);
        errors += run_frame(image, NO_FAULT, 0u, name);
    }

    return errors;
}

} // anonymní namespace

int main()
{
    uint32_t errors = 0u;

    errors += run_pattern(64u, 48u, 1u, NO_FAULT, 0u, "snímek 1");
    errors += run_pattern(64u, 48u, 2u, NO_FAULT, 0u, "snímek 2");

    static const uint32_t SIZES[][2] = { { 1u, 1u }, { 1u, 8u }, { 8u, 1u }, { 9u, 3u }, { 17u, 5u } };
    for (const auto& size : SIZES)
    {
        errors += run_pattern(size[0], size[1], size[0] + size[1], NO_FAULT, 0u, "rozměr");
    }

    const Fault garbage = { 7u, -1, -1 };
    errors += run_pattern(32u, 16u, 5u, garbage, hls_video::WIN_STATUS_SKIPPED, "resync");
    const Fault bad_eol = { 0u, 5, -1 };
    errors += run_pattern(32u, 16u, 6u, bad_eol, hls_video::WIN_STATUS_EARLY_EOL | hls_video::WIN_STATUS_LATE_EOL,
                          "TLAST mimo");
    const Fault extra_sof = { 0u, -1, 7 };
    errors += run_pattern(32u, 16u, 7u, extra_sof, hls_video::WIN_STATUS_EARLY_SOF, "TUSER uprostřed");
    errors += run_pattern(32u, 16u, 8u, NO_FAULT, 0u, "po poruchách");

    const char* full = std::getenv("TB_PASSTHROUGH_FULL");
    if ((full != nullptr) && (full[0] == '1'))
    {
        errors += run_pattern(3840u, 2160u, 9u, NO_FAULT, 0u, "maximum");
        errors += run_all_colors();
    }

    std::printf("\nVYSLEDEK: %s (%u chyb)\n", (errors == 0u) ? "PASS" : "FAIL", errors);
    return (errors == 0u) ? 0 : 1;
}
