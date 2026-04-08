// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xhls_histogram_gray.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHls_histogram_gray_CfgInitialize(XHls_histogram_gray *InstancePtr, XHls_histogram_gray_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XHls_histogram_gray_Start(XHls_histogram_gray *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_AP_CTRL) & 0x80;
    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XHls_histogram_gray_IsDone(XHls_histogram_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XHls_histogram_gray_IsIdle(XHls_histogram_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XHls_histogram_gray_IsReady(XHls_histogram_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XHls_histogram_gray_EnableAutoRestart(XHls_histogram_gray *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XHls_histogram_gray_DisableAutoRestart(XHls_histogram_gray *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_AP_CTRL, 0);
}

void XHls_histogram_gray_Set_width(XHls_histogram_gray *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XHls_histogram_gray_Get_width(XHls_histogram_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XHls_histogram_gray_Set_height(XHls_histogram_gray *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XHls_histogram_gray_Get_height(XHls_histogram_gray *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

u32 XHls_histogram_gray_Get_hist_out_BaseAddress(XHls_histogram_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE);
}

u32 XHls_histogram_gray_Get_hist_out_HighAddress(XHls_histogram_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_HIGH);
}

u32 XHls_histogram_gray_Get_hist_out_TotalBytes(XHls_histogram_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_HIGH - XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + 1);
}

u32 XHls_histogram_gray_Get_hist_out_BitWidth(XHls_histogram_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHLS_HISTOGRAM_GRAY_CONTROL_WIDTH_HIST_OUT;
}

u32 XHls_histogram_gray_Get_hist_out_Depth(XHls_histogram_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHLS_HISTOGRAM_GRAY_CONTROL_DEPTH_HIST_OUT;
}

u32 XHls_histogram_gray_Write_hist_out_Words(XHls_histogram_gray *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_HIGH - XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XHls_histogram_gray_Read_hist_out_Words(XHls_histogram_gray *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_HIGH - XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + (offset + i)*4);
    }
    return length;
}

u32 XHls_histogram_gray_Write_hist_out_Bytes(XHls_histogram_gray *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_HIGH - XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XHls_histogram_gray_Read_hist_out_Bytes(XHls_histogram_gray *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_HIGH - XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE + offset + i);
    }
    return length;
}

void XHls_histogram_gray_InterruptGlobalEnable(XHls_histogram_gray *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_GIE, 1);
}

void XHls_histogram_gray_InterruptGlobalDisable(XHls_histogram_gray *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_GIE, 0);
}

void XHls_histogram_gray_InterruptEnable(XHls_histogram_gray *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_IER);
    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_IER, Register | Mask);
}

void XHls_histogram_gray_InterruptDisable(XHls_histogram_gray *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_IER);
    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_IER, Register & (~Mask));
}

void XHls_histogram_gray_InterruptClear(XHls_histogram_gray *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHls_histogram_gray_WriteReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_ISR, Mask);
}

u32 XHls_histogram_gray_InterruptGetEnabled(XHls_histogram_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_IER);
}

u32 XHls_histogram_gray_InterruptGetStatus(XHls_histogram_gray *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHls_histogram_gray_ReadReg(InstancePtr->Control_BaseAddress, XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_ISR);
}

