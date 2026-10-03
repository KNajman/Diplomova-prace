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
 * hraniční hodnoty (0, 1, 127, 128, 254, 255 ve všech složkách), kde se chyby saturace
 * a zaokrouhlení projeví nejčastěji.
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
            uint8_t* px = imgproc_image_pixel(&image.img, x, y);
            for (uint8_t c = 0u; c < image.img.channels; c++)
            {
                state = (state * 1103515245u) + 12345u;
                if (y == 0u)
                {
                    px[c] = EDGES[(x + (c * 2u)) % n_edges];
                }
                else if (y < (image.img.height / 2u))
                {
                    px[c] = static_cast<uint8_t>((x * (c + 1u)) + y);
                }
                else
                {
                    px[c] = static_cast<uint8_t>(state >> 16u);
                }
            }
        }
    }
}

/**
 * @brief Zapíše obraz do streamu jako AXI4-Stream Video (TUSER na prvním pixelu, TLAST na konci řádku).
 * @param image     Zdrojový obraz
 * @param stream    Cílový stream
 */
template <int CH>
void push_frame(const Image& image, hlsv::stream_t<CH>& stream)
{
    for (uint32_t y = 0u; y < image.img.height; y++)
    {
        for (uint32_t x = 0u; x < image.img.width; x++)
        {
            const uint8_t* src = imgproc_image_pixel(&image.img, x, y);
            hlsv::Pixel<CH> px;
            for (int c = 0; c < CH; c++)
            {
                px.ch[c] = src[c];
            }
            hlsv::axis_t<CH> pkt;
            pkt.data = hlsv::pack<CH>(px);
            pkt.keep = -1;
            pkt.strb = -1;
            pkt.user = ((x == 0u) && (y == 0u)) ? 1 : 0;
            pkt.last = (x == (image.img.width - 1u)) ? 1 : 0;
            stream.write(pkt);
        }
    }
}

/**
 * @brief Přečte snímek ze streamu a porovná ho s očekávaným obrazem včetně TUSER/TLAST.
 * @param stream    Výstupní stream jádra
 * @param expected  Očekávaný obraz (golden model)
 * @param name      Název testu pro výpis
 * @return Počet chyb (0 = bitová shoda)
 */
template <int CH>
uint32_t check_frame(hlsv::stream_t<CH>& stream, const Image& expected, const char* name)
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
            const hlsv::axis_t<CH> pkt = stream.read();
            const hlsv::Pixel<CH> px = hlsv::unpack<CH>(pkt.data);
            const uint8_t* exp = imgproc_image_pixel(&expected.img, x, y);
            const bool user_ok = (pkt.user == (((x == 0u) && (y == 0u)) ? 1 : 0));
            const bool last_ok = (pkt.last == ((x == (expected.img.width - 1u)) ? 1 : 0));
            bool data_ok = true;
            for (int c = 0; c < CH; c++)
            {
                data_ok = data_ok && (px.ch[c] == exp[c]);
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
