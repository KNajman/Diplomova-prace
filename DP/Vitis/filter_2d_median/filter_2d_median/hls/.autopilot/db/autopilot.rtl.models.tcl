set SynModuleInfo {
  {SRCNAME hls_filter_median_3x3_Pipeline_VITIS_LOOP_31_1 MODELNAME hls_filter_median_3x3_Pipeline_VITIS_LOOP_31_1 RTLNAME hls_filter_median_3x3_hls_filter_median_3x3_Pipeline_VITIS_LOOP_31_1
    SUBMODULES {
      {MODELNAME hls_filter_median_3x3_hls_filter_median_3x3_Pipeline_VITIS_LOOP_31_1_line_buffer_1_RAM_AUTO_1R1W RTLNAME hls_filter_median_3x3_hls_filter_median_3x3_Pipeline_VITIS_LOOP_31_1_line_buffer_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME hls_filter_median_3x3_flow_control_loop_pipe_sequential_init RTLNAME hls_filter_median_3x3_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME hls_filter_median_3x3_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME hls_filter_median_3x3 MODELNAME hls_filter_median_3x3 RTLNAME hls_filter_median_3x3 IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_filter_median_3x3_mul_13ns_13ns_26_1_1 RTLNAME hls_filter_median_3x3_mul_13ns_13ns_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_filter_median_3x3_control_s_axi RTLNAME hls_filter_median_3x3_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_filter_median_3x3_regslice_both RTLNAME hls_filter_median_3x3_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
