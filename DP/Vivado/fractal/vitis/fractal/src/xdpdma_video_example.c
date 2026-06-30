/*******************************************************************************
 * Copyright (C) 2017 - 2022 Xilinx, Inc.  All rights reserved.
 * Copyright (C) 2022 - 2023 Advanced Micro Devices, Inc.  All rights reserved.
 * SPDX-License-Identifier: MIT
 *******************************************************************************/

/*****************************************************************************/
/**
 *
 * @file xdpdma_video_example.c
 *
 *
 * This file contains a design example using the DPDMA driver (XDpDma)
 * This example demonstrates the use of DPDMA for displaying a Graphics Overlay
 *
 * @note
 *
 * None.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who Date     Changes
 * ----- --- -------- -----------------------------------------------
 * 1.0	aad 10/19/17	Initial Release
 * 1.1   aad 02/22/18    Fixed the header
 *</pre>
 *
 ******************************************************************************/

/***************************** Include Files *********************************/

#include "xil_exception.h"
#include <stdlib.h>
#include <stdio.h>
#include "xil_printf.h"
#include "xil_cache.h"
#include "xdpdma_video_example.h"
#include "xtime_l.h"

#include "xfractal.h"
#include "fractal.h"

/************************** Constant Definitions *****************************/
#ifndef SDT
#define DPPSU_DEVICE_ID		XPAR_PSU_DP_DEVICE_ID
#define AVBUF_DEVICE_ID		XPAR_PSU_DP_DEVICE_ID
#define DPDMA_DEVICE_ID		XPAR_XDPDMA_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_SCUGIC_0_DEVICE_ID
#define DPPSU_INTR_ID		151
#define DPDMA_INTR_ID		154

#define DPPSU_BASEADDR		XPAR_PSU_DP_BASEADDR
#define AVBUF_BASEADDR		XPAR_PSU_DP_BASEADDR
#define DPDMA_BASEADDR		XPAR_PSU_DPDMA_BASEADDR
#else
#define DPPSU_BASEADDR		XPAR_XDPPSU_0_BASEADDR
#define AVBUF_BASEADDR		XPAR_XDPPSU_0_BASEADDR
#define DPDMA_BASEADDR		XPAR_XDPDMA_0_BASEADDR
#define INTC_BASEADDR       XPAR_XSCUGIC_0_BASEADDR
#endif

#define FRAMEWIDTH 			1920
#define FRAMEHEIGHT			1080
#define FRAMESIZE			FRAMEWIDTH*FRAMEHEIGHT
#define BUFFERSIZE			FRAMESIZE * 4		/* HTotal * VTotal * BPP */
#define LINESIZE			FRAMEWIDTH * 4			/* HTotal * BPP */
#define STRIDE				LINESIZE			/* The stride value should
													be aligned to 256*/

/************************** Variable Declarations ***************************/
XDpDma DpDma;
XDpPsu DpPsu;
XAVBuf AVBuf;
XScuGic Intr;
Run_Config RunCfg;

u8 Frame[BUFFERSIZE] __attribute__ ((__aligned__(256)));
XDpDma_FrameBuffer FrameBuffer;

int mandelbrot[FRAMESIZE] __attribute__ ((__aligned__(256)));

XFractal Fractal[XPAR_XFRACTAL_NUM_INSTANCES];
#include "axi_video/axi_video.h"
AXI_VIDEO video;

/**************************** Type Definitions *******************************/

/*****************************************************************************/
/**
 *
 * Main function to call the DPDMA Video example.
 *
 * @param	None
 *
 * @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
 *
 * @note		None
 *
 ******************************************************************************/

u32 conv(float value);
int main()
{
//	Xil_DCacheDisable();
//	Xil_ICacheDisable();
	int status;

	status = AXI_VIDEO_Initialize(&video, XPAR_AXI_VIDEO_0_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("Failed to initialize AXI VIDEO");
		return status;
	}

	AXI_VIDEO_SetFrameStartAddress(&video, (u64)Frame);
	AXI_VIDEO_SetFrameSize(&video, BUFFERSIZE);
	AXI_VIDEO_SetTiming(&video, &FullHD60);
	AXI_VIDEO_Start(&video);


	status = DpdmaVideoExample(&RunCfg);
	if (status != XST_SUCCESS) {
		xil_printf("DPDMA Video Example Test Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran DPDMA Video Example Test\r\n");

	for (int fid = 0; fid < XPAR_XFRACTAL_NUM_INSTANCES; fid++) {
		status = XFractal_Initialize(&Fractal[fid], fid);
		if (status != XST_SUCCESS) {
			xil_printf("Failed to initialize Fractal driver %d\r\n", fid);
			return status;
		}
	}

	float center_x = 2.613577e-1;
	float center_y = -2.018128e-3;

	static float r_x = 3;
	static float r_y = 3;

	XTime t0, t1;

	float zoom = 0.99;

	while(1) {

		XTime_GetTime(&t0);
		float x0 = center_x - r_x/2;
		float y0 = center_y - r_y/2;
		int size_x = FRAMEWIDTH;
		int size_y = FRAMEHEIGHT / XPAR_XFRACTAL_NUM_INSTANCES;
		float step_x = r_x / FRAMEWIDTH;
		float step_y = r_y / FRAMEHEIGHT;
		for (int fid = 0; fid < XPAR_XFRACTAL_NUM_INSTANCES; fid++) {

			XFractal_Set_result(&Fractal[fid], (u64)&mandelbrot[fid*FRAMEWIDTH*FRAMEHEIGHT/XPAR_XFRACTAL_NUM_INSTANCES]);
			XFractal_Set_size_x(&Fractal[fid], size_x);
			XFractal_Set_size_y(&Fractal[fid], size_y);
			XFractal_Set_start_x(&Fractal[fid], conv(x0));
			XFractal_Set_start_y(&Fractal[fid], conv(y0 + fid*(r_y / (XPAR_XFRACTAL_NUM_INSTANCES))));
			XFractal_Set_step_x(&Fractal[fid], conv(step_x));
			XFractal_Set_step_y(&Fractal[fid], conv(step_y));

		}
		for (int fid = 0; fid < XPAR_XFRACTAL_NUM_INSTANCES; fid++) {
			XFractal_Start(&Fractal[fid]);
		}

		int done[XPAR_XFRACTAL_NUM_INSTANCES];
		for (int fid = 0; fid < XPAR_XFRACTAL_NUM_INSTANCES; fid++) {
			done[fid] = 0;
		}

		while (1) {
			for (int fid = 0; fid < XPAR_XFRACTAL_NUM_INSTANCES; fid++) {
				if (XFractal_IsDone(&Fractal[fid])) {
					done[fid] = 1;
				}
			}
			int done_cnt = 0;
			for (int fid = 0; fid < XPAR_XFRACTAL_NUM_INSTANCES; fid++) {
				done_cnt += done[fid];
			}
			if (done_cnt >= XPAR_XFRACTAL_NUM_INSTANCES) {
				break;
			}

		}
		XTime_GetTime(&t1);
		printf("HW: %f s\r\n", ((float)(t1-t0))/COUNTS_PER_SECOND);

		u32 *RGBA;
		RGBA = (u32 *) Frame;
		for (int p = 0; p < FRAMESIZE; p++) {
			u32 c = mandelbrot[p];
			RGBA[p] = 0xFF000000 | (c << 16) | (c << 8) | (c);
		}
		Xil_DCacheFlushRange((INTPTR)RGBA, BUFFERSIZE);
		r_x *= zoom;
		r_y *= zoom;

		if (r_x < 0.0001) {
			zoom = 1.01;
		} else if (r_x > 3) {
			zoom = 0.99;
		}
	}

	while(1) {

	}

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
 *
 * The purpose of this function is to illustrate how to use the XDpDma device
 * driver in Graphics overlay mode.
 *
 * @param	RunCfgPtr is a pointer to the application configuration structure.
 *
 * @return	XST_SUCCESS if successful, else XST_FAILURE.
 *
 * @note		None.
 *
 *****************************************************************************/
int DpdmaVideoExample(Run_Config *RunCfgPtr)

{
	u32 Status;
	/* Initialize the application configuration */
	InitRunConfig(RunCfgPtr);
	Status = InitDpDmaSubsystem(RunCfgPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	xil_printf("Generating Overlay.....\n\r");
	GraphicsOverlay(Frame, RunCfgPtr);

	/* Populate the FrameBuffer structure with the frame attributes */
	FrameBuffer.Address = (INTPTR)Frame;
	FrameBuffer.Stride = STRIDE;
	FrameBuffer.LineSize = LINESIZE;
	FrameBuffer.Size = BUFFERSIZE;

	SetupInterrupts(RunCfgPtr);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
 *
 * The purpose of this function is to initialize the application configuration.
 *
 * @param	RunCfgPtr is a pointer to the application configuration structure.
 *
 * @return	None.
 *
 * @note		None.
 *
 *****************************************************************************/
void InitRunConfig(Run_Config *RunCfgPtr)
{
	/* Initial configuration parameters. */
	RunCfgPtr->DpPsuPtr   = &DpPsu;
	RunCfgPtr->IntrPtr   = &Intr;
	RunCfgPtr->AVBufPtr  = &AVBuf;
	RunCfgPtr->DpDmaPtr  = &DpDma;
	RunCfgPtr->VideoMode = XVIDC_VM_1920x1080_60_P;
	RunCfgPtr->Bpc		 = XVIDC_BPC_8;
	RunCfgPtr->ColorEncode			= XDPPSU_CENC_RGB;
	RunCfgPtr->UseMaxCfgCaps		= 1;
	RunCfgPtr->LaneCount			= LANE_COUNT_2;
	RunCfgPtr->LinkRate				= LINK_RATE_540GBPS;
	RunCfgPtr->EnSynchClkMode		= 0;
	RunCfgPtr->UseMaxLaneCount		= 1;
	RunCfgPtr->UseMaxLinkRate		= 1;
}

/*****************************************************************************/
/**
 *
 * The purpose of this function is to initialize the DP Subsystem (XDpDma,
 * XAVBuf, XDpPsu)
 *
 * @param	RunCfgPtr is a pointer to the application configuration structure.
 *
 * @return	None.
 *
 * @note		None.
 *
 *****************************************************************************/
int InitDpDmaSubsystem(Run_Config *RunCfgPtr)
{
	u32 Status;
	XDpPsu		*DpPsuPtr = RunCfgPtr->DpPsuPtr;
	XDpPsu_Config	*DpPsuCfgPtr;
	XAVBuf		*AVBufPtr = RunCfgPtr->AVBufPtr;
	XDpDma_Config *DpDmaCfgPtr;
	XDpDma		*DpDmaPtr = RunCfgPtr->DpDmaPtr;


	/* Initialize DisplayPort driver. */
#ifndef SDT
	DpPsuCfgPtr = XDpPsu_LookupConfig(DPPSU_DEVICE_ID);
#else
	DpPsuCfgPtr = XDpPsu_LookupConfig(DPPSU_BASEADDR);
#endif
	XDpPsu_CfgInitialize(DpPsuPtr, DpPsuCfgPtr, DpPsuCfgPtr->BaseAddr);
	/* Initialize Video Pipeline driver */
#ifndef SDT
	XAVBuf_CfgInitialize(AVBufPtr, DpPsuPtr->Config.BaseAddr, AVBUF_DEVICE_ID);
#else
	XAVBuf_CfgInitialize(AVBufPtr, DpPsuPtr->Config.BaseAddr);
#endif

	/* Initialize the DPDMA driver */
#ifndef SDT
	DpDmaCfgPtr = XDpDma_LookupConfig(DPDMA_DEVICE_ID);
#else
	DpDmaCfgPtr = XDpDma_LookupConfig(DPDMA_BASEADDR);
#endif
	XDpDma_CfgInitialize(DpDmaPtr,DpDmaCfgPtr);

	/* Initialize the DisplayPort TX core. */
	Status = XDpPsu_InitializeTx(DpPsuPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	/* Set the format graphics frame for DPDMA*/
	Status = XDpDma_SetGraphicsFormat(DpDmaPtr, RGBA8888);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	/* Set the format graphics frame for Video Pipeline*/
	Status = XAVBuf_SetInputNonLiveGraphicsFormat(AVBufPtr, RGBA8888);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	/* Set the QOS for Video */
	XDpDma_SetQOS(RunCfgPtr->DpDmaPtr, 11);
	/* Enable the Buffers required by Graphics Channel */
	XAVBuf_EnableGraphicsBuffers(RunCfgPtr->AVBufPtr, 1);
	/* Set the output Video Format */
	XAVBuf_SetOutputVideoFormat(AVBufPtr, RGB_8BPC);

	/* Select the Input Video Sources.
	 * Here in this example we are going to demonstrate
	 * graphics overlay over the TPG video.
	 */
//	XAVBuf_InputVideoSelect(AVBufPtr, XAVBUF_VIDSTREAM1_NONE,
//			XAVBUF_VIDSTREAM2_NONLIVE_GFX);
	XAVBuf_InputVideoSelect(AVBufPtr, XAVBUF_VIDSTREAM1_LIVE,
				XAVBUF_VIDSTREAM2_NONE);
	/* Configure Video pipeline for graphics channel */
	XAVBuf_ConfigureGraphicsPipeline(AVBufPtr);
	/* Configure the output video pipeline */
	XAVBuf_ConfigureOutputVideo(AVBufPtr);
	/* Disable the global alpha, since we are using the pixel based alpha */
	XAVBuf_SetBlenderAlpha(AVBufPtr, 0, 0);
	/* Set the clock mode */
	XDpPsu_CfgMsaEnSynchClkMode(DpPsuPtr, RunCfgPtr->EnSynchClkMode);
	/* Set the clock source depending on the use case.
	 * Here for simplicity we are using PS clock as the source*/
	XAVBuf_SetAudioVideoClkSrc(AVBufPtr, XAVBUF_PS_CLK, XAVBUF_PS_CLK);
	/* Issue a soft reset after selecting the input clock sources */
	XAVBuf_SoftReset(AVBufPtr);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
 *
 * The purpose of this function is to setup call back functions for the DP
 * controller interrupts.
 *
 * @param	RunCfgPtr is a pointer to the application configuration structure.
 *
 * @return	None.
 *
 * @note		None.
 *
 *****************************************************************************/
void SetupInterrupts(Run_Config *RunCfgPtr)
{
	XDpPsu *DpPsuPtr = RunCfgPtr->DpPsuPtr;
	XScuGic		*IntrPtr = RunCfgPtr->IntrPtr;
	XScuGic_Config	*IntrCfgPtr;
	u32  IntrMask = XDPPSU_INTR_HPD_IRQ_MASK | XDPPSU_INTR_HPD_EVENT_MASK;

	XDpPsu_WriteReg(DpPsuPtr->Config.BaseAddr, XDPPSU_INTR_DIS, 0xFFFFFFFF);
	XDpPsu_WriteReg(DpPsuPtr->Config.BaseAddr, XDPPSU_INTR_MASK, 0xFFFFFFFF);

	XDpPsu_SetHpdEventHandler(DpPsuPtr, DpPsu_IsrHpdEvent, RunCfgPtr);
	XDpPsu_SetHpdPulseHandler(DpPsuPtr, DpPsu_IsrHpdPulse, RunCfgPtr);

#ifndef SDT
	/* Initialize interrupt controller driver. */
	IntrCfgPtr = XScuGic_LookupConfig(INTC_DEVICE_ID);
	XScuGic_CfgInitialize(IntrPtr, IntrCfgPtr, IntrCfgPtr->CpuBaseAddress);

	/* Register ISRs. */
	XScuGic_Connect(IntrPtr, DPPSU_INTR_ID,
			(Xil_InterruptHandler)XDpPsu_HpdInterruptHandler, RunCfgPtr->DpPsuPtr);

	/* Trigger DP interrupts on rising edge. */
	XScuGic_SetPriorityTriggerType(IntrPtr, DPPSU_INTR_ID, 0x0, 0x03);


	/* Connect DPDMA Interrupt */
	XScuGic_Connect(IntrPtr, DPDMA_INTR_ID,
			(Xil_ExceptionHandler)XDpDma_InterruptHandler, RunCfgPtr->DpDmaPtr);

	/* Initialize exceptions. */
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
			(Xil_ExceptionHandler)XScuGic_DeviceInterruptHandler,
			INTC_DEVICE_ID);

	/* Enable exceptions for interrupts. */
	Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);
	Xil_ExceptionEnable();

	/* Enable DP interrupts. */
	XScuGic_Enable(IntrPtr, DPPSU_INTR_ID);
	XDpPsu_WriteReg(DpPsuPtr->Config.BaseAddr, XDPPSU_INTR_EN, IntrMask);

	/* Enable DPDMA Interrupts */
	XScuGic_Enable(IntrPtr, DPDMA_INTR_ID);
	XDpDma_InterruptEnable(RunCfgPtr->DpDmaPtr, XDPDMA_IEN_VSYNC_INT_MASK);
#else
	XSetupInterruptSystem(RunCfgPtr->DpPsuPtr, &XDpPsu_HpdInterruptHandler, RunCfgPtr->DpPsuPtr->Config.IntrId,
			RunCfgPtr->DpPsuPtr->Config.IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
	XDpPsu_WriteReg(DpPsuPtr->Config.BaseAddr, XDPPSU_INTR_EN, IntrMask);
	XSetupInterruptSystem(RunCfgPtr->DpDmaPtr, &XDpDma_InterruptHandler, RunCfgPtr->DpDmaPtr->Config.IntrId,
			RunCfgPtr->DpDmaPtr->Config.IntrParent, XINTERRUPT_DEFAULT_PRIORITY);
	XDpDma_InterruptEnable(RunCfgPtr->DpDmaPtr, XDPDMA_IEN_VSYNC_INT_MASK);
#endif
}
/*****************************************************************************/
/**
 *
 * The purpose of this function is to generate a Graphics frame of the format
 * RGBA8888 which generates an overlay on 1/2 of the bottom of the screen.
 * This is just to illustrate the functionality of the graphics overlay.
 *
 * @param	RunCfgPtr is a pointer to the application configuration structure.
 * @param	Frame is a pointer to a buffer which is going to be populated with
 * 			rendered frame
 *
 * @return	Returns a pointer to the frame.
 *
 * @note		None.
 *
 *****************************************************************************/
u8 *GraphicsOverlay(u8* Frame, Run_Config *RunCfgPtr)
{
	u64 Index;
	u32 *RGBA;
	RGBA = (u32 *) Frame;
	/*
	 * Red at the top half
	 * Alpha = 0x0F
	 * */
	for(Index = 0; Index < (BUFFERSIZE/4) /2; Index ++) {
		RGBA[Index] = 0x0F0000FF;
	}
	for(; Index < BUFFERSIZE/4; Index ++) {
		/*
		 * Green at the bottom half
		 * Alpha = 0xF0
		 * */
		RGBA[Index] = 0xF000FF00;
	}
	Xil_DCacheFlushRange((INTPTR)Frame, BUFFERSIZE);

	return Frame;
}

u32 conv(float value) {
	u32* uval = (u32*)&value;
	return uval[0];

}
