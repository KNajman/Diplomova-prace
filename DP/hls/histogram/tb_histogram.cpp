/**
 * @file    tb_histogram.cpp
 * @brief   Testbench HLS jádra histogramu proti golden modelu (imgproc_histogram)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Testy:
 *  1. dva běžné snímky za sebou (testovací vzor tbv::fill_pattern),
 *  2. zátěžový snímek pro forwarding: běhy stejné hodnoty, jediná hodnota v celém řádku a vzory
 *     s opakováním koše po 1, 2, 3 a 4 pixelech (a,a / a,b,a / a,b,c,a / a,b,c,d,a),
 *  3. porucha a resynchronizace: polovina snímku A bez konce, celý B, celý C.
 *     1. volání: A/2 + B/2 řádků, status EARLY_SOF; 2. volání: zbytek B přeskočí, C správně, status SKIPPED.
 * Ve všech testech musí výstupní stream přesně odpovídat vstupu (bypass).
 */

#include "hls_histogram.hpp"
#include "../common/tb_video.hpp"

#include <cstdio>
#include <vector>

namespace
{

constexpr uint32_t TB_WIDTH = 64u;
constexpr uint32_t TB_HEIGHT = 48u;

using packets_t = std::vector<hlsv::axis_gray_t>;

/**
 * @brief Zapíše řádky [row_begin, row_end) obrazu do streamu a uloží kopii paketů (TUSER jen na pixelu [0, 0]).
 * @param image     Zdrojový obraz (1 kanál)
 * @param row_begin První řádek
 * @param row_end   Řádek za posledním
 * @param stream    Cílový stream
 * @param sent      Záznam odeslaných paketů (pro kontrolu bypassu)
 */
void push_rows(const tbv::Image& image, uint32_t row_begin, uint32_t row_end, hlsv::stream_gray_t& stream,
               packets_t& sent)
{
    for (uint32_t y = row_begin; y < row_end; y++)
    {
        for (uint32_t x = 0u; x < image.img.width; x++)
        {
            hlsv::axis_gray_t pkt;
            pkt.data = *imgproc_image_pixel(&image.img, x, y);
            pkt.keep = -1;
            pkt.strb = -1;
            pkt.user = ((x == 0u) && (y == 0u)) ? 1 : 0;
            pkt.last = (x == (image.img.width - 1u)) ? 1 : 0;
            stream.write(pkt);
            sent.push_back(pkt);
        }
    }
}

/**
 * @brief Golden histogram řádků [row_begin, row_end) obrazu, přičtený k acc (pohled na část bufferu).
 * @param image     Obraz (1 kanál, řádky za sebou bez mezer)
 * @param row_begin První řádek
 * @param row_end   Řádek za posledním
 * @param acc       Akumulovaný očekávaný histogram
 */
void golden_rows(const tbv::Image& image, uint32_t row_begin, uint32_t row_end, std::vector<uint32_t>& acc)
{
    imgproc_image_t view;
    std::vector<uint32_t> part(IMGPROC_HIST_BINS);
    imgproc_image_init(&view, const_cast<uint8_t*>(image.buf.data()) + (row_begin * image.img.width),
                       image.img.width, row_end - row_begin, 1u);
    imgproc_histogram(&view, part.data());
    for (uint32_t i = 0u; i < IMGPROC_HIST_BINS; i++)
    {
        acc[i] += part[i];
    }
}

/**
 * @brief Jedno volání jádra a porovnání histogramu a statusu s očekáváním.
 * @param in        Vstupní stream
 * @param out       Výstupní stream
 * @param expected  Očekávaný histogram
 * @param exp_status Očekávaný status
 * @param name      Název testu
 * @return Počet chyb
 */
uint32_t run_and_check(hlsv::stream_gray_t& in, hlsv::stream_gray_t& out, const std::vector<uint32_t>& expected,
                       unsigned exp_status, const char* name)
{
    hist_count_t hist[HIST_BINS];
    hist_status_t status = 0;
    hls_histogram(in, out, TB_HEIGHT, hist, status);

    uint32_t errors = 0u;
    uint32_t total = 0u;
    for (int i = 0; i < HIST_BINS; i++)
    {
        total += static_cast<uint32_t>(hist[i]);
        if (hist[i] != expected[i])
        {
            if (errors < 5u)
            {
                std::printf("      koš %3d: jádro %u, golden %u\n", i, static_cast<uint32_t>(hist[i]), expected[i]);
            }
            errors++;
        }
    }
    if (status != exp_status)
    {
        std::printf("      status %u, očekáváno %u\n", static_cast<unsigned>(status), exp_status);
        errors++;
    }
    std::printf("%s  %-40s součet %u px, status %u, chyb: %u\n", (errors == 0u) ? "PASS" : "FAIL", name, total,
                static_cast<unsigned>(status), errors);
    return errors;
}

/**
 * @brief Ověří, že výstup jádra je přesná kopie odeslaných paketů (data, TUSER, TLAST, TKEEP).
 * @param out   Výstupní stream
 * @param sent  Odeslané pakety
 * @param name  Název testu
 * @return Počet chyb
 */
uint32_t check_bypass(hlsv::stream_gray_t& out, const packets_t& sent, const char* name)
{
    uint32_t errors = 0u;
    for (size_t i = 0u; i < sent.size(); i++)
    {
        if (out.empty())
        {
            std::printf("FAIL  %-40s výstup má jen %zu z %zu pixelů\n", name, i, sent.size());
            return errors + 1u;
        }
        const hlsv::axis_gray_t pkt = out.read();
        if ((pkt.data != sent[i].data) || (pkt.user != sent[i].user) || (pkt.last != sent[i].last)
            || (pkt.keep != sent[i].keep))
        {
            errors++;
        }
    }
    if (!out.empty())
    {
        std::printf("      jádro vydalo víc pixelů, než přišlo\n");
        errors++;
    }
    std::printf("%s  %-40s %zu px, chyb: %u\n", (errors == 0u) ? "PASS" : "FAIL", name, sent.size(), errors);
    return errors;
}

/**
 * @brief Zátěžový obraz pro forwarding (opakování koše po 1 až 4 pixelech).
 * @param image Obraz (1 kanál)
 */
void fill_stress(tbv::Image& image)
{
    static const uint8_t ABAC[] = { 10u, 20u, 10u, 30u };
    tbv::fill_pattern(image, 99u);
    for (uint32_t y = 0u; y < image.img.height; y++)
    {
        for (uint32_t x = 0u; x < image.img.width; x++)
        {
            uint8_t* px = imgproc_image_pixel(&image.img, x, y);
            switch (y % 8u)
            {
            case 0u: *px = 255u; break;                                       // celý řádek jedna hodnota (dlouhý běh)
            case 1u: *px = static_cast<uint8_t>(x & 1u); break;               // a,b,a,b
            case 2u: *px = ABAC[x % 4u]; break;                               // a,b,a,c
            case 3u: *px = static_cast<uint8_t>((x / 3u) * 7u); break;        // běhy délky 3
            case 4u: *px = (x == 0u) ? 255u : static_cast<uint8_t>(x); break; // navazuje na běh z řádku 0/3 přes TLAST
            case 5u: *px = static_cast<uint8_t>((x % 3u) * 50u); break;       // a,b,c,a (vzdálenost 3)
            case 6u: *px = static_cast<uint8_t>((x % 4u) * 40u); break;       // a,b,c,d,a (vzdálenost 4)
            default: break;                                                   // šum z fill_pattern
            }
        }
    }
}

/**
 * @brief Test jednoho celého snímku.
 * @param image Snímek
 * @param name  Název testu
 * @return Počet chyb
 */
uint32_t test_frame(const tbv::Image& image, const char* name)
{
    hlsv::stream_gray_t in;
    hlsv::stream_gray_t out;
    packets_t sent;
    std::vector<uint32_t> expected(IMGPROC_HIST_BINS, 0u);
    push_rows(image, 0u, TB_HEIGHT, in, sent);
    golden_rows(image, 0u, TB_HEIGHT, expected);
    uint32_t errors = run_and_check(in, out, expected, 0u, name);
    errors += check_bypass(out, sent, "  bypass");
    return errors;
}

/**
 * @brief Test poruchy (useknutý snímek) a resynchronizace.
 * @return Počet chyb
 */
uint32_t test_resync()
{
    tbv::Image a(TB_WIDTH, TB_HEIGHT, 1u);
    tbv::Image b(TB_WIDTH, TB_HEIGHT, 1u);
    tbv::Image c(TB_WIDTH, TB_HEIGHT, 1u);
    tbv::fill_pattern(a, 11u);
    tbv::fill_pattern(b, 22u);
    tbv::fill_pattern(c, 33u);
    const uint32_t half = TB_HEIGHT / 2u;

    hlsv::stream_gray_t in;
    hlsv::stream_gray_t out;
    packets_t sent;
    push_rows(a, 0u, half, in, sent);          // A useknutý v polovině
    push_rows(b, 0u, TB_HEIGHT, in, sent);
    push_rows(c, 0u, TB_HEIGHT, in, sent);

    std::vector<uint32_t> exp1(IMGPROC_HIST_BINS, 0u);
    golden_rows(a, 0u, half, exp1);            // 1. volání: A/2 + prvních TB_HEIGHT/2 řádků B
    golden_rows(b, 0u, TB_HEIGHT - half, exp1);
    std::vector<uint32_t> exp2(IMGPROC_HIST_BINS, 0u);
    golden_rows(c, 0u, TB_HEIGHT, exp2);       // 2. volání: zbytek B přeskočen, C celý

    uint32_t errors = run_and_check(in, out, exp1, HIST_STATUS_EARLY_SOF, "resync: useknutý A + B/2");
    errors += run_and_check(in, out, exp2, HIST_STATUS_SKIPPED, "resync: přeskočení zbytku B, C");
    errors += check_bypass(out, sent, "  bypass A/2 + B + C");
    if (!in.empty())
    {
        std::printf("FAIL  jádro nepřečetlo celý vstup\n");
        errors++;
    }
    return errors;
}

} // namespace

int main()
{
    uint32_t errors = 0u;

    tbv::Image frame(TB_WIDTH, TB_HEIGHT, 1u);
    tbv::fill_pattern(frame, 1u);
    errors += test_frame(frame, "snímek 1 (testovací vzor)");
    tbv::fill_pattern(frame, 2u);
    errors += test_frame(frame, "snímek 2 (jiný vzor, nulování mezi snímky)");
    fill_stress(frame);
    errors += test_frame(frame, "zátěž: opakování koše po 1-4 px");
    errors += test_resync();

    std::printf("\nVYSLEDEK: %s (%u chyb)\n", (errors == 0u) ? "PASS" : "FAIL", errors);
    return (errors == 0u) ? 0 : 1;
}
