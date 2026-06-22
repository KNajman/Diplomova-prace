#include "hls_rgb_2_hsv.hpp"
//#include <opencv2/opencv.hpp>

// Pomocná struktura pro definici testovacích vektorů
struct TestColor {
  uint8_t r, g, b;
  ap_uint<1> user, last;
  const char *name;
};

/**
 * @brief Převádí barvu z barevného prostoru RGB do HSV (kompatibilní s OpenCV
 * 8-bit).
 * * Tato funkce implementuje převod ze standardního 8bitového RGB do 8bitového
 * HSV formátu, který přesně odpovídá chování knihovny OpenCV pro datový typ
 * CV_8U. Standardní úhel Hue (0-360) je komprimován dělením dvěma, aby se vešel
 * do jednoho bajtu.
 * * @param[in]  rgb Vstupní pole 3 hodnot reprezentující červenou, zelenou a
 * modrou složku. Rozsah: R = 0-255, G = 0-255, B = 0-255.
 * @param[out] hsv Výstupní pole 3 hodnot reprezentující Hue, Saturation a
 * Value. Rozsah: H = 0-179 (OpenCV specifikum), S = 0-255, V = 0-255.
 */
void golden_rgb2hsv(uint8_t rgb[3], uint8_t hsv[3]) {
  uint8_t r = rgb[0];
  uint8_t g = rgb[1];
  uint8_t b = rgb[2];

  uint8_t cmax = std::max({r, g, b});
  uint8_t cmin = std::min({r, g, b});
  uint8_t delta = cmax - cmin;

  // Value
  uint8_t v = cmax;

  // Saturation
  uint8_t s = (cmax != 0) ? (delta * 255) / cmax : 0;

  // Hue
  int h =
      0; // Musí být znaménkový int kvůli výpočtu a detekci záporných hodnot!

  if (delta == 0) {
    h = 0;
  } else if (cmax == r) {
    h = 30 * (g - b) / delta; // Pro OpenCV používáme 30 místo 60
  } else if (cmax == g) {
    h = 30 * (b - r) / delta + 60; // 60 místo 120
  } else if (cmax == b) {
    h = 30 * (r - g) / delta + 120; // 120 místo 240
  }

  // Oprava záporného úhlu (při cmax == r a g < b)
  if (h < 0) {
    h += 180; // Standardně se přidává 360, v OpenCV rozsahu (0-179) přidáme 180
  }

  hsv[0] = (uint8_t)h;
  hsv[1] = s;
  hsv[2] = v;
}
/*
// Využití OpenCV pro převod RGB -> HSV z tvých polí
void opencv_rgb2hsv(uint8_t rgb[3], uint8_t hsv[3]) {
  // Vytvoříme OpenCV matice o velikosti 1x1 pixel
  // CV_8UC3 = 8-bit unsigned integer, 3 kanály
  // Jako čtvrtý parametr předáme ukazatel na tvá existující data
  cv::Mat mat_rgb(1, 1, CV_8UC3, rgb);
  cv::Mat mat_hsv(1, 1, CV_8UC3, hsv);

  // Přímé volání OpenCV převodu
  cv::cvtColor(mat_rgb, mat_hsv, cv::COLOR_RGB2HSV);
}
*/
int test_rgb2hsv() {
  printf("--- Spoustim Test RGB -> HSV (Full Scale 0-255) ---\n");
  int errors = 0;

  // 1. DIRECTED TESTS (Corner cases)
  TestColor test_colors[] = {
      {0, 0, 0, 1, 0, "Black (SOF)"}, {255, 255, 255, 0, 0, "White"},
      {255, 0, 0, 0, 0, "Red"},       {0, 255, 0, 0, 0, "Green"},
      {0, 0, 255, 0, 0, "Blue"},      {255, 255, 0, 0, 0, "Yellow"},
      {0, 255, 255, 0, 0, "Cyan"},    {255, 0, 255, 0, 1, "Magenta (EOL)"}};

  int num_directed = sizeof(test_colors) / sizeof(test_colors[0]);
  int total_tests = num_directed + 1000; // Přidáme 1000 náhodných pixelů

  for (int i = 0; i < total_tests; i++) {
    uint8_t rgb_in[3];
    ap_uint<1> tuser = 0, tlast = 0;

    if (i < num_directed) {
      rgb_in[0] = test_colors[i].r;
      rgb_in[1] = test_colors[i].g;
      rgb_in[2] = test_colors[i].b;
      tuser = test_colors[i].user;
      tlast = test_colors[i].last;
      if (i < num_directed)
        printf("Test %-14s: ", test_colors[i].name);
    } else {
      // 2. RANDOMIZED TESTING
      rgb_in[0] = rand() % 256;
      rgb_in[1] = rand() % 256;
      rgb_in[2] = rand() % 256;
    }

    // Příprava vstupu
    hls::stream<axis_rgb> in_stream("video_in");
    hls::stream<axis_hsv> out_stream("video_out");

    axis_rgb in_pixel;
    in_pixel.data.channel[0] = rgb_in[0];
    in_pixel.data.channel[1] = rgb_in[1];
    in_pixel.data.channel[2] = rgb_in[2];
    in_pixel.user = tuser;
    in_pixel.last = tlast;

    in_stream.write(in_pixel);

    uint8_t gold_hsv[3];

    // Volej HW IP a Golden model
    hls_rgb_2_hsv(in_stream, out_stream);
    golden_rgb2hsv(rgb_in, gold_hsv);

    // Tolerance 1-2 hodnoty (HW zaokrouhluje přes bitové posuny, SW používá
    // double precision)
    axis_hsv hw_out = out_stream.read();

    int diff_h = abs((int)hw_out.data.channel[0] - (int)gold_hsv[0]);
    // Pokud je lineární rozdíl na kružnici větší než polovina (90 pro rozsah
    // 180), znamená to, že jdeme přes nulu a musíme vzít kratší cestu z druhé
    // strany.
    if (diff_h > 90) {
      diff_h = 180 - diff_h;
    }
    int diff_s = abs((int)hw_out.data.channel[1] - (int)gold_hsv[1]);
    int diff_v = abs((int)hw_out.data.channel[2] - (int)gold_hsv[2]);

    // Zkontrolujeme signály a hodnoty
    bool pass = (diff_h <= 1 && diff_s <= 1 && diff_v <= 1) &&
                (hw_out.user == tuser && hw_out.last == tlast);

    if (!pass) {
      if (errors < 10) { // Vypíšeme jen prvních 10 chyb, ať nezahltíme konzoli
        printf("\n -> CHYBA! RGB(%3d,%3d,%3d)\n", rgb_in[0], rgb_in[1],
               rgb_in[2]);
        printf("    HW : H=%3d, S=%3d, V=%3d | TUSER=%d, TLAST=%d\n",
               (int)hw_out.data.channel[0], (int)hw_out.data.channel[1],
               (int)hw_out.data.channel[2], (int)hw_out.user, (int)hw_out.last);
        printf("    SW : H=%3d, S=%3d, V=%3d | TUSER=%d, TLAST=%d\n",
               gold_hsv[0], gold_hsv[1], gold_hsv[2], (int)tuser, (int)tlast);
      }
      errors++;
    } else if (i < num_directed) {
      printf("OK (HW: %3d, %3d, %3d)\n", (int)hw_out.data.channel[0],
             (int)hw_out.data.channel[1], (int)hw_out.data.channel[2]);
    }
  }

  printf("-> Random testy dokonceno. Celkem chyb: %d\n", errors);
  return errors;
}

int main() {
  int errors = 0;

  errors += test_rgb2hsv();

  if (errors == 0) {
    printf("\nALL TESTS PASSED!\n");
  } else {
    printf("\nErrors occurred: %d\n", errors);
  }

  return errors;
}