// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xhls_color_space_convert_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHls_color_space_convert_top_CfgInitialize(XHls_color_space_convert_top *InstancePtr, XHls_color_space_convert_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XHls_color_space_convert_top_Start(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XHls_color_space_convert_top_IsDone(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XHls_color_space_convert_top_IsIdle(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XHls_color_space_convert_top_IsReady(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XHls_color_space_convert_top_EnableAutoRestart(XHls_color_space_convert_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XHls_color_space_convert_top_DisableAutoRestart(XHls_color_space_convert_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_AP_CTRL, 0);
}

void XHls_color_space_convert_top_Set_coeffs_0_0(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_0_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_0_0(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_0_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_coeffs_0_1(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_1_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_0_1(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_1_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_coeffs_0_2(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_2_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_0_2(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_2_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_coeffs_1_0(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_0_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_1_0(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_0_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_coeffs_1_1(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_1_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_1_1(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_1_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_coeffs_1_2(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_2_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_1_2(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_2_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_coeffs_2_0(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_0_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_2_0(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_0_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_coeffs_2_1(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_1_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_2_1(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_1_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_coeffs_2_2(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_2_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_coeffs_2_2(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_2_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_offsets_0(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_0_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_offsets_0(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_0_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_offsets_1(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_1_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_offsets_1(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_1_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_offsets_2(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_2_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_offsets_2(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_2_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_width(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_width(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XHls_color_space_convert_top_Set_height(XHls_color_space_convert_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XHls_color_space_convert_top_Get_height(XHls_color_space_convert_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

void XHls_color_space_convert_top_InterruptGlobalEnable(XHls_color_space_convert_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_GIE, 1);
}

void XHls_color_space_convert_top_InterruptGlobalDisable(XHls_color_space_convert_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_GIE, 0);
}

void XHls_color_space_convert_top_InterruptEnable(XHls_color_space_convert_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_IER);
    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_IER, Register | Mask);
}

void XHls_color_space_convert_top_InterruptDisable(XHls_color_space_convert_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_IER);
    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XHls_color_space_convert_top_InterruptClear(XHls_color_space_convert_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_color_space_convert_top_WriteReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_ISR, Mask);
}

u32 XHls_color_space_convert_top_InterruptGetEnabled(XHls_color_space_convert_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_IER);
}

u32 XHls_color_space_convert_top_InterruptGetStatus(XHls_color_space_convert_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_color_space_convert_top_ReadReg(InstancePtr->Control_BaseAddress, XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_ISR);
}

