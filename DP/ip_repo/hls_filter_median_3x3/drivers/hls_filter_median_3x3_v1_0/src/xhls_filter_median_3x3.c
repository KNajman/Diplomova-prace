// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xhls_filter_median_3x3.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHls_filter_median_3x3_CfgInitialize(XHls_filter_median_3x3 *InstancePtr, XHls_filter_median_3x3_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XHls_filter_median_3x3_Start(XHls_filter_median_3x3 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_AP_CTRL) & 0x80;
    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XHls_filter_median_3x3_IsDone(XHls_filter_median_3x3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XHls_filter_median_3x3_IsIdle(XHls_filter_median_3x3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XHls_filter_median_3x3_IsReady(XHls_filter_median_3x3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XHls_filter_median_3x3_EnableAutoRestart(XHls_filter_median_3x3 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XHls_filter_median_3x3_DisableAutoRestart(XHls_filter_median_3x3 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_AP_CTRL, 0);
}

void XHls_filter_median_3x3_Set_width(XHls_filter_median_3x3 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XHls_filter_median_3x3_Get_width(XHls_filter_median_3x3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XHls_filter_median_3x3_Set_height(XHls_filter_median_3x3 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XHls_filter_median_3x3_Get_height(XHls_filter_median_3x3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

void XHls_filter_median_3x3_InterruptGlobalEnable(XHls_filter_median_3x3 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_GIE, 1);
}

void XHls_filter_median_3x3_InterruptGlobalDisable(XHls_filter_median_3x3 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_GIE, 0);
}

void XHls_filter_median_3x3_InterruptEnable(XHls_filter_median_3x3 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_IER);
    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_IER, Register | Mask);
}

void XHls_filter_median_3x3_InterruptDisable(XHls_filter_median_3x3 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_IER);
    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_IER, Register & (~Mask));
}

void XHls_filter_median_3x3_InterruptClear(XHls_filter_median_3x3 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_median_3x3_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_ISR, Mask);
}

u32 XHls_filter_median_3x3_InterruptGetEnabled(XHls_filter_median_3x3 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_IER);
}

u32 XHls_filter_median_3x3_InterruptGetStatus(XHls_filter_median_3x3 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_filter_median_3x3_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_MEDIAN_3X3_CONTROL_ADDR_ISR);
}

