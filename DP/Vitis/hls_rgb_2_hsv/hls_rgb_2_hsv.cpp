#include "hls_rgb_2_hsv.hpp"

void hls_rgb_2_hsv(hls::stream<axis_rgb> &in_stream,
                   hls::stream<axis_hsv> &out_stream) {
  #pragma HLS PIPELINE II = 1
  #pragma HLS AGGREGATE variable = in_stream
  #pragma HLS AGGREGATE variable = out_stream
  #pragma HLS INTERFACE axis port = in_stream
  #pragma HLS INTERFACE axis port = out_stream
  #pragma HLS INTERFACE s_axilite port = return bundle = control
  #pragma HLS INTERFACE ap_ctrl_none port = return

  axis_rgb in_packet = in_stream.read();
  ap_uint<8> r = in_packet.data.channel[0];
  ap_uint<8> g = in_packet.data.channel[1];
  ap_uint<8> b = in_packet.data.channel[2];

  ap_uint<8> min_rg = (r < g) ? r : g;
  ap_uint<8> max_rg = (r > g) ? r : g;
  ap_uint<8> Cmin = (min_rg < b) ? min_rg : b;
  ap_uint<8> Cmax = (max_rg > b) ? max_rg : b;
  ap_uint<8> delta = Cmax - Cmin;

  ap_int<15> hue_out = 0;
  ap_uint<8> sat_out = 0;

  if (Cmax != 0) {
    ap_uint<24> sat_tmp = (ap_uint<24>)delta * 255 * INV_TBL.data[Cmax];
    sat_out = (ap_uint<8>)(sat_tmp >> 16);
  }

  if (delta != 0) {
    ap_int<10> diff = 0;
    ap_int<10> offset = 0;
    if (Cmax == r) {
      diff = (ap_int<10>)g - (ap_int<10>)b;
      offset = 0;
    } else if (Cmax == g) {
      diff = (ap_int<10>)b - (ap_int<10>)r;
      offset = 85;
    } else {
      diff = (ap_int<10>)r - (ap_int<10>)g;
      offset = 170;
    }

    ap_int<32> hue_tmp = (diff * 43 * (ap_int<32>)INV_TBL.data[delta]) >> 16;
    hue_out = (ap_uint<8>)((ap_int<10>)hue_tmp + offset);
  }

  axis_hsv out_packet;
  out_packet.data.channel[0] = hue_out;
  out_packet.data.channel[1] = sat_out;
  out_packet.data.channel[2] = Cmax;
  out_packet.user = in_packet.user;
  out_packet.last = in_packet.last;
  out_stream.write(out_packet);
}