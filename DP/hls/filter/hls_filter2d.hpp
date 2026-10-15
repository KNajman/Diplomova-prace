/**
 * @file    hls_filter2d.hpp
 * @brief   HLS jádro 2D konvoluce K x K (mean, zostření, Sobel, ...) šedotónového videa
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Aritmetika bitově shodná s imgproc_filter2d() golden modelu (sémantika cv::filter2D, korelace):
 *   acc = sum_{r,c}(coeff[r][c] * win[r][c]),  out = saturate_0_255(((acc * scale + 2^13) >> 14) + delta)
 * Okno, okraje, flush a resynchronizace: společná šablona hlsv::window_frame (jako medián).
 *
 * Top funkce:
 *  - hls_filter2d_3x3: koeficienty jako 9 skalárních registrů c0..c8 - mapa registrů shodná s VHDL
 *    filter2d_axil (jeden driver, deska),
 *  - hls_filter2d_5x5 / hls_filter2d_7x7: koeficienty jako pole v AXI4-Lite (25 / 49 položek),
 *    jen pro OOC srovnání prostředků (skalárních registrů by bylo 49).
 */

#ifndef HLS_FILTER_HLS_FILTER2D_HPP_
#define HLS_FILTER_HLS_FILTER2D_HPP_

#include "../common/hls_window.hpp"

namespace hlsf
{

constexpr int COEFF_BITS = 8;       ///< Koeficient jádra (int8, shodně s golden modelem)
constexpr int SCALE_BITS = 18;      ///< Normalizace Q.14 (18 b se znaménkem)
constexpr int SCALE_FRAC = 14;      ///< Zlomkové bity normalizace
constexpr int DELTA_BITS = 16;      ///< Offset před saturací (int16)

/// Nejmenší k, pro které 2^k >= n (šířky součtů se odvozují vzorcem, ne konstantou)
constexpr int clog2(int n)
{
    return (n <= 1) ? 0 : (1 + clog2((n + 1) / 2));
}

using coeff_t = ap_int<COEFF_BITS>;
using scale_t = ap_int<SCALE_BITS>;
using delta_t = ap_int<DELTA_BITS>;

} // namespace hlsf

/// 2D konvoluce 3x3, koeficienty c0..c8 = řádky jádra za sebou (registry jako VHDL filter2d_axil)
void hls_filter2d_3x3(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::win_dim_t width,
                      hlsv::win_dim_t height, ap_uint<1> border, hlsf::scale_t scale, hlsf::delta_t delta,
                      hlsf::coeff_t c0, hlsf::coeff_t c1, hlsf::coeff_t c2, hlsf::coeff_t c3, hlsf::coeff_t c4,
                      hlsf::coeff_t c5, hlsf::coeff_t c6, hlsf::coeff_t c7, hlsf::coeff_t c8,
                      hlsv::win_status_t& status);

/// 2D konvoluce 5x5 (koeficienty jako pole v AXI4-Lite, jen OOC srovnání)
void hls_filter2d_5x5(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::win_dim_t width,
                      hlsv::win_dim_t height, ap_uint<1> border, hlsf::scale_t scale, hlsf::delta_t delta,
                      hlsf::coeff_t coeff[25], hlsv::win_status_t& status);

/// 2D konvoluce 7x7 (koeficienty jako pole v AXI4-Lite, jen OOC srovnání)
void hls_filter2d_7x7(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::win_dim_t width,
                      hlsv::win_dim_t height, ap_uint<1> border, hlsf::scale_t scale, hlsf::delta_t delta,
                      hlsf::coeff_t coeff[49], hlsv::win_status_t& status);

#endif // HLS_FILTER_HLS_FILTER2D_HPP_
