#ifndef VDMA_UTILS_H
#define VDMA_UTILS_H

#include "xaxivdma.h"
#include "xil_types.h"

// Inicializace VDMA architektury pro zadaný počet snímků
int VDMA_Init(XAxiVdma *VdmaInstancePtr, u32 BaseAddr, int Width, int Height, int BytesPerPixel, int FrameCount);

// Spuštění přenosu
int VDMA_Start(XAxiVdma *VdmaInstancePtr, UINTPTR SrcAddr, UINTPTR DstAddr);

// Bezpečné čekání na dokončení přenosu s definovaným timeoutem v milisekundách
int VDMA_WaitForCompletion(XAxiVdma *VdmaInstancePtr, int TimeoutMs);

#endif // VDMA_UTILS_H