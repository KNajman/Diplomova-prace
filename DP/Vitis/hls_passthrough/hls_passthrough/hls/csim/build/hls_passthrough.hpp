#ifndef HLS_PASSTHROUGH_HPP
#define HLS_PASSTHROUGH_HPP

#include <ap_axi_sdata.h>
#include <hls_stream.h>

#include "../hls_video_types.hpp"

const int AXI_DMA_WIDTH = 32;
using axis_video_dma = ap_axiu<AXI_DMA_WIDTH, 1, 0, 0>;

void hls_passthrough(hls::stream<axis_video_dma> &in_stream,
                     hls::stream<axis_video_dma> &out_stream);

#endif // HLS_PASSTHROUGH_HPP