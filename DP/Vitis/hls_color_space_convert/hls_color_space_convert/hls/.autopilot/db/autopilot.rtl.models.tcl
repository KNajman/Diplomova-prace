set SynModuleInfo {
  {SRCNAME {hls_color_space_convert_template<3, 8, 3, 8>_Pipeline_VITIS_LOOP_19_1} MODELNAME hls_color_space_convert_template_3_8_3_8_Pipeline_VITIS_LOOP_19_1 RTLNAME hls_color_space_convert_top_hls_color_space_convert_template_3_8_3_8_Pipeline_VITIS_LOOP_19_1
    SUBMODULES {
      {MODELNAME hls_color_space_convert_top_mul_16s_8ns_24_1_1 RTLNAME hls_color_space_convert_top_mul_16s_8ns_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_color_space_convert_top_mac_muladd_16s_8ns_24s_25_4_1 RTLNAME hls_color_space_convert_top_mac_muladd_16s_8ns_24s_25_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME hls_color_space_convert_top_mac_muladd_16s_8ns_25s_26_4_1 RTLNAME hls_color_space_convert_top_mac_muladd_16s_8ns_25s_26_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME hls_color_space_convert_top_flow_control_loop_pipe_sequential_init RTLNAME hls_color_space_convert_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME hls_color_space_convert_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME {hls_color_space_convert_template<3, 8, 3, 8>} MODELNAME hls_color_space_convert_template_3_8_3_8_s RTLNAME hls_color_space_convert_top_hls_color_space_convert_template_3_8_3_8_s
    SUBMODULES {
      {MODELNAME hls_color_space_convert_top_mul_32s_32s_32_1_1 RTLNAME hls_color_space_convert_top_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME hls_color_space_convert_top MODELNAME hls_color_space_convert_top RTLNAME hls_color_space_convert_top IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_color_space_convert_top_control_s_axi RTLNAME hls_color_space_convert_top_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_color_space_convert_top_regslice_both RTLNAME hls_color_space_convert_top_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
