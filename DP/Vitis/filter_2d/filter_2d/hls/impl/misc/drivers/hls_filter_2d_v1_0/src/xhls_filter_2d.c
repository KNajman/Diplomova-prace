// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xhls_filter_2d.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHls_filter_2d_CfgInitialize(XHls_filter_2d *InstancePtr, XHls_filter_2d_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XHls_filter_2d_Start(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_AP_CTRL) & 0x80;
    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XHls_filter_2d_IsDone(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XHls_filter_2d_IsIdle(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XHls_filter_2d_IsReady(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XHls_filter_2d_EnableAutoRestart(XHls_filter_2d *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XHls_filter_2d_DisableAutoRestart(XHls_filter_2d *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_AP_CTRL, 0);
}

void XHls_filter_2d_Set_width(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XHls_filter_2d_Get_width(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XHls_filter_2d_Set_height(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XHls_filter_2d_Get_height(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_0_0(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_0_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_0_0(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_0_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_0_1(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_1_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_0_1(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_1_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_0_2(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_2_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_0_2(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_2_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_0_3(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_3_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_0_3(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_3_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_0_4(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_4_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_0_4(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_0_4_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_1_0(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_0_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_1_0(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_0_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_1_1(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_1_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_1_1(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_1_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_1_2(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_2_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_1_2(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_2_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_1_3(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_3_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_1_3(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_3_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_1_4(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_4_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_1_4(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_1_4_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_2_0(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_0_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_2_0(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_0_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_2_1(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_1_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_2_1(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_1_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_2_2(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_2_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_2_2(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_2_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_2_3(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_3_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_2_3(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_3_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_2_4(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_4_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_2_4(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_2_4_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_3_0(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_0_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_3_0(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_0_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_3_1(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_1_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_3_1(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_1_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_3_2(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_2_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_3_2(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_2_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_3_3(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_3_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_3_3(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_3_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_3_4(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_4_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_3_4(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_3_4_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_4_0(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_0_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_4_0(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_0_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_4_1(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_1_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_4_1(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_1_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_4_2(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_2_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_4_2(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_2_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_4_3(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_3_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_4_3(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_3_DATA);
    return Data;
}

void XHls_filter_2d_Set_kernel_4_4(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_4_DATA, Data);
}

u32 XHls_filter_2d_Get_kernel_4_4(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_KERNEL_4_4_DATA);
    return Data;
}

void XHls_filter_2d_Set_inv_divisor(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_INV_DIVISOR_DATA, Data);
}

u32 XHls_filter_2d_Get_inv_divisor(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_INV_DIVISOR_DATA);
    return Data;
}

void XHls_filter_2d_Set_fraction_bits(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_FRACTION_BITS_DATA, Data);
}

u32 XHls_filter_2d_Get_fraction_bits(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_FRACTION_BITS_DATA);
    return Data;
}

void XHls_filter_2d_Set_delta(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_DELTA_DATA, Data);
}

u32 XHls_filter_2d_Get_delta(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_DELTA_DATA);
    return Data;
}

void XHls_filter_2d_Set_borderType(XHls_filter_2d *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_BORDERTYPE_DATA, Data);
}

u32 XHls_filter_2d_Get_borderType(XHls_filter_2d *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_BORDERTYPE_DATA);
    return Data;
}

void XHls_filter_2d_InterruptGlobalEnable(XHls_filter_2d *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_GIE, 1);
}

void XHls_filter_2d_InterruptGlobalDisable(XHls_filter_2d *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_GIE, 0);
}

void XHls_filter_2d_InterruptEnable(XHls_filter_2d *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_IER);
    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_IER, Register | Mask);
}

void XHls_filter_2d_InterruptDisable(XHls_filter_2d *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_IER);
    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_IER, Register & (~Mask));
}

void XHls_filter_2d_InterruptClear(XHls_filter_2d *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_filter_2d_WriteReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_ISR, Mask);
}

u32 XHls_filter_2d_InterruptGetEnabled(XHls_filter_2d *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_IER);
}

u32 XHls_filter_2d_InterruptGetStatus(XHls_filter_2d *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_filter_2d_ReadReg(InstancePtr->Control_BaseAddress, XHLS_FILTER_2D_CONTROL_ADDR_ISR);
}

