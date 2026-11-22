/**
 * @file    hls_passthrough.cpp
 * @brief   HLS propust AXI4-Stream Video s resynchronizací a kontrolou TUSER/TLAST
 * @author  Bc. Karel Najman
 * @date    2026-11-22
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Účel: ověření průchodu dat a řízení toku bez vlivu algoritmu (mezery ve vstupu, zpětný tlak,
 * pixely před začátkem snímku, chybné TLAST, maximální rozměr, zastavení a znovuspuštění).
 *  - Před snímkem se čeká na TUSER, pixely před ním se zahodí (WIN_STATUS_SKIPPED).
 *  - Snímek má vždy width x height pixelů; TUSER uprostřed snímku a TLAST mimo konec řádku se jen
 *    hlásí, výstupní TUSER/TLAST jsou z čítačů (stejně jako window_frame a VHDL passthrough_core).
 */

#include "hls_passthrough.hpp"

void hls_passthrough(hls_video::stream_rgb_t& s_axis_video, hls_video::stream_rgb_t& m_axis_video,
                     hls_video::win_dim_t width, hls_video::win_dim_t height, hls_video::win_status_t& status)
{
    #pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
    #pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
    #pragma HLS INTERFACE mode=s_axilite port=width bundle=control
    #pragma HLS INTERFACE mode=s_axilite port=height bundle=control
    #pragma HLS INTERFACE mode=s_axilite port=status bundle=control
    #pragma HLS INTERFACE mode=s_axilite port=return bundle=control

    bool skipped = false;
    bool early_sof = false;
    bool early_eol = false;
    bool late_eol = false;

    // Čekání na začátek snímku; pixel s TUSER je první pixel snímku
    hls_video::axis_rgb_t first;
wait_sof:
    do
    {
        #pragma HLS PIPELINE II=1
        first = s_axis_video.read();
        if (first.user != 1)
        {
            skipped = true;
        }
    } while (first.user != 1);

    const hls_video::win_dim_t width_m1 = width - 1;
    const hls_video::win_dim_t height_m1 = height - 1;
    hls_video::win_dim_t x = 0;
    hls_video::win_dim_t y = 0;
    bool done = false;
frame_loop:
    do
    {
        #pragma HLS PIPELINE II=1
        #pragma HLS LOOP_TRIPCOUNT min=1 max=8294400

        hls_video::axis_rgb_t packet = first;
        if ((x != 0) || (y != 0))
        {
            packet = s_axis_video.read();
            if (packet.user == 1)
            {
                early_sof = true;
            }
        }

        const bool eol = (x == width_m1);
        if ((packet.last == 1) && (!eol))
        {
            early_eol = true;
        }
        if ((packet.last != 1) && eol)
        {
            late_eol = true;
        }

        hls_video::axis_rgb_t out;
        out.data = packet.data;
        out.keep = -1;
        out.strb = -1;
        out.user = ((x == 0) && (y == 0)) ? 1 : 0;
        out.last = eol ? 1 : 0;
        m_axis_video.write(out);

        if (eol)
        {
            x = 0;
            done = (y == height_m1);
            y++;
        }
        else
        {
            x++;
        }
    } while (!done);

    status = (skipped ? hls_video::WIN_STATUS_SKIPPED : 0u) | (early_sof ? hls_video::WIN_STATUS_EARLY_SOF : 0u)
             | (early_eol ? hls_video::WIN_STATUS_EARLY_EOL : 0u) | (late_eol ? hls_video::WIN_STATUS_LATE_EOL : 0u);
}
