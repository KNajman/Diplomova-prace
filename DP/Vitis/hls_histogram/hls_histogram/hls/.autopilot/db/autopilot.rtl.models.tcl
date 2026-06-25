set SynModuleInfo {
  {SRCNAME hls_histogram_gray_Pipeline_VITIS_LOOP_19_1 MODELNAME hls_histogram_gray_Pipeline_VITIS_LOOP_19_1 RTLNAME hls_histogram_gray_hls_histogram_gray_Pipeline_VITIS_LOOP_19_1
    SUBMODULES {
      {MODELNAME hls_histogram_gray_flow_control_loop_pipe_sequential_init RTLNAME hls_histogram_gray_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME hls_histogram_gray_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME hls_histogram_gray_Pipeline_VITIS_LOOP_32_2 MODELNAME hls_histogram_gray_Pipeline_VITIS_LOOP_32_2 RTLNAME hls_histogram_gray_hls_histogram_gray_Pipeline_VITIS_LOOP_32_2}
  {SRCNAME hls_histogram_gray_Pipeline_VITIS_LOOP_68_3 MODELNAME hls_histogram_gray_Pipeline_VITIS_LOOP_68_3 RTLNAME hls_histogram_gray_hls_histogram_gray_Pipeline_VITIS_LOOP_68_3}
  {SRCNAME hls_histogram_gray MODELNAME hls_histogram_gray RTLNAME hls_histogram_gray IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_histogram_gray_mul_32s_32s_32_1_1 RTLNAME hls_histogram_gray_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_histogram_gray_local_hist_RAM_T2P_BRAM_1R1W RTLNAME hls_histogram_gray_local_hist_RAM_T2P_BRAM_1R1W BINDTYPE storage TYPE ram_t2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME hls_histogram_gray_control_s_axi RTLNAME hls_histogram_gray_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_histogram_gray_regslice_both RTLNAME hls_histogram_gray_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
