#include "hls_color_space_convert.hpp"

#include "opencv2/opencv.hpp"
#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstdlib>

#include <opencv2/opencv.hpp>

/*
=================================================================================
    REFERENČNÍ MODELY (GOLDEN)
=================================================================================
*/

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

/**
 * @brief Převádí barvu z barevného prostoru HSV do RGB (kompatibilní s OpenCV
 * 8-bit).
 * * Funkce provádí inverzní transformaci k funkci `golden_rgb2hsv`. Očekává na
 * vstupu 8bitové hodnoty specifické pro knihovnu OpenCV, kde má složka Hue
 * poloviční rozsah oproti standardnímu úhlovému vyjádření.
 * * @param[in]  hsv Vstupní pole 3 hodnot reprezentující Hue, Saturation a
 * Value. Rozsah: H = 0-179 (OpenCV specifikum), S = 0-255, V = 0-255.
 * @param[out] rgb Výstupní pole 3 hodnot reprezentující červenou, zelenou a
 * modrou složku. Rozsah: R = 0-255, G = 0-255, B = 0-255.
 */
void golden_hsv2rgb(uint8_t hsv[3], uint8_t rgb[3]) {
  uint8_t h = hsv[0];
  uint8_t s = hsv[1];
  uint8_t v = hsv[2];

  uint8_t r = 0, g = 0, b = 0;

  if (s == 0) {
    r = g = b = v; // Šedá barva
  } else {
    // Pro OpenCV (rozsah 0-179) má jeden ze 6 regionů velikost přesně 30
    // jednotek
    uint8_t region = h / 30; // Výsledek bude 0 až 5

    // Zbytek po dělení převedený na rozsah 0-255 pro interpolaci
    uint32_t remainder = (h % 30) * 255 / 30;

    uint8_t p = (v * (255 - s)) / 255;
    uint8_t q = (v * (255 - (s * remainder) / 255)) / 255;
    uint8_t t = (v * (255 - (s * (255 - remainder)) / 255)) / 255;

    switch (region) {
    case 0:
      r = v;
      g = t;
      b = p;
      break;
    case 1:
      r = q;
      g = v;
      b = p;
      break;
    case 2:
      r = p;
      g = v;
      b = t;
      break;
    case 3:
      r = p;
      g = q;
      b = v;
      break;
    case 4:
      r = t;
      g = p;
      b = v;
      break;
    default:
      r = v;
      g = p;
      b = q;
      break; // case 5
    }
  }

  rgb[0] = r;
  rgb[1] = g;
  rgb[2] = b;
}

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

// Využití OpenCV pro převod HSV -> RGB do tvých polí
void opencv_hsv2rgb(uint8_t hsv[3], uint8_t rgb[3]) {
  cv::Mat mat_hsv(1, 1, CV_8UC3, hsv);
  cv::Mat mat_rgb(1, 1, CV_8UC3, rgb);

  // Přímé volání OpenCV převodu (inverzní)
  cv::cvtColor(mat_hsv, mat_rgb, cv::COLOR_HSV2RGB);
}

// Pomocná struktura pro definici testovacích vektorů
struct TestColor {
  uint8_t r, g, b;
  ap_uint<1> user, last;
  const char *name;
};

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
    uint8_t r, g, b;
    ap_uint<1> tuser = 0, tlast = 0;

    if (i < num_directed) {
      r = test_colors[i].r;
      g = test_colors[i].g;
      b = test_colors[i].b;
      tuser = test_colors[i].user;
      tlast = test_colors[i].last;
      if (i < num_directed)
        printf("Test %-14s: ", test_colors[i].name);
    } else {
      // 2. RANDOMIZED TESTING
      r = rand() % 256;
      g = rand() % 256;
      b = rand() % 256;
    }

    // Příprava vstupu
    hls::stream<axis_rgb> in_stream("video_in");
    hls::stream<axis_hsv> out_stream("video_out");

    axis_rgb in_pixel;
    in_pixel.data.channel[0] = r;
    in_pixel.data.channel[1] = g;
    in_pixel.data.channel[2] = b;
    in_pixel.user = tuser;
    in_pixel.last = tlast;

    in_stream.write(in_pixel);

    uint8_t gold_h, gold_s, gold_v;

    // Volej HW IP a Golden model
    hls_rgb_2_hsv(in_stream, out_stream);
    golden_rgb2hsv(r, g, b, &gold_h, &gold_s, &gold_v);

    // Tolerance 1-2 hodnoty (HW zaokrouhluje přes bitové posuny, SW používá
    // double precision)
    axis_hsv hw_out = out_stream.read();

    int diff_h = abs((int)hw_out.data.channel[0] - (int)gold_h);
    int diff_s = abs((int)hw_out.data.channel[1] - (int)gold_s);
    int diff_v = abs((int)hw_out.data.channel[2] - (int)gold_v);

    // Zkontrolujeme signály a hodnoty
    bool pass = (diff_h <= 1 && diff_s <= 1 && diff_v <= 1) &&
                (hw_out.user == tuser && hw_out.last == tlast);

    if (!pass) {
      if (errors < 10) { // Vypíšeme jen prvních 10 chyb, ať nezahltíme konzoli
        printf("\n -> CHYBA! RGB(%3d,%3d,%3d)\n", r, g, b);
        printf("    HW : H=%3d, S=%3d, V=%3d | TUSER=%d, TLAST=%d\n",
               (int)hw_out.data.channel[0], (int)hw_out.data.channel[1],
               (int)hw_out.data.channel[2], (int)hw_out.user, (int)hw_out.last);
        printf("    SW : H=%3d, S=%3d, V=%3d | TUSER=%d, TLAST=%d\n", gold_h,
               gold_s, gold_v, (int)tuser, (int)tlast);
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

int test_hsv2rgb() {
  printf("\n--- Spoustim Test HSV -> RGB (Full Scale 0-255) ---\n");
  int errors = 0;

  // Struktura: H, S, V, TUSER, TLAST, Name
  // H hodnoty jsou aproximace 360 stupňů do 256 úrovní (např. 120 stupnu = 85)
  struct TestHSV {
    uint8_t h, s, v;
    ap_uint<1> user, last;
    const char *name;
  };

  TestHSV test_colors[] = {
      {0, 0, 0, 1, 0, "Black (SOF)"}, {0, 0, 255, 0, 0, "White"},
      {0, 255, 255, 0, 0, "Red"},     {85, 255, 255, 0, 0, "Green"},
      {170, 255, 255, 0, 0, "Blue"},  {42, 255, 255, 0, 0, "Yellow"},
      {127, 255, 255, 0, 0, "Cyan"},  {212, 255, 255, 0, 1, "Magenta (EOL)"}};

  int num_directed = sizeof(test_colors) / sizeof(test_colors[0]);
  int total_tests = num_directed + 1000;

  for (int i = 0; i < total_tests; i++) {
    uint8_t h_in, s_in, v_in;
    ap_uint<1> tuser = 0, tlast = 0;

    if (i < num_directed) {
      h_in = test_colors[i].h;
      s_in = test_colors[i].s;
      v_in = test_colors[i].v;
      tuser = test_colors[i].user;
      tlast = test_colors[i].last;
      printf("Test %-14s: ", test_colors[i].name);
    } else {
      h_in = rand() % 256;
      s_in = rand() % 256;
      v_in = rand() % 256;
    }

    hls::stream<axis_hsv> in_stream("video_in");
    hls::stream<axis_rgb> out_stream("video_out");

    // Vstupní HSV pixel
    axis_hsv in_pixel;
    in_pixel.data.channel[0] = h_in;
    in_pixel.data.channel[1] = s_in;
    in_pixel.data.channel[2] = v_in;
    in_pixel.user = tuser;
    in_pixel.last = tlast;

    in_stream.write(in_pixel);

    uint8_t gold_r, gold_g, gold_b;

    // TADY ZAVOLEJ SVOJI HLS FUNKCI (předpokládám název hls_hsv_2_rgb)
    hls_hsv_2_rgb(in_stream, out_stream);
    axis_rgb hw_out = out_stream.read();

    // Zlatý model
    golden_hsv2rgb(h_in, s_in, v_in, &gold_r, &gold_g, &gold_b);

    // Tolerance: při převodech tam a zpět může být chyba kolem 2-3 úrovní.
    int diff_r = abs((int)hw_out.data.channel[0] - (int)gold_r);
    int diff_g = abs((int)hw_out.data.channel[1] - (int)gold_g);
    int diff_b = abs((int)hw_out.data.channel[2] - (int)gold_b);

    bool pass = (diff_r <= 1 && diff_g <= 1 && diff_b <= 1) &&
                (hw_out.user == tuser && hw_out.last == tlast);

    if (!pass) {
      if (errors < 10) {
        printf("\n -> CHYBA! Vstup HSV(%3d,%3d,%3d)\n", h_in, s_in, v_in);
        printf("    HW : R=%3d, G=%3d, B=%3d\n", (int)hw_out.data.channel[0],
               (int)hw_out.data.channel[1], (int)hw_out.data.channel[2]);
        printf("    SW : R=%3d, G=%3d, B=%3d\n", gold_r, gold_g, gold_b);
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

int run_test_hsv() {
  int fails = 0;
  fails += test_rgb2hsv();
  fails += test_hsv2rgb();
  return fails;
}
