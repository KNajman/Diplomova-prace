/**
 * @file    hls_filter2d.cpp
 * @brief   HLS jádro 2D konvoluce K x K šedotónového videa
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Poznámky k návrhu:
 *  - Funktor FilterOp<K> počítá jeden výstupní pixel z okna; rámec (řádkové buffery, okraje,
 *    flush, resync) je hlsv::window_frame - stejný jako u mediánu, takže HLS i VHDL sdílí
 *    sémantiku okénkových jader.
 *  - Šířky vzorcem: součin 8 b x 9 b = 17 b, součet K*K členů 17 + clog2(K*K) b, škálovaný
 *    součet + 18 b. HLS si strom sčítaček a umístění násobení (LUT/DSP) zvolí sám - to je
 *    jeden ze srovnávaných rozdílů proti VHDL (explicitní strom s registrem v každé úrovni).
 *  - 5x5 / 7x7: koeficienty z pole v AXI4-Lite se na začátku snímku zkopírují do registrů
 *    (ARRAY_PARTITION complete), K*K taktů na snímek - zanedbatelné.
 */

#include "hls_filter2d.hpp"

namespace
{

/// Výpočet jednoho pixelu z okna K x K (shodný s imgproc_filter_point + delta + saturace)
template <int K>
struct FilterOp
{
    static constexpr int PIXEL_SIGNED_BITS = hlsv::PIXEL_BITS + 1;
    static constexpr int PRODUCT_BITS = hlsf::COEFF_BITS + PIXEL_SIGNED_BITS;
    static constexpr int SUM_BITS = PRODUCT_BITS + hlsf::clog2(K * K);
    static constexpr int SCALED_BITS = SUM_BITS + hlsf::SCALE_BITS;
    static constexpr int OFFSET_BITS = ((SCALED_BITS - hlsf::SCALE_FRAC + 1) > hlsf::DELTA_BITS
                                            ? (SCALED_BITS - hlsf::SCALE_FRAC + 1)
                                            : hlsf::DELTA_BITS) + 1;

    hlsf::coeff_t coeff[K][K];
    hlsf::scale_t scale;
    hlsf::delta_t delta;

    hlsv::pixel_t operator()(const hlsv::pixel_t win[K][K]) const
    {
#pragma HLS INLINE
        ap_int<SUM_BITS> sum = 0;
        for (int row = 0; row < K; row++)
        {
#pragma HLS UNROLL
            for (int col = 0; col < K; col++)
            {
#pragma HLS UNROLL
                sum += static_cast<ap_int<PRODUCT_BITS>>(coeff[row][col]
                                                         * static_cast<ap_int<PIXEL_SIGNED_BITS>>(win[row][col]));
            }
        }
        const ap_int<SCALED_BITS> scaled = static_cast<ap_int<SCALED_BITS>>(sum) * scale;
        const ap_int<OFFSET_BITS> offset_value = static_cast<ap_int<OFFSET_BITS>>(
                                                     hlsv::round_shift<hlsf::SCALE_FRAC>(scaled))
                                                 + static_cast<ap_int<OFFSET_BITS>>(delta);
        return hlsv::saturate_u8(offset_value);
    }
};

/**
 * @brief Společné tělo 5x5 / 7x7: koeficienty z pole AXI4-Lite do registrů a snímek.
 */
template <int K>
void filter_from_array(hlsv::stream_gray_t& in_stream, hlsv::stream_gray_t& out_stream, hlsv::win_dim_t width,
                       hlsv::win_dim_t height, ap_uint<1> border, hlsf::scale_t scale, hlsf::delta_t delta,
                       const hlsf::coeff_t coeff[K * K], hlsv::win_status_t& status)
{
#pragma HLS INLINE
    FilterOp<K> op;
#pragma HLS ARRAY_PARTITION variable=op.coeff type=complete dim=0
copy_coeff:
    for (int tap = 0; tap < K * K; tap++)
    {
#pragma HLS PIPELINE II=1
        op.coeff[tap / K][tap % K] = coeff[tap];
    }
    op.scale = scale;
    op.delta = delta;
    hlsv::window_frame<K>(in_stream, out_stream, width, height, border == 1, status, op);
}

} // namespace

void hls_filter2d_3x3(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::win_dim_t width,
                      hlsv::win_dim_t height, ap_uint<1> border, hlsf::scale_t scale, hlsf::delta_t delta,
                      hlsf::coeff_t c0, hlsf::coeff_t c1, hlsf::coeff_t c2, hlsf::coeff_t c3, hlsf::coeff_t c4,
                      hlsf::coeff_t c5, hlsf::coeff_t c6, hlsf::coeff_t c7, hlsf::coeff_t c8,
                      hlsv::win_status_t& status)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=width bundle=control
#pragma HLS INTERFACE mode=s_axilite port=height bundle=control
#pragma HLS INTERFACE mode=s_axilite port=border bundle=control
#pragma HLS INTERFACE mode=s_axilite port=scale bundle=control
#pragma HLS INTERFACE mode=s_axilite port=delta bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c0 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c1 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c2 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c3 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c4 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c5 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c6 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c7 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=c8 bundle=control
#pragma HLS INTERFACE mode=s_axilite port=status bundle=control
#pragma HLS INTERFACE mode=s_axilite port=return bundle=control

    FilterOp<3> op;
#pragma HLS ARRAY_PARTITION variable=op.coeff type=complete dim=0
    op.coeff[0][0] = c0; op.coeff[0][1] = c1; op.coeff[0][2] = c2;
    op.coeff[1][0] = c3; op.coeff[1][1] = c4; op.coeff[1][2] = c5;
    op.coeff[2][0] = c6; op.coeff[2][1] = c7; op.coeff[2][2] = c8;
    op.scale = scale;
    op.delta = delta;
    hlsv::window_frame<3>(s_axis_video, m_axis_video, width, height, border == 1, status, op);
}

void hls_filter2d_5x5(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::win_dim_t width,
                      hlsv::win_dim_t height, ap_uint<1> border, hlsf::scale_t scale, hlsf::delta_t delta,
                      hlsf::coeff_t coeff[25], hlsv::win_status_t& status)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=width bundle=control
#pragma HLS INTERFACE mode=s_axilite port=height bundle=control
#pragma HLS INTERFACE mode=s_axilite port=border bundle=control
#pragma HLS INTERFACE mode=s_axilite port=scale bundle=control
#pragma HLS INTERFACE mode=s_axilite port=delta bundle=control
#pragma HLS INTERFACE mode=s_axilite port=coeff bundle=control
#pragma HLS INTERFACE mode=s_axilite port=status bundle=control
#pragma HLS INTERFACE mode=s_axilite port=return bundle=control
    filter_from_array<5>(s_axis_video, m_axis_video, width, height, border, scale, delta, coeff, status);
}

void hls_filter2d_7x7(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::win_dim_t width,
                      hlsv::win_dim_t height, ap_uint<1> border, hlsf::scale_t scale, hlsf::delta_t delta,
                      hlsf::coeff_t coeff[49], hlsv::win_status_t& status)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=width bundle=control
#pragma HLS INTERFACE mode=s_axilite port=height bundle=control
#pragma HLS INTERFACE mode=s_axilite port=border bundle=control
#pragma HLS INTERFACE mode=s_axilite port=scale bundle=control
#pragma HLS INTERFACE mode=s_axilite port=delta bundle=control
#pragma HLS INTERFACE mode=s_axilite port=coeff bundle=control
#pragma HLS INTERFACE mode=s_axilite port=status bundle=control
#pragma HLS INTERFACE mode=s_axilite port=return bundle=control
    filter_from_array<7>(s_axis_video, m_axis_video, width, height, border, scale, delta, coeff, status);
}
