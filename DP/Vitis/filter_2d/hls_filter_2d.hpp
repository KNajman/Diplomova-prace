#ifndef HLS_FILTER_2D_HPP
#define HLS_FILTER_2D_HPP

// Standardní knihovny pro C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// Pro HLS
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>

// Připojení našich vlastních sdílených video typů
#include "hls_video_types.hpp"

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
// (Pro MAX_IMG_WIDTH 7680 potřebuje 13 bitů, protože 2^13 = 8192), lze určit dynamicky jako ceil(log2(MAX_IMG_WIDTH))
const int COORD_BITS = ceil(log2(MAX_IMG_WIDTH)); //
const int TOTAL_PIXELS_BITS = COORD_BITS * 2;        // 26 bitů (13 + 13)
const int FLUSH_CYCLES_BITS = COORD_BITS + 3;        // Rezerva pro okraje
const int FLUSH_CYCLES_BITS =  //dynamicky vypo
const int TOTAL_CYCLES_BITS = TOTAL_PIXELS_BITS + 1; // +1 bit proti přetečení

// ============================================================================
// HLAVIČKY (Prototypy funkcí)
// ============================================================================

/**
 * @brief Top-level funkce HLS konvolučního 2D filtru.
 * @param s_axis_video Vstupní AXI4-Stream rozhraní.
 * @param m_axis_video Výstupní AXI4-Stream rozhraní.
 * @param width        Šířka zpracovávaného obrazu.
 * @param height       Výška zpracovávaného obrazu.
 * @param kernel       Matice koeficientů konvolučního jádra.
 * @param inv_divisor  Inverzní dělitel (pro normalizaci násobením místo dělení).
 * @param fraction_bits Počet bitů pro bitový posun (nahrazuje dělení).
 * @param delta        Posun výstupní hodnoty (jasový offset).
 * @param borderType   Režim okrajů (0 = VALID, 1 = SAME).
 */
void hls_filter_2d(
    hls::stream<axis_gray> &s_axis_video, 
    hls::stream<axis_gray> &m_axis_video,
    ap_uint<COORD_BITS> width, 
    ap_uint<COORD_BITS> height,
    ap_int<KERNEL_WIDTH> kernel[KERNEL_SIZE][KERNEL_SIZE],
    ap_int<ACCUMULATOR_WIDTH> inv_divisor, 
    ap_uint<5> fraction_bits,
    ap_int<ACCUMULATOR_WIDTH> delta,
    ap_uint<1> borderType
);

#endif // HLS_FILTER_2D_HPP