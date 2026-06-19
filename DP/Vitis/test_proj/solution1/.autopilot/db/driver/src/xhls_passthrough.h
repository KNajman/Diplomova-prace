// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XHLS_PASSTHROUGH_H
#define XHLS_PASSTHROUGH_H

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
#include "xhls_passthrough_hw.h"

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
} XHls_passthrough_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XHls_passthrough;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XHls_passthrough_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XHls_passthrough_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XHls_passthrough_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XHls_passthrough_ReadReg(BaseAddress, RegOffset) \
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
int XHls_passthrough_Initialize(XHls_passthrough *InstancePtr, UINTPTR BaseAddress);
XHls_passthrough_Config* XHls_passthrough_LookupConfig(UINTPTR BaseAddress);
#else
int XHls_passthrough_Initialize(XHls_passthrough *InstancePtr, u16 DeviceId);
XHls_passthrough_Config* XHls_passthrough_LookupConfig(u16 DeviceId);
#endif
int XHls_passthrough_CfgInitialize(XHls_passthrough *InstancePtr, XHls_passthrough_Config *ConfigPtr);
#else
int XHls_passthrough_Initialize(XHls_passthrough *InstancePtr, const char* InstanceName);
int XHls_passthrough_Release(XHls_passthrough *InstancePtr);
#endif

void XHls_passthrough_Start(XHls_passthrough *InstancePtr);
u32 XHls_passthrough_IsDone(XHls_passthrough *InstancePtr);
u32 XHls_passthrough_IsIdle(XHls_passthrough *InstancePtr);
u32 XHls_passthrough_IsReady(XHls_passthrough *InstancePtr);
void XHls_passthrough_EnableAutoRestart(XHls_passthrough *InstancePtr);
void XHls_passthrough_DisableAutoRestart(XHls_passthrough *InstancePtr);


void XHls_passthrough_InterruptGlobalEnable(XHls_passthrough *InstancePtr);
void XHls_passthrough_InterruptGlobalDisable(XHls_passthrough *InstancePtr);
void XHls_passthrough_InterruptEnable(XHls_passthrough *InstancePtr, u32 Mask);
void XHls_passthrough_InterruptDisable(XHls_passthrough *InstancePtr, u32 Mask);
void XHls_passthrough_InterruptClear(XHls_passthrough *InstancePtr, u32 Mask);
u32 XHls_passthrough_InterruptGetEnabled(XHls_passthrough *InstancePtr);
u32 XHls_passthrough_InterruptGetStatus(XHls_passthrough *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
