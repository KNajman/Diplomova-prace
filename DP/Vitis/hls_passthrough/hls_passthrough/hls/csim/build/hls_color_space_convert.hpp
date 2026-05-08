#ifndef HLS_COLOR_SPACE_CONVERT_HPP
#define HLS_COLOR_SPACE_CONVERT_HPP

// Standardní knihovny pro C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// pro HLS
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>

#include "ap_axi_sdata.h"

// ============================================================================
// DATOVÉ STRUKTURY PRO AXI4-STREAM (Využití Arbitrary Precision)
// ============================================================================

/*
Obalová struktura pro AXI-Stream video data pro libovolný barevný prostor a
pixel Určuje jen dataflow.
 */
template <int DATA_WIDTH>
struct axi_stream_video {   // Podle Xilinx AXI4-Stream Video Protocol XAPP793
  ap_uint<DATA_WIDTH> data; // Čistá datová složka (TDATA)
  ap_uint<DATA_WIDTH / 8>
      keep; // PŘIDÁNO: Zajišťuje platnost bajtů (potřebné pro AXI standard)
  ap_uint<DATA_WIDTH / 8> strb; // PŘIDÁNO: Strobing
  ap_uint<1> user;              // Start of Frame / VSYNC (TUSER)
  ap_uint<1> last;              // End of Line / HSYNC (TLAST)
};

// Sjednocený typ pro všechny video streamy (32 bitů pro AXI DMA)
const int AXI_DMA_WIDTH = 32;
using axis_video_dma = ap_axiu<AXI_DMA_WIDTH, 1, 0, 0>;

/*
 Univerzální struktura pro pixel v libovolném barevném prostoru, pokud se
 nezvolí jinak počítám s 8 bit na barvu a 3 kanály
*/
template <int NUM_CHANNELS = 3, int PIXEL_WIDTH = 8> struct color_pixel {
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
    ap_uint<NUM_CHANNELS *PIXEL_WIDTH> packed_data = cpu_data;
    for (int i = 0; i < NUM_CHANNELS; i++) {
#pragma HLS UNROLL
      channel[i] = packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH);
    }
  }

  /*
   Přetypování na ap_uint (Zabalení pro AXI-Stream / HW)
  */
  operator ap_uint<NUM_CHANNELS * PIXEL_WIDTH>() const {
#pragma HLS INLINE
    ap_uint<NUM_CHANNELS *PIXEL_WIDTH> packed_data = 0;

    for (int i = 0; i < NUM_CHANNELS; i++) {
#pragma HLS UNROLL
      packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH) = channel[i];
    }

    return packed_data;
  }

  /*
   Přetypování na standardní unsigned int (Zabalení pro CPU / Testbench)
  */
  operator unsigned int() const {
#pragma HLS INLINE
    ap_uint<NUM_CHANNELS *PIXEL_WIDTH> packed = *this;
    return static_cast<unsigned int>(packed);
  }
};

// ============================================================================
// KONKRÉTNÍ DATOVÉ TYPY PRO AXI-STREAM (Moderní C++ Using)
// ============================================================================
using gray_pixel = color_pixel<1, 8>;
using rgb_pixel = color_pixel<3, 8>;
using ycbcr_pixel = color_pixel<3, 8>;
using hsv_pixel = color_pixel<3, 8>;
using rgba_pixel = color_pixel<4, 8>;
// a například pro CMYK
// using cmyk_pixel = color_pixel<4,8>;

// ============================================================================
// HLAVICKY FUNKCÍ
// ============================================================================
void hls_color_space_convert_top(
    hls::stream<axis_video_dma> &s_axis_video, // Vstupní stream (např. RGB)
    hls::stream<axis_video_dma> &m_axis_video, // Výstupní stream (např. YCbCr)
    ap_int<16> coeffs[3][3],                   // Matice 3x3
    ap_int<16> offsets[3],                     // 3 offsety
    int width, int height);

/* Z RGB do HSV a zpět - tyto funkce jsou složitější kvůli nelineární povaze
 HSV, ale stále zpracovávají pixel po pixelu bez potřeby ukládání celých
 obrazů v paměti.*/
void hls_rgb_2_hsv(hls::stream<axis_video_dma> &s_axis_rgb,
                   hls::stream<axis_video_dma> &m_axis_hsv);

/* Zpětná neztrátová konverze z HSV do RGB, která zachovává přesnost a
/ minimalizuje využití hardwarových prostředků.
*/
void hls_hsv_2_rgb(hls::stream<axis_video_dma> &s_axis_hsv,
                   hls::stream<axis_video_dma> &m_axis_rgb);

void hls_passthrough(hls::stream<axis_video_dma> &in_stream,
                     hls::stream<axis_video_dma> &out_stream);
#endif // HLS_COLOR_SPACE_CONVERT_HPP
