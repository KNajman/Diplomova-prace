#include "hls_color_space_convert.hpp"

#include <math.h>

/*
=================================================================================
    REFERENČNÍ MODELY (GOLDEN)
=================================================================================
*/

// Golden model pro barevné transformace. Předpokládá Q8.8 formát (koeficienty
// se dělí 256)
void golden_color_space_convert(uint8_t color_in[3], uint8_t color_out[3],
                                const int16_t coeffs[3][3],
                                const int16_t offsets[3]) {
  for (int i = 0; i < 3; i++) {
    // Offset je typicky posunut nahoru před bitshiftem, v závislosti na HW
    // implementaci. Zde simulujeme typický DSP přístup: (A*X + B*Y + C*Z) >> 8
    // + offset
    int sum = 0;
    for (int j = 0; j < 3; j++) {
      sum += coeffs[i][j] * color_in[j];
    }

    sum = (sum >> 8) + offsets[i];

    if (sum < 0)
      sum = 0;
    if (sum > 255)
      sum = 255;

    color_out[i] = (uint8_t)sum;
  }
}

/*
=================================================================================
    UNIFIKOVANÉ TESTY (DIRECTED + RANDOM)
=================================================================================
*/

int test_color_space_convert() {
  printf("\n--- Spoustim Test RGB -> YCbCr (Rec.601) ---\n");
  int errors = 0;

  hls::stream<axis_rgb> in_stream("video_in");
  hls::stream<axis_ycbcr> out_stream("video_out");

  // Testujeme klasickou červenou pro Rec.601
  axis_rgb in_pixel;
  in_pixel.data.channel[0] = 255;
  in_pixel.data.channel[1] = 0; // G
  in_pixel.data.channel[2] = 0; // B
  in_pixel.user = 1;
  in_pixel.last = 0;

  //zapsat data
  in_stream.write(in_pixel);

  // Musíme přetypovat parametry matice na formát, který funkce očekává (nebo
  // použít dočasné pole)
  int16_t hw_coeffs[4][4] = {0};
  int16_t hw_offsets[4] = {0};

  // Zkopírování 3x3 Rec.601 z vybrane_algoritmy.hpp do 4x4 IP bloku
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++)
      hw_coeffs[i][j] = rec601_coeffs[i][j];
    hw_offsets[i] = rec601_offsets[i];
  }

  hls_color_space_convert_top(in_stream, out_stream, rec601_coeffs, rec601_offsets,
                              1, 1);

  axis_ycbcr hw_out = out_stream.read();

  // Očekávané hodnoty pro čistě červenou v Rec.601: Y=76, Cb=84, Cr=255
  printf("Vstup RGB: (%3d, %3d, %3d)\n", (int)in_pixel.data.channel[0],
         (int)in_pixel.data.channel[1],
         (int)in_pixel.data.channel[2]);
  printf("HLS YCbCr: (%3d, %3d, %3d)\n",
  (int)hw_out.data.channel[0],
         (int)hw_out.data.channel[1], (int)hw_out.data.channel[2]);

  if (abs((int)hw_out.data.channel[0] - 76) > 2 ||
      abs((int)hw_out.data.channel[1] - 84) > 2 ||
      abs((int)hw_out.data.channel[2] - 255) > 2) {
    printf(" -> CHYBA v maticovem vypoctu!\n");
    errors++;
  } else {
    printf(" -> OK\n");
  }

  return errors;
}

int run_test_csc() {

  int fails = 0;

  fails += test_color_space_convert();
  return fails;
}

int main() {
  printf("=========================================\n");
  printf("   START HLS C SIMULATION (Color IP)\n");
  printf("=========================================\n\n");

  int fails = 0;

  fails += run_test_csc();

  if (fails == 0) {
    printf("\n=========================================\n");
    printf(" ALL TESTS PASSED! \n");
    printf("=========================================\n");
    return 0;
  } else {
    printf("\n=========================================\n");
    printf(" WARNING: SOME TESTS FAILED (%d)\n", fails);
    printf("=========================================\n");
    return 1;
  }
}