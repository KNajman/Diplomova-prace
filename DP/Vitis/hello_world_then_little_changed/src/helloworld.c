/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */
/*
#include <stdio.h>
#include <xaxidma_hw.h>
#include "platform.h"
#include "xil_printf.h"

int main()
{
    init_platform();

    print("Hello World\n\r");
    print("Successfully ran Hello World application");
    cleanup_platform();
    return 0;
}
*/

/******************************************************************************
* Vitis Bare-Metal testovací aplikace s DIAGNOSTIKOU ZAMRZNUTÍ
******************************************************************************/

/******************************************************************************
* Vitis Bare-Metal testovací aplikace s DIAGNOSTIKOU ZAMRZNUTÍ
******************************************************************************/

#include "xaxidma.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "sleep.h"

#define DMA_BASE_ADDR       XPAR_AXI_DMA_0_BASEADDR
#define TEST_PIXELS         1024 
#define MAX_PKT_LEN         (TEST_PIXELS * 4)

XAxiDma AxiDma;

u32 TxBuffer[TEST_PIXELS] __attribute__((aligned(64)));
u32 RxBuffer[TEST_PIXELS] __attribute__((aligned(64)));

int main()
{
    int Status;
    XAxiDma_Config *Config;

    xil_printf("\r\n--- AXI DMA Passthrough Test ---\r\n");

    Config = XAxiDma_LookupConfig(DMA_BASE_ADDR);
    if (!Config) {
        xil_printf("[ERR] LookupConfig failed for addr 0x%08X\r\n", DMA_BASE_ADDR);
        return XST_FAILURE;
    }

    Status = XAxiDma_CfgInitialize(&AxiDma, Config);
    if (Status != XST_SUCCESS) {
        xil_printf("[ERR] CfgInitialize failed with status %d\r\n", Status);
        return XST_FAILURE;
    }

    XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

    // Init buffers
    for(int i = 0; i < TEST_PIXELS; i++) {
        TxBuffer[i] = 0x000080FF; 
        RxBuffer[i] = 0x00000000;
    }

    // Cache sync
    Xil_DCacheFlushRange((UINTPTR)TxBuffer, MAX_PKT_LEN);
    Xil_DCacheInvalidateRange((UINTPTR)RxBuffer, MAX_PKT_LEN);

    xil_printf("TX %d bytes to HLS IP...\r\n", MAX_PKT_LEN);

    // Start S2MM (RX)
    Status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)RxBuffer, MAX_PKT_LEN, XAXIDMA_DEVICE_TO_DMA);
    if (Status != XST_SUCCESS) {
        xil_printf("[ERR] S2MM Transfer start failed\r\n");
        return XST_FAILURE;
    }

    // Start MM2S (TX)
    Status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)TxBuffer, MAX_PKT_LEN, XAXIDMA_DMA_TO_DEVICE);
    if (Status != XST_SUCCESS) {
        xil_printf("[ERR] MM2S Transfer start failed\r\n");
        return XST_FAILURE;
    }

    int timeout = 0;
    while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE) || 
           XAxiDma_Busy(&AxiDma, XAXIDMA_DEVICE_TO_DMA)) {
        
        usleep(10000); 
        timeout++;
        
        if (timeout > 100) {
            u32 mm2s_status = XAxiDma_ReadReg(AxiDma.RegBase, XAXIDMA_TX_OFFSET + XAXIDMA_SR_OFFSET);
            u32 s2mm_status = XAxiDma_ReadReg(AxiDma.RegBase, XAXIDMA_RX_OFFSET + XAXIDMA_SR_OFFSET);
            xil_printf("[ERR] DMA STALL\r\n");
            xil_printf("MM2S SR: 0x%08X\r\n", mm2s_status);
            xil_printf("S2MM SR: 0x%08X\r\n", s2mm_status);
            return XST_FAILURE;
        }
    }

    xil_printf("Transfer done. Verifying...\r\n");

    Xil_DCacheInvalidateRange((UINTPTR)RxBuffer, MAX_PKT_LEN);

    int ErrorCount = 0;
    for(int i = 0; i < TEST_PIXELS; i++) {
        if (RxBuffer[i] != TxBuffer[i]) {
            xil_printf("Data mismatch [%d]: Exp 0x%08X, Got 0x%08X\r\n", i, TxBuffer[i], RxBuffer[i]);
            ErrorCount++;
            if (ErrorCount >= 10) break;
        }
    }

    if (ErrorCount == 0) xil_printf("SUCCESS: %d pixels matched.\r\n", TEST_PIXELS);
    else xil_printf("FAILED with %d errors.\r\n", ErrorCount);

    return XST_SUCCESS;
}