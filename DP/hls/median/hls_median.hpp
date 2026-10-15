/**
 * @file    hls_median.hpp
 * @brief   HLS jádro mediánového filtru 3x3 (šedotónové video)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Bitově shodné s imgproc_median3x3() golden modelu; s replikací okraje i s cv::medianBlur(src, dst, 3).
 * Rámec (řádkové buffery, okraje, flush, resynchronizace) je společná šablona hlsv::window_frame.
 */

#ifndef HLS_MEDIAN_HLS_MEDIAN_HPP_
#define HLS_MEDIAN_HLS_MEDIAN_HPP_

#include "../common/hls_window.hpp"

/**
 * @brief Mediánový filtr 3x3 jednoho snímku.
 * @param s_axis_video  Vstup AXI4-Stream Video (8 b)
 * @param m_axis_video  Výstup (stejný rozměr)
 * @param width         Šířka snímku (8 .. 3840)
 * @param height        Výška snímku
 * @param border        0 = nuly, 1 = replikace okraje
 * @param status        Výstup: příznaky hlsv::WIN_STATUS_*
 */
void hls_median(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::win_dim_t width,
                hlsv::win_dim_t height, ap_uint<1> border, hlsv::win_status_t& status);

#endif // HLS_MEDIAN_HLS_MEDIAN_HPP_
