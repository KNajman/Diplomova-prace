#ifndef VYBRANE_ALGORITMY_HPP
#define VYBRANE_ALGORITMY_HPP

// Standardní knihovny pro C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// pro HLS
#include <ap_int.h>
#include <hls_math.h>

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

//=============================================================================
// YCbCr má více standardů (Rec.601, Rec.709, Rec.2020), pro jednoduchost
// použijeme rozsah 8 bitů pro každý kanál
// =============================================================================

/*
Koeficienty pro Rec.601 - SD
Y  =  0.299*R + 0.587*G + 0.114*B
Cb = -0.169*R - 0.331*G + 0.5*B + 128
Cr =  0.5*R - 0.419*G - 0.081*B + 128
 */
ap_int<16> rec601_coeffs[3][3] = {
    {77, 150, 29},   // Koeficienty pro výpočet Y
    {-43, -85, 128}, // Koeficienty pro výpočet Cb (U)
    {128, -107, -21} // Koeficienty pro výpočet Cr (V)
};

ap_int<16> rec601_offsets[3] = {0, 128, 128};

/*Koeficienty pro Rec.709 - HD
Y  =  0.2126*R + 0.7152*G + 0.0722*B
Cb = -0.114*R - 0.385*G + 0.5*B + 128
Cr =  0.5*R - 0.454*G - 0.046*B + 128
*/
 ap_int<16> rec709_coeffs[3][3] = {
    {54, 183, 19},   // Koeficienty pro výpočet Y
    {-43, -85, 128}, // Koeficienty pro výpočet Cb (U)
    {128, -107, -21} // Koeficienty pro výpočet Cr (V)
};
 ap_int<16> rec709_offsets[3] = {0, 128, 128};

/*
Koeficienty pro Rec.2020 - 4K
Y  =  0.2126*R + 0.7152*G + 0.0722*B
Cb = -0.114*R - 0.385*G + 0.5*B + 128
Cr =  0.5*R - 0.454*G - 0.046*B + 128
*/
 ap_int<16> rec2020_coeffs[3][3] = {
    {63, 173, 20},   // Koeficienty pro výpočet Y
    {-43, -85, 128}, // Koeficienty pro výpočet Cb (U)
    {128, -107, -21} // Koeficienty pro výpočet Cr (V)
};
 ap_int<16> rec2020_offsets[3] = {0, 128, 128};

// ============================================================================
// KONKRÉTNÍ DATOVÉ TYPY PRO AXI-STREAM (Moderní C++ Using)
// ============================================================================
using gray_pixel = color_pixel<1, 8>;
using rgb_pixel = color_pixel<3, 8>;
using ycbcr_pixel = color_pixel<3, 8>;
using hsv_pixel = color_pixel<3, 9>;
using rgba_pixel = color_pixel<4, 8>;
// a například pro CMYK
// using cmyk_pixel = color_pixel<4,8>;

// Vytvoření plnohodnotných AXI-Stream strukturusing axis_rgb =
// axi_stream_video
using axis_gray = axi_stream_video<gray_pixel>;
using axis_rgb = axi_stream_video<rgb_pixel>;
using axis_ycbcr = axi_stream_video<ycbcr_pixel>;
using axis_hsv = axi_stream_video<hsv_pixel>;

// ============================================================================
// HLAVICKY FUNKCÍ
// ============================================================================

// ===========================================================================
// ČÁST BAREVNÉ TRANSFORMACE (Point Operations)
// Tyto operace jsou bez paměti, "stream like", zpracování pixel po pixelu.
// ===========================================================================

/*
*/
void hls_color_space_convert_top(
    axis_rgb *s_axis_video,   // Vstupní stream (např. RGB)
    axis_ycbcr *m_axis_video, // Výstupní stream (např. YCbCr)
    ap_int<16> coeffs[3][3],  // Matice 3x3
    ap_int<16> offsets[3],    // 3 offsety
    int width, int height);

/* Z RGB do HSV a zpět - tyto funkce jsou složitější kvůli nelineární povaze
 HSV, ale stále zpracovávají pixel po pixelu bez potřeby ukládání celých
 obrazů v paměti.*/
void hls_rgb_2_hsv(axis_rgb *in, axis_hsv *out);

/* Zpětná neztrátová konverze z HSV do RGB, která zachovává přesnost a
/ minimalizuje využití hardwarových prostředků.
*/
void hls_hsv_2_rgb(axis_hsv *in, axis_rgb *out);



// Deklarace funkce
void hls_threshold(axis_gray in, axis_gray *out, ap_uint<8> thresh_val,
                   ap_uint<2> thresh_type);

// ============================================================================
// KONFIGURACE HARDWARU (Ekvivalent VHDL Generics)
// ============================================================================

// 1. Parametry konvoluce
const int KERNEL_SIZE = 5;
const int RADIUS = KERNEL_SIZE / 2;

// 2. Datové šířky (Ovlivňují velikost BRAM, registrů a DSP bloků)
const int PIXEL_WIDTH = 8;        // Šířka obrazového bodu (Grayscale)
const int KERNEL_WIDTH = 8;       // Šířka koeficientu jádra (Se znaménkem)
const int ACCUMULATOR_WIDTH = 32; // Šířka vnitřního sčítače konvoluce

// 3. Maximální podporované rozlišení (Rozhoduje o velikosti Line Bufferu)
const int MAX_IMG_WIDTH = 7680; // 8K rozlišení

// 4. Bitové šířky čítačů pro syntézu optimálních sčítaček (místo 32-bit int)
// (Pro MAX_IMG_WIDTH 7680 potřebujeme 13 bitů, protože 2^13 = 8192)
const int COORD_BITS = 13;
const int TOTAL_PIXELS_BITS = COORD_BITS * 2;        // 26 bitů (13 + 13)
const int FLUSH_CYCLES_BITS = COORD_BITS + 3;        // Rezerva pro okraje
const int TOTAL_CYCLES_BITS = TOTAL_PIXELS_BITS + 1; // +1 bit proti přetečení

// 3. Konvoluční operace (Area operations)
void hls_filter_2d(
    axis_gray *s_axis_video, // Standardní pojmenování pro Slave AXI-Stream
    axis_gray *m_axis_video, // Standardní pojmenování pro Master AXI-Stream
    ap_uint<COORD_BITS> width, ap_uint<COORD_BITS> height,
    ap_int<KERNEL_WIDTH> kernel[KERNEL_SIZE][KERNEL_SIZE],
    ap_int<ACCUMULATOR_WIDTH> inv_divisor, ap_uint<5> fraction_bits,
    ap_int<ACCUMULATOR_WIDTH> delta,
    ap_uint<1> borderType // 0 = HW_VALID, 1 = HW_SAME (Doplnění nulami)
);

#endif // VYBRANE_ALGORITMY_HPP