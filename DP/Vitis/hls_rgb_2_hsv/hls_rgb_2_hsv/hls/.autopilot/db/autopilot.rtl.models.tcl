set SynModuleInfo {
  {SRCNAME hls_rgb_2_hsv MODELNAME hls_rgb_2_hsv RTLNAME hls_rgb_2_hsv IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_rgb_2_hsv_sparsemux_7_2_9_1_1 RTLNAME hls_rgb_2_hsv_sparsemux_7_2_9_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME hls_rgb_2_hsv_mul_16ns_17ns_24_1_1 RTLNAME hls_rgb_2_hsv_mul_16ns_17ns_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME hls_rgb_2_hsv_sparsemux_7_2_7_1_1 RTLNAME hls_rgb_2_hsv_sparsemux_7_2_7_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME hls_rgb_2_hsv_am_submul_14s_10s_17ns_28_4_1 RTLNAME hls_rgb_2_hsv_am_submul_14s_10s_17ns_28_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME hls_rgb_2_hsv_INV_TBL_ROM_AUTO_1R RTLNAME hls_rgb_2_hsv_INV_TBL_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME hls_rgb_2_hsv_control_s_axi RTLNAME hls_rgb_2_hsv_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_rgb_2_hsv_regslice_both RTLNAME hls_rgb_2_hsv_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
