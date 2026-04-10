// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
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
// 0x10 : Data signal of size_x
//        bit 12~0 - size_x[12:0] (Read/Write)
//        others   - reserved
// 0x14 : reserved
// 0x18 : Data signal of size_y
//        bit 12~0 - size_y[12:0] (Read/Write)
//        others   - reserved
// 0x1c : reserved
// 0x20 : Data signal of start_x
//        bit 31~0 - start_x[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of start_y
//        bit 31~0 - start_y[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of step_x
//        bit 31~0 - step_x[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of step_y
//        bit 31~0 - step_y[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of result
//        bit 31~0 - result[31:0] (Read/Write)
// 0x44 : Data signal of result
//        bit 31~0 - result[63:32] (Read/Write)
// 0x48 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XFRACTAL_CONTROL_ADDR_AP_CTRL      0x00
#define XFRACTAL_CONTROL_ADDR_GIE          0x04
#define XFRACTAL_CONTROL_ADDR_IER          0x08
#define XFRACTAL_CONTROL_ADDR_ISR          0x0c
#define XFRACTAL_CONTROL_ADDR_SIZE_X_DATA  0x10
#define XFRACTAL_CONTROL_BITS_SIZE_X_DATA  13
#define XFRACTAL_CONTROL_ADDR_SIZE_Y_DATA  0x18
#define XFRACTAL_CONTROL_BITS_SIZE_Y_DATA  13
#define XFRACTAL_CONTROL_ADDR_START_X_DATA 0x20
#define XFRACTAL_CONTROL_BITS_START_X_DATA 32
#define XFRACTAL_CONTROL_ADDR_START_Y_DATA 0x28
#define XFRACTAL_CONTROL_BITS_START_Y_DATA 32
#define XFRACTAL_CONTROL_ADDR_STEP_X_DATA  0x30
#define XFRACTAL_CONTROL_BITS_STEP_X_DATA  32
#define XFRACTAL_CONTROL_ADDR_STEP_Y_DATA  0x38
#define XFRACTAL_CONTROL_BITS_STEP_Y_DATA  32
#define XFRACTAL_CONTROL_ADDR_RESULT_DATA  0x40
#define XFRACTAL_CONTROL_BITS_RESULT_DATA  64

