#include "image_utils.h"
#include "xil_printf.h"

void IMG_GenerateTestPattern(u8 *FramePtr, int Width, int Height, int BytesPerPixel, int FrameOffset) {
    for (int r = 0; r < Height; r++) {
        for (int c = 0; c < Width; c++) {
            int offset = (r * Width + c) * BytesPerPixel;
            // FrameOffset umožňuje měnit barvy mezi jednotlivými snímky, pokud jich testuješ více
            FramePtr[offset + 0] = ((r * 10) + c + 5 + FrameOffset) & 0xFF;  // R
            FramePtr[offset + 1] = ((r * 20) + c + 10 + FrameOffset) & 0xFF; // G
            FramePtr[offset + 2] = ((r * 30) + c + 15 + FrameOffset) & 0xFF; // B
            FramePtr[offset + 3] = 0xAA;                                     // X
        }
    }
}

void IMG_ClearBuffer(u8 *FramePtr, int Width, int Height, int BytesPerPixel, u8 value) {
    int total_bytes = Width * Height * BytesPerPixel;
    for (int i = 0; i < total_bytes; i++) {
        FramePtr[i] = value; // nebo třeba 0xAA
    }
}

int IMG_VerifyPattern(u8 *SrcFramePtr, u8 *DstFramePtr, int Width, int Height, int BytesPerPixel) {
    int error_count = 0;
    int total_bytes = Width * Height * BytesPerPixel;
    
    for (int i = 0; i < total_bytes; i++) {
        if (DstFramePtr[i] != SrcFramePtr[i]) {
            error_count++;
        }
    }
    return error_count;
}