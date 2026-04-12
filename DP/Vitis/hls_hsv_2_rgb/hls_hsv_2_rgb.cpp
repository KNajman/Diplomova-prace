#include "hls_color_space_convert.hpp"

/*
 Constexpr pro vygenerování ROM tabulky během kompilace.
 Nahrazuje extrémně hardwarovou děličku pamětí (BRAM/LUTRAM)
 a jedním násobením. Vypočítá (1 << 16) / x.
*/
struct InvTable {
  uint32_t data[256];

  constexpr InvTable() : data() {
    for (int i = 0; i < 256; i++) {
      // if (i == 0) {
      //   data[i] = 0;
      // } else {
      //   data[i] = 65536 / i;
      // }
      data[i] = (i == 0)? 0 : (65536 + (i >> 1)) / i; // Zaokrouhlení pro lepší přesnost
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
// Určuje, že tento blok bude řízen daty(Data - driven)
#pragma HLS INTERFACE ap_ctrl_none port = return

  axis_rgb in_packet = in_stream.read();

  // Extrakce hodnot R, G, B z AXI-Stream struktury.
  ap_uint<8> r = in_packet.data.channel[0];
  ap_uint<8> g = in_packet.data.channel[1];
  ap_uint<8> b = in_packet.data.channel[2];

  // Komparatory pro nalezení minimální a maximální hodnoty mezi R, G, B.
  ap_uint<8> min_rg = (r < g) ? r : g;
  ap_uint<8> max_rg = (r > g) ? r : g;

  // Určení celkového minima a maxima pro výpočet delty
  ap_uint<8> Cmin = (min_rg < b) ? min_rg : b;
  ap_uint<8> Cmax = (max_rg > b) ? max_rg : b; // Je taktéž Value (jas)

  ap_uint<8> delta = Cmax - Cmin; // max hodnota 255

  ap_int<15> hue_out = 0; // Odstín v rozsahu 0-255 (pro 360° mapujeme na 0-255)
  ap_uint<8> sat_out = 0; // Sytost v rozsahu 0-255

  // Výpočet sytosti (Saturation) pomocí předpočítané převrácené hodnoty
  if (Cmax != 0) {
    /* Místo: (delta * 255) / Cmax
    (delta * 255 * (1/Cmax)) >> 16 */
    ap_uint<24> sat_tmp = (ap_uint<24>)delta * 255 * INV_TBL.data[Cmax];
    sat_out = (ap_uint<8>)(sat_tmp >> 16);
  }

  /* Výpočet odstínu (Hue) s eliminací děličky */
  if (delta != 0) {
    ap_int<10> diff = 0;
    ap_int<10> offset = 0;

    // Vybírá příslušný rozdíl kanálů a úhlový posun (offset) podle dominantní
    // barvy.
    if (Cmax == r) {
      diff = (ap_int<10>)g - (ap_int<10>)b;
      offset = 0; // 0° v mapování 0-255
    } else if (Cmax == g) {
      diff = (ap_int<10>)b - (ap_int<10>)r;
      offset = 85; // 120° v mapování 0-255
    } else {
      diff = (ap_int<10>)r - (ap_int<10>)g;
      offset = 170; // 240° v mapování 0-255
    }

    // 60° v mapování 0-255 je přibližně 43
    // Místo: (diff * 43) / delta
    ap_int<32> hue_tmp = (diff * 43 * (ap_int<32>)INV_TBL.data[delta]) >> 16;

    // Saturaci řeší přetečení
    // Pokud hue_tmp vyjde záporně, nebo po přičtení offsetu přesáhne 255,
    // díky datovému tipu ap_uint<8> se hue_out správně ořízne do rozsahu 0-255
    hue_out = (ap_uint<8>)((ap_int<10>)hue_tmp + offset);
  }

  // Zapisuje finální vypočítané hodnoty do výstupního ukazatele.
  axis_hsv out_packet;
  out_packet.data.channel[0] = hue_out;
  out_packet.data.channel[1] = sat_out;
  out_packet.data.channel[2] = Cmax;

  // Propagace synchronizačních signálů z vstupu na výstup pro zachování
  // správné synchronizace v rámci AXI-Stream protokolu.
  out_packet.user = in_packet.user;
  out_packet.last = in_packet.last;

  // Odeslání
  out_stream.write(out_packet);
}

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
