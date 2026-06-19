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
  #ifndef HLS_COLOR_SPACE_CONVERT_HPP
  #define HLS_COLOR_SPACE_CONVERT_HPP

  #include "../hls_color_space_convert.hpp"

  #endif // HLS_COLOR_SPACE_CONVERT_HPP
template <int NUM_CHANNELS, int PIXEL_WIDTH = 8> struct color_pixel {
