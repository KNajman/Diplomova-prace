#ifndef HLS_HISTOGRAM_HPP
#define HLS_HISTOGRAM_HPP

#include "hls_video_types.hpp"
#include <hls_stream.h>

// ============================================================================
// 1. GENERICKÁ ŠABLONA ALGORITMU
// ============================================================================
template <int PIXEL_WIDTH = 8, int HIST_SIZE = 256>
void histogram_core(
    hls::stream<axi_stream_video<color_pixel<1, PIXEL_WIDTH>>> &stream_in,
    ap_uint<32> hist_out[HIST_SIZE], ap_uint<32> width, ap_uint<32> height) {
  // Alokace lokální BRAM paměti v FPGA
  ap_uint<32> local_hist[HIST_SIZE];
#pragma HLS BIND_STORAGE variable = local_hist type = ram_t2p impl = bram

  // 1. KROK: Vynulování BRAM (trvá HIST_SIZE taktů)
  for (int i = 0; i < HIST_SIZE; i++) {
#pragma HLS PIPELINE II = 1
    local_hist[i] = 0;
  }

  // Proměnné pro řešení RAW hazardu
  ap_uint<PIXEL_WIDTH> old_pixel = 0; // Generický typ místo natvrdo ap_uint<8>
  ap_uint<32> old_count = 0;
  bool is_first_pixel = true;

  ap_uint<32> total_pixels = width * height;

  // 2. KROK: Průchod obrazem (Zpracování streamu)
  for (ap_uint<32> i = 0; i < total_pixels; i++) {
#pragma HLS PIPELINE II = 1

    // Bezpečné načtení jednoho pixelu z AXI-Streamu
    axi_stream_video<color_pixel<1, PIXEL_WIDTH>> packet = stream_in.read();
    ap_uint<PIXEL_WIDTH> curr_pixel = packet.data.channel[0];

    ap_uint<32> current_count;

    // --- HARDWAROVÉ KOUZLO: Ochrana proti RAW Hazardu ---
    if (!is_first_pixel && (curr_pixel == old_pixel)) {
      // Přišel stejný pixel jako minule! Ignorujeme čtení BRAM a přičítáme
      // rovnou.
      current_count = old_count + 1;
    } else {
      // Přišel nový pixel. Načteme hodnotu z BRAM.
      current_count = local_hist[curr_pixel] + 1;

      // Zápis předchozího pixelu do BRAM.
      if (!is_first_pixel) {
        local_hist[old_pixel] = old_count;
      }
    }

    // Uložení aktuálních hodnot do zpožďovacích registrů pro příští takt
    old_pixel = curr_pixel;
    old_count = current_count;
    is_first_pixel = false;
  }

  // Na konci snímku musíme zapsat poslední pixel (pokud obraz nebyl 0x0)
  if (!is_first_pixel) {
    local_hist[old_pixel] = old_count;
  }

  // 3. KROK: Odeslání výsledku (Z lokální BRAM na výstupní port)
  for (int i = 0; i < HIST_SIZE; i++) {
#pragma HLS PIPELINE II = 1
    hist_out[i] = local_hist[i];
  }
}

// ============================================================================
// 2. DEKLARACE KONKRÉTNÍCH TOP-LEVEL FUNKCÍ
// ============================================================================
const int HIST_BINS_8BIT = 256;

void hls_histogram_gray(hls::stream<axis_gray> &stream_in,
                        ap_uint<32> hist_out[HIST_BINS_8BIT], ap_uint<32> width,
                        ap_uint<32> height);

#endif // HLS_HISTOGRAM_HPP