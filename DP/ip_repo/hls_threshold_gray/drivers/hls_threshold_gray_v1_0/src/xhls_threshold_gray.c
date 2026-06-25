// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xhls_threshold_gray.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHls_threshold_gray_CfgInitialize(XHls_threshold_gray *InstancePtr, XHls_threshold_gray_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XHls_threshold_gray_Start(XHls_threshold_gray *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_AP_CTRL) & 0x80;
    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XHls_threshold_gray_IsDone(XHls_threshold_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XHls_threshold_gray_IsIdle(XHls_threshold_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XHls_threshold_gray_IsReady(XHls_threshold_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XHls_threshold_gray_EnableAutoRestart(XHls_threshold_gray *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XHls_threshold_gray_DisableAutoRestart(XHls_threshold_gray *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_AP_CTRL, 0);
}

void XHls_threshold_gray_Set_thresh_val(XHls_threshold_gray *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_THRESH_VAL_DATA, Data);
}

u32 XHls_threshold_gray_Get_thresh_val(XHls_threshold_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_THRESH_VAL_DATA);
    return Data;
}

void XHls_threshold_gray_Set_thresh_type(XHls_threshold_gray *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_THRESH_TYPE_DATA, Data);
}

u32 XHls_threshold_gray_Get_thresh_type(XHls_threshold_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_THRESH_TYPE_DATA);
    return Data;
}

void XHls_threshold_gray_Set_width(XHls_threshold_gray *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XHls_threshold_gray_Get_width(XHls_threshold_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XHls_threshold_gray_Set_height(XHls_threshold_gray *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XHls_threshold_gray_Get_height(XHls_threshold_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

void XHls_threshold_gray_InterruptGlobalEnable(XHls_threshold_gray *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_GIE, 1);
}

void XHls_threshold_gray_InterruptGlobalDisable(XHls_threshold_gray *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_GIE, 0);
}

void XHls_threshold_gray_InterruptEnable(XHls_threshold_gray *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_IER);
    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_IER, Register | Mask);
}

void XHls_threshold_gray_InterruptDisable(XHls_threshold_gray *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_IER);
    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_IER, Register & (~Mask));
}

void XHls_threshold_gray_InterruptClear(XHls_threshold_gray *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_threshold_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_ISR, Mask);
}

u32 XHls_threshold_gray_InterruptGetEnabled(XHls_threshold_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_IER);
}

u32 XHls_threshold_gray_InterruptGetStatus(XHls_threshold_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_threshold_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_THRESHOLD_GRAY_CONTROL_ADDR_ISR);
}

