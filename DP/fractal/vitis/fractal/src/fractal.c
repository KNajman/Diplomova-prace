#include "fractal.h"
int fractal_iterative(float x0, float y0) {
  int i;
  float x = x0;
  float y = y0;
  float dcx = 1;
  float dcy = 0;
  float dcx_sum = 0;
  float dcy_sum = 0;

  float xn, yn, dcxn, dcyn;

  for (i = 1; i < LIMIT; i++) {
    xn = x0 + x * x - y * y;
    yn = y0 + 2 * x * y;
    x = xn;
    y = yn;

    dcxn = 2 * (x * dcx - y * dcy) + 1;
    dcyn = 2 * (x * dcy + y * dcx);
    dcx = dcxn;
    dcy = dcyn;

    dcx_sum += dcx;
    dcy_sum += dcy;
    if (abs_square(dcx_sum, dcy_sum) >= DERBAIL) {
      return i;
    }
  }
  return 0;
}

float abs_square(float x, float y) {
	return x*x + y*y;
}
