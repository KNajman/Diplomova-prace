// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of coeffs_0_0
//        bit 15~0 - coeffs_0_0[15:0] (Read/Write)
//        others   - reserved
// 0x14 : reserved
// 0x18 : Data signal of coeffs_0_1
//        bit 15~0 - coeffs_0_1[15:0] (Read/Write)
//        others   - reserved
// 0x1c : reserved
// 0x20 : Data signal of coeffs_0_2
//        bit 15~0 - coeffs_0_2[15:0] (Read/Write)
//        others   - reserved
// 0x24 : reserved
// 0x28 : Data signal of coeffs_1_0
//        bit 15~0 - coeffs_1_0[15:0] (Read/Write)
//        others   - reserved
// 0x2c : reserved
// 0x30 : Data signal of coeffs_1_1
//        bit 15~0 - coeffs_1_1[15:0] (Read/Write)
//        others   - reserved
// 0x34 : reserved
// 0x38 : Data signal of coeffs_1_2
//        bit 15~0 - coeffs_1_2[15:0] (Read/Write)
//        others   - reserved
// 0x3c : reserved
// 0x40 : Data signal of coeffs_2_0
//        bit 15~0 - coeffs_2_0[15:0] (Read/Write)
//        others   - reserved
// 0x44 : reserved
// 0x48 : Data signal of coeffs_2_1
//        bit 15~0 - coeffs_2_1[15:0] (Read/Write)
//        others   - reserved
// 0x4c : reserved
// 0x50 : Data signal of coeffs_2_2
//        bit 15~0 - coeffs_2_2[15:0] (Read/Write)
//        others   - reserved
// 0x54 : reserved
// 0x58 : Data signal of offsets_0
//        bit 15~0 - offsets_0[15:0] (Read/Write)
//        others   - reserved
// 0x5c : reserved
// 0x60 : Data signal of offsets_1
//        bit 15~0 - offsets_1[15:0] (Read/Write)
//        others   - reserved
// 0x64 : reserved
// 0x68 : Data signal of offsets_2
//        bit 15~0 - offsets_2[15:0] (Read/Write)
//        others   - reserved
// 0x6c : reserved
// 0x70 : Data signal of width
//        bit 31~0 - width[31:0] (Read/Write)
// 0x74 : reserved
// 0x78 : Data signal of height
//        bit 31~0 - height[31:0] (Read/Write)
// 0x7c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_AP_CTRL         0x00
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_GIE             0x04
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_IER             0x08
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_ISR             0x0c
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_0_DATA 0x10
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_0_0_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_1_DATA 0x18
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_0_1_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_0_2_DATA 0x20
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_0_2_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_0_DATA 0x28
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_1_0_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_1_DATA 0x30
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_1_1_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_1_2_DATA 0x38
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_1_2_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_0_DATA 0x40
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_2_0_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_1_DATA 0x48
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_2_1_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_COEFFS_2_2_DATA 0x50
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_COEFFS_2_2_DATA 16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_0_DATA  0x58
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_OFFSETS_0_DATA  16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_1_DATA  0x60
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_OFFSETS_1_DATA  16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_OFFSETS_2_DATA  0x68
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_OFFSETS_2_DATA  16
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_WIDTH_DATA      0x70
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_WIDTH_DATA      32
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_ADDR_HEIGHT_DATA     0x78
#define XHLS_COLOR_SPACE_CONVERT_TOP_CONTROL_BITS_HEIGHT_DATA     32

