# Inferred from syn.array_partition.complete_threshold=4
set_directive_array_partition hls_filter_median_3x3/min -dim=1 -type=complete min
# Inferred from performance & pipeline pragmas/directives
set_directive_inline sort_three<ap_uint<8> >
