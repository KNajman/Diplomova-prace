set SynModuleInfo {
  {SRCNAME hls_hsv_2_rgb MODELNAME hls_hsv_2_rgb RTLNAME hls_hsv_2_rgb IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_hsv_2_rgb_mul_8ns_13ns_19_1_1 RTLNAME hls_hsv_2_rgb_mul_8ns_13ns_19_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_hsv_2_rgb_mul_8ns_8ns_16_1_1 RTLNAME hls_hsv_2_rgb_mul_8ns_8ns_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_hsv_2_rgb_sparsemux_9_3_8_1_1 RTLNAME hls_hsv_2_rgb_sparsemux_9_3_8_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME hls_hsv_2_rgb_control_s_axi RTLNAME hls_hsv_2_rgb_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_hsv_2_rgb_regslice_both RTLNAME hls_hsv_2_rgb_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
