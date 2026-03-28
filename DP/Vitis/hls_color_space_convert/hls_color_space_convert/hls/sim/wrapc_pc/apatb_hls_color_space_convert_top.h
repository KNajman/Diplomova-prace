// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

extern "C" void AESL_WRAP_hls_color_space_convert_top (
hls::stream<int > s_axis_video,
hls::stream<int > m_axis_video,
volatile void* coeffs_0_0,
volatile void* coeffs_0_1,
volatile void* coeffs_0_2,
volatile void* coeffs_1_0,
volatile void* coeffs_1_1,
volatile void* coeffs_1_2,
volatile void* coeffs_2_0,
volatile void* coeffs_2_1,
volatile void* coeffs_2_2,
volatile void* offsets_0,
volatile void* offsets_1,
volatile void* offsets_2,
int width,
int height);
