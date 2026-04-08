set SynModuleInfo {
  {SRCNAME hls_threshold_gray_Pipeline_VITIS_LOOP_24_1 MODELNAME hls_threshold_gray_Pipeline_VITIS_LOOP_24_1 RTLNAME hls_threshold_gray_hls_threshold_gray_Pipeline_VITIS_LOOP_24_1
    SUBMODULES {
      {MODELNAME hls_threshold_gray_flow_control_loop_pipe_sequential_init RTLNAME hls_threshold_gray_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME hls_threshold_gray_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME hls_threshold_gray MODELNAME hls_threshold_gray RTLNAME hls_threshold_gray IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_threshold_gray_mul_32s_32s_32_1_1 RTLNAME hls_threshold_gray_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_threshold_gray_control_s_axi RTLNAME hls_threshold_gray_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_threshold_gray_regslice_both RTLNAME hls_threshold_gray_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
