#ifndef HLS_PASSTHROUGH_HPP
#define HLS_PASSTHROUGH_HPP

#include "../hls_video_types.hpp"

void hls_passthrough(hls::stream<axis_video> &in_stream,
                     hls::stream<axis_video> &out_stream, int height,
                     int width);

#endif // HLS_PASSTHROUGH_HPP