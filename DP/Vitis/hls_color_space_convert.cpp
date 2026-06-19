#include "hls_color_space_convert.hpp"

//#include <stdint.h>

template <int IN_CH, int IN_W, int OUT_CH, int OUT_W>
static void hls_color_space_convert_template(
    hls::stream<axi_stream_video<color_pixel<IN_CH, IN_W>>> &in_stream,
    hls::stream<axi_stream_video<color_pixel<OUT_CH, OUT_W>>> &out_stream,
    ap_int<16> coeffs[OUT_CH][IN_CH], ap_int<16> offsets[OUT_CH], int width,
    int height) {
#pragma HLS AGGREGATE variable = in_stream compact = bit
#pragma HLS AGGREGATE variable = out_stream compact = bit
#pragma HLS ARRAY_PARTITION variable = coeffs complete dim = 0
#pragma HLS ARRAY_PARTITION variable = offsets complete dim = 1

  int total_pixels = width * height;
  int x = 0;
  int y = 0;
  const int MAX_VAL = (1 << OUT_W) - 1;

  for (int i = 0; i < total_pixels; i++) {
#pragma HLS PIPELINE II = 1
    axi_stream_video<color_pixel<IN_CH, IN_W>> in_packet = in_stream.read();
    axi_stream_video<color_pixel<OUT_CH, OUT_W>> out_packet;

    for (int out_c = 0; out_c < OUT_CH; out_c++) {
#pragma HLS UNROLL
      ap_int<48> sum = 0;

      for (int in_c = 0; in_c < IN_CH; in_c++) {
        sum += coeffs[out_c][in_c] * in_packet.data.channel[in_c];
      }

      ap_int<48> result = (sum >> 8) + offsets[out_c];
      if (result < 0) {
        result = 0;
      } else if (result > MAX_VAL) {
        result = MAX_VAL;
      }

      out_packet.data.channel[out_c] = (ap_uint<OUT_W>)result;
    }

    out_packet.user = (x == 0 && y == 0) ? 1 : 0;
    out_packet.last = (x == width - 1) ? 1 : 0;
    out_stream.write(out_packet);

    if (x == width - 1) {
      x = 0;
      y++;
    } else {
      x++;
    }
  }
}

void hls_color_space_convert_top(
    hls::stream<axis_rgb> &s_axis_video, hls::stream<axis_ycbcr> &m_axis_video,
    ap_int<16> coeffs[3][3], ap_int<16> offsets[3], int width, int height) {
#pragma HLS INTERFACE axis port = s_axis_video
#pragma HLS INTERFACE axis port = m_axis_video
#pragma HLS INTERFACE s_axilite port = coeffs bundle = control
#pragma HLS INTERFACE s_axilite port = offsets bundle = control
#pragma HLS INTERFACE s_axilite port = width bundle = control
#pragma HLS INTERFACE s_axilite port = height bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control

  const int INOUT_CH = 3;
  const int INOUT_W = 8;
  hls_color_space_convert_template<INOUT_CH, INOUT_W, INOUT_CH, INOUT_W>(
      s_axis_video, m_axis_video, coeffs, offsets, width, height);
}

struct InvTable {
  uint32_t data[256];

  constexpr InvTable() : data() {
    for (int i = 0; i < 256; i++) {
      data[i] = (i == 0) ? 0 : (65536 + (i >> 1)) / i;
    }
  }
};

constexpr InvTable INV_TBL;



