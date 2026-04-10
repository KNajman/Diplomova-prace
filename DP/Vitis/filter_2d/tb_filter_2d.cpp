#include "hls_filter_2d.hpp"

#include <cmath>
#include <cstdlib>
#include <iostream>
#include <vector>

using namespace std;

// ============================================================================
// SOFTWAROVÝ "ZLATÝ MODEL" (Náhrada za cv::filter2D)
// ============================================================================

void sw_filter_2d_golden(const vector<uint8_t> &src, vector<uint8_t> &dst,
                         int width, int height,
                         int kernel[KERNEL_SIZE][KERNEL_SIZE], int inv_divisor,
                         int fraction_bits, int delta, int mode) {
  int radius = KERNEL_SIZE / 2;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {

      // Logika režimu VALID - přeskočíme okraje
      if (mode == 0 && (x < radius || x >= width - radius || y < radius ||
                        y >= height - radius)) {
        continue;
      }

      int sum = 0;
      for (int r = 0; r < KERNEL_SIZE; r++) {
        for (int c = 0; c < KERNEL_SIZE; c++) {
          int img_x = x - radius + c;
          int img_y = y - radius + r;

          int val = 0;
          if (img_x >= 0 && img_x < width && img_y >= 0 && img_y < height) {
            val = src[img_y * width + img_x]; // Čtení ze pseudo-2D pole
          }
          sum += val * kernel[r][c];
        }
      }

      sum = (sum * inv_divisor) >> fraction_bits;
      sum += delta;

      if (sum < 0)
        sum = 0;
      if (sum > 255)
        sum = 255;

      dst[y * width + x] = sum;
    }
  }
}

// ============================================================================
// UNIVERZÁLNÍ TESTOVACÍ FUNKCE
// ============================================================================
int run_filter_test(const string &test_name, int width, int height,
                    int kernel_in[KERNEL_SIZE][KERNEL_SIZE], double divisor,
                    int delta, int mode) {
  cout << "--- Spoustim test: " << test_name << " ---" << endl;

  vector<uint8_t> sw_src(width * height);
  vector<uint8_t> sw_dst(width * height, 0);
  // vector<axis_gray> hw_in_stream(width * height);
  // vector<axis_gray> hw_out_stream(width * height);

  hls::stream<axis_gray> hw_in_stream("in_stream");
  hls::stream<axis_gray> hw_out_stream("out_stream");

  // Vygenerování testovacích dat (Šum)
  for (int i = 0; i < width * height; i++) {
    uint8_t val = rand() % 256;
    sw_src[i] = val;
  }

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      axis_gray in_pixel;
      in_pixel.data = sw_src[y * width + x];

      // Simulace AXI-Stream synchronizace
      in_pixel.user = (x == 0 && y == 0) ? 1 : 0;
      in_pixel.last = (x == width - 1) ? 1 : 0;

      // Vložení pixelu do fronty
      hw_in_stream.write(in_pixel);
    }
  }

  // Příprava jádra pro HW
  ap_int<KERNEL_WIDTH> hw_kernel[KERNEL_SIZE][KERNEL_SIZE];
  for (int r = 0; r < KERNEL_SIZE; r++) {
    for (int c = 0; c < KERNEL_SIZE; c++) {
      hw_kernel[r][c] = kernel_in[r][c];
    }
  }

  ap_uint<5> fraction_bits = 16;
  ap_int<ACCUMULATOR_WIDTH> inv_divisor = round((1 << 16) / divisor);

  // 1. Spuštění našeho SW zlatého modelu
  sw_filter_2d_golden(sw_src, sw_dst, width, height, kernel_in, inv_divisor,
                      fraction_bits, delta, mode);

  // 2. Spuštění HW modelu
  hls_filter_2d(hw_in_stream, hw_out_stream, width, height, hw_kernel,
                inv_divisor, fraction_bits, delta, mode);

  // 3. Porovnání
  int errors = 0;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {

      bool is_valid_pixel =
          (mode == 1) || (x >= RADIUS && x < (width - RADIUS) && y >= RADIUS &&
                          y < (height - RADIUS));

      if (is_valid_pixel) {
        int hw_val = hw_out_stream.read().data;
        int sw_val = sw_dst[y * width + x];

        if (hw_val != sw_val) {
          if (errors < 10) {
            cout << "-> Mismatch @[" << x << "," << y << "]: "
                 << "HW=" << hw_val << ", SW=" << sw_val << endl;
          }
          errors++;
        }
      }
    }
  }

  if (errors == 0)
    cout << "-> VYSLEDEK: OK" << endl << endl;
  else
    cout << "-> VYSLEDEK: SELHALO s " << errors << " chybami!" << endl << endl;

  return errors;
}

int main() {
  cout << "=========================================" << endl;
  cout << " SPUSTENI STANDALONE HLS TESTBENCHU" << endl;
  cout << "=========================================" << endl << endl;

  int fails = 0;
  const int W = 64;
  const int H = 32;

  int kernel_identity[KERNEL_SIZE][KERNEL_SIZE] = {0};
  kernel_identity[RADIUS][RADIUS] = 1;
  fails +=
      run_filter_test("Identita (VALID)", W, H, kernel_identity, 1.0, 0, 0);

  int kernel_edge[KERNEL_SIZE][KERNEL_SIZE] = {{0, 0, 0, 0, 0},
                                               {0, 0, -1, 0, 0},
                                               {0, -1, 4, -1, 0},
                                               {0, 0, -1, 0, 0},
                                               {0, 0, 0, 0, 0}};
  fails +=
      run_filter_test("Detekce Hran (SAME)", W, H, kernel_edge, 1.0, 128, 1);

  return fails;
}