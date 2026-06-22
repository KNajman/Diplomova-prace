#include "hls_passthrough.hpp"

/*
Dataflow, only pass input stream to output stream without any processing.
*/
void hls_passthrough(hls::stream<axis_video_dma> &in_stream, hls::stream<axis_video_dma> &out_stream)
{
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    
    // Block-Level: Definition of AXI4-Lite interface for control and status registers
    #pragma HLS INTERFACE s_axilite port=return bundle=control

    #pragma HLS PIPELINE II=1
    
    axis_video_dma in_packet = in_stream.read(); 
    axis_video_dma out_packet = in_packet;
    out_stream.write(out_packet);
}
