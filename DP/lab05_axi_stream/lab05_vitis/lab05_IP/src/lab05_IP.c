#include <stdio.h>
#include "platform.h"
// Timer
#include "xtmrctr.h"
XTmrCtr Timer;
// DMA
#include "xaxidma.h"
XAxiDma DMARW, DMAR;

#include "xparameters.h"
#include "xil_cache.h"

#include "axis_macc/macc_h.h"
AXIS_MACC MACC;

int InitializeDrivers();

int main()
{

	int status;
	// src & dst buffers are manually allocated
	int *bufA = (int*)(XPAR_MIG_7SERIES_0_BASEADDR + 2*1024*1024);
	int *bufB = (int*)(XPAR_MIG_7SERIES_0_BASEADDR + 10*1024*1024);
	int *bufC = (int*)(XPAR_MIG_7SERIES_0_BASEADDR + 18*1024*1024);
	int *bufD = (int*)(XPAR_MIG_7SERIES_0_BASEADDR + 26*1024*1024);
	// buffer size in bytes
	int bytesize = 1024*1024;

    init_platform();
    status = InitializeDrivers();
    if (status != XST_SUCCESS) {
    	return status;
    }

    /*
     *
     * TASK 1
     *
     * we will compute IP core computation on CPU and measure execution time
     *
     * copy and modify SetupBufs function from previous project to setup bufABCD
     *
     * create function(s) that will implement operations of the hardware
     * 		computeSW(int* bufA, int* bufB, int* bufC, int bytesize, int op);
     * 		from within this function call following functions
     * 			SWAdd, SWSub, SWMul, SWNAND(int* bufA, int* bufB, int* bufC, int bytesize)
     * 			perform the computation loop here to increase performance of SW solution
     *
     * measure operations time using timer
     */

    /*
     * TASK 2
     *
     * update local InitializeDrivers() with MACC initialization
     * 		implement driver functions in macc_h.c. Create more driver function if necessary
     */

    /*
     * TASK 3
     * Test HW
     * 		Setup buffers
     * 		Flush buffers from Memory
     * 		Setup IP OPeration
     * 		Use multiple XAxiDma_SimpleTransfer(InstancePtr, BuffAddr, Length, Direction) calls to start transfers
     * 				directions are XAXIDMA_DMA_TO_DEVICE and XAXIDMA_DEVICE_TO_DMA
     * 		Poll calling XAxiDma_Busy(InstancePtr, Direction) for each device
     * 		Invalidate output buffer
     * 		Compare with SW solution
     *
     * 		measure time
     */

    /*
     * TASK 4
     * create function from TASK 3 code
     * int AXIS_MACC_compute(AXIS_MACC* InstancePtr, int* bufA, int* bufB, int* bufC, int bytesize, XAxiDma* DMA_AC, DMA_B, int OP);
     *
     *
     * measure HW vs SW speedup on different buffer sizes as in previous lab
     * Use release configuration to optimize CPU code
     */

    cleanup_platform();
    return 0;
}

/* Initialize drivers */
int InitializeDrivers() {
	int status;
	// Timer
	status = XTmrCtr_Initialize(&Timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	if (status != XST_SUCCESS) {
		printf("Timer init failed with status 0x%08X\r\n", status);
		return XST_FAILURE;
	}
	XTmrCtr_SetOptions(&Timer, 0, 0);
	XTmrCtr_Start(&Timer, 0);

	// DMAx2
	XAxiDma_Config *dmarw_cfg = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	status = XAxiDma_CfgInitialize(&DMARW, dmarw_cfg);
	if (status != XST_SUCCESS) {
		printf("DMARW init failed with status 0x%08X\r\n", status);
		return XST_FAILURE;
	}

	XAxiDma_Config *dmar_cfg = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	status = XAxiDma_CfgInitialize(&DMAR, dmar_cfg);
	if (status != XST_SUCCESS) {
		printf("DMAR init failed with status 0x%08X\r\n", status);
		return XST_FAILURE;
	}

	/*
	 * TASK 2 add AXIS MACC initialization here
	 */
	return XST_SUCCESS;
}
