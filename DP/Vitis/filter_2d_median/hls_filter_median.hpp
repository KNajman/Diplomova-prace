#ifndef HLS_FILTER_MEDIAN
#define HLS_FILTER_MEDIAN

#include "hls_video_types.hpp"

// Standardní knihovny pro C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// pro HLS
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>


// ============================================================================
// KONFIGURACE HARDWARU (Ekvivalent VHDL Generics)
// ============================================================================

// 1. Parametry konvoluce
const int KERNEL_SIZE = 3;
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

// // ============================================================================
// // DATOVÉ STRUKTURY PRO AXI4-STREAM (Využití Arbitrary Precision)
// // ============================================================================

// /*
// Obalová struktura pro AXI-Stream video data pro libovolný barevný prostor a
// pixel Určuje jen dataflow.
//  */
// template <typename PIXEL_TYPE>
// struct axi_stream_video { // Podle Xilinx AXI4-Stream Video Protocol XAPP793
//   PIXEL_TYPE data;        // Čistá datová složka (TDATA)
//   ap_uint<1> user;        // Start of Frame / VSYNC (TUSER)
//   ap_uint<1> last;        // End of Line / HSYNC (TLAST)
// };

// /*
//  Univerzální struktura pro pixel v libovolném barevném prostoru
// */
// template <int NUM_CHANNELS, int PIXEL_WIDTH = 8> struct color_pixel {
//     /* Pole kanálů (např. 3 pro RGB, 4 pro CMYK) */
//     ap_uint<PIXEL_WIDTH> channel[NUM_CHANNELS];

//       /*
//       Výchozí konstruktor (Inicializace nulou)
//       */
//         color_pixel() {
//       #pragma HLS INLINE
//           for (int i = 0; i < NUM_CHANNELS; i++) {
//       #pragma HLS UNROLL
//             channel[i] = 0;
//           }
//         }

//     /*
//     Konstruktor pro rozbalení z hardwarového formátu (ap_uint)
//     Načte široké číslo a pomocí bitového řezu ho rozseká do kanálů.
//     */
//     color_pixel(ap_uint<NUM_CHANNELS * PIXEL_WIDTH> packed_data) {
//     #pragma HLS INLINE
//         for (int i = 0; i < NUM_CHANNELS; i++) {
//     #pragma HLS UNROLL
//           /* Extrakce konkrétních bitů: např. pro 8bit kanály:
//           i=0 -> bity 7:0
//           i=1 -> bity 15:8
//           */
//           channel[i] = packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH);
//         }
//       }

//     /*
//     Konstruktor pro rozbalení ze softwarového formátu (unsigned int)
//     Vhodné pro testbench a inicializaci hexadecimálním kódem.
//     */
//     color_pixel(unsigned int cpu_data) {
//   #pragma HLS INLINE
//       ap_uint<NUM_CHANNELS *PIXEL_WIDTH> packed_data = cpu_data;
//       for (int i = 0; i < NUM_CHANNELS; i++) {
//   #pragma HLS UNROLL
//         channel[i] = packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH);
//       }
//     }

//     /*
//     Přetypování na ap_uint (Zabalení pro AXI-Stream / HW)
//     */
//     operator ap_uint<NUM_CHANNELS * PIXEL_WIDTH>() const {
//   #pragma HLS INLINE
//       ap_uint<NUM_CHANNELS *PIXEL_WIDTH> packed_data = 0;

//       for (int i = 0; i < NUM_CHANNELS; i++) {
//   #pragma HLS UNROLL
//         packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH) = channel[i];
//       }

//       return packed_data;
//     }

//     /*
//     Přetypování na standardní unsigned int (Zabalení pro CPU / Testbench)
//     */
//     operator unsigned int() const {
//   #pragma HLS INLINE
//       ap_uint<NUM_CHANNELS *PIXEL_WIDTH> packed = *this;
//       return static_cast<unsigned int>(packed);
//     }
// };

// // ============================================================================
// // KONKRÉTNÍ DATOVÉ TYPY PRO AXI-STREAM (Moderní C++ Using)
// // ============================================================================
// using gray_pixel = color_pixel<1, 8>;
// using rgb_pixel = color_pixel<3, 8>;
// using ycbcr_pixel = color_pixel<3, 8>;
// using hsv_pixel = color_pixel<3, 9>;
// using rgba_pixel = color_pixel<4, 8>;
// // a například pro CMYK
// // using cmyk_pixel = color_pixel<4,8>;

// // Vytvoření plnohodnotných AXI-Stream strukturusing axis_rgb =
// // axi_stream_video
// using axis_gray = axi_stream_video<gray_pixel>;
// using axis_rgb = axi_stream_video<rgb_pixel>;
// using axis_ycbcr = axi_stream_video<ycbcr_pixel>;
// using axis_hsv = axi_stream_video<hsv_pixel>;


// ============================================================================
// Hlavičky
// ============================================================================

// ============================================================================
// FUNKCE PRO SORTING NETWORK
// ============================================================================

/*
Generický komparátor hledající minumum
*/
template<typename T>
T hls_min(T a, T b) {
    return (a < b) ? a : b;
}

/*
Generický komparátor hledajicí maximum
*/
template<typename T>
T hls_max(T a, T b) {
    return (a > b) ? a : b;
}

// Pro zadanou trojici čísel nalezt hodnoty MIN, MED a MAX.
template<typename T>
void sort_three(T a, T b, T c, T &min_val, T &med_val, T &max_val) {
    T tmp_min1 = hls_min(a, b);
    T tmp_max1 = hls_max(a, b);
    
    min_val    = hls_min(tmp_min1, c);
    T tmp_max2 = hls_max(tmp_min1, c);
    
    med_val    = hls_min(tmp_max1, tmp_max2);
    max_val    = hls_max(tmp_max1, tmp_max2);
}

void hls_filter_median_3x3(
    hls::stream<axis_gray> &s_axis_video, 
    hls::stream<axis_gray> &m_axis_video,
    ap_uint<COORD_BITS> width, 
    ap_uint<COORD_BITS> height
);

#endif // HLS_FILTER_MEDIAN