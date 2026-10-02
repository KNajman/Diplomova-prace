#ifndef IMAGE_UTILS_H
#define IMAGE_UTILS_H

#include "xil_types.h"

// Vygeneruje testovací barevný vzor do zadaného bufferu
void IMG_GenerateTestPattern(u8 *FramePtr, int Width, int Height, int BytesPerPixel, int FrameOffset);

// Vyčistí cílový buffer (např. hodnotou 0xAA) pro ověření přepisu
void IMG_ClearBuffer(u8 *FramePtr, int Width, int Height, int BytesPerPixel, u8 value);

// Porovná dva buffery a vrátí počet chyb (0 = OK)
int IMG_VerifyPattern(u8 *SrcFramePtr, u8 *DstFramePtr, int Width, int Height, int BytesPerPixel);

#endif // IMAGE_UTILS_H