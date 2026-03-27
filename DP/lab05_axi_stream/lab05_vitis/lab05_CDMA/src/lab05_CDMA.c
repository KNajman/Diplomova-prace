#include <stdio.h>
#include "platform.h"
// Timer
#include "xtmrctr.h"
XTmrCtr Timer;
// cdma
#include "xaxicdma.h"
XAxiCdma CDMA;

#include "xparameters.h"
#include "xil_cache.h"

int InitializeDrivers();

SetupBufs(int* src, int* dst, int bytesize);

int main()
{
	int status;
	// src & dst buffers are manually allocated
	int *src = (int*)(XPAR_MIG_7SERIES_0_BASEADDR + 2*1024*1024);
	int *dst = (int*)(XPAR_MIG_7SERIES_0_BASEADDR + 34*1024*1024);
	// buffer size in bytes
	int bytesize = 1024*1024;

    init_platform();

    printf("\r\n---*** LAB05 MicroBlaze ***---\r\n");

    // Initializes CDMA and Timer
    status = InitializeDrivers();
    if (status != XST_SUCCESS) {
    	return status;
    }

    /*
     * TASK 1
     *
     * Create function SetupBufs(int* src, int* dst, int bytesize) that will
     * clear dst buffer, setup src buffer (incrementing value). Use memset to clear.
     *
     * measure time that takes CPU to copy src -> dst
     * use XTmrCtr_GetValue(InstancePtr, TmrCtrNumber) function
     * use memcpy to copy data
     */

    /*
     * TASK 2
     *
     * Clear buffers
     * measure time that takes CDMA to copy buffer
     * use XAxiCdma_SimpleTransfer(InstancePtr, SrcAddr, DstAddr, Length, SimpleCallBack, CallbackRef) function.
     * 		Pass NULL to callback functions and argument
     * 		Check return value for errors. Should return XST_SUCCESS
     * to check task completion poll DMA status using XAxiCdma_IsBusy(InstancePtr).
     * 		Function returns 1 when busy, 0 when done
     * check CDMA for errors XAxiCdma_GetError(InstancePtr). Return 0 if OK.
     *
     * implement function int CheckBuffers(void* src, void* dst, int bsize) that compares whether transfer was valid
     * 		compare transferred arrays
     */


    /*
     * TASK 3
     * Explore Xil_DCacheFlushRange(adr, len) and Xil_DCacheInvalidateRange(adr, len) functions to fix "erroneous" behavior
     *
     * Update the code in a way to measure CPU, CDMA (W/O cache clean) and CDMA (with cache clean) transfer speeds
     * Report in MB/s. Use buffer sizes from 8 bytes to 16MBytes. Use logarithmic scale for x axis (size).
     * Measure in Release configuration (ie with optimization enabled)
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


	// CDMA
	XAxiCdma_Config *cdma_cfg = XAxiCdma_LookupConfig(XPAR_AXICDMA_0_DEVICE_ID);
	status = XAxiCdma_CfgInitialize(&CDMA, cdma_cfg, cdma_cfg->BaseAddress);
	if (status != XST_SUCCESS) {
		printf("CDMA init failed with status 0x%08X\r\n", status);
		return XST_FAILURE;
	}
	XAxiCdma_IntrDisable(&CDMA, XAXICDMA_XR_IRQ_ALL_MASK);

	return XST_SUCCESS;
}
