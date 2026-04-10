#include "hls_color_space_convert.hpp"

int run_test_hsv();
//==============================================================================
// MAIN
//==============================================================================

int main() {
  printf("=========================================\n");
  printf("   START HLS C SIMULATION (Color IP)\n");
  printf("=========================================\n\n");

  int fails = 0;
  fails += run_test_hsv();

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