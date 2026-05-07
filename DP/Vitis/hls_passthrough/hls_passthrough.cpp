#include "hls_color_space_convert.hpp"

/*
Přicházející data na streamu pouze předá na výstupní stream
*/
void hls_passthrough(hls::stream<axis_video_dma> &in_stream, hls::stream<axis_video_dma> &out_stream)
{
    #pragma HLS PIPELINE II = 1
    // #pragma HLS AGGREGATE variable = in_stream
    // #pragma HLS AGGREGATE variable = out_stream

    #pragma HLS INTERFACE axis port = in_stream
    #pragma HLS INTERFACE axis port = out_stream

    #pragma HLS INTERFACE ap_ctrl_none port=return

    axis_video_dma in_packet = in_stream.read(); 
    axis_video_dma out_packet = in_packet;
    out_stream.write(out_packet);
}
