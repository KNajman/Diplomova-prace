#include "hls_passthrough.hpp"

/*
Dataflow, only pass input stream to output stream without any processing.
*/
void hls_passthrough(hls::stream<axis_video> &in_stream,
                     hls::stream<axis_video> &out_stream) {
  #pragma HLS INTERFACE axis port = in_stream
  #pragma HLS INTERFACE axis port = out_stream
  // Block-Level: Definition of AXI4-Lite interface for control
  #pragma HLS INTERFACE s_axilite port = return bundle = control

  bool eol = 0; //konec řádku
  while (!eol) {
  #pragma HLS PIPELINE II = 1
    axis_video packet = in_stream.read();
    eol = packet.last;
    out_stream.write(packet);
  }
}
