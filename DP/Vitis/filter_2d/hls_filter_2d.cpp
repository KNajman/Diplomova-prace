#include "hls_filter_2d.hpp"

// ============================================================================
// TOP-LEVEL FUNKCE IP JÁDRA
// ============================================================================

void hls_filter_2d(
    hls::stream<axis_gray> &s_axis_video, hls::stream<axis_gray> &m_axis_video,
    ap_uint<COORD_BITS> width, ap_uint<COORD_BITS> height,
    ap_int<KERNEL_WIDTH> kernel[KERNEL_SIZE][KERNEL_SIZE],
    ap_int<ACCUMULATOR_WIDTH> inv_divisor,
    ap_uint<5> fraction_bits,
    ap_int<ACCUMULATOR_WIDTH> delta,
    ap_uint<1> borderType // 0 = HW_VALID, 1 = HW_SAME (Doplnění nulami)
) {
  // Mapování AXI-Stream rozhraní
#pragma HLS INTERFACE axis port = s_axis_video
#pragma HLS INTERFACE axis port = m_axis_video

// Mapování konfiguračních registrů na AXI4-Lite (pro procesor)
#pragma HLS INTERFACE s_axilite port = width bundle = control
#pragma HLS INTERFACE s_axilite port = height bundle = control
#pragma HLS INTERFACE s_axilite port = kernel bundle = control
#pragma HLS INTERFACE s_axilite port = inv_divisor bundle = control
#pragma HLS INTERFACE s_axilite port = fraction_bits bundle = control
#pragma HLS INTERFACE s_axilite port = delta bundle = control
#pragma HLS INTERFACE s_axilite port = borderType bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control

// Rozbalení jádra na jednotlivé registry pro paralelní přístup DSP bloků
#pragma HLS ARRAY_PARTITION variable = kernel complete dim = 0

  // Řádkové paměti dimenzované přesně podle nastavených parametrů
  ap_uint<PIXEL_WIDTH> line_buffer[KERNEL_SIZE - 1][MAX_IMG_WIDTH];
#pragma HLS ARRAY_PARTITION variable = line_buffer complete dim = 1

  // Posuvné okno konvoluce
  ap_uint<PIXEL_WIDTH> window[KERNEL_SIZE][KERNEL_SIZE];
#pragma HLS ARRAY_PARTITION variable = window complete dim = 0

  // Výpočet hraničních cyklů (provedeno na přesných bitových šířkách)
  ap_uint<TOTAL_PIXELS_BITS> total_pixels = width * height;
  ap_uint<FLUSH_CYCLES_BITS> flush_cycles = (RADIUS * width) + RADIUS;
  ap_uint<TOTAL_CYCLES_BITS> total_cycles = total_pixels + flush_cycles;

  // Optimalizované souřadnicové čítače
  ap_uint<COORD_BITS> x = 0;
  ap_uint<COORD_BITS> out_x = 0;
  ap_uint<COORD_BITS> out_y = 0;

  for (ap_uint<TOTAL_CYCLES_BITS> i = 0; i < total_cycles; i++) {
#pragma HLS PIPELINE II = 1

    // ---------------------------------------------------------------------
    // 1. ČTENÍ (Slave AXI-Stream) A LOGIKA OKNA
    // ---------------------------------------------------------------------

    ap_uint<PIXEL_WIDTH> new_pixel = 0;
    // using new_pixel = color_pixel<1,PIXEL_WIDTH>;

    if (i < total_pixels) {
      // axis_gray in_packet = *s_axis_video++;

      // 2. Extrahujeme data z lokální kopie
      new_pixel = s_axis_video.read().data;
      // new_pixel = (*s_axis_video++).data;
    }

    // Posuv oken
    for (size_t r = 0; r < KERNEL_SIZE; r++) {
      for (size_t c = 0; c < KERNEL_SIZE - 1; c++) {
        window[r][c] = window[r][c + 1];
      }
    }

    for (size_t r = 0; r < KERNEL_SIZE - 1; r++) {
      window[r][KERNEL_SIZE - 1] = line_buffer[r][x];
    }
    window[KERNEL_SIZE - 1][KERNEL_SIZE - 1] = new_pixel;

    if (x < width) {
      for (size_t r = 0; r < KERNEL_SIZE - 2; r++) {
        line_buffer[r][x] = line_buffer[r + 1][x];
      }
      line_buffer[KERNEL_SIZE - 2][x] = new_pixel;
    }

    if (x == width - 1) {
      x = 0;
    } else {
      x++;
    }

    // ---------------------------------------------------------------------
    // 2. VÝPOČET KONVOLUCE
    // ---------------------------------------------------------------------
    if (i >= flush_cycles) {
      ap_int<ACCUMULATOR_WIDTH> sum = 0;

      for (size_t r = 0; r < KERNEL_SIZE; r++) {
        for (size_t c = 0; c < KERNEL_SIZE; c++) {

          // Znaménkové souřadnice pro detekci okrajů (Padding)
          ap_int<COORD_BITS + 2> img_x =
              (ap_int<COORD_BITS + 2>)out_x - RADIUS + c;
          ap_int<COORD_BITS + 2> img_y =
              (ap_int<COORD_BITS + 2>)out_y - RADIUS + r;

          ap_uint<PIXEL_WIDTH> val = 0;

          // Zero-padding podmínka
          if (img_x >= 0 && img_x < width && img_y >= 0 && img_y < height) {
            val = window[r][c];
          }

          sum += (ap_int<ACCUMULATOR_WIDTH>)val *
                 (ap_int<ACCUMULATOR_WIDTH>)kernel[r][c];
        }
      }

      // Normalizace posunem a aplikace delty (offsetu)
      sum = (sum * inv_divisor) >> fraction_bits;
      sum += delta;

      // Saturace obrazu podle datové šířky pixelu
      const int MAX_PIXEL_VAL = (1 << PIXEL_WIDTH) - 1;
      if (sum < 0)
        sum = 0;
      if (sum > MAX_PIXEL_VAL)
        sum = MAX_PIXEL_VAL;

      // -----------------------------------------------------------------
      // 3. VÝSTUP (Master AXI-Stream) A ŘÍZENÍ REŽIMŮ
      // -----------------------------------------------------------------
      bool output_valid = false;

      if (borderType == 1) { // SAME
        output_valid = true;
      } else { // VALID
        if (out_x >= RADIUS && out_x < (width - RADIUS) && out_y >= RADIUS &&
            out_y < (height - RADIUS)) {
          output_valid = true;
        }
      }

      if (output_valid) {
        axis_gray out_paket;
        out_paket.data = (ap_uint<PIXEL_WIDTH>)sum;

        out_paket.user = (out_x == 0 && out_y == 0) ? 1 : 0;

        if (borderType == 1) {
          out_paket.last = (out_x == width - 1) ? 1 : 0;
        } else {
          out_paket.last = (out_x == width - RADIUS - 1) ? 1 : 0;
        }

        m_axis_video.write(out_paket);
      }

      // Inkrementace výstupních souřadnic
      if (out_x == width - 1) {
        out_x = 0;
        out_y++;
      } else {
        out_x++;
      }
    }
  }
}