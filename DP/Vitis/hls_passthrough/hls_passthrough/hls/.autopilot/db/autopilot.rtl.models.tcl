set SynModuleInfo {
  {SRCNAME hls_passthrough MODELNAME hls_passthrough RTLNAME hls_passthrough IS_TOP 1
    SUBMODULES {
      {MODELNAME hls_passthrough_control_s_axi RTLNAME hls_passthrough_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME hls_passthrough_regslice_both RTLNAME hls_passthrough_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
