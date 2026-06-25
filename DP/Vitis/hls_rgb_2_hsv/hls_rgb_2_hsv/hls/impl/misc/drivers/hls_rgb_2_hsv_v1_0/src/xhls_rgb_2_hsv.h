// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XHLS_RGB_2_HSV_H
#define XHLS_RGB_2_HSV_H

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
#include "xhls_rgb_2_hsv_hw.h"

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
} XHls_rgb_2_hsv_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XHls_rgb_2_hsv;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XHls_rgb_2_hsv_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XHls_rgb_2_hsv_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XHls_rgb_2_hsv_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XHls_rgb_2_hsv_ReadReg(BaseAddress, RegOffset) \
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
int XHls_rgb_2_hsv_Initialize(XHls_rgb_2_hsv *InstancePtr, UINTPTR BaseAddress);
XHls_rgb_2_hsv_Config* XHls_rgb_2_hsv_LookupConfig(UINTPTR BaseAddress);
#else
int XHls_rgb_2_hsv_Initialize(XHls_rgb_2_hsv *InstancePtr, u16 DeviceId);
XHls_rgb_2_hsv_Config* XHls_rgb_2_hsv_LookupConfig(u16 DeviceId);
#endif
int XHls_rgb_2_hsv_CfgInitialize(XHls_rgb_2_hsv *InstancePtr, XHls_rgb_2_hsv_Config *ConfigPtr);
#else
int XHls_rgb_2_hsv_Initialize(XHls_rgb_2_hsv *InstancePtr, const char* InstanceName);
int XHls_rgb_2_hsv_Release(XHls_rgb_2_hsv *InstancePtr);
#endif



#ifdef __cplusplus
}
#endif

#endif
