#ifndef HLS_RGB_2_HSV
#define HLS_RGB_2_HSV

#include <hls_stream.h>

#include "hls_video_types.hpp"

void hls_rgb_2_hsv(hls::stream<axis_rgb> &s_axis_video,
                   hls::stream<axis_hsv> &m_axis_video);

#endif // HLS_RGB_2_HSV
