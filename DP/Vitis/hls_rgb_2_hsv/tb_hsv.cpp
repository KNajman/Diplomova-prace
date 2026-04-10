#include "hls_color_space_convert.hpp"

/*
=================================================================================
    REFERENČNÍ MODELY (GOLDEN)
=================================================================================
*/

// Golden model aktualizovaný pro FULL SCALE (0-255)
void golden_rgb2hsv(uint8_t r, uint8_t g, uint8_t b, uint8_t *h, uint8_t *s,
                    uint8_t *v) {
  double r_norm = r / 255.0;
  double g_norm = g / 255.0;
  double b_norm = b / 255.0;

  double cmax = fmax(r_norm, fmax(g_norm, b_norm));
  double cmin = fmin(r_norm, fmin(g_norm, b_norm));
  double delta = cmax - cmin;

  // Světlost (Value)
  *v = (uint8_t)round(cmax * 255.0);

  // Sytost (Saturation)
  if (cmax == 0.0) {
    *s = 0;
  } else {
    *s = (uint8_t)round((delta / cmax) * 255.0);
  }

  // Odstín (Hue) v rozsahu 0-255
  double h_calc = 0.0;
  if (delta == 0.0) {
    h_calc = 0.0;
  } else if (cmax == r_norm) {
    h_calc = 60.0 * fmod(((g_norm - b_norm) / delta), 6.0);
  } else if (cmax == g_norm) {
    h_calc = 60.0 * (((b_norm - r_norm) / delta) + 2.0);
  } else if (cmax == b_norm) {
    h_calc = 60.0 * (((r_norm - g_norm) / delta) + 4.0);
  }

  if (h_calc < 0.0)
    h_calc += 360.0;

  // Převod z 360° do 256 dílků (Full Scale)
  *h = (uint8_t)round((h_calc * 255.0) / 360.0);
}

// Referenční SW model pro převod HSV (0-255) zpět na RGB (0-255)
void golden_hsv2rgb(uint8_t h, uint8_t s, uint8_t v, uint8_t *r, uint8_t *g,
                    uint8_t *b) {
  // Převod H zpět do stupňů (0-360) a S, V do rozsahu 0.0 - 1.0
  double h_deg = (h * 360.0) / 255.0;
  double s_norm = s / 255.0;
  double v_norm = v / 255.0;

  double c = v_norm * s_norm;
  double x = c * (1.0 - fabs(fmod(h_deg / 60.0, 2.0) - 1.0));
  double m = v_norm - c;

  double r_prime = 0, g_prime = 0, b_prime = 0;

  if (h_deg >= 0 && h_deg < 60) {
    r_prime = c;
    g_prime = x;
    b_prime = 0;
  } else if (h_deg >= 60 && h_deg < 120) {
    r_prime = x;
    g_prime = c;
    b_prime = 0;
  } else if (h_deg >= 120 && h_deg < 180) {
    r_prime = 0;
    g_prime = c;
    b_prime = x;
  } else if (h_deg >= 180 && h_deg < 240) {
    r_prime = 0;
    g_prime = x;
    b_prime = c;
  } else if (h_deg >= 240 && h_deg < 300) {
    r_prime = x;
    g_prime = 0;
    b_prime = c;
  } else {
    r_prime = c;
    g_prime = 0;
    b_prime = x;
  }

  *r = (uint8_t)round((r_prime + m) * 255.0);
  *g = (uint8_t)round((g_prime + m) * 255.0);
  *b = (uint8_t)round((b_prime + m) * 255.0);
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
