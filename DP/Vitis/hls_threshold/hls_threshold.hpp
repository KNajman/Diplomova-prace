#ifndef HLS_THRESHOLD_HPP
#define HLS_THRESHOLD_HPP

#include "../hls_video_types.hpp"
#include <hls_stream.h>

#define THRESH_BINARY 0
#define THRESH_TRUNC 1
#define THRESH_TOZERO_INV 2

// ============================================================================
// GENERICKÝ ŠABLONA PRO PRAHOVÁNÍ (Všechny typy pixelů, všechny režimy)
// ============================================================================
template <int PIXEL_WIDTH>
void hls_threshold(
    hls::stream<axi_stream_video<color_pixel<1, PIXEL_WIDTH>>> &stream_in,
    hls::stream<axi_stream_video<color_pixel<1, PIXEL_WIDTH>>> &stream_out,
    ap_uint<PIXEL_WIDTH> thresh_val, ap_uint<2> thresh_type, ap_uint<32> width,
    ap_uint<32> height) {
  // V inline šablonách se pragmas pro pipelining používat mohou
  ap_uint<32> total_pixels = width * height;
  const ap_uint<PIXEL_WIDTH> MAX_VAL = (1 << PIXEL_WIDTH) - 1;

  for (ap_uint<32> i = 0; i < total_pixels; i++) {
    #pragma HLS PIPELINE II = 1

    axi_stream_video<color_pixel<1, PIXEL_WIDTH>> in_packet = stream_in.read();
    axi_stream_video<color_pixel<1, PIXEL_WIDTH>> out_packet;

    ap_uint<PIXEL_WIDTH> pixel_in = in_packet.data.channel[0];
    ap_uint<PIXEL_WIDTH> pixel_out = 0;

    if (thresh_type == THRESH_BINARY) {
      pixel_out = (pixel_in > thresh_val) ? MAX_VAL : (ap_uint<PIXEL_WIDTH>)0;
    } else if (thresh_type == THRESH_TRUNC) {
      pixel_out = (pixel_in > thresh_val) ? thresh_val : pixel_in;
    } else {
      pixel_out = (pixel_in > thresh_val) ? (ap_uint<PIXEL_WIDTH>)0 : pixel_in;
    }

    out_packet.data.channel[0] = pixel_out;
    out_packet.user = in_packet.user;
    out_packet.last = in_packet.last;

    stream_out.write(out_packet);
  }
}

// ============================================================================
// DEKLARACE KONKRÉTNÍCH TOP-LEVEL FUNKCÍ
// ============================================================================

// Tuto funkci uvidí syntéza a udělá z ní IP jádro pro 8-bit Gray
void hls_threshold_gray(hls::stream<axis_gray> &s_axis_video,
                        hls::stream<axis_gray> &m_axis_video,
                        ap_uint<8> thresh_val, ap_uint<2> thresh_type,
                        ap_uint<32> width, ap_uint<32> height);

#endif // HLS_THRESHOLD_HPP