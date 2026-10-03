/**
 * @file    hls_csc.hpp
 * @brief   HLS jádro lineárního převodu barevných prostorů (matice 3x3, koeficienty Q2.15)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Aritmetika je bitově shodná s golden modelem (lib_imgproc/imgproc/csc.c):
 *   acc = sum_i(coeff[o][i] * in[i]) + (offset[o] << 15)
 *   out = saturate_0_255((acc + 2^14) >> 15)
 * Koeficienty a offsety jsou registry AXI4-Lite (mění se za běhu z ARM, bez nového buildu).
 */

#ifndef HLS_CSC_HLS_CSC_HPP_
#define HLS_CSC_HLS_CSC_HPP_

#include "../common/hls_video.hpp"

constexpr int CSC_COEFF_BITS = 18;      ///< Šířka koeficientu (Q2.15 = port B DSP48E2)
constexpr int CSC_FRAC_BITS = 15;       ///< Zlomkové bity koeficientu
constexpr int CSC_OFFSET_BITS = 10;     ///< Šířka offsetu (celé číslo se znaménkem, -512..511)

using csc_coeff_t = ap_int<CSC_COEFF_BITS>;
using csc_offset_t = ap_int<CSC_OFFSET_BITS>;

/// Koeficienty jednoho převodu [výstup][vstup] a offsety výstupů
struct CscParams
{
    csc_coeff_t coeff[hlsv::RGB_CHANNELS][hlsv::RGB_CHANNELS];
    csc_offset_t offset[hlsv::RGB_CHANNELS];
};

/// Převod 3 -> 3 kanály (RGB -> YCbCr), registry c<výstup><vstup> a o<výstup>
void hls_csc_rgb(hlsv::stream_rgb_t& s_axis_video, hlsv::stream_rgb_t& m_axis_video,
                 csc_coeff_t c00, csc_coeff_t c01, csc_coeff_t c02,
                 csc_coeff_t c10, csc_coeff_t c11, csc_coeff_t c12,
                 csc_coeff_t c20, csc_coeff_t c21, csc_coeff_t c22,
                 csc_offset_t o0, csc_offset_t o1, csc_offset_t o2);

/// Převod 3 -> 1 kanál (RGB -> šedá)
void hls_csc_rgb_to_gray(hlsv::stream_rgb_t& s_axis_video, hlsv::stream_gray_t& m_axis_video,
                         csc_coeff_t c00, csc_coeff_t c01, csc_coeff_t c02, csc_offset_t o0);

/// Převod 1 -> 3 kanály (šedá -> RGB)
void hls_csc_gray_to_rgb(hlsv::stream_gray_t& s_axis_video, hlsv::stream_rgb_t& m_axis_video,
                         csc_coeff_t c00, csc_coeff_t c10, csc_coeff_t c20,
                         csc_offset_t o0, csc_offset_t o1, csc_offset_t o2);

#endif // HLS_CSC_HLS_CSC_HPP_
