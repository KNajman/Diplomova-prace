set SynModuleInfo {
  {SRCNAME hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP MODELNAME hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP RTLNAME hls_passthrough_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP
    SUBMODULES {
      {MODELNAME hls_passthrough_flow_control_loop_pipe_sequential_init RTLNAME hls_passthrough_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME hls_passthrough_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME hls_passthrough MODELNAME hls_passthrough RTLNAME hls_passthrough IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_passthrough_mul_32ns_31ns_62_1_1 RTLNAME hls_passthrough_mul_32ns_31ns_62_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_passthrough_control_s_axi RTLNAME hls_passthrough_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_passthrough_regslice_both RTLNAME hls_passthrough_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
