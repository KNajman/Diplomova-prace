// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XHLS_COLOR_SPACE_CONVERT_TOP_H
#define XHLS_COLOR_SPACE_CONVERT_TOP_H

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
#include "xhls_color_space_convert_top_hw.h"

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
} XHls_color_space_convert_top_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XHls_color_space_convert_top;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XHls_color_space_convert_top_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XHls_color_space_convert_top_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XHls_color_space_convert_top_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XHls_color_space_convert_top_ReadReg(BaseAddress, RegOffset) \
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
int XHls_color_space_convert_top_Initialize(XHls_color_space_convert_top *InstancePtr, UINTPTR BaseAddress);
XHls_color_space_convert_top_Config* XHls_color_space_convert_top_LookupConfig(UINTPTR BaseAddress);
#else
int XHls_color_space_convert_top_Initialize(XHls_color_space_convert_top *InstancePtr, u16 DeviceId);
XHls_color_space_convert_top_Config* XHls_color_space_convert_top_LookupConfig(u16 DeviceId);
#endif
int XHls_color_space_convert_top_CfgInitialize(XHls_color_space_convert_top *InstancePtr, XHls_color_space_convert_top_Config *ConfigPtr);
#else
int XHls_color_space_convert_top_Initialize(XHls_color_space_convert_top *InstancePtr, const char* InstanceName);
int XHls_color_space_convert_top_Release(XHls_color_space_convert_top *InstancePtr);
#endif

void XHls_color_space_convert_top_Start(XHls_color_space_convert_top *InstancePtr);
u32 XHls_color_space_convert_top_IsDone(XHls_color_space_convert_top *InstancePtr);
u32 XHls_color_space_convert_top_IsIdle(XHls_color_space_convert_top *InstancePtr);
u32 XHls_color_space_convert_top_IsReady(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_EnableAutoRestart(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_DisableAutoRestart(XHls_color_space_convert_top *InstancePtr);

void XHls_color_space_convert_top_Set_coeffs_0_0(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_0_0(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_coeffs_0_1(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_0_1(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_coeffs_0_2(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_0_2(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_coeffs_1_0(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_1_0(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_coeffs_1_1(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_1_1(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_coeffs_1_2(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_1_2(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_coeffs_2_0(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_2_0(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_coeffs_2_1(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_2_1(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_coeffs_2_2(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_coeffs_2_2(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_offsets_0(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_offsets_0(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_offsets_1(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_offsets_1(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_offsets_2(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_offsets_2(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_width(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_width(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_Set_height(XHls_color_space_convert_top *InstancePtr, u32 Data);
u32 XHls_color_space_convert_top_Get_height(XHls_color_space_convert_top *InstancePtr);

void XHls_color_space_convert_top_InterruptGlobalEnable(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_InterruptGlobalDisable(XHls_color_space_convert_top *InstancePtr);
void XHls_color_space_convert_top_InterruptEnable(XHls_color_space_convert_top *InstancePtr, u32 Mask);
void XHls_color_space_convert_top_InterruptDisable(XHls_color_space_convert_top *InstancePtr, u32 Mask);
void XHls_color_space_convert_top_InterruptClear(XHls_color_space_convert_top *InstancePtr, u32 Mask);
u32 XHls_color_space_convert_top_InterruptGetEnabled(XHls_color_space_convert_top *InstancePtr);
u32 XHls_color_space_convert_top_InterruptGetStatus(XHls_color_space_convert_top *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
