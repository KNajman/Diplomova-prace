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
#include "xhls_filter_median_3x3.h"

extern XHls_filter_median_3x3_Config XHls_filter_median_3x3_ConfigTable[];

#ifdef SDT
XHls_filter_median_3x3_Config *XHls_filter_median_3x3_LookupConfig(UINTPTR BaseAddress) {
	XHls_filter_median_3x3_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XHls_filter_median_3x3_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XHls_filter_median_3x3_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XHls_filter_median_3x3_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_filter_median_3x3_Initialize(XHls_filter_median_3x3 *InstancePtr, UINTPTR BaseAddress) {
	XHls_filter_median_3x3_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_filter_median_3x3_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_filter_median_3x3_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XHls_filter_median_3x3_Config *XHls_filter_median_3x3_LookupConfig(u16 DeviceId) {
	XHls_filter_median_3x3_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XHLS_FILTER_MEDIAN_3X3_NUM_INSTANCES; Index++) {
		if (XHls_filter_median_3x3_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XHls_filter_median_3x3_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_filter_median_3x3_Initialize(XHls_filter_median_3x3 *InstancePtr, u16 DeviceId) {
	XHls_filter_median_3x3_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_filter_median_3x3_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_filter_median_3x3_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

