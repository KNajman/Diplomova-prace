/**
 * @file    tb_hsv.cpp
 * @brief   Testbench HLS jader RGB -> HSV a HSV -> RGB proti golden modelu
 * @author  Bc. Karel Najman
 * @date    2026-10-22
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Testuje obě top funkce bez ohledu na to, která je syn.top (jako tb_csc): C-sim ověří celý zdroj,
 * při co-simulaci běží v RTL jen syntetizované jádro, druhé v C.
 *
 * Testy (každý dva snímky za sebou - jádro nesmí držet stav):
 *  1. testovací vzor 64 x 48 (tbv::fill_pattern: hraniční hodnoty, gradient, šum),
 *  2. rozmítání 256 x 256: složka 0 = x, složka 1 = y, složka 2 = hodnota snímku.
 *     Výchozí (i pro cosim): složka 2 z {0, 255} - cosim má jen potvrdit, že RTL počítá totéž co C
 *     (časování, šířky, TUSER/TLAST); 6 hodnot trvalo v cosim ~18 min na jádro, 2 hodnoty ~6 min.
 *     TB_HSV_FULL=1 v prostředí: všech 256 hodnot = úplný test 2^24 vstupů v obou směrech (jen C-sim,
 *     v cosim by trval hodiny). U HSV -> RGB to zahrnuje i neplatné H 180..255.
 *
 * Poznámka k volbě: úplný test je řízen proměnnou prostředí, ne parametrem v .cfg - csim i cosim spouští
 * stejný testbench a proměnnou nastaví jen fronta u kroku csim.
 */

#include "hls_hsv.hpp"
#include "../common/tb_video.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

namespace
{

constexpr uint32_t TB_WIDTH = 64u;
constexpr uint32_t TB_HEIGHT = 48u;
constexpr uint32_t TB_FRAMES = 2u;
constexpr uint32_t TB_SWEEP_SIZE = 256u;    ///< rozmítání: 256 x 256 = všechny kombinace složek 0 a 1
const uint8_t TB_SWEEP_REDUCED[] = { 0u, 255u };     ///< cosim: jen ověření RTL = C (pokrytí dělá úplný test v C-sim)

/// Směr převodu
enum Direction
{
    DIRECTION_RGB_TO_HSV = 0,
    DIRECTION_HSV_TO_RGB
};

/**
 * @brief Spustí jádro daného směru nad jedním snímkem a porovná výstup s golden modelem.
 * @param direction Směr převodu
 * @param src       Vstupní obraz
 * @param name      Název testu pro výpis
 * @return Počet chyb
 */
uint32_t run_and_check(Direction direction, const tbv::Image& src, const char* name)
{
    tbv::Image expected(src.img.width, src.img.height, hlsv::RGB_CHANNELS);
    hlsv::stream_rgb_t in;
    hlsv::stream_rgb_t out;

    if (direction == DIRECTION_RGB_TO_HSV)
    {
        imgproc_rgb_to_hsv(&src.img, &expected.img);
    }
    else
    {
        imgproc_hsv_to_rgb(&src.img, &expected.img);
    }
    tbv::push_frame<hlsv::RGB_CHANNELS>(src, in);
    while (!in.empty())
    {
        if (direction == DIRECTION_RGB_TO_HSV)
        {
            hls_rgb2hsv(in, out);
        }
        else
        {
            hls_hsv2rgb(in, out);
        }
    }
    return tbv::check_frame<hlsv::RGB_CHANNELS>(out, expected, name);
}

/**
 * @brief Vyplní snímek rozmítání: složka 0 = x, složka 1 = y, složka 2 = konstanta.
 * @param image         Obraz 256 x 256
 * @param third_value   Hodnota složky 2
 */
void fill_sweep(tbv::Image& image, uint8_t third_value)
{
    for (uint32_t y = 0u; y < image.img.height; y++)
    {
        for (uint32_t x = 0u; x < image.img.width; x++)
        {
            uint8_t* px = imgproc_image_pixel(&image.img, x, y);
            px[0] = static_cast<uint8_t>(x);
            px[1] = static_cast<uint8_t>(y);
            px[2] = third_value;
        }
    }
}

/**
 * @brief Otestuje jeden směr převodu.
 * @param direction Směr převodu
 * @param full      true = úplný test všech 2^24 vstupů
 * @return Počet chyb
 */
uint32_t test_direction(Direction direction, bool full)
{
    const char* direction_name = (direction == DIRECTION_RGB_TO_HSV) ? "rgb2hsv" : "hsv2rgb";
    char name[64];
    uint32_t errors = 0u;

    for (uint32_t frame = 0u; frame < TB_FRAMES; frame++)
    {
        tbv::Image pattern(TB_WIDTH, TB_HEIGHT, hlsv::RGB_CHANNELS);
        tbv::fill_pattern(pattern, (frame * 7919u) + static_cast<uint32_t>(direction));
        std::snprintf(name, sizeof(name), "%s vzor snimek %u", direction_name, frame);
        errors += run_and_check(direction, pattern, name);
    }

    tbv::Image sweep(TB_SWEEP_SIZE, TB_SWEEP_SIZE, hlsv::RGB_CHANNELS);
    const uint32_t sweep_count = full ? TB_SWEEP_SIZE : static_cast<uint32_t>(sizeof(TB_SWEEP_REDUCED));
    for (uint32_t sweep_idx = 0u; sweep_idx < sweep_count; sweep_idx++)
    {
        const uint8_t third_value = full ? static_cast<uint8_t>(sweep_idx) : TB_SWEEP_REDUCED[sweep_idx];
        fill_sweep(sweep, third_value);
        std::snprintf(name, sizeof(name), "%s rozmitani slozka2 = %u", direction_name, third_value);
        errors += run_and_check(direction, sweep, name);     // check_frame vypíše PASS/FAIL
    }
    std::printf("%s: %s, %u chyb\n", direction_name, full ? "uplny test 2^24" : "zkraceny test", errors);
    return errors;
}

} // namespace

int main()
{
    const char* full_env = std::getenv("TB_HSV_FULL");
    const bool full = (full_env != nullptr) && (std::strcmp(full_env, "1") == 0);
    uint32_t errors = 0u;

    errors += test_direction(DIRECTION_RGB_TO_HSV, full);
    errors += test_direction(DIRECTION_HSV_TO_RGB, full);

    std::printf("\nVYSLEDEK: %s (%s, %u chyb)\n", (errors == 0u) ? "PASS" : "FAIL",
                full ? "uplny test" : "zkraceny test", errors);
    return (errors == 0u) ? 0 : 1;
}
