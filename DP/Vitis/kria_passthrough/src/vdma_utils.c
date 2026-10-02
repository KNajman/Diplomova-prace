#include "vdma_utils.h"
#include "xil_printf.h"
#include "sleep.h"

int VDMA_Init(XAxiVdma *VdmaInstancePtr, u32 BaseAddr, int Width, int Height, int BytesPerPixel, int FrameCount) {
    XAxiVdma_Config *VdmaConfig = XAxiVdma_LookupConfig(BaseAddr);
    if (!VdmaConfig) {
        xil_printf("[VDMA ERR] Konfigurace nenalezena!\r\n");
        return XST_FAILURE;
    }

    int status = XAxiVdma_CfgInitialize(VdmaInstancePtr, VdmaConfig, VdmaConfig->BaseAddress);
    if (status != XST_SUCCESS) {
        xil_printf("[VDMA ERR] Inicializace selhala!\r\n");
        return XST_FAILURE;
    }

    int stride = Width * BytesPerPixel;

    XAxiVdma_DmaSetup Setup = {0};
    Setup.VertSizeInput = Height;
    Setup.HoriSizeInput = stride;
    Setup.Stride = stride;
    Setup.FrameDelay = 0;
    Setup.EnableCircularBuf = 0; // Pevný počet snímků
    Setup.EnableSync = 0;
    Setup.PointNum = 0;
    Setup.EnableFrameCounter = 1; // Povolíme počítadlo

    status = XAxiVdma_DmaConfig(VdmaInstancePtr, XAXIVDMA_WRITE, &Setup);
    if (status != XST_SUCCESS) return XST_FAILURE;

    status = XAxiVdma_DmaConfig(VdmaInstancePtr, XAXIVDMA_READ, &Setup);
    if (status != XST_SUCCESS) return XST_FAILURE;

    XAxiVdma_FrameCounter FrameCountCfg;
    FrameCountCfg.ReadFrameCount = FrameCount;
    FrameCountCfg.WriteFrameCount = FrameCount;
    FrameCountCfg.ReadDelayTimerCount = 0;
    FrameCountCfg.WriteDelayTimerCount = 0;

    status = XAxiVdma_SetFrameCounter(VdmaInstancePtr, &FrameCountCfg);
    if (status != XST_SUCCESS) return XST_FAILURE;

    return XST_SUCCESS;
}

int VDMA_Start(XAxiVdma *VdmaInstancePtr, UINTPTR SrcAddr, UINTPTR DstAddr) {
    UINTPTR ReadAddrList[1] = {SrcAddr};
    UINTPTR WriteAddrList[1] = {DstAddr};

    int status = XAxiVdma_DmaSetBufferAddr(VdmaInstancePtr, XAXIVDMA_READ, ReadAddrList);
    if (status != XST_SUCCESS) return XST_FAILURE;

    status = XAxiVdma_DmaSetBufferAddr(VdmaInstancePtr, XAXIVDMA_WRITE, WriteAddrList);
    if (status != XST_SUCCESS) return XST_FAILURE;

    // S2MM nejdřív, pak MM2S
    status = XAxiVdma_DmaStart(VdmaInstancePtr, XAXIVDMA_WRITE);
    if (status != XST_SUCCESS) return XST_FAILURE;

    status = XAxiVdma_DmaStart(VdmaInstancePtr, XAXIVDMA_READ);
    if (status != XST_SUCCESS) return XST_FAILURE;

    return XST_SUCCESS;
}

int VDMA_WaitForCompletion(XAxiVdma *VdmaInstancePtr, int TimeoutMs) {
    int elapsed_ms = 0;
    while (elapsed_ms < TimeoutMs) {
        if (XAxiVdma_IsBusy(VdmaInstancePtr, XAXIVDMA_WRITE) == 0 &&
            XAxiVdma_IsBusy(VdmaInstancePtr, XAXIVDMA_READ) == 0) {
            return XST_SUCCESS;
        }
        usleep(1000); // Počkej přesně 1 milisekundu
        elapsed_ms++;
    }
    return XST_FAILURE; // Timeout
}