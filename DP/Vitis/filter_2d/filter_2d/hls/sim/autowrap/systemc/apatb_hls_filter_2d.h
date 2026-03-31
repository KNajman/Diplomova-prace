// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

extern "C" void AESL_WRAP_hls_filter_2d (
hls::stream<int > s_axis_video,
hls::stream<int > m_axis_video,
short width,
short height,
volatile void* kernel_0_0,
volatile void* kernel_0_1,
volatile void* kernel_0_2,
volatile void* kernel_0_3,
volatile void* kernel_0_4,
volatile void* kernel_1_0,
volatile void* kernel_1_1,
volatile void* kernel_1_2,
volatile void* kernel_1_3,
volatile void* kernel_1_4,
volatile void* kernel_2_0,
volatile void* kernel_2_1,
volatile void* kernel_2_2,
volatile void* kernel_2_3,
volatile void* kernel_2_4,
volatile void* kernel_3_0,
volatile void* kernel_3_1,
volatile void* kernel_3_2,
volatile void* kernel_3_3,
volatile void* kernel_3_4,
volatile void* kernel_4_0,
volatile void* kernel_4_1,
volatile void* kernel_4_2,
volatile void* kernel_4_3,
volatile void* kernel_4_4,
int inv_divisor,
char fraction_bits,
int delta,
char borderType);
