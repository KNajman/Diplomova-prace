// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFRACTAL_H
#define XFRACTAL_H

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
#include "xfractal_hw.h"

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
} XFractal_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFractal;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFractal_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFractal_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFractal_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFractal_ReadReg(BaseAddress, RegOffset) \
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
int XFractal_Initialize(XFractal *InstancePtr, UINTPTR BaseAddress);
XFractal_Config* XFractal_LookupConfig(UINTPTR BaseAddress);
#else
int XFractal_Initialize(XFractal *InstancePtr, u16 DeviceId);
XFractal_Config* XFractal_LookupConfig(u16 DeviceId);
#endif
int XFractal_CfgInitialize(XFractal *InstancePtr, XFractal_Config *ConfigPtr);
#else
int XFractal_Initialize(XFractal *InstancePtr, const char* InstanceName);
int XFractal_Release(XFractal *InstancePtr);
#endif

void XFractal_Start(XFractal *InstancePtr);
u32 XFractal_IsDone(XFractal *InstancePtr);
u32 XFractal_IsIdle(XFractal *InstancePtr);
u32 XFractal_IsReady(XFractal *InstancePtr);
void XFractal_EnableAutoRestart(XFractal *InstancePtr);
void XFractal_DisableAutoRestart(XFractal *InstancePtr);

void XFractal_Set_size_x(XFractal *InstancePtr, u32 Data);
u32 XFractal_Get_size_x(XFractal *InstancePtr);
void XFractal_Set_size_y(XFractal *InstancePtr, u32 Data);
u32 XFractal_Get_size_y(XFractal *InstancePtr);
void XFractal_Set_start_x(XFractal *InstancePtr, u32 Data);
u32 XFractal_Get_start_x(XFractal *InstancePtr);
void XFractal_Set_start_y(XFractal *InstancePtr, u32 Data);
u32 XFractal_Get_start_y(XFractal *InstancePtr);
void XFractal_Set_step_x(XFractal *InstancePtr, u32 Data);
u32 XFractal_Get_step_x(XFractal *InstancePtr);
void XFractal_Set_step_y(XFractal *InstancePtr, u32 Data);
u32 XFractal_Get_step_y(XFractal *InstancePtr);
void XFractal_Set_result(XFractal *InstancePtr, u64 Data);
u64 XFractal_Get_result(XFractal *InstancePtr);

void XFractal_InterruptGlobalEnable(XFractal *InstancePtr);
void XFractal_InterruptGlobalDisable(XFractal *InstancePtr);
void XFractal_InterruptEnable(XFractal *InstancePtr, u32 Mask);
void XFractal_InterruptDisable(XFractal *InstancePtr, u32 Mask);
void XFractal_InterruptClear(XFractal *InstancePtr, u32 Mask);
u32 XFractal_InterruptGetEnabled(XFractal *InstancePtr);
u32 XFractal_InterruptGetStatus(XFractal *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
