/**
 * @file    hls_threshold.cpp
 * @brief   HLS jádro prahování jasu (5 typů jako cv::threshold), bodové jádro AXI4-Stream Video 8 b
 * @author  Bc. Karel Najman
 * @date    2026-10-19
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Poznámky k návrhu (převod z původního DP/Vitis/hls_threshold):
 *  - Jedno volání top funkce = jeden ŘÁDEK (smyčka do TLAST), PIPELINE II=1, ap_ctrl_hs + auto-restart
 *    jako u všech bodových jader (viz csc). Původní verze četla width * height pixelů jedním voláním
 *    a TUSER/TLAST jen kopírovala - po ztraceném pixelu by zůstala posunutá navždy. Teď se jádro
 *    nemá s čím rozejít: TUSER/TLAST putují s daty, šířka ani výška nejsou potřeba.
 *  - Typy rozšířeny ze 3 (BINARY, TRUNC, TOZERO_INV, maxval pevně 255) na všech 5 typů OpenCV
 *    a maxval je registr. Číslování typů podle golden modelu / OpenCV (původní mělo vlastní).
 *  - Typ se v pipeline nedekóduje větvením: z typu se spočítá, odkud vzít výsledek nad a pod
 *    prahem (stejně jako ve VHDL threshold_core). HLS by to zvládlo i ze switch, ale takhle je
 *    datová cesta porovnání + multiplexor a obě implementace mají stejnou strukturu.
 */

#include "hls_threshold.hpp"

namespace
{

/// Zdroj výsledku pixelu
enum ResultSource
{
    SOURCE_ZERO = 0,
    SOURCE_MAXVAL,
    SOURCE_THRESH,
    SOURCE_VALUE
};

/// Zdroje výsledku nad a pod prahem pro daný typ (neplatný typ -> nula)
struct ThresholdSources
{
    ap_uint<2> above;
    ap_uint<2> below;
};

ThresholdSources decode_type(thresh_type_t type)
{
#pragma HLS INLINE
    ThresholdSources sources = { SOURCE_ZERO, SOURCE_ZERO };
    switch (type.to_uint())
    {
        case 0u: sources = { SOURCE_MAXVAL, SOURCE_ZERO }; break;      // BINARY
        case 1u: sources = { SOURCE_ZERO, SOURCE_MAXVAL }; break;      // BINARY_INV
        case 2u: sources = { SOURCE_THRESH, SOURCE_VALUE }; break;     // TRUNC
        case 3u: sources = { SOURCE_VALUE, SOURCE_ZERO }; break;       // TOZERO
        case 4u: sources = { SOURCE_ZERO, SOURCE_VALUE }; break;       // TOZERO_INV
        default: break;
    }
    return sources;
}

hlsv::pixel_t select_source(ap_uint<2> source, hlsv::pixel_t value, hlsv::pixel_t thresh, hlsv::pixel_t maxval)
{
#pragma HLS INLINE
    hlsv::pixel_t result = 0;
    switch (source.to_uint())
    {
        case SOURCE_MAXVAL: result = maxval; break;
        case SOURCE_THRESH: result = thresh; break;
        case SOURCE_VALUE: result = value; break;
        default: break;
    }
    return result;
}

} // namespace

void hls_threshold(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hlsv::pixel_t thresh,
                   hlsv::pixel_t maxval, thresh_type_t type)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=thresh bundle=control
#pragma HLS INTERFACE mode=s_axilite port=maxval bundle=control
#pragma HLS INTERFACE mode=s_axilite port=type bundle=control
#pragma HLS INTERFACE mode=s_axilite port=return bundle=control
    const ThresholdSources sources = decode_type(type);
    bool last = false;
    do
    {
#pragma HLS PIPELINE II=1
        const hlsv::axis_gray_t in = s_axis_video.read();
        const hlsv::pixel_t value = hlsv::unpack<1>(in.data).ch[0];
        const bool above = (value > thresh);
        hlsv::Pixel<1> out;
        out.ch[0] = select_source(above ? sources.above : sources.below, value, thresh, maxval);
        m_axis_video.write(hlsv::make_packet<1, 1>(hlsv::pack<1>(out), in));
        last = (in.last == 1);
    } while (!last);
}
