#include "hls_filter_median.hpp"
#include <algorithm> // Obsahuje std::sort pro zlatý model
#include <cstdlib>
#include <iostream>
#include <vector>
#include <string>

using namespace std;

// ============================================================================
// 1. UNIT TESTY PRO ZÁKLADNÍ KOMPONENTY
// ============================================================================

int test_min_max() {
  int errors = 0;
  cout << "--- Spoustim test: MIN / MAX ---" << endl;

  if (hls_min<int>(0, 1) != 0) errors++;
  if (hls_max<int>(0, 1) != 1) errors++;
  if (hls_min<int>(5, 10) != 5) errors++;
  if (hls_max<int>(5, 10) != 10) errors++;
  if (hls_min<int>(255, 0) != 0) errors++;
  if (hls_max<int>(255, 0) != 255) errors++;
  if (hls_min<int>(128, 128) != 128) errors++;

  if (errors == 0)
    cout << "-> OK\n" << endl;
  else
    cout << "-> SELHALO (" << errors << " chyb)\n" << endl;
  return errors;
}

int test_sort_three() {
  int errors = 0;
  cout << "--- Spoustim test: sort_three (Tridici sit) ---" << endl;

  int test_cases[6][3] = {{1, 2, 3}, {1, 3, 2}, {2, 1, 3},
                          {2, 3, 1}, {3, 1, 2}, {3, 2, 1}};

  for (int i = 0; i < 6; i++) {
    int a = test_cases[i][0];
    int b = test_cases[i][1];
    int c = test_cases[i][2];

    int min_val, med_val, max_val;
    sort_three<int>(a, b, c, min_val, med_val, max_val);

    if (min_val != 1 || med_val != 2 || max_val != 3) {
      cout << "Chyba pro vstup: " << a << ", " << b << ", " << c
           << " -> Vystup: " << min_val << ", " << med_val << ", " << max_val
           << endl;
      errors++;
    }
  }

  if (errors == 0)
    cout << "-> OK\n" << endl;
  else
    cout << "-> SELHALO (" << errors << " chyb)\n" << endl;
  return errors;
}

// ============================================================================
// 2. SOFTWAROVÝ "ZLATÝ MODEL" PRO MEDIÁN 3x3
// ============================================================================

void sw_median_3x3_golden(const vector<uint8_t> &src, vector<uint8_t> &dst,
                          int width, int height) {
  int radius = KERNEL_SIZE / 2; // Pro 3x3 je radius 1

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {

      if (x < radius || x >= width - radius || y < radius || y >= height - radius) {
        continue;
      }

      vector<uint8_t> window_pixels;
      for (int r = -radius; r <= radius; r++) {
        for (int c = -radius; c <= radius; c++) {
          window_pixels.push_back(src[(y + r) * width + (x + c)]);
        }
      }

      sort(window_pixels.begin(), window_pixels.end());
      dst[y * width + x] = window_pixels[4];
    }
  }
}

// ============================================================================
// 3. TOP-LEVEL TEST FILTRU
// ============================================================================

// Funkce upravena tak, aby brala název testu a případně předpřipravená data
int run_median_test(string test_name, int width, int height, const vector<uint8_t>* custom_src = nullptr) {
  cout << "--- Spoustim test: " << test_name << " (" << width << "x" << height << ") ---" << endl;

  vector<uint8_t> sw_src(width * height);
  vector<uint8_t> sw_dst(width * height, 0);

  hls::stream<axis_gray> hw_in_stream("in_stream");
  hls::stream<axis_gray> hw_out_stream("out_stream");

  // Pokud jsme předali vlastní data, použijeme je. Jinak generujeme náhodný šum.
  if (custom_src != nullptr) {
    sw_src = *custom_src;
  } else {
    for (int i = 0; i < width * height; i++) {
      sw_src[i] = rand() % 256;
    }
  }

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      axis_gray in_pixel;
      in_pixel.data = sw_src[y * width + x];
      in_pixel.user = (x == 0 && y == 0) ? 1 : 0;
      in_pixel.last = (x == width - 1) ? 1 : 0;
      hw_in_stream.write(in_pixel);
    }
  }

  // 1. Spuštění SW referenčního modelu
  sw_median_3x3_golden(sw_src, sw_dst, width, height);

  // 2. Spuštění HW IP jádra
  hls_filter_median_3x3(hw_in_stream, hw_out_stream, width, height);

  // 3. Porovnání výsledků
  int errors = 0;
  int radius = KERNEL_SIZE / 2;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      bool is_valid_pixel = (x >= radius && x < (width - radius) &&
                             y >= radius && y < (height - radius));

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

  if (!hw_out_stream.empty()) {
    cout << "-> CHYBA: HW vygeneroval vice pixelu nez se ocekavalo!" << endl;
    errors++;
  }

  if (errors == 0)
    cout << "-> VYSLEDEK: OK\n" << endl;
  else
    cout << "-> VYSLEDEK: SELHALO s " << errors << " chybami!\n" << endl;

  return errors;
}

// ============================================================================
// HLAVNÍ FUNKCE TESTBENCHU
// ============================================================================

int main() {
  cout << "=========================================" << endl;
  cout << " SPUSTENI HLS TESTBENCHU PRO MEDIAN" << endl;
  cout << "=========================================\n" << endl;

  int total_fails = 0;
  
  // Definice rozměrů pro testy
  const int W = 64;
  const int H = 64;

  // 0. Základní testy
  total_fails += test_min_max();
  total_fails += test_sort_three();

  // Zkouška na malém rozlišení s náhodným šumem
  total_fails += run_median_test("Nahodny sum", W, H);

  // ==========================================
  // 1. TEST: Odstranění šumu (Izolovaná jednička)
  // ==========================================
  vector<uint8_t> src_noise(W * H, 0);
  src_noise[(H / 2) * W + (W / 2)] = 1;     // Jeden "vadný" pixel
  src_noise[(H / 2) * W + (W / 2) + 1] = 1; // Dva vedle sebe

  total_fails += run_median_test("Odstraneni sumu (0 a 1)", W, H, &src_noise);

  // ==========================================
  // 2. TEST: Ostrá hrana
  // ==========================================
  vector<uint8_t> src_edge(W * H, 0);
  for (int y = 0; y < H; y++) {
    for (int x = W / 2; x < W; x++) {
      src_edge[y * W + x] = 1; // Pravá polovina jsou 1
    }
  }

  total_fails += run_median_test("Ostra hrana (0 -> 1)", W, H, &src_edge);

  // ==========================================
  // 3. TEST: Šachovnice (Stress test třídění)
  // ==========================================
  vector<uint8_t> src_checker(W * H);
  for (int y = 0; y < H; y++) {
    for (int x = 0; x < W; x++) {
      src_checker[y * W + x] = ((x + y) % 2 == 0) ? 1 : 0;
    }
  }

  total_fails += run_median_test("Sachovnice", W, H, &src_checker);

  // ==========================================
  // ZÁVĚREČNÉ VYHODNOCENÍ
  // ==========================================
  if (total_fails == 0) {
    cout << ">>> VSECHNY TESTY USPESNE PROSLY <<<" << endl;
  } else {
    cout << ">>> DETEKOVANO " << total_fails << " CHYB V TESTECH! <<<" << endl;
  }

  return total_fails;
}