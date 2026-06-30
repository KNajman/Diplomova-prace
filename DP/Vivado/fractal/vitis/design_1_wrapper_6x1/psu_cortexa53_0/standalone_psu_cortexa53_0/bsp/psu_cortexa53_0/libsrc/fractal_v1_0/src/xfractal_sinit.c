// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xfractal.h"

extern XFractal_Config XFractal_ConfigTable[];

#ifdef SDT
XFractal_Config *XFractal_LookupConfig(UINTPTR BaseAddress) {
	XFractal_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XFractal_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XFractal_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XFractal_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFractal_Initialize(XFractal *InstancePtr, UINTPTR BaseAddress) {
	XFractal_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFractal_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFractal_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XFractal_Config *XFractal_LookupConfig(u16 DeviceId) {
	XFractal_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFRACTAL_NUM_INSTANCES; Index++) {
		if (XFractal_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFractal_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFractal_Initialize(XFractal *InstancePtr, u16 DeviceId) {
	XFractal_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFractal_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFractal_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

