#include "hls_hsv_2_rgb.hpp"

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

// Využití OpenCV pro převod HSV -> RGB do tvých polí
/*
void opencv_hsv2rgb(uint8_t hsv[3], uint8_t rgb[3]) {
  cv::Mat mat_hsv(1, 1, CV_8UC3, hsv);
  cv::Mat mat_rgb(1, 1, CV_8UC3, rgb);

  // Přímé volání OpenCV převodu (inverzní)
  cv::cvtColor(mat_hsv, mat_rgb, cv::COLOR_HSV2RGB);
}*/

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
      {0, 255, 255, 0, 0, "Red"},     {60, 255, 255, 0, 0, "Green"},
      {120, 255, 255, 0, 0, "Blue"},  {30, 255, 255, 0, 0, "Yellow"},
      {90, 255, 255, 0, 0, "Cyan"},   {150, 255, 255, 0, 1, "Magenta (EOL)"}};

  int num_directed = sizeof(test_colors) / sizeof(test_colors[0]);
  int total_tests = num_directed + 1000;

  for (int i = 0; i < total_tests; i++) {
    uint8_t hsv_in[3];
    ap_uint<1> tuser = 0, tlast = 0;

    if (i < num_directed) {
      hsv_in[0] = test_colors[i].h;
      hsv_in[1] = test_colors[i].s;
      hsv_in[2] = test_colors[i].v;
      tuser = test_colors[i].user;
      tlast = test_colors[i].last;
      printf("Test %-14s: ", test_colors[i].name);
    } else {
      hsv_in[0] = rand() % 180;
      hsv_in[1] = rand() % 256;
      hsv_in[2] = rand() % 256;
    }

    hls::stream<axis_hsv> in_stream("video_in");
    hls::stream<axis_rgb> out_stream("video_out");

    // Vstupní HSV pixel
    axis_hsv in_pixel;
    in_pixel.data.channel[0] = hsv_in[0];
    in_pixel.data.channel[1] = hsv_in[1];
    in_pixel.data.channel[2] = hsv_in[2];
    in_pixel.user = tuser;
    in_pixel.last = tlast;

    in_stream.write(in_pixel);

    uint8_t gold_rgb[3];

    hls_hsv_2_rgb(in_stream, out_stream);
    axis_rgb hw_out = out_stream.read();

    // Zlatý model
    golden_hsv2rgb(hsv_in, gold_rgb);

    // Tolerance: při převodech tam a zpět může být chyba kolem 2-3 úrovní.
    int diff_r = abs((int)hw_out.data.channel[0] - (int)gold_rgb[0]);
    int diff_g = abs((int)hw_out.data.channel[1] - (int)gold_rgb[1]);
    int diff_b = abs((int)hw_out.data.channel[2] - (int)gold_rgb[2]);

    bool pass = (diff_r <= 1 && diff_g <= 1 && diff_b <= 1) &&
                (hw_out.user == tuser && hw_out.last == tlast);

    if (!pass) {
      if (errors < 10) {
        printf("\n -> CHYBA! Vstup HSV(%3d,%3d,%3d)\n", hsv_in[0], hsv_in[1],
               hsv_in[2]);
        printf("    HW : R=%3d, G=%3d, B=%3d\n", (int)hw_out.data.channel[0],
               (int)hw_out.data.channel[1], (int)hw_out.data.channel[2]);
        printf("    SW : R=%3d, G=%3d, B=%3d\n", gold_rgb[0], gold_rgb[1],
               gold_rgb[2]);
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

  errors += test_hsv2rgb();

  if (errors == 0) {
    printf("\nALL TESTS PASSED!\n");
  } else {
    printf("\nErrors occurred: %d\n", errors);
  }

  return errors;
}