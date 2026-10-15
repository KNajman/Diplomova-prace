/**
 * @file    hls_window.hpp
 * @brief   Společná šablona okénkových jader K x K (řádkové buffery, okraje, flush, resynchronizace)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Šablonu používá medián 3x3 i 2D konvoluce (3x3, 5x5, 7x7). Operace nad oknem je funktor
 * op(win), win[řádek][sloupec], střed okna je win[R][R], R = K / 2.
 *
 * Poznámky k návrhu (shodné s rozhodnutími pro VHDL verzi):
 *  - Jedno volání = jeden snímek. Geometrie z registrů width/height (čítače), TLAST se jen
 *    kontroluje (status). Snímek se vždy dokončí v plném rozměru W x H a výstup má stejný
 *    rozměr jako vstup (režim SAME, jako cv::filter2D / cv::medianBlur).
 *  - Smyčka běží přes (W + R) x (H + R) iterací s II=1. Vstup se čte jen pro x < W a y < H,
 *    výstup pixelu (x - R, y - R) se zapíše pro x >= R a y >= R. Iterace navíc jsou "flush":
 *    R taktů na konci řádku a R řádků na konci snímku, kdy se nečte (TREADY = 0) a dopočítává
 *    se pravý a dolní okraj. Režie R / W na řádek (0,05 % pro 3x3 při 1920 px).
 *  - K - 1 řádkových bufferů v BRAM (simple dual port, 1 čtení + 1 zápis za takt na stejné
 *    adrese x). Stejná adresa se znovu čte až za W + R iterací, proto DEPENDENCE inter false.
 *    Minimální šířka snímku je 8 px (rezerva vůči hloubce pipeline).
 *  - Okraj: border = 0 nuly (cv::BORDER_CONSTANT), 1 replikace (cv::BORDER_REPLICATE).
 *    Svisle se řeší při skládání sloupce (řádky mimo obraz se nahradí nulou nebo nejbližším
 *    platným řádkem téhož sloupce), vodorovně při posunu okna (začátek řádku vyplní okno
 *    hraniční hodnotou, za koncem řádku se opakuje poslední sloupec nebo nuly). Rohy tak vyjdou
 *    automaticky jako nejbližší pixel, stejně jako v OpenCV a golden modelu.
 *  - Resynchronizace: před snímkem se čeká na TUSER, pixely před ním se zahodí (status bit0).
 *    TUSER uprostřed snímku a nesoulad TLAST s šířkou se jen hlásí, snímek se dokončí.
 */

#ifndef HLS_COMMON_HLS_WINDOW_HPP_
#define HLS_COMMON_HLS_WINDOW_HPP_

#include "hls_video.hpp"

namespace hlsv
{

constexpr int WIN_MAX_WIDTH = 3840;         ///< Maximální šířka snímku (hloubka řádkových bufferů, 4K UHD)
constexpr int WIN_DIM_BITS = 12;            ///< Šířka registrů width/height (max 4095)

constexpr unsigned WIN_STATUS_SKIPPED = 1u;     ///< bit0: před TUSER přišly pixely, byly zahozeny (resynchronizace)
constexpr unsigned WIN_STATUS_EARLY_SOF = 2u;   ///< bit1: TUSER uprostřed snímku
constexpr unsigned WIN_STATUS_EARLY_EOL = 4u;   ///< bit2: TLAST před koncem řádku (x < W - 1)
constexpr unsigned WIN_STATUS_LATE_EOL = 8u;    ///< bit3: chybí TLAST na konci řádku (x = W - 1)

using win_dim_t = ap_uint<WIN_DIM_BITS>;
using win_status_t = ap_uint<4>;

/**
 * @brief Zpracuje jeden snímek okénkovou operací K x K.
 * @param in_stream     Vstupní stream (1 složka)
 * @param out_stream    Výstupní stream (1 složka, stejný rozměr)
 * @param width         Šířka snímku (8 .. WIN_MAX_WIDTH)
 * @param height        Výška snímku (>= 1)
 * @param replicate     true = replikace okraje, false = nuly
 * @param status        Výstup: příznaky WIN_STATUS_*
 * @param op            Funktor pixel_t op(const pixel_t win[K][K])
 */
template <int K, typename Op>
void window_frame(stream_t<1>& in_stream, stream_t<1>& out_stream, win_dim_t width, win_dim_t height,
                  bool replicate, win_status_t& status, const Op& op)
{
#pragma HLS INLINE
    constexpr int R = K / 2;

    pixel_t line_buf[K - 1][WIN_MAX_WIDTH];
#pragma HLS ARRAY_PARTITION variable=line_buf type=complete dim=1
#pragma HLS BIND_STORAGE variable=line_buf type=ram_s2p impl=bram
#pragma HLS DEPENDENCE variable=line_buf type=inter dependent=false

    pixel_t win[K][K];
#pragma HLS ARRAY_PARTITION variable=win type=complete dim=0
    pixel_t last_col[K];        // sloupec x = W - 1 (opakuje se za pravým okrajem)
#pragma HLS ARRAY_PARTITION variable=last_col type=complete

    bool skipped = false;
    bool early_sof = false;
    bool early_eol = false;
    bool late_eol = false;

    // Čekání na začátek snímku; pixel s TUSER je první pixel snímku
    axis_t<1> first;
wait_sof:
    do
    {
#pragma HLS PIPELINE II=1
        first = in_stream.read();
        if (first.user != 1)
        {
            skipped = true;
        }
    } while (first.user != 1);

    win_dim_t x = 0;
    win_dim_t y = 0;
    const win_dim_t x_end = width - 1 + R;      // poslední iterace řádku
    const win_dim_t y_end = height - 1 + R;     // poslední řádek iterací
    bool done = false;
frame_loop:
    do
    {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=64 max=8300000
        const bool in_col = (x < width);
        const bool in_row = (y < height);

        // 1. Vstupní pixel (jen uvnitř snímku; (0, 0) je už přečtený pixel s TUSER)
        pixel_t in_val = 0;
        if (in_col && in_row)
        {
            axis_t<1> pkt = first;
            if ((x != 0) || (y != 0))
            {
                pkt = in_stream.read();
                if (pkt.user == 1)
                {
                    early_sof = true;
                }
            }
            in_val = pkt.data;
            const bool eol = (x == (width - 1));
            if ((pkt.last == 1) && (!eol))
            {
                early_eol = true;
            }
            if ((pkt.last != 1) && eol)
            {
                late_eol = true;
            }
        }

        // 2. Sloupec řádků y-K+1 .. y z řádkových bufferů + posun bufferů
        pixel_t raw[K];
#pragma HLS ARRAY_PARTITION variable=raw type=complete
        for (int k = 0; k < K; k++)
        {
#pragma HLS UNROLL
            raw[k] = 0;
        }
        if (in_col)
        {
            for (int k = 0; k < K - 1; k++)
            {
#pragma HLS UNROLL
                raw[k] = line_buf[k][x];
            }
            raw[K - 1] = in_val;
            for (int k = 0; k < K - 2; k++)
            {
#pragma HLS UNROLL
                line_buf[k][x] = raw[k + 1];
            }
            line_buf[K - 2][x] = in_val;
        }

        // 3. Svislý okraj: řádky mimo obraz -> nula nebo nejbližší platný řádek téhož sloupce
        pixel_t col[K];
#pragma HLS ARRAY_PARTITION variable=col type=complete
        const int row0 = static_cast<int>(y) - (K - 1);     // index řádku raw[0]
        for (int k = 0; k < K; k++)
        {
#pragma HLS UNROLL
            const int ry = row0 + k;
            if (ry < 0)
            {
                col[k] = replicate ? raw[-row0] : pixel_t(0);                   // řádek 0
            }
            else if (ry >= static_cast<int>(height))
            {
                col[k] = replicate ? raw[static_cast<int>(height) - 1 - row0] : pixel_t(0);  // řádek H-1
            }
            else
            {
                col[k] = raw[k];
            }
        }

        // 4. Vodorovný posun okna a vodorovný okraj
        if (in_col)
        {
            if (x == (width - 1))
            {
                for (int k = 0; k < K; k++)
                {
#pragma HLS UNROLL
                    last_col[k] = col[k];
                }
            }
        }
        else
        {
            for (int k = 0; k < K; k++)
            {
#pragma HLS UNROLL
                col[k] = replicate ? last_col[k] : pixel_t(0);
            }
        }
        for (int r = 0; r < K; r++)
        {
#pragma HLS UNROLL
            for (int c = 0; c < K - 1; c++)
            {
#pragma HLS UNROLL
                // Začátek řádku: sloupce vlevo od obrazu = hraniční hodnota
                win[r][c] = (x == 0) ? (replicate ? col[r] : pixel_t(0)) : win[r][c + 1];
            }
            win[r][K - 1] = col[r];
        }

        // 5. Výstup pixelu (x - R, y - R)
        if ((x >= R) && (y >= R))
        {
            axis_t<1> out;
            out.data = op(win);
            out.keep = -1;
            out.strb = -1;
            out.user = ((x == R) && (y == R)) ? 1 : 0;
            out.last = (x == x_end) ? 1 : 0;
            out_stream.write(out);
        }

        // 6. Čítače
        if (x == x_end)
        {
            x = 0;
            done = (y == y_end);
            y++;
        }
        else
        {
            x++;
        }
    } while (!done);

    status = (skipped ? WIN_STATUS_SKIPPED : 0u) | (early_sof ? WIN_STATUS_EARLY_SOF : 0u)
             | (early_eol ? WIN_STATUS_EARLY_EOL : 0u) | (late_eol ? WIN_STATUS_LATE_EOL : 0u);
}

} // namespace hlsv

#endif // HLS_COMMON_HLS_WINDOW_HPP_
