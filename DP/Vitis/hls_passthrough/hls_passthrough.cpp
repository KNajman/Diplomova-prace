#include "hls_color_space_convert.hpp"

/*
Přicházející data na in_stream pouze předá na výstupní out_stream
*/
void hls_passthrough(hls::stream<axis_video_dma> &in_stream, hls::stream<axis_video_dma> &out_stream)
{
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    
    // Block-Level: Řízení bloku přes AXI-Lite
    #pragma HLS INTERFACE s_axilite port=return

    #pragma HLS PIPELINE II=1
    
    axis_video_dma in_packet = in_stream.read(); 
    axis_video_dma out_packet = in_packet;
    out_stream.write(out_packet);
}
