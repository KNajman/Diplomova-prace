// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xhls_passthrough.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHls_passthrough_CfgInitialize(XHls_passthrough *InstancePtr, XHls_passthrough_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XHls_passthrough_Start(XHls_passthrough *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_passthrough_ReadReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_AP_CTRL) & 0x80;
    XHls_passthrough_WriteReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XHls_passthrough_IsDone(XHls_passthrough *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_passthrough_ReadReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XHls_passthrough_IsIdle(XHls_passthrough *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_passthrough_ReadReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XHls_passthrough_IsReady(XHls_passthrough *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_passthrough_ReadReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XHls_passthrough_EnableAutoRestart(XHls_passthrough *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_passthrough_WriteReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XHls_passthrough_DisableAutoRestart(XHls_passthrough *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_passthrough_WriteReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_AP_CTRL, 0);
}

void XHls_passthrough_InterruptGlobalEnable(XHls_passthrough *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_passthrough_WriteReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_GIE, 1);
}

void XHls_passthrough_InterruptGlobalDisable(XHls_passthrough *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_passthrough_WriteReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_GIE, 0);
}

void XHls_passthrough_InterruptEnable(XHls_passthrough *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_passthrough_ReadReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_IER);
    XHls_passthrough_WriteReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_IER, Register | Mask);
}

void XHls_passthrough_InterruptDisable(XHls_passthrough *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_passthrough_ReadReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_IER);
    XHls_passthrough_WriteReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_IER, Register & (~Mask));
}

void XHls_passthrough_InterruptClear(XHls_passthrough *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_passthrough_WriteReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_ISR, Mask);
}

u32 XHls_passthrough_InterruptGetEnabled(XHls_passthrough *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_passthrough_ReadReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_IER);
}

u32 XHls_passthrough_InterruptGetStatus(XHls_passthrough *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_passthrough_ReadReg(InstancePtr->Control_BaseAddress, XHLS_PASSTHROUGH_CONTROL_ADDR_ISR);
}

