/**
 * @file    hls_hsv.cpp
 * @brief   HLS jádra převodu RGB -> HSV a HSV -> RGB, bodová jádra AXI4-Stream Video 24 b
 * @author  Bc. Karel Najman
 * @date    2026-10-22
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Poznámky k návrhu (převod z původních DP/Vitis/hls_rgb_2_hsv a hls_hsv_2_rgb):
 *  - Jedno volání top funkce = jeden ŘÁDEK (smyčka do TLAST), PIPELINE II=1, ap_ctrl_hs + auto-restart
 *    jako u všech bodových jader (viz csc). Původní verze měly ap_ctrl_none a jedno volání = jeden pixel,
 *    což Vitis 2025.2 nedokáže co-simulovat.
 *  - Původní struktura {channel[3], user, last} s AGGREGATE zabalila TUSER/TLAST do TDATA; teď ap_axiu
 *    (hlsv::axis_t) a pořadí složek podle UG934 (G, B, R), původní verze měly R, G, B.
 *  - RGB -> HSV: dělení diff / V a čitatel / diff nahrazují tabulky převrácených hodnot OpenCV
 *    (IMGPROC_HSV_SDIV, IMGPROC_HSV_HDIV180 z generovaného imgproc_coeffs.h, v HW ROM 256 položek)
 *    a dvě násobení. Původní verze měla vlastní tabulku v Q.8 a s OpenCV se neshodovala.
 *  - HSV -> RGB: původní algoritmus beze změny (H / 30 násobením 2185 >> 16, x / 255 vzorcem div255,
 *    f = 8,5 * zbytek posuny). Golden model ho převzal, proto je výsledek bitově shodný.
 *  - Šířky signálů se odvozují z rozsahů (komentáře u konstant), stejně jako ve VHDL verzi.
 */

#include "hls_hsv.hpp"

#include <imgproc/hsv.h>        // IMGPROC_HSV_SHIFT, IMGPROC_*_IDX_*, IMGPROC_HSV_HUE_RANGE
#include <imgproc_coeffs.h>     // IMGPROC_HSV_SDIV, IMGPROC_HSV_HDIV180 (generováno, NEOPISOVAT)

namespace
{

constexpr int HSV_SHIFT = static_cast<int>(IMGPROC_HSV_SHIFT);      ///< Zlomkové bity tabulek (12)
constexpr int HSV_HUE_RANGE = static_cast<int>(IMGPROC_HSV_HUE_RANGE); ///< Rozsah H 0..179
constexpr int HSV_SDIV_BITS = 20;       ///< max sdiv = round((255 << 12) / 1) = 1 044 480 < 2^20
constexpr int HSV_HDIV_BITS = 17;       ///< max hdiv180 = round((180 << 12) / 6) = 122 880 < 2^17
constexpr int HSV_HUE_NUM_BITS = 12;    ///< čitatel odstínu -255 .. 255 + 4 * 255 = 1275, se znaménkem
constexpr int HSV_SAT_PRODUCT_BITS = hlsv::PIXEL_BITS + HSV_SDIV_BITS + 1;  ///< diff * sdiv + znaménko pro round_shift
constexpr int HSV_HUE_PRODUCT_BITS = HSV_HUE_NUM_BITS + HSV_HDIV_BITS + 1;  ///< se znaménkem x bez znaménka
constexpr int HSV_HUE_BITS = HSV_HUE_PRODUCT_BITS - HSV_SHIFT + 1;         ///< po zaokrouhlení (round_shift)
constexpr int HSV_SECTOR_G = 2;         ///< offset sektoru pro maximum v G (x diff)
constexpr int HSV_SECTOR_B = 4;         ///< offset sektoru pro maximum v B (x diff)

constexpr unsigned HSV_SECTOR_WIDTH = 30u;      ///< šířka sektoru v jednotkách H (60 stupňů / 2)
constexpr unsigned HSV_SECTOR_RECIP = 2185u;    ///< round(2^16 / 30), převrácená hodnota šířky sektoru
constexpr int HSV_SECTOR_RECIP_BITS = 12;       ///< 2185 < 2^12
constexpr int HSV_SECTOR_RECIP_SHIFT = 16;      ///< zlomkové bity HSV_SECTOR_RECIP
constexpr int HSV_FRACT_INT_SHIFT = 3;          ///< f = zbytek * 8,5 = (zbytek << 3) + (zbytek >> 1)
constexpr int HSV_PRODUCT_BITS = 2 * hlsv::PIXEL_BITS;  ///< součin dvou 8bitových složek (max 65 025)

/**
 * Volba implementace násobení HSV -> RGB (obdoba generiku G_USE_DSP ve VHDL hsv2rgb_core):
 *   0 (výchozí) - rozhodne HLS / syntéza (malá násobení 8 x 8 b skončí v LUT),
 *   1           - BIND_OP impl=dsp vynutí všech pět násobení do DSP (hls_config_hsv2rgb_dsp.cfg).
 * Volba přes makro, ne argument funkce: implementace je vlastnost hardwaru, ne registr za běhu.
 */
#ifndef HSV_MUL_IMPL_DSP
#define HSV_MUL_IMPL_DSP 0
#endif

using hsv_pixel_t = hlsv::Pixel<hlsv::RGB_CHANNELS>;
using sdiv_t = ap_uint<HSV_SDIV_BITS>;
using hdiv_t = ap_int<HSV_HDIV_BITS + 1>;       ///< kladná hodnota, znaménkový typ kvůli násobení
using hue_num_t = ap_int<HSV_HUE_NUM_BITS>;
using product_t = ap_uint<HSV_PRODUCT_BITS>;

/**
 * @brief Převede pixel RGB na HSV (shodné s imgproc_rgb_to_hsv_pixel a VHDL rgb2hsv_core).
 *
 * Priorita kanálu s maximem při rovnosti: R, pak G, pak B (shodně s OpenCV).
 *
 * @param rgb   Vstup v pořadí UG934 (G, B, R)
 * @return Pixel H, S, V
 */
hsv_pixel_t rgb_to_hsv_pixel(const hsv_pixel_t& rgb)
{
#pragma HLS INLINE
    const hlsv::pixel_t red = rgb.ch[IMGPROC_RGB_IDX_R];
    const hlsv::pixel_t green = rgb.ch[IMGPROC_RGB_IDX_G];
    const hlsv::pixel_t blue = rgb.ch[IMGPROC_RGB_IDX_B];

    const bool max_is_red = (red >= green) && (red >= blue);
    const bool max_is_green = (!max_is_red) && (green >= blue);
    const hlsv::pixel_t value_max = max_is_red ? red : (max_is_green ? green : blue);
    const hlsv::pixel_t value_min = (red <= green) ? ((red <= blue) ? red : blue) : ((green <= blue) ? green : blue);
    const hlsv::pixel_t diff = value_max - value_min;

    // Saturace: S = round(diff * 255 / V) = round_shift(diff * sdiv[V], 12)
    const sdiv_t saturation_recip = IMGPROC_HSV_SDIV[value_max.to_uint()];
    const ap_int<HSV_SAT_PRODUCT_BITS> saturation_product = diff * saturation_recip;
    const hlsv::pixel_t saturation = hlsv::round_shift<HSV_SHIFT>(saturation_product);   // vždy <= 255

    // Odstín: H = round(čitatel * 30 / diff) = round_shift(čitatel * hdiv180[diff], 12)
    hue_num_t hue_numerator = 0;
    if (max_is_red)
    {
        hue_numerator = static_cast<hue_num_t>(green) - static_cast<hue_num_t>(blue);
    }
    else if (max_is_green)
    {
        hue_numerator = (static_cast<hue_num_t>(blue) - static_cast<hue_num_t>(red))
                        + (static_cast<hue_num_t>(diff) * HSV_SECTOR_G);
    }
    else
    {
        hue_numerator = (static_cast<hue_num_t>(red) - static_cast<hue_num_t>(green))
                        + (static_cast<hue_num_t>(diff) * HSV_SECTOR_B);
    }
    const hdiv_t hue_recip = IMGPROC_HSV_HDIV180[diff.to_uint()];
    const ap_int<HSV_HUE_PRODUCT_BITS> hue_product = hue_numerator * hue_recip;
    const ap_int<HSV_HUE_BITS> hue_rounded = hlsv::round_shift<HSV_SHIFT>(hue_product);
    const ap_int<HSV_HUE_BITS> hue = (hue_rounded < 0) ? static_cast<ap_int<HSV_HUE_BITS>>(hue_rounded + HSV_HUE_RANGE)
                                                       : hue_rounded;

    hsv_pixel_t hsv;
    hsv.ch[IMGPROC_HSV_IDX_H] = hlsv::saturate_u8(hue);
    hsv.ch[IMGPROC_HSV_IDX_S] = saturation;
    hsv.ch[IMGPROC_HSV_IDX_V] = value_max;
    return hsv;
}

/**
 * @brief Aproximace x / 255 bez dělení: (x + 1 + (x >> 8)) >> 8 (shodné s golden modelem).
 * @param x Dělenec 0..65 025 (součin dvou složek)
 * @return Přibližný podíl 0..255
 */
hlsv::pixel_t div255(const product_t& x)
{
#pragma HLS INLINE
    const ap_uint<HSV_PRODUCT_BITS + 1> biased = x + 1 + (x >> hlsv::PIXEL_BITS);
    return static_cast<hlsv::pixel_t>(biased >> hlsv::PIXEL_BITS);
}

/**
 * @brief Převede pixel HSV na RGB (shodné s imgproc_hsv_to_rgb_pixel a VHDL hsv2rgb_core).
 * @param hsv   Vstup H 0..179 (vyšší hodnoty se berou jako 0), S, V
 * @return Pixel v pořadí UG934 (G, B, R)
 */
hsv_pixel_t hsv_to_rgb_pixel(const hsv_pixel_t& hsv)
{
#pragma HLS INLINE
    const hlsv::pixel_t hue_in = hsv.ch[IMGPROC_HSV_IDX_H];
    const hlsv::pixel_t saturation = hsv.ch[IMGPROC_HSV_IDX_S];
    const hlsv::pixel_t value = hsv.ch[IMGPROC_HSV_IDX_V];
    const hlsv::pixel_t hue = (hue_in >= HSV_HUE_RANGE) ? hlsv::pixel_t(0) : hue_in;

    // Sektor = H / 30 násobením převrácenou hodnotou, zbytek přepočtený na 0..255 (f = zbytek * 255 / 30)
    const ap_uint<hlsv::PIXEL_BITS + HSV_SECTOR_RECIP_BITS> hue_scaled = hue * ap_uint<HSV_SECTOR_RECIP_BITS>(HSV_SECTOR_RECIP);
    const ap_uint<3> sector = hue_scaled >> HSV_SECTOR_RECIP_SHIFT;                   // 0..5
    const hlsv::pixel_t remainder = hue - (sector * HSV_SECTOR_WIDTH);                // 0..29
    const hlsv::pixel_t fraction = (remainder << HSV_FRACT_INT_SHIFT) + (remainder >> 1);  // 0..246

    // Pět násobení 8 x 8 b; pojmenované součiny kvůli BIND_OP (volba HSV_MUL_IMPL_DSP)
    const hlsv::pixel_t inv_saturation = hlsv::pixel_t(255) - saturation;
    const hlsv::pixel_t inv_fraction = hlsv::pixel_t(255) - fraction;
    const product_t p_product = value * inv_saturation;
    const product_t sat_fraction_product = saturation * fraction;
    const product_t sat_inv_fraction_product = saturation * inv_fraction;
#if HSV_MUL_IMPL_DSP
#pragma HLS BIND_OP variable=p_product op=mul impl=dsp
#pragma HLS BIND_OP variable=sat_fraction_product op=mul impl=dsp
#pragma HLS BIND_OP variable=sat_inv_fraction_product op=mul impl=dsp
#endif
    const hlsv::pixel_t q_factor = hlsv::pixel_t(255) - div255(sat_fraction_product);
    const hlsv::pixel_t t_factor = hlsv::pixel_t(255) - div255(sat_inv_fraction_product);
    const product_t q_product = value * q_factor;
    const product_t t_product = value * t_factor;
#if HSV_MUL_IMPL_DSP
#pragma HLS BIND_OP variable=q_product op=mul impl=dsp
#pragma HLS BIND_OP variable=t_product op=mul impl=dsp
#endif
    const hlsv::pixel_t p_level = div255(p_product);
    const hlsv::pixel_t q_level = div255(q_product);
    const hlsv::pixel_t t_level = div255(t_product);

    hlsv::pixel_t red = value;
    hlsv::pixel_t green = value;
    hlsv::pixel_t blue = value;
    if (saturation != 0)
    {
        switch (sector.to_uint())
        {
            case 0u: green = t_level; blue = p_level; break;            //   0 -  60 stupňů: V, t, p
            case 1u: red = q_level; blue = p_level; break;              //  60 - 120: q, V, p
            case 2u: red = p_level; blue = t_level; break;              // 120 - 180: p, V, t
            case 3u: red = p_level; green = q_level; break;             // 180 - 240: p, q, V
            case 4u: red = t_level; green = p_level; break;             // 240 - 300: t, p, V
            default: green = p_level; blue = q_level; break;            // 300 - 360: V, p, q
        }
    }

    hsv_pixel_t rgb;
    rgb.ch[IMGPROC_RGB_IDX_R] = red;
    rgb.ch[IMGPROC_RGB_IDX_G] = green;
    rgb.ch[IMGPROC_RGB_IDX_B] = blue;
    return rgb;
}

/// Převod RGB -> HSV jako typ (parametr šablony convert_stream)
struct RgbToHsv
{
    static hsv_pixel_t convert(const hsv_pixel_t& in)
    {
#pragma HLS INLINE
        return rgb_to_hsv_pixel(in);
    }
};

/// Převod HSV -> RGB jako typ (parametr šablony convert_stream)
struct HsvToRgb
{
    static hsv_pixel_t convert(const hsv_pixel_t& in)
    {
#pragma HLS INLINE
        return hsv_to_rgb_pixel(in);
    }
};

/**
 * @brief Zpracuje jeden řádek: čte, převádí a zapisuje pixely až do TLAST (tělo obou top funkcí).
 *
 * Poznámka k volbě: převod je parametr šablony (typ), ne příznak za běhu - každé jádro tak obsahuje
 * jen svou datovou cestu, stejně jako VHDL hsv_axil s generikem G_RGB_TO_HSV.
 *
 * @param in_stream     Vstupní stream
 * @param out_stream    Výstupní stream
 */
template <typename Converter>
void convert_stream(hlsv::stream_rgb_t& in_stream, hlsv::stream_rgb_t& out_stream)
{
#pragma HLS INLINE
    bool last = false;
    do
    {
#pragma HLS PIPELINE II=1
        const hlsv::axis_rgb_t in = in_stream.read();
        const hsv_pixel_t px = Converter::convert(hlsv::unpack<hlsv::RGB_CHANNELS>(in.data));
        out_stream.write(hlsv::make_packet<hlsv::RGB_CHANNELS, hlsv::RGB_CHANNELS>(hlsv::pack<hlsv::RGB_CHANNELS>(px), in));
        last = (in.last == 1);
    } while (!last);
}

} // namespace

void hls_rgb2hsv(hlsv::stream_rgb_t& s_axis_video, hlsv::stream_rgb_t& m_axis_video)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=return bundle=control
    convert_stream<RgbToHsv>(s_axis_video, m_axis_video);
}

void hls_hsv2rgb(hlsv::stream_rgb_t& s_axis_video, hlsv::stream_rgb_t& m_axis_video)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=return bundle=control
    convert_stream<HsvToRgb>(s_axis_video, m_axis_video);
}
