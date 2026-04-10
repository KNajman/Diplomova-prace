#include "hls_color_space_convert.hpp"

// ============================================================================
// GENERICKÁ ŠABLONA PRO KONVERZI BAREVNÉHO PROSTORU
// ============================================================================

/**
 * @brief Univerzální IP jádro pro lineární maticovou transformaci barevných
 * prostorů.
 * * Modul provádí konverzi obrazových dat typu bod-bod pomocí afinní
 * transformace (násobení maticí 4x4 s akumulací a přičtením offsetu).
 * Architektura je optimalizována pro FPGA architektury rodiny Xilinx/AMD s
 * cílovou propustností 1 pixel / hodinový takt (II=1).
 * * @param in      Vstupní video tok (AXI4-Stream). Šířka datového vodiče TDATA
 * je odvozena šablonou (typicky 32 bitů). Signály TUSER (SOF) a TLAST (EOL) se
 * automaticky detekují a propagují na výstup pro zachování synchronizace rámce.
 * @param out     Výstupní video tok (AXI4-Stream).
 * @param coeffs  Konfigurační matice koeficientů 4x4. Mapováno na sběrnici
 * AXI4-Lite. Fyzicky implementováno jako 16 nezávislých registrů (LUT/FF) díky
 * kompletnímu rozdělení pole (ARRAY_PARTITION), což zajišťuje
 * paralelní přístup ke všem operandům v jednom taktu.
 * @param offsets Vektor offsetů 4x1 pro normalizaci výstupu. Mapováno na
 * AXI4-Lite.
 * * @note Modul je určen výhradně pro lineární transformace (RGB <-> YCbCr,
 * CMY, Sepia). Neimplementuje nelineární transformace vyžadující komparátory
 * extrémů nebo děličky (např. převod do HSV).
 * * @warning Prvky šablony AxiStreamColor musí využívat typy ap_int/ap_uint.
 * Modul nativně spoléhá na operátor decltype pro syntézu saturačních konstant.
 */
template <int IN_CH, int IN_W, int OUT_CH, int OUT_W>
void hls_color_space_convert_template(
    hls::stream<axi_stream_video<color_pixel<IN_CH, IN_W>>> &in_stream,
    hls::stream<axi_stream_video<color_pixel<OUT_CH, OUT_W>>> &out_stream,
    // Tranformační matice (např. 3x3, 4x4, 1x3)
    ap_int<16> coeffs[OUT_CH][IN_CH],
    // Offset
    ap_int<16> offsets[OUT_CH], int width, int height) {
// Sloučení strukturálních prvků do datového toku (TDATA).
#pragma HLS AGGREGATE variable = in_stream compact = bit
#pragma HLS AGGREGATE variable = out_stream compact = bit

// Destrukce BRAM inferencí. Rozpad na samostatné logické registry (FFs)
// pro zamezení konfliktů při paralelním čtení uvnitř rozbalené smyčky.
#pragma HLS ARRAY_PARTITION variable = coeffs complete dim = 0
#pragma HLS ARRAY_PARTITION variable = offsets complete dim = 1

  int total_pixels = width * height;

  // Hardwarové čítače souřadnic
  int x = 0;
  int y = 0;

  // Syntéza statických limitů saturace na úrovni pre-kompilace (nulová spotřeba
  // HW logiky). Odvozuje maximální povolenou hodnotu (samé jedničky) na základě
  // bitové šířky kanálu z šablony (např. 255 pro 8-bit).
  const int MAX_VAL = (1 << OUT_W) - 1;

  for (int i = 0; i < total_pixels; i++) {
// Cílení na plné zřetězení (Pipelining).
// II=1 vynucuje propustnost 1 pixel/takt a automaticky rozbaluje vnitřní
// smyčky.
#pragma HLS PIPELINE II = 1

    // Čtení vstupního paketu
    axi_stream_video<color_pixel<IN_CH, IN_W>> in_packet = in_stream.read();
    axi_stream_video<color_pixel<OUT_CH, OUT_W>> out_packet;

    // Fyzická implementace paralelních cest MAC (Multiply-Accumulate).
    // Cyklus je nástrojem implicitně rozbalen (Unrolled) kvůli direktivě
    // PIPELINE.
    for (int out_c = 0; out_c < OUT_CH; out_c++) {
#pragma HLS UNROLL

      // Inferování DSP48E1/DSP48E2 řezů.
      // Použití 48bitového typu ap_int přesně odpovídá architektuře
      // hardwarového akumulátoru v DSP bloku. Zabraňuje jakémukoliv datovému
      // přetečení během mezivýpočtů matice.
      ap_int<48> sum = 0;

      for (int in_c = 0; in_c < IN_CH; in_c++) {
        // Díky ARRAY_PARTITION a UNROLL se zde vygeneruje plně paralelní strom
        // násobiček
        sum += coeffs[out_c][in_c] * in_packet.data.channel[in_c];
      }

      // Aplikace zisku (Q8.8 bitový posun) a offsetu. Z pohledu HW se jedná o
      // prosté přeznačení vodičů (posun) a následnou sčítačku (LUT adder).
      ap_int<48> result = (sum >> 8) + offsets[out_c];

      // Saturace: Ořezání výsledku do rozsahu [0, MAX_VAL]
      if (result < 0) {
        result = 0;
      } else if (result > MAX_VAL) {
        result = MAX_VAL;
      }

      // Fyzický zápis (Wire assignment) na výstupní porty.
      // Automatické oříznutí MSB bitů dle deklarace kanálu v šabloně.
      out_packet.data.channel[out_c] = (ap_uint<OUT_W>)result;
    }

    // Propagace postranních signálů sběrnice AXI4-Stream (synchronizace rámce).
    out_packet.user = (x == 0 && y == 0) ? 1 : 0;
    out_packet.last = (x == width - 1) ? 1 : 0;

    // Zápis na výstup
    out_stream.write(out_packet);

    // Posun souřadnic
    if (x == width - 1) {
      x = 0;
      y++;
    } else {
      x++;
    }
  }
}

// ============================================================================
// TOP-LEVEL FUNKCE (Fyzická definice IP Jádra pro Vivado)
// ============================================================================
void hls_color_space_convert_top(
    hls::stream<axis_rgb> &s_axis_video,   // Vstupní AXI stream (RGB)
    hls::stream<axis_ycbcr> &m_axis_video, // Výstupní AXI stream (YCbCr)
    ap_int<16> coeffs[3][3],               // Matice 3x3
    ap_int<16> offsets[3],                 // 3 offsety
    int width, int height) {
// Deklarace video datových rozhraní (AXI4-Stream)
#pragma HLS INTERFACE axis port = s_axis_video
#pragma HLS INTERFACE axis port = m_axis_video

// Mapování konfiguračních portů na paměťově mapované rozhraní (AXI4-Lite)
// Toto umožní procesoru (Zynq PS) za běhu měnit matici a parametry videa
#pragma HLS INTERFACE s_axilite port = coeffs bundle = control
#pragma HLS INTERFACE s_axilite port = offsets bundle = control
#pragma HLS INTERFACE s_axilite port = width bundle = control
#pragma HLS INTERFACE s_axilite port = height bundle = control

// Způsob řízení IP jádra (Data-driven vs CPU-driven)
// Pokud použiješ 'ap_ctrl_none', jádro běží samo jakmile přijdou data.
// Pro video se ale častěji používá 'ap_ctrl_hs', aby ho CPU mohl
// zapnout/vypnout.
#pragma HLS INTERFACE s_axilite port = return bundle = control

  // Volání HW-optimalizované generické šablony
  // <IN_CH=3, IN_W=8, OUT_CH=3, OUT_W=8>
  const int INOUT_CH = 3; // RGB
  const int INOUT_W = 8;  // 8 bitů na kanál
  hls_color_space_convert_template<INOUT_CH, INOUT_W, INOUT_CH, INOUT_W>(
      s_axis_video, m_axis_video, coeffs, offsets, width, height);
}

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
#pragma HLS PIPELINE II = 1 // Nastavuje propustnost 1 pixel za hodinový takt.
#pragma HLS AGGREGATE variable = in_stream
#pragma HLS AGGREGATE variable = out_stream

// Definuje vstupní AXI-Stream rozhraní pro RGB data
#pragma HLS INTERFACE axis port = in_stream
// Definuje výstupní AXI-Stream rozhraní pro HSV data
#pragma HLS INTERFACE axis port = out_stream
#pragma HLS INTERFACE s_axilite port = return bundle = control
// Určuje, že tento blok bude řízen daty(Data - driven),nikoli CPU
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
    // TRIK 1: Násobení šesti nám rozbalí 256 do rozsahu 0-1530.
    ap_uint<12> h_mult = h * 6;
    ap_uint<12> h_scaled = h_mult + (h_mult >> 8);

    // TRIK 2: Horní 3 bity jsou číslo výseče (0-5). Žádné dělení!
    ap_uint<3> region = h_scaled >> 8;

    // TRIK 3: Spodních 8 bitů je automaticky zbytek (fraction) namapovaný
    // na krásných 0-255! Získali jsme ho zadarmo oříznutím (bitovým AND).
    ap_uint<8> f = h_scaled & 0xFF;

// Výpočet složek P, Q, T bez dělení!
// Využívám aproximaci  x/ 255 ~= (x+1 + x/256)/256 ~=(x+1 + x>>8) >> 8
#define DIV255(x) (((x) + 1 + ((x) >> 8)) >> 8)
    // Operace (255 - X) je v HW implementována jako prostá negace (NOT hradlo).

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

  // Zapisuje finální vypočítané hodnoty do výstupního ukazatele.
  axis_rgb out_packet;
  out_packet.data.channel[0] = r;
  out_packet.data.channel[1] = g;
  out_packet.data.channel[2] = b;

  // Propagace synchronizačních signálů z vstupu na výstup pro zachování
  // správné synchronizace v rámci AXI-Stream protokolu.
  out_packet.user = in_packet.user;
  out_packet.last = in_packet.last;

  // Odeslání
  out_stream.write(out_packet);
}
