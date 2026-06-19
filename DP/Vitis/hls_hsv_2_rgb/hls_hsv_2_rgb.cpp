#include "hsv_2_rgb.h"

void hls_hsv_2_rgb(hls::stream<axis_hsv> &in_stream,
                   hls::stream<axis_rgb> &out_stream) {
  // Nastavuje propustnost 1 pixel za hodinový takt.
  #pragma HLS PIPELINE II = 1
  #pragma HLS AGGREGATE variable = in_stream
  #pragma HLS AGGREGATE variable = out_stream
  #pragma HLS INTERFACE axis port = in_stream
  #pragma HLS INTERFACE axis port = out_stream
  #pragma HLS INTERFACE s_axilite port = return bundle = control
  #pragma HLS INTERFACE ap_ctrl_none port = return

  axis_hsv in_packet = in_stream.read();

  // Extrakce hodnot H, S, V z AXI-Stream struktury.
  ap_uint<8> h = in_packet.data.channel[0];
  ap_uint<8> s = in_packet.data.channel[1];
  ap_uint<8> v = in_packet.data.channel[2];

  ap_uint<8> r = v, g = v, b = v; // Výchozí barva pro případ s=0 (odstíny šedi)

  // Ošetřuje okrajovou hodnotu odstínu, aby se zabránilo přetečení v
  // následujících výpočtech.
  if (h >= 360) {
    h = 0;
  }

  if (s != 0) {
    // Násobení šesti rozdělí 256 do rozsahu 0-1530.
    ap_uint<12> h_mult = h * 6;
    ap_uint<12> h_scaled = h_mult + (h_mult >> 8);

    // Horní 3 bity jsou číslo výseče (0-5).
    ap_uint<3> region = h_scaled >> 8;

    // Spodních 8 bitů je automaticky zbytek (fraction) namapovaný
    ap_uint<8> f = h_scaled & 0xFF;

// Výpočet složek P, Q, T bez dělení!
// Využívám aproximaci  x/ 255 ~= (x+1 + x/256)/256 ~=(x+1 + x>>8) >> 8
  #define DIV255(x) (((x) + 1 + ((x) >> 8)) >> 8)
    // Operace (255 - X) je v HW implementována jako negace

    ap_uint<8> p = DIV255(v * (255 - s));

    ap_uint<8> s_f = DIV255((s * f));
    ap_uint<8> q = DIV255((v * (255 - s_f)));

    ap_uint<8> s_nf = DIV255(s * (255 - f));
    ap_uint<8> t = DIV255(v * (255 - s_nf));

    // Čistý paralelní MUX
    switch (region) {
    case 0: // 0°-60°: R=V, G=T, B=P
      // r = v;
      g = t;
      b = p;
      break;
    case 1: // 60°-120°: R=Q, G=V, B=P
      r = q;
      // g = v;
      b = p;
      break;
    case 2: // 120°-180°: R=P, G=V, B=T
      r = p;
      // g = v;
      b = t;
      break;
    case 3: // 180°-240°: R=P, G=Q, B=V
      r = p;
      g = q;
      // b = v;
      break;
    case 4: // 240°-300°: R=T, G=P, B=V
      r = t;
      g = p;
      // b = v;
      break;
    default: // 300°-360°: R=V, G=P, B=Q
      // r = v;
      g = p;
      b = q;
      break;
    }
  }

  // Zapisuje finálních hodnot do výstupního ukazatele.
  axis_rgb out_packet;
  out_packet.data.channel[0] = r;
  out_packet.data.channel[1] = g;
  out_packet.data.channel[2] = b;

  // Propagace synchronizačních signálů z vstupu na výstup pro zachování
  // správné synchronizace v rámci AXI-Stream protokolu.
  out_packet.user = in_packet.user;
  out_packet.last = in_packet.last;

  // Zápis
  out_stream.write(out_packet);
}

/*
void hls_hsv_2_rgb(hls::stream<axis_hsv> &in_stream,
                   hls::stream<axis_rgb> &out_stream) {
#pragma HLS PIPELINE II = 1
#pragma HLS AGGREGATE variable = in_stream
#pragma HLS AGGREGATE variable = out_stream
#pragma HLS INTERFACE axis port = in_stream
#pragma HLS INTERFACE axis port = out_stream
#pragma HLS INTERFACE s_axilite port = return bundle = control
#pragma HLS INTERFACE ap_ctrl_none port = return

  axis_hsv in_packet = in_stream.read();
  ap_uint<8> h = in_packet.data.channel[0];
  ap_uint<8> s = in_packet.data.channel[1];
  ap_uint<8> v = in_packet.data.channel[2];

  ap_uint<8> r = v, g = v, b = v;

  if (h >= 360) {
    h = 0;
  }

  if (s != 0) {
    ap_uint<12> h_mult = h * 6;
    ap_uint<12> h_scaled = h_mult + (h_mult >> 8);
    ap_uint<3> region = h_scaled >> 8;
    ap_uint<8> f = h_scaled & 0xFF;

#define DIV255(x) (((x) + 1 + ((x) >> 8)) >> 8)
    ap_uint<8> p = DIV255(v * (255 - s));
    ap_uint<8> s_f = DIV255((s * f));
    ap_uint<8> q = DIV255((v * (255 - s_f)));
    ap_uint<8> s_nf = DIV255(s * (255 - f));
    ap_uint<8> t = DIV255(v * (255 - s_nf));

    switch (region) {
    case 0:
      g = t;
      b = p;
      break;
    case 1:
      r = q;
      b = p;
      break;
    case 2:
      r = p;
      b = t;
      break;
    case 3:
      r = p;
      g = q;
      break;
    case 4:
      r = t;
      g = p;
      break;
    default:
      g = p;
      b = q;
      break;
    }
  }

  axis_rgb out_packet;
  out_packet.data.channel[0] = r;
  out_packet.data.channel[1] = g;
  out_packet.data.channel[2] = b;
  out_packet.user = in_packet.user;
  out_packet.last = in_packet.last;
  out_stream.write(out_packet);
}
*/