set SynModuleInfo {
  {SRCNAME hls_filter_2d_Pipeline_VITIS_LOOP_158_1 MODELNAME hls_filter_2d_Pipeline_VITIS_LOOP_158_1 RTLNAME hls_filter_2d_hls_filter_2d_Pipeline_VITIS_LOOP_158_1
    SUBMODULES {
      {MODELNAME hls_filter_2d_mul_21s_32s_52_1_1 RTLNAME hls_filter_2d_mul_21s_32s_52_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_filter_2d_mul_8ns_8s_16_1_1 RTLNAME hls_filter_2d_mul_8ns_8s_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_filter_2d_mac_muladd_8ns_8s_16s_17_4_1 RTLNAME hls_filter_2d_mac_muladd_8ns_8s_16s_17_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME hls_filter_2d_mac_muladd_8ns_8s_17s_18_4_1 RTLNAME hls_filter_2d_mac_muladd_8ns_8s_17s_18_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME hls_filter_2d_hls_filter_2d_Pipeline_VITIS_LOOP_158_1_line_buffer_3_RAM_AUTO_1R1W RTLNAME hls_filter_2d_hls_filter_2d_Pipeline_VITIS_LOOP_158_1_line_buffer_3_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME hls_filter_2d_flow_control_loop_pipe_sequential_init RTLNAME hls_filter_2d_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME hls_filter_2d_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME hls_filter_2d MODELNAME hls_filter_2d RTLNAME hls_filter_2d IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_filter_2d_mul_13ns_13ns_26_1_1 RTLNAME hls_filter_2d_mul_13ns_13ns_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_filter_2d_control_s_axi RTLNAME hls_filter_2d_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_filter_2d_regslice_both RTLNAME hls_filter_2d_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
