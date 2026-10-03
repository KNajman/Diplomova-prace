/**
 * @file    hls_csc.cpp
 * @brief   HLS jádro lineárního převodu barevných prostorů (matice 3x3, koeficienty Q2.15)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Poznámky k návrhu:
 *  - Řízení ap_ctrl_none: jádro běží samo, bez ap_start. Jedno volání top funkce = jeden pixel,
 *    PIPELINE II=1 = jeden pixel za takt. Nepotřebuje šířku ani výšku snímku - TUSER/TLAST jen
 *    putují s daty, takže resynchronizace je automatická (stejně jako ve VHDL verzi).
 *  - Koeficienty jsou skalární registry AXI4-Lite (ne pole). Pole na s_axilite by se
 *    implementovalo jako RAM se dvěma porty a 9 čtení za takt by nešlo; skaláry jsou registry
 *    a mapa registrů je čitelná i pro VHDL verzi (stejné offsety, jeden C driver).
 *  - Akumulátor 30 b: 18b koeficient x 9b pixel (se znaménkem) = 26 b, součet 3 členů +2 b,
 *    offset << 15 má 25 b. Vejde se do 48bitového akumulátoru DSP48E2 (násobení + PCIN kaskáda).
 */

#include "hls_csc.hpp"

namespace
{

constexpr int CSC_ACC_BITS = 30;        ///< Šířka akumulátoru (viz poznámka výše)

using csc_acc_t = ap_int<CSC_ACC_BITS>;

/**
 * @brief Převod jednoho pixelu (shodné s imgproc_csc_pixel).
 * @param in    Vstupní složky
 * @param p     Koeficienty a offsety
 * @return Výstupní složky
 */
template <int CH_IN, int CH_OUT>
hlsv::Pixel<CH_OUT> csc_pixel(const hlsv::Pixel<CH_IN>& in, const CscParams& p)
{
#pragma HLS INLINE
    hlsv::Pixel<CH_OUT> out;
    for (int o = 0; o < CH_OUT; o++)
    {
#pragma HLS UNROLL
        csc_acc_t acc = static_cast<csc_acc_t>(p.offset[o]) << CSC_FRAC_BITS;
        for (int i = 0; i < CH_IN; i++)
        {
#pragma HLS UNROLL
            acc += static_cast<csc_acc_t>(p.coeff[o][i]) * static_cast<csc_acc_t>(in.ch[i]);
        }
        out.ch[o] = hlsv::saturate_u8(hlsv::round_shift<CSC_FRAC_BITS>(acc));
    }
    return out;
}

/**
 * @brief Přečte pixel, převede ho a zapíše (tělo všech top funkcí).
 * @param in_stream     Vstupní stream
 * @param out_stream    Výstupní stream
 * @param p             Koeficienty a offsety
 */
template <int CH_IN, int CH_OUT>
void csc_stream(hlsv::stream_t<CH_IN>& in_stream, hlsv::stream_t<CH_OUT>& out_stream, const CscParams& p)
{
#pragma HLS INLINE
    const hlsv::axis_t<CH_IN> in = in_stream.read();
    const hlsv::Pixel<CH_OUT> px = csc_pixel<CH_IN, CH_OUT>(hlsv::unpack<CH_IN>(in.data), p);
    out_stream.write(hlsv::make_packet<CH_OUT, CH_IN>(hlsv::pack<CH_OUT>(px), in));
}

} // namespace

void hls_csc_rgb(hlsv::stream_rgb_t& s_axis_video, hlsv::stream_rgb_t& m_axis_video,
                 csc_coeff_t c00, csc_coeff_t c01, csc_coeff_t c02,
                 csc_coeff_t c10, csc_coeff_t c11, csc_coeff_t c12,
                 csc_coeff_t c20, csc_coeff_t c21, csc_coeff_t c22,
                 csc_offset_t o0, csc_offset_t o1, csc_offset_t o2)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=c00 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c01 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c02 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c10 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c11 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c12 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c20 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c21 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c22 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=o0 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=o1 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=o2 bundle=control
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS PIPELINE II=1
    const CscParams p = { { { c00, c01, c02 }, { c10, c11, c12 }, { c20, c21, c22 } }, { o0, o1, o2 } };
    csc_stream<hlsv::RGB_CHANNELS, hlsv::RGB_CHANNELS>(s_axis_video, m_axis_video, p);
}

void hls_csc_rgb_to_gray(hlsv::stream_rgb_t& s_axis_video, hlsv::stream_gray_t& m_axis_video,
                         csc_coeff_t c00, csc_coeff_t c01, csc_coeff_t c02, csc_offset_t o0)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=c00 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c01 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c02 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=o0 bundle=control
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS PIPELINE II=1
    const CscParams p = { { { c00, c01, c02 }, { 0, 0, 0 }, { 0, 0, 0 } }, { o0, 0, 0 } };
    csc_stream<hlsv::RGB_CHANNELS, 1>(s_axis_video, m_axis_video, p);
}

void hls_csc_gray_to_rgb(hlsv::stream_gray_t& s_axis_video, hlsv::stream_rgb_t& m_axis_video,
                         csc_coeff_t c00, csc_coeff_t c10, csc_coeff_t c20,
                         csc_offset_t o0, csc_offset_t o1, csc_offset_t o2)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=c00 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c10 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c20 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=o0 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=o1 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=o2 bundle=control
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS PIPELINE II=1
    const CscParams p = { { { c00, 0, 0 }, { c10, 0, 0 }, { c20, 0, 0 } }, { o0, o1, o2 } };
    csc_stream<1, hlsv::RGB_CHANNELS>(s_axis_video, m_axis_video, p);
}
