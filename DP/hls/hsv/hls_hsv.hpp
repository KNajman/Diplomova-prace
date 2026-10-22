/**
 * @file    hls_hsv.hpp
 * @brief   HLS jádra převodu RGB -> HSV a HSV -> RGB, bodová jádra AXI4-Stream Video 24 b
 * @author  Bc. Karel Najman
 * @date    2026-10-22
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Výsledek je bitově shodný s golden modelem (DP/model/lib_imgproc/imgproc/hsv.c) a s VHDL
 * rgb2hsv_core / hsv2rgb_core:
 *   RGB -> HSV  celočíselný algoritmus OpenCV (RGB2HSV_b, tabulky sdiv a hdiv180, shift 12),
 *               bitově shodný s cv::cvtColor(COLOR_RGB2HSV); H 0..179, S a V 0..255
 *   HSV -> RGB  vlastní celočíselný algoritmus bez dělení (OpenCV počítá přes float)
 * Pořadí složek v TDATA: RGB = G, B, R (UG934, IMGPROC_RGB_IDX_*), HSV = H, S, V (IMGPROC_HSV_IDX_*).
 * Jádra nemají parametry - mapa registrů obsahuje jen řízení 0x00 - 0x0C (ap_ctrl_hs, GIE, IER, ISR),
 * stejně jako VHDL hsv_axil.
 */

#ifndef HLS_HSV_HLS_HSV_HPP_
#define HLS_HSV_HLS_HSV_HPP_

#include "../common/hls_video.hpp"

/// Převod RGB -> HSV, jedno volání je zpracování jednoho řádku (do TLAST)
void hls_rgb2hsv(hlsv::stream_rgb_t& s_axis_video, hlsv::stream_rgb_t& m_axis_video);

/// Převod HSV -> RGB, jedno volání je zpracování jednoho řádku (do TLAST)
void hls_hsv2rgb(hlsv::stream_rgb_t& s_axis_video, hlsv::stream_rgb_t& m_axis_video);

#endif // HLS_HSV_HLS_HSV_HPP_
