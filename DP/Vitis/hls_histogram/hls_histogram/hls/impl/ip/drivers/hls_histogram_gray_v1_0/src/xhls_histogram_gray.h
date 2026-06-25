// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XHLS_HISTOGRAM_GRAY_H
#define XHLS_HISTOGRAM_GRAY_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xhls_histogram_gray_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XHls_histogram_gray_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XHls_histogram_gray;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XHls_histogram_gray_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XHls_histogram_gray_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XHls_histogram_gray_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XHls_histogram_gray_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XHls_histogram_gray_Initialize(XHls_histogram_gray *InstancePtr, UINTPTR BaseAddress);
XHls_histogram_gray_Config* XHls_histogram_gray_LookupConfig(UINTPTR BaseAddress);
#else
int XHls_histogram_gray_Initialize(XHls_histogram_gray *InstancePtr, u16 DeviceId);
XHls_histogram_gray_Config* XHls_histogram_gray_LookupConfig(u16 DeviceId);
#endif
int XHls_histogram_gray_CfgInitialize(XHls_histogram_gray *InstancePtr, XHls_histogram_gray_Config *ConfigPtr);
#else
int XHls_histogram_gray_Initialize(XHls_histogram_gray *InstancePtr, const char* InstanceName);
int XHls_histogram_gray_Release(XHls_histogram_gray *InstancePtr);
#endif

void XHls_histogram_gray_Start(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_IsDone(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_IsIdle(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_IsReady(XHls_histogram_gray *InstancePtr);
void XHls_histogram_gray_EnableAutoRestart(XHls_histogram_gray *InstancePtr);
void XHls_histogram_gray_DisableAutoRestart(XHls_histogram_gray *InstancePtr);

void XHls_histogram_gray_Set_width(XHls_histogram_gray *InstancePtr, u32 Data);
u32 XHls_histogram_gray_Get_width(XHls_histogram_gray *InstancePtr);
void XHls_histogram_gray_Set_height(XHls_histogram_gray *InstancePtr, u32 Data);
u32 XHls_histogram_gray_Get_height(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_Get_hist_out_BaseAddress(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_Get_hist_out_HighAddress(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_Get_hist_out_TotalBytes(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_Get_hist_out_BitWidth(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_Get_hist_out_Depth(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_Write_hist_out_Words(XHls_histogram_gray *InstancePtr, int offset, word_type *data, int length);
u32 XHls_histogram_gray_Read_hist_out_Words(XHls_histogram_gray *InstancePtr, int offset, word_type *data, int length);
u32 XHls_histogram_gray_Write_hist_out_Bytes(XHls_histogram_gray *InstancePtr, int offset, char *data, int length);
u32 XHls_histogram_gray_Read_hist_out_Bytes(XHls_histogram_gray *InstancePtr, int offset, char *data, int length);

void XHls_histogram_gray_InterruptGlobalEnable(XHls_histogram_gray *InstancePtr);
void XHls_histogram_gray_InterruptGlobalDisable(XHls_histogram_gray *InstancePtr);
void XHls_histogram_gray_InterruptEnable(XHls_histogram_gray *InstancePtr, u32 Mask);
void XHls_histogram_gray_InterruptDisable(XHls_histogram_gray *InstancePtr, u32 Mask);
void XHls_histogram_gray_InterruptClear(XHls_histogram_gray *InstancePtr, u32 Mask);
u32 XHls_histogram_gray_InterruptGetEnabled(XHls_histogram_gray *InstancePtr);
u32 XHls_histogram_gray_InterruptGetStatus(XHls_histogram_gray *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
