#include "hls_passthrough.hpp"
/*
Dataflow, only pass input stream to output stream without any processing.
Založeno na specifikaci XAPP793 pro AXI4-Stream Video.
*/
void hls_passthrough(hls::stream<axis_video> &in_stream,
                     hls::stream<axis_video> &out_stream, int height,
                     int width) {

  #pragma HLS INTERFACE axis port = in_stream
  #pragma HLS INTERFACE axis port = out_stream
  // Block-Level: Definition of AXI4-Lite interface for control
  #pragma HLS INTERFACE s_axilite port = height bundle = control
  #pragma HLS INTERFACE s_axilite port = width bundle = control
  #pragma HLS INTERFACE s_axilite port = return bundle = control

  for (int i = 0; i < height; i++) {
    #pragma HLS LOOP_FLATTEN
    for (int j = 0; j < width; j++) {
    #pragma HLS PIPELINE II = 1
      axis_video packet = in_stream.read();
      out_stream.write(packet);
    }
  }
}
