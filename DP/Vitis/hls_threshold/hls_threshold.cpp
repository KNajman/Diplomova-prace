#include "hls_threshold.hpp"

// ============================================================================
// IMPLEMENTACE TOP-LEVEL FUNKCE (Fyzický obal nad šablonou)
// ============================================================================
void hls_threshold_gray(hls::stream<axis_gray> &s_axis_video,
                        hls::stream<axis_gray> &m_axis_video,
                        ap_uint<8> thresh_val, ap_uint<2> thresh_type,
                        ap_uint<32> width, ap_uint<32> height) {
// Hardwarové mapování platí POUZE pro tento konkrétní top-level obal
#pragma HLS INTERFACE axis port = s_axis_video
#pragma HLS INTERFACE axis port = m_axis_video
#pragma HLS INTERFACE s_axilite port = thresh_val bundle = control
#pragma HLS INTERFACE s_axilite port = thresh_type bundle = control
#pragma HLS INTERFACE s_axilite port = width bundle = control
#pragma HLS INTERFACE s_axilite port = height bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control

  // Jednoduché volání naší šablony s parametrem <8> bitů.
  // Typ "axis_gray" se zde skrytě mapuje na axi_stream_video<color_pixel<1, 8>>
  hls_threshold<8>(s_axis_video, m_axis_video, thresh_val, thresh_type, width,
                height);
}