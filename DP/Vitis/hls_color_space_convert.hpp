#ifndef HLS_COLOR_SPACE_CONVERT_HPP
#define HLS_COLOR_SPACE_CONVERT_HPP

#include <hls_stream.h>

#include "hls_video_types.hpp"

void hls_color_space_convert_top(
    hls::stream<axis_rgb> &s_axis_video,
    hls::stream<axis_ycbcr> &m_axis_video,
    ap_int<16> coeffs[3][3], ap_int<16> offsets[3], int width, int height);

void hls_rgb_2_hsv(hls::stream<axis_rgb> &s_axis_video,
                   hls::stream<axis_hsv> &m_axis_video);

void hls_hsv_2_rgb(hls::stream<axis_hsv> &s_axis_video,
                   hls::stream<axis_rgb> &m_axis_video);

#endif // HLS_COLOR_SPACE_CONVERT_HPP
