/**
 * @file    hls_threshold.hpp
 * @brief   HLS jádro prahování jasu (5 typů jako cv::threshold), bodové jádro AXI4-Stream Video 8 b
 * @author  Bc. Karel Najman
 * @date    2026-10-19
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Výsledek je bitově shodný s imgproc_threshold_pixel() golden modelu:
 *   typ 0 BINARY      above ? maxval : 0        typ 3 TOZERO      above ? value : 0
 *   typ 1 BINARY_INV  above ? 0 : maxval        typ 4 TOZERO_INV  above ? 0 : value
 *   typ 2 TRUNC       above ? thresh : value    above = value > thresh; neplatný typ 5..7 -> 0
 * Mapa registrů (pořadí argumentů) je shodná s VHDL threshold_axil:
 *   0x10 thresh [7:0], 0x18 maxval [7:0], 0x20 type [2:0]
 */

#ifndef HLS_THRESHOLD_HLS_THRESHOLD_HPP_
#define HLS_THRESHOLD_HLS_THRESHOLD_HPP_

#include "../common/hls_video.hpp"

constexpr int THRESH_TYPE_BITS = 3;     ///< Šířka registru type (5 typů OpenCV, 5..7 neplatné)

using thresh_type_t = ap_uint<THRESH_TYPE_BITS>;

/// Prahování šedého obrazu, jedno volání = jeden řádek (do TLAST)
void hls_threshold(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::pixel_t thresh,
                   hlsv::pixel_t maxval, thresh_type_t type);

#endif // HLS_THRESHOLD_HLS_THRESHOLD_HPP_
