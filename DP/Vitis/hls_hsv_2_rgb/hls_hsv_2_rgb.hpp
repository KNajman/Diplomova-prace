#ifndef HLS_HSV_2_RGB
#define HLS_HSV_2_RGB

#include <hls_stream.h>

#include "hls_video_types.hpp"

void hls_hsv_2_rgb(hls::stream<axis_hsv> &s_axis_video,
                   hls::stream<axis_rgb> &m_axis_video);

#endif // HLS_HSV_2_RGB
