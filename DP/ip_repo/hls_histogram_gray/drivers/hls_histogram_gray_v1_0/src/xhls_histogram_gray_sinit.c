// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xhls_histogram_gray.h"

extern XHls_histogram_gray_Config XHls_histogram_gray_ConfigTable[];

#ifdef SDT
XHls_histogram_gray_Config *XHls_histogram_gray_LookupConfig(UINTPTR BaseAddress) {
	XHls_histogram_gray_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XHls_histogram_gray_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XHls_histogram_gray_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XHls_histogram_gray_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_histogram_gray_Initialize(XHls_histogram_gray *InstancePtr, UINTPTR BaseAddress) {
	XHls_histogram_gray_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_histogram_gray_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_histogram_gray_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XHls_histogram_gray_Config *XHls_histogram_gray_LookupConfig(u16 DeviceId) {
	XHls_histogram_gray_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XHLS_HISTOGRAM_GRAY_NUM_INSTANCES; Index++) {
		if (XHls_histogram_gray_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XHls_histogram_gray_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_histogram_gray_Initialize(XHls_histogram_gray *InstancePtr, u16 DeviceId) {
	XHls_histogram_gray_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_histogram_gray_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_histogram_gray_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

