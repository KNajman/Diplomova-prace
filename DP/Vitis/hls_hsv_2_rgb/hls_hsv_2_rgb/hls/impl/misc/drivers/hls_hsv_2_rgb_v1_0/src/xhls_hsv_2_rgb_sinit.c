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
#include "xhls_hsv_2_rgb.h"

extern XHls_hsv_2_rgb_Config XHls_hsv_2_rgb_ConfigTable[];

#ifdef SDT
XHls_hsv_2_rgb_Config *XHls_hsv_2_rgb_LookupConfig(UINTPTR BaseAddress) {
	XHls_hsv_2_rgb_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XHls_hsv_2_rgb_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XHls_hsv_2_rgb_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XHls_hsv_2_rgb_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_hsv_2_rgb_Initialize(XHls_hsv_2_rgb *InstancePtr, UINTPTR BaseAddress) {
	XHls_hsv_2_rgb_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_hsv_2_rgb_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_hsv_2_rgb_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XHls_hsv_2_rgb_Config *XHls_hsv_2_rgb_LookupConfig(u16 DeviceId) {
	XHls_hsv_2_rgb_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XHLS_HSV_2_RGB_NUM_INSTANCES; Index++) {
		if (XHls_hsv_2_rgb_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XHls_hsv_2_rgb_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_hsv_2_rgb_Initialize(XHls_hsv_2_rgb *InstancePtr, u16 DeviceId) {
	XHls_hsv_2_rgb_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_hsv_2_rgb_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_hsv_2_rgb_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

