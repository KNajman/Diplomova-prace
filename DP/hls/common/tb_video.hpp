/**
 * @file    tb_video.hpp
 * @brief   Pomocné funkce testbenchů HLS jader: testovací obrazy, stream <-> buffer, porovnání
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Referencí je vždy golden model lib_imgproc. Testbench vrací 0 jen při bitové shodě dat
 * i postranních signálů (TUSER/TLAST), jinak počet chyb - Vitis HLS pak C-sim/cosim označí
 * jako FAIL.
 */

#ifndef HLS_COMMON_TB_VIDEO_HPP_
#define HLS_COMMON_TB_VIDEO_HPP_

#include "hls_video.hpp"

#include <imgproc.h>

#include <cstdint>
#include <cstdio>
#include <vector>

namespace tbv
{

/// Obraz v paměti (UG934 pořadí složek) včetně popisu pro golden model
struct Image
{
    std::vector<uint8_t> buf;
    imgproc_image_t img;

    Image(uint32_t width, uint32_t height, uint8_t channels) : buf(width * height * channels)
    {
        imgproc_image_init(&img, buf.data(), width, height, channels);
    }
};

/**
 * @brief Vyplní obraz testovacím vzorem: rohy a okraje rozsahu, gradient, pseudonáhodný šum.
 *
 * Šum pokrývá náhodné kombinace, gradient spojité přechody a první řádek obsahuje
 * hraniční hodnoty (0, 1, 127, 128, 254, 255 ve všech složkách), kde se chyby způsobené
 * saturací a zaokrouhlení projevují nejčastěji.
 *
 * @param image Obraz
 * @param seed  Semínko generátoru
 */
inline void fill_pattern(Image& image, uint32_t seed)
{
    static const uint8_t EDGES[] = { 0u, 1u, 127u, 128u, 254u, 255u };
    const uint32_t n_edges = sizeof(EDGES) / sizeof(EDGES[0]);
    uint32_t state = seed;

    for (uint32_t y = 0u; y < image.img.height; y++)
    {
        for (uint32_t x = 0u; x < image.img.width; x++)
        {
            uint8_t* pixel = imgproc_image_pixel(&image.img, x, y);
            for (uint8_t c = 0u; c < image.img.channels; c++)
            {
                state = (state * 1103515245u) + 12345u;
                if (y == 0u)
                {
                    pixel[c] = EDGES[(x + (c * 2u)) % n_edges];
                }
                else if (y < (image.img.height / 2u))
                {
                    pixel[c] = static_cast<uint8_t>((x * (c + 1u)) + y);
                }
                else
                {
                    pixel[c] = static_cast<uint8_t>(state >> 16u);
                }
            }
        }
    }
}

/**
 * @brief Převede obraz do datového proudu/streamu jako AXI4-Stream Video (TUSER na prvním pixelu, TLAST na konci řádku).
 * @param image     Zdrojový obraz
 * @param stream    Cílový datový stream (1 nebo vícesložkový)
 */
template <int CHANNELS>
void push_frame(const Image& image, hls_video::stream_t<CHANNELS>& stream)
{
    for (uint32_t y = 0u; y < image.img.height; y++)
    {
        for (uint32_t x = 0u; x < image.img.width; x++)
        {
            const uint8_t* src = imgproc_image_pixel(&image.img, x, y);
            hls_video::Pixel<CHANNELS> pixel;
            for (int c = 0; c < CHANNELS; c++)
            {
                pixel.ch[c] = src[c];
            }

            hls_video::axis_t<CHANNELS> packet;
            packet.data = hls_video::pack<CHANNELS>(pixel);
            packet.keep = -1;
            packet.strb = -1;
            packet.user = ((x == 0u) && (y == 0u)) ? 1 : 0;
            packet.last = (x == (image.img.width - 1u)) ? 1 : 0;
            stream.write(packet);
        }
    }
}

/**
 * @brief Přečte snímek ze streamu a porovná ho s očekávaným obrazem včetně signálů TUSER/TLAST.
 * @param stream    Výstupní stream jádra
 * @param expected  Očekávaný obraz (golden model)
 * @param name      Název testu pro výpis
 * @return Počet chyb (0 = bitová shoda)
 */
template <int CHANNELS>
uint32_t check_frame(hls_video::stream_t<CHANNELS>& stream, const Image& expected, const char* name)
{
    uint32_t errors = 0u;

    for (uint32_t y = 0u; y < expected.img.height; y++)
    {
        for (uint32_t x = 0u; x < expected.img.width; x++)
        {
            if (stream.empty())
            {
                std::printf("FAIL  %-40s chybí pixel [%u, %u]\n", name, x, y);
                return errors + 1u;
            }

            const hls_video::axis_t<CHANNELS> packet = stream.read();
            const hls_video::Pixel<CHANNELS> pixel = hls_video::unpack<CHANNELS>(packet.data);
            const uint8_t* exp = imgproc_image_pixel(&expected.img, x, y);
            const bool user_ok = (packet.user == (((x == 0u) && (y == 0u)) ? 1 : 0));
            const bool last_ok = (packet.last == ((x == (expected.img.width - 1u)) ? 1 : 0));
            bool data_ok = true;

            for (int c = 0; c < CHANNELS; c++)
            {
                data_ok = data_ok && (pixel.ch[c] == exp[c]);
            }
            
            if ((!data_ok) || (!user_ok) || (!last_ok))
            {
                if (errors < 5u)
                {
                    std::printf("      [%u, %u] data %s, TUSER %s, TLAST %s\n", x, y, data_ok ? "ok" : "CHYBA",
                                user_ok ? "ok" : "CHYBA", last_ok ? "ok" : "CHYBA");
                }
                errors++;
            }
        }
    }

    if (!stream.empty())
    {
        std::printf("      jádro vydalo víc pixelů, než je ve snímku\n");
        errors++;
    }
    std::printf("%s  %-40s %ux%u, chyb: %u\n", (errors == 0u) ? "PASS" : "FAIL", name, expected.img.width,
                expected.img.height, errors);
    return errors;
}

} // namespace tbv

#endif // HLS_COMMON_TB_VIDEO_HPP_
