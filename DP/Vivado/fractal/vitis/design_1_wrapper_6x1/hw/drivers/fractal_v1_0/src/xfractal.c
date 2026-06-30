// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xfractal.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFractal_CfgInitialize(XFractal *InstancePtr, XFractal_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFractal_Start(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFractal_IsDone(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFractal_IsIdle(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFractal_IsReady(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFractal_EnableAutoRestart(XFractal *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XFractal_DisableAutoRestart(XFractal *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_AP_CTRL, 0);
}

void XFractal_Set_size_x(XFractal *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_SIZE_X_DATA, Data);
}

u32 XFractal_Get_size_x(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_SIZE_X_DATA);
    return Data;
}

void XFractal_Set_size_y(XFractal *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_SIZE_Y_DATA, Data);
}

u32 XFractal_Get_size_y(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_SIZE_Y_DATA);
    return Data;
}

void XFractal_Set_start_x(XFractal *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_START_X_DATA, Data);
}

u32 XFractal_Get_start_x(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_START_X_DATA);
    return Data;
}

void XFractal_Set_start_y(XFractal *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_START_Y_DATA, Data);
}

u32 XFractal_Get_start_y(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_START_Y_DATA);
    return Data;
}

void XFractal_Set_step_x(XFractal *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_STEP_X_DATA, Data);
}

u32 XFractal_Get_step_x(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_STEP_X_DATA);
    return Data;
}

void XFractal_Set_step_y(XFractal *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_STEP_Y_DATA, Data);
}

u32 XFractal_Get_step_y(XFractal *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_STEP_Y_DATA);
    return Data;
}

void XFractal_Set_result(XFractal *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_RESULT_DATA, (u32)(Data));
    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_RESULT_DATA + 4, (u32)(Data >> 32));
}

u64 XFractal_Get_result(XFractal *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_RESULT_DATA);
    Data += (u64)XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_RESULT_DATA + 4) << 32;
    return Data;
}

void XFractal_InterruptGlobalEnable(XFractal *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_GIE, 1);
}

void XFractal_InterruptGlobalDisable(XFractal *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_GIE, 0);
}

void XFractal_InterruptEnable(XFractal *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_IER);
    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_IER, Register | Mask);
}

void XFractal_InterruptDisable(XFractal *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_IER);
    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XFractal_InterruptClear(XFractal *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFractal_WriteReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_ISR, Mask);
}

u32 XFractal_InterruptGetEnabled(XFractal *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_IER);
}

u32 XFractal_InterruptGetStatus(XFractal *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFractal_ReadReg(InstancePtr->Control_BaseAddress, XFRACTAL_CONTROL_ADDR_ISR);
}

