#ifndef VYBRANE_ALGORITMY_H
#define VYBRANE_ALGORITMY_H

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h> 
//#include <cmath.h>

// pro HLS
// #include <ap_int.h>
// #include <hls_stream.h>
// #include <ap_ufixed.h>


// Koeficienty pro RGB -> Y
#define COEFF_Y_R 77   
#define COEFF_Y_G 150  
#define COEFF_Y_B 29

// Příklad pro N = 256 (Fixed-point Q8.0)
#define N 256

// Trik: Přičteme 0.5f pro zaokrouhlení a přetypujeme na (int)
// Kompilátor tento výpočet provede v čase kompilace, do FPGA se dostane jen číslo 77.
#define W_R 77//((int)(0.299f * N + 0.5f))      // 77
#define W_B 29//((int)(0.114f * N + 0.5f))      // 29

// W_G se dopočítá už čistě v celých číslech, aby součet dal přesně N
#define W_G 150 //(N - W_R - W_B)                 // 256 - 77 - 29 = 150

// Definice max rozlišení pro statické alokace
#define MAX_WIDTH  1920
#define MAX_HEIGHT 1080
// Velikost jádra pro konvoluci
#define KERNEL_SIZE 3

// Typy
typedef unsigned char uint8_t;
typedef signed char int8_t;
typedef short int16_t;

// Datové struktury
// RGB struct
// standardní rozsah RGB je 8 bitů na kanál, tedy celkem 24 bitů na pixel -> můžu posílat 24 vektor
// hodnoty R, G, B jsou v rozsahu od 0 do 255
typedef struct { uint8_t r; uint8_t g; uint8_t b; } RgbPixel; // [0, 255]
typedef struct { uint8_t y; uint8_t u; uint8_t v; } YuvPixel; // Y: [0, 255], U/V: [0, 255] s posunem 128
typedef struct { uint8_t h; uint8_t s; uint8_t v; } HsvPixel; // H: [0, 255] (mapováno z [0, 360]), S/V: [0, 255]
typedef struct { uint8_t c; uint8_t m; uint8_t y; uint8_t k; } CmykPixel;

// 1. Barevné transformace
void rgb2y_hls(RgbPixel in, uint8_t *y);
void rgb2yuv_hls(RgbPixel in, YuvPixel *out);
void rgb2hsv_hls(RgbPixel in, HsvPixel *out);
//void rgb2cmyk_hls(RgbPixel in, CmykPixel *out); //asi není třeba, leda bychom chtěli tisknout z FPGA :D

// TODO:
void yuv2rgb_hls(YuvPixel in, RgbPixel *out);
void hsv2rgb_hls(HsvPixel in, RgbPixel *out);

// 2. Bodové operace (Point operations)
void threshold_global_hls(uint8_t in_pixel, uint8_t threshold, uint8_t *out_pixel);

// 3. Konvoluční operace (Area operations)
void convolution_engine_hls(
    uint8_t *in_pixels, 
    uint8_t *out_pixels, 
    int width, 
    int height,
    const int8_t kernel[3][3],
    int divisor,
    int offset
);

// 4. Analýza signálu / obrazu
void konvoluce_1d_hls(int *x, int length_x, int *h, int length_h, int *y);
void histogram_hls(uint8_t *image, int width, int height, int *hist);