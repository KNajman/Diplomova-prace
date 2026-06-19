// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xhls_passthrough.h"

extern XHls_passthrough_Config XHls_passthrough_ConfigTable[];

#ifdef SDT
XHls_passthrough_Config *XHls_passthrough_LookupConfig(UINTPTR BaseAddress) {
	XHls_passthrough_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XHls_passthrough_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XHls_passthrough_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XHls_passthrough_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_passthrough_Initialize(XHls_passthrough *InstancePtr, UINTPTR BaseAddress) {
	XHls_passthrough_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_passthrough_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_passthrough_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XHls_passthrough_Config *XHls_passthrough_LookupConfig(u16 DeviceId) {
	XHls_passthrough_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XHLS_PASSTHROUGH_NUM_INSTANCES; Index++) {
		if (XHls_passthrough_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XHls_passthrough_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_passthrough_Initialize(XHls_passthrough *InstancePtr, u16 DeviceId) {
	XHls_passthrough_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_passthrough_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_passthrough_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

