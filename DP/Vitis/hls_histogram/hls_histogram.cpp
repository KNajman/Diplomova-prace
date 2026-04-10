#include "hls_histogram.hpp"

#include "hls_histogram.hpp"

void hls_histogram_gray(
    hls::stream<axis_gray> &stream_in, 
    ap_uint<32> hist_out[HIST_BINS_8BIT],
    ap_uint<32> width,
    ap_uint<32> height
) {
    // Definice hardwarového rozhraní pro toto specifické IP jádro
    #pragma HLS INTERFACE axis port = stream_in
    #pragma HLS INTERFACE s_axilite port = hist_out bundle = control
    #pragma HLS INTERFACE s_axilite port = width bundle = control
    #pragma HLS INTERFACE s_axilite port = height bundle = control
    #pragma HLS INTERFACE s_axilite port = return bundle = control

    // Instanciace šablony pro 8-bitové (grayscale) video s 256 "koši" v histogramu
    histogram_core<8, HIST_BINS_8BIT>(stream_in, hist_out, width, height);
}