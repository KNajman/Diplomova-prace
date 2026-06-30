#include "../axi_video/axi_video.h"
#include "xparameters.h"
#include "xstatus.h"

VideoTiming_t VGA480p = {
		640,	// HActive
		16,		// HFPorch
		96,		// HSync
		48,		// HBPorch
		0,		// HSyncPolarity
		480,	// VActive
		10,		// VFPorch
		2,		// VSync
		33,		// VBPorch
		0		// VSyncPolarity
};

VideoTiming_t XGA768p = {
		1024,	// HActive
		24,		// HFPorch
		136,	// HSync
		160,	// HBPorch
		1,		// HSyncPolarity
		768,	// VActive
		3,		// VFPorch
		6,		// VSync
		29,		// VBPorch
		1		// VSyncPolarity
};

VideoTiming_t VESA1024p = {
		1280,	// HActive
		48,		// HFPorch
		112,	// HSync
		248,	// HBPorch
		1,		// HSyncPolarity
		1024,	// VActive
		1,		// VFPorch
		3,		// VSync
		38,		// VBPorch
		1		// VSyncPolarity
};

VideoTiming_t FullHD60 = {
		1920,	// HActive
		88,		// HFPorch
		44,	// HSync
		148,	// HBPorch
		1,		// HSyncPolarity
		1080,	// VActive
		4,		// VFPorch
		5,		// VSync
		36,		// VBPorch
		1		// VSyncPolarity
};


int AXI_VIDEO_Initialize(AXI_VIDEO* InstancePtr, int DeviceId) {
	AXI_VIDEO_Config *CfgPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_AXI_VIDEO_NUM_INSTANCES; Index++) {
		if (AXI_VIDEO_ConfigTable[Index].DeviceId == DeviceId) {
			CfgPtr = &AXI_VIDEO_ConfigTable[Index];
			break;
		}
	}

	if (CfgPtr == NULL) {
		return XST_FAILURE;
	}

	InstancePtr->BaseAddress = CfgPtr->BaseAddress;
	InstancePtr->AXIDataWidth = CfgPtr->AXIDataWidth;
	InstancePtr->MaxLineWidth = CfgPtr->MaxLineWidth;

	InstancePtr->IsReady = XIL_COMPONENT_IS_READY;
	InstancePtr->IsRunning = 0;

	return XST_SUCCESS;
}

void AXI_VIDEO_Reset(AXI_VIDEO* InstancePtr) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control | AXI_VIDEO_BIT_REG_CONTROL_RESET);
}

void AXI_VIDEO_SetPolarityHSync(AXI_VIDEO* InstancePtr, int Polarity) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	if (Polarity) {
		AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control | AXI_VIDEO_BIT_REG_CONTROL_POLARITY_H_SYNC);
	} else {
		AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control & ~AXI_VIDEO_BIT_REG_CONTROL_POLARITY_H_SYNC);
	}
}

void AXI_VIDEO_SetPolarityVSync(AXI_VIDEO* InstancePtr, int Polarity) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	if (Polarity) {
		AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control | AXI_VIDEO_BIT_REG_CONTROL_POLARITY_V_SYNC);
	} else {
		AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control & ~AXI_VIDEO_BIT_REG_CONTROL_POLARITY_V_SYNC);
	}
}

void AXI_VIDEO_Start(AXI_VIDEO* InstancePtr) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control | AXI_VIDEO_BIT_REG_CONTROL_RUN);
	InstancePtr->IsRunning = 1;
}

void AXI_VIDEO_Stop(AXI_VIDEO* InstancePtr) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control & ~AXI_VIDEO_BIT_REG_CONTROL_RUN);
	InstancePtr->IsRunning = 0;
}

void AXI_VIDEO_SetVFSMReset(AXI_VIDEO* InstancePtr) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control | AXI_VIDEO_BIT_REG_CONTROL_VFSM_RESET);
}
void AXI_VIDEO_ClearVFSMReset(AXI_VIDEO* InstancePtr) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control & ~AXI_VIDEO_BIT_REG_CONTROL_VFSM_RESET);
}

void AXI_VIDEO_SetBGRAMode(AXI_VIDEO* InstancePtr, int BGRA) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	if (BGRA) {
		AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control | AXI_VIDEO_BIT_REG_CONTROL_VFSM_BGRA);
	} else {
		AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL, reg_control & ~AXI_VIDEO_BIT_REG_CONTROL_VFSM_BGRA);
	}
}

int AXI_VIDEO_GetVFSMError(AXI_VIDEO* InstancePtr, u32* Status) {
	if (InstancePtr == NULL) {
		return XST_FAILURE;
	}
	if (InstancePtr->IsReady != 1) {
		return XST_FAILURE;
	}

	u32 reg_control = AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_CONTROL);
	*Status = (reg_control & AXI_VIDEO_MASK_REG_CONTROL_VFSM_STATUS) >> AXI_VIDEO_SHIFT_REG_CONTROL_VFSM_STATUS;
	return reg_control & AXI_VIDEO_BIT_REG_CONTROL_VFSM_ERROR;
}

/* Timing & Streaming */
void AXI_VIDEO_SetFrameStartAddress(AXI_VIDEO* InstancePtr, u64 FrameAddress) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_STREAM_BASEADDR_HIGH, FrameAddress>>32);
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_STREAM_BASEADDR_LOW, FrameAddress);
}

void AXI_VIDEO_SetFrameSize(AXI_VIDEO* InstancePtr, int ByteSize) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	int word_frame_size = ByteSize / (InstancePtr->AXIDataWidth/8);
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_FRAMESIZE, word_frame_size);
}

void AXI_VIDEO_SetTiming(AXI_VIDEO* InstancePtr, VideoTiming_t* Timing) {
	Xil_AssertVoid(InstancePtr != NULL);
	Xil_AssertVoid(Timing != NULL);
	Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

	int incremental = 0;

	incremental = Timing->HActive - 1;
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_VIDEO_H_ACTIVE, incremental);
	incremental += Timing->HFrontPorch;
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_VIDEO_H_FPORCH, incremental);
	incremental += Timing->HSync;
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_VIDEO_H_SYNC, incremental);
	incremental += Timing->HBackPorch;
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_VIDEO_H_BPORCH, incremental);
	AXI_VIDEO_SetPolarityHSync(InstancePtr, Timing->HPolarity);

	incremental = Timing->VActive - 1;
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_VIDEO_V_ACTIVE, incremental);
	incremental += Timing->VFrontPorch;
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_VIDEO_V_FPORCH, incremental);
	incremental += Timing->VSync;
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_VIDEO_V_SYNC, incremental);
	incremental += Timing->VBackPorch;
	AXI_VIDEO_mWriteReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_VIDEO_V_BPORCH, incremental);
	AXI_VIDEO_SetPolarityVSync(InstancePtr, Timing->VPolarity);
}

int AXI_VIDEO_GetFIFOStatus(AXI_VIDEO* InstancePtr) {
	if (InstancePtr == NULL) {
		return XST_FAILURE;
	}
	if (InstancePtr->IsReady != 1) {
		return XST_FAILURE;
	}

	return AXI_VIDEO_mReadReg(InstancePtr->BaseAddress, AXI_VIDEO_OFFSET_REG_FIFO_STATUS);
}
