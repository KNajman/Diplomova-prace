#include "hls_filter_2d.hpp"

// ===========================================================================
// ČÁST Thresholding (Binarizace)
// ===========================================================================


// ===========================================================================
// ČÁST KONVOLUCE
// ===========================================================================

// diskrétní řádková konvoluce
//  x je vstupní signál
//  h je jádro konvoluce
//  y je výstupní signál
//  N je velikost vstupního signálu
//  M je velikost jádra konvoluce
//  n je aktuální index výstupního signálu
//  m je index jádra konvoluce

void konvoluce(int *x, int length_x, int *h, int length_g, int *y)
{
    int n = 0;      // index výstupního signálu
    int k = 0;      // index jádra konvoluce
    int y_temp = 0; // dočasná proměnná pro ukládání výsledku konvoluce
    //[length_x + length_g - 1]; // velikost výstupního signálu je N + M - 1

    for (; n < length_x + length_g - 1; n++) // procházení všech indexů výstupního signálu
    {
        y_temp = 0;                    // vynulování dočasné proměnné pro aktuální index n
        for (k = 0; k < length_g; k++) // procházení všech indexů jádra konvoluce
        {
            if (n - k >= 0 && n - k < length_x) // kontrola indexů, aby nedošlo k přetečení pole
            {
                y_temp += x[n - k] * h[k]; // výpočet konvoluce pro aktuální index n
            }
        }
        y[n] = y_temp;
    }
}

void konvoluce_hls(int *x, int length_x, int *h, int length_h, int *y)
{
    int y_temp = 0;
    int i = 0; // index výstupního signálu
    int k = 0; // index jádra konvoluce

    // Celková délka výstupu je length_x + length_h - 1
    for (i = 0; i < length_x + length_h - 1; i++)
    {
#pragma HLS PIPELINE II = 1
        y_temp = 0;
        for (k = 0; k < length_h; k++)
        {
            if (i - k >= 0 && i - k < length_x)
            {
                y_temp += x[i - k] * h[k];
            }
        }
        y[i] = y_temp;
    }
}

// 2D konvoluce pro FPGA Stream, zpracování pixel po pixelu, bez přístupu k celé matici najednou
// Pokus společně s Gemini AI

typedef struct
{
    uint8_t line_buffer[KERNEL_SIZE - 1][PIXEL_WIDTH];
    uint8_t window[KERNEL_SIZE][KERNEL_SIZE];
} WindowContext;

static void slide_window(uint8_t new_pixel, WindowContext *ctx, int col)
    {
    #pragma HLS INLINE
        for (int i = 0; i < KERNEL_SIZE; i++)
        {
            for (int j = 0; j < KERNEL_SIZE - 1; j++)
            {
                ctx->window[i][j] = ctx->window[i][j + 1];
            }
        }
        ctx->window[0][KERNEL_SIZE - 1] = ctx->line_buffer[0][col];
        ctx->window[1][KERNEL_SIZE - 1] = ctx->line_buffer[1][col];
        ctx->line_buffer[0][col] = ctx->line_buffer[1][col];
        ctx->line_buffer[1][col] = new_pixel;
        ctx->window[2][KERNEL_SIZE - 1] = new_pixel;
    }

    void convolution_engine_hls(
        uint8_t *in_pixels, uint8_t *out_pixels, int width, int height,
        const int8_t kernel[3][3], int divisor, int offset)
    {
    #pragma HLS ARRAY_PARTITION variable = kernel complete dim = 0
    static WindowContext ctx;
    int pixel_idx = 0;

    for (int y = 0; y < height; y++)
    {
        for (int x = 0; x < width; x++)
        {
    #pragma HLS PIPELINE II = 1
            uint8_t new_pixel = in_pixels[pixel_idx];
            slide_window(new_pixel, &ctx, x);

            if (y >= 2 && x >= 2)
            {
                int sum = 0;
                for (int i = 0; i < 3; i++)
                {
                    for (int j = 0; j < 3; j++)
                    {
                        sum += ctx.window[i][j] * kernel[i][j];
                    }
                }
                int result = (sum / divisor) + offset;
                if (result < 0)
                    result = 0;
                if (result > 255)
                    result = 255;
                out_pixels[(y - 1) * width + (x - 1)] = (uint8_t)result;
            }
            pixel_idx++;
        }
    }
}

// ===========================================================================
// ČÁST HISTOGRAM (Histogram)
// ===========================================================================


