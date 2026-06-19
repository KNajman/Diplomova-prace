#ifndef HLS_COLOR_SPACE_CONVERT_HPP
#define HLS_COLOR_SPACE_CONVERT_HPP

// Standardní knihovny pro C
#include <stdint.h>

// pro HLS
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>

// ============================================================================
// DATOVÉ STRUKTURY PRO AXI4-STREAM (Využití Arbitrary Precision)
// ============================================================================

/*
Obalová struktura pro AXI-Stream video data pro libovolný barevný prostor a
pixel Určuje jen dataflow.
 */
template <typename PIXEL_TYPE>
struct axi_stream_video { // Podle Xilinx AXI4-Stream Video Protocol XAPP793
  PIXEL_TYPE data;        // Čistá datová složka (TDATA)
  ap_uint<1> user;        // Start of Frame / VSYNC (TUSER)
  ap_uint<1> last;        // End of Line / HSYNC (TLAST)
};

/*
 Univerzální struktura pro pixel v libovolném barevném prostoru
*/
template <int NUM_CHANNELS, int PIXEL_WIDTH = 8> struct color_pixel {
  /* Pole kanálů (např. 3 pro RGB, 4 pro CMYK) */
  ap_uint<PIXEL_WIDTH> channel[NUM_CHANNELS];

  /*
   Výchozí konstruktor (Inicializace nulou)
  */
  color_pixel() {
#pragma HLS INLINE
    for (int i = 0; i < NUM_CHANNELS; i++) {
#pragma HLS UNROLL
      channel[i] = 0;
    }
  }

  /*
   Konstruktor pro rozbalení z hardwarového formátu (ap_uint)
   Načte široké číslo a pomocí bitového řezu ho rozseká do kanálů.
  */
  color_pixel(ap_uint<NUM_CHANNELS * PIXEL_WIDTH> packed_data) {
#pragma HLS INLINE
    for (int i = 0; i < NUM_CHANNELS; i++) {
#pragma HLS UNROLL
      /* Extrakce konkrétních bitů: např. pro 8bit kanály:
       i=0 -> bity 7:0
       i=1 -> bity 15:8
      */
      channel[i] = packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH);
    }
  }

  /*
   Konstruktor pro rozbalení ze softwarového formátu (unsigned int)
   Vhodné pro testbench a inicializaci hexadecimálním kódem.
  */
  color_pixel(unsigned int cpu_data) {
#pragma HLS INLINE
    ap_uint<NUM_CHANNELS * PIXEL_WIDTH> packed_data = cpu_data;
    for (int i = 0; i < NUM_CHANNELS; i++) {
#pragma HLS UNROLL
      channel[i] = packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH);
    }
  }

  /*
   Přetypování na ap_uint (Zabalení pro AXI-Stream / HW)
  */
  #ifndef HLS_COLOR_SPACE_CONVERT_HPP
  #define HLS_COLOR_SPACE_CONVERT_HPP

  #include "../hls_color_space_convert.hpp"

  #endif // HLS_COLOR_SPACE_CONVERT_HPP
      packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH) = channel[i];
