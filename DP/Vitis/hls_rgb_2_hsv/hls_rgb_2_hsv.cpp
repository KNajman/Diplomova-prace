#include "hls_rgb_2_hsv.hpp"

/*
 Moderní C++ technika (Constexpr) pro vygenerování ROM tabulky během kompilace.
 Nahrazuje hardwarovou děličku pamětí/tabulkou předpočítaných hodnot
 (BRAM/LUTRAM) a jedním násobením. Vypočítá (1 << 16) / x.
*/
struct InvTable {
  uint32_t data[256]; // POUŽIT STANDARDNÍ TYP, ODSTRANĚNO 'const'

  constexpr InvTable() : data() {
    for (int i = 0; i < 256; i++) {
      // if (i == 0) {
      //   data[i] = 0;
      // } else {
      //   data[i] = 65536 / i;
      // }
      data[i] = (i == 0)
                    ? 0
                    : (65536 + (i >> 1)) / i; // Zaokrouhlení pro lepší přesnost
    }
  }
};

// Samotná instance už je constexpr (tedy i const)
constexpr InvTable INV_TBL;

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
      offset = 60;
    } else {
      diff = (ap_int<10>)r - (ap_int<10>)g;
      offset = 120;
    }

    ap_int<32> hue_tmp = (diff * 30 * (ap_int<32>)INV_TBL.data[delta]) >> 16;
    ap_int<12> hue_calc = hue_tmp + offset;

    // Korekce záporného úhlu
    if (hue_calc < 0) {
      hue_calc += 180;
    }
    
    hue_out = (ap_uint<8>)hue_calc;
  }

  axis_hsv out_packet;
  out_packet.data.channel[0] = hue_out;
  out_packet.data.channel[1] = sat_out;
  out_packet.data.channel[2] = Cmax;
  out_packet.user = in_packet.user;
  out_packet.last = in_packet.last;
  out_stream.write(out_packet);
}