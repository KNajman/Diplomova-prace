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
#include "xhls_color_space_convert_top.h"

extern XHls_color_space_convert_top_Config XHls_color_space_convert_top_ConfigTable[];

#ifdef SDT
XHls_color_space_convert_top_Config *XHls_color_space_convert_top_LookupConfig(UINTPTR BaseAddress) {
	XHls_color_space_convert_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XHls_color_space_convert_top_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XHls_color_space_convert_top_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XHls_color_space_convert_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_color_space_convert_top_Initialize(XHls_color_space_convert_top *InstancePtr, UINTPTR BaseAddress) {
	XHls_color_space_convert_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_color_space_convert_top_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_color_space_convert_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XHls_color_space_convert_top_Config *XHls_color_space_convert_top_LookupConfig(u16 DeviceId) {
	XHls_color_space_convert_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XHLS_COLOR_SPACE_CONVERT_TOP_NUM_INSTANCES; Index++) {
		if (XHls_color_space_convert_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XHls_color_space_convert_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_color_space_convert_top_Initialize(XHls_color_space_convert_top *InstancePtr, u16 DeviceId) {
	XHls_color_space_convert_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_color_space_convert_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_color_space_convert_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

