// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (Read/TOW)
//         bit 1 - ap_ready (Read/TOW)
//         others - reserved
// 0x010 : Data signal of width
//         bit 31~0 - width[31:0] (Read/Write)
// 0x014 : reserved
// 0x018 : Data signal of height
//         bit 31~0 - height[31:0] (Read/Write)
// 0x01c : reserved
// 0x400 ~
// 0x7ff : Memory 'hist_out' (256 * 32b)
//         Word n : bit [31:0] - hist_out[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_AP_CTRL       0x000
#define XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_GIE           0x004
#define XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_IER           0x008
#define XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_ISR           0x00c
#define XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_WIDTH_DATA    0x010
#define XHLS_HISTOGRAM_GRAY_CONTROL_BITS_WIDTH_DATA    32
#define XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HEIGHT_DATA   0x018
#define XHLS_HISTOGRAM_GRAY_CONTROL_BITS_HEIGHT_DATA   32
#define XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_BASE 0x400
#define XHLS_HISTOGRAM_GRAY_CONTROL_ADDR_HIST_OUT_HIGH 0x7ff
#define XHLS_HISTOGRAM_GRAY_CONTROL_WIDTH_HIST_OUT     32
#define XHLS_HISTOGRAM_GRAY_CONTROL_DEPTH_HIST_OUT     256

