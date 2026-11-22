/**
 * @file    tb_median.cpp
 * @brief   Testbench HLS jádra mediánu 3x3 proti golden modelu (imgproc_median3x3)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Testuje zároveň společnou šablonu hls_video::window_frame (okraje, flush, resynchronizace):
 *  1. 64x48, replikace, dva snímky za sebou; nulový okraj,
 *  2. malé a liché rozměry včetně výšky 1 a 2 (horní a dolní okraj se překrývají), oba okraje,
 *  3. 7 pixelů bez TUSER před snímkem -> zahozeny, status SKIPPED, výstup správný,
 *  4. TLAST v řádku 5 o 3 pixely dřív -> status EARLY_EOL | LATE_EOL, geometrie z čítačů, výstup správný.
 * TB_MEDIAN_IMAGE=<soubor.pgm> v prostředí: navíc vlastní snímek (např. šum salt-and-pepper z gen_test_images.py),
 * výstup jádra se uloží vedle jako <soubor>_hls_median.pgm (náhled do práce).
 */

#include "hls_median.hpp"
#include "../common/tb_video.hpp"

#include <cstdio>
#include <cstdlib>
#include <string>
#include <vector>

namespace // anonymní namespace, jen pro vnitřní linkování
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
void push_faulty(const tbv::Image& image, const Fault& fault, hls_video::stream_gray_t& in)
{
    for (uint32_t i = 0u; i < fault.garbage_before; i++)
    {
        hls_video::axis_gray_t pkt;
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
            hls_video::axis_gray_t pkt;
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

    hls_video::stream_gray_t in;
    hls_video::stream_gray_t out;
    push_faulty(src, fault, in);
    hls_video::win_status_t status = 0;
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

/**
 * @brief Načte binární šedý snímek PGM (P5, maxval 255).
 * @param path   Cesta
 * @param width  Výstup: šířka
 * @param height Výstup: výška
 * @param pixels Výstup: pixely po řádcích
 * @return true při úspěchu
 */
bool read_pgm(const char* path, uint32_t& width, uint32_t& height, std::vector<uint8_t>& pixels)
{
    FILE* file = std::fopen(path, "rb");
    if (file == nullptr)
    {
        return false;
    }

    unsigned maxval = 0u;
    const bool header_ok = (std::fscanf(file, "P5 %u %u %u", &width, &height, &maxval) == 3) && (maxval == 255u)
                           && (std::fgetc(file) != EOF);
    pixels.resize(static_cast<size_t>(width) * height);
    const bool data_ok = header_ok && (std::fread(pixels.data(), 1u, pixels.size(), file) == pixels.size());
    std::fclose(file);
    return data_ok;
}

/**
 * @brief Medián vlastního snímku (replikace okraje) proti golden modelu, výstup jádra uloží jako PGM.
 * @param path Cesta ke vstupnímu PGM
 * @return Počet chyb
 */
uint32_t run_image(const char* path)
{
    uint32_t width = 0u;
    uint32_t height = 0u;
    std::vector<uint8_t> pixels;
    if (!read_pgm(path, width, height, pixels))
    {
        std::printf("FAIL    nelze načíst %s\n", path);
        return 1u;
    }

    tbv::Image src(width, height, 1u);
    tbv::Image expected(width, height, 1u);
    for (uint32_t y = 0u; y < height; y++)
    {
        for (uint32_t x = 0u; x < width; x++)
        {
            *imgproc_image_pixel(&src.img, x, y) = pixels[(static_cast<size_t>(y) * width) + x];
        }
    }
    imgproc_median3x3(&src.img, &expected.img, IMGPROC_BORDER_REPLICATE);

    hls_video::stream_gray_t in;
    hls_video::stream_gray_t out;
    tbv::push_frame<1>(src, in);
    hls_video::win_status_t status = 0;
    hls_median(in, out, width, height, 1, status);

    // výstup jádra: kopie streamu do PGM a zpět do streamu pro porovnání
    std::string out_path(path);
    out_path = out_path.substr(0u, out_path.rfind('.')) + "_hls_median.pgm";
    FILE* file = std::fopen(out_path.c_str(), "wb");
    hls_video::stream_gray_t checked;
    if (file != nullptr)
    {
        std::fprintf(file, "P5\n%u %u\n255\n", width, height);
    }
    while (!out.empty())
    {
        const hls_video::axis_gray_t packet = out.read();
        if (file != nullptr)
        {
            std::fputc(static_cast<int>(packet.data.to_uint()), file);
        }
        checked.write(packet);
    }
    if (file != nullptr)
    {
        std::fclose(file);
    }

    uint32_t errors = tbv::check_frame<1>(checked, expected, "vlastní snímek repl");
    if (status != 0u)
    {
        std::printf("FAIL    status %u, očekáváno 0\n", static_cast<unsigned>(status));
        errors++;
    }
    std::printf("        %s -> %s\n", path, out_path.c_str());
    return errors;
}

} // anonymní namespace

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
    errors += run_test(32u, 16u, IMGPROC_BORDER_REPLICATE, 5u, garbage, hls_video::WIN_STATUS_SKIPPED, "resync");
    const Fault bad_eol = { 0u, 5 };
    errors += run_test(32u, 16u, IMGPROC_BORDER_REPLICATE, 6u, bad_eol,
                       hls_video::WIN_STATUS_EARLY_EOL | hls_video::WIN_STATUS_LATE_EOL, "TLAST mimo");

    const char* image_path = std::getenv("TB_MEDIAN_IMAGE");
    if ((image_path != nullptr) && (image_path[0] != '\0'))
    {
        errors += run_image(image_path);
    }

    std::printf("\nVYSLEDEK: %s (%u chyb)\n", (errors == 0u) ? "PASS" : "FAIL", errors);
    return (errors == 0u) ? 0 : 1;
}
