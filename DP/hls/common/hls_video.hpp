/**
 * @file    hls_video.hpp
 * @brief   Společné typy a pomocné funkce pro HLS jádra (AXI4-Stream Video podle UG934)
 * @author  Bc. Karel Najman
 * @date    2026-10-02
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Kontrakt rozhraní všech jader (viz plán DP):
 *  - TUSER(0) = SOF (první pixel snímku), TLAST = EOL (poslední pixel řádku)
 *  - RGB 24 b: TDATA[7:0] = G, [15:8] = B, [23:16] = R; šedá 8 b; YCbCr: Y, Cb, Cr; HSV: H, S, V
 *  - TKEEP/TSTRB jsou vždy samé jedničky (celý pixel je platný)
 *
 * Poznámka k volbě ap_axiu: Vitis HLS vytvoří skutečné porty TUSER/TLAST JEN pro typy ap_axiu
 * a hls::axis. Vlastní struktura {data, user, last} s pragmou AGGREGATE (původní
 * axi_stream_video<>) se celá zabalí do TDATA (26 bitů) a TUSER/TLAST na rozhraní chybí.
 * Takové jádro pak nespolupracuje s VDMA ani s Video Frame Buffer.
 */

#ifndef HLS_COMMON_HLS_VIDEO_HPP_
#define HLS_COMMON_HLS_VIDEO_HPP_

#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

namespace hlsv
{

constexpr int PIXEL_BITS = 8;                       ///< Bity na složku
constexpr int RGB_CHANNELS = 3;                     ///< Složky RGB/YCbCr/HSV pixelu

using pixel_t = ap_uint<PIXEL_BITS>;                ///< Jedna 8bitová složka

template <int CH>
using axis_t = ap_axiu<CH * PIXEL_BITS, 1, 0, 0>;  ///< Paket AXI4-Stream s CH složkami (TUSER 1 b)

template <int CH>
using stream_t = hls::stream<axis_t<CH>>;           ///< Stream paketů s CH složkami

using axis_rgb_t = axis_t<RGB_CHANNELS>;            ///< 24bitový pixel (RGB, YCbCr, HSV)
using axis_gray_t = axis_t<1>;                      ///< 8bitový pixel (šedá)
using stream_rgb_t = stream_t<RGB_CHANNELS>;
using stream_gray_t = stream_t<1>;

/// Pixel rozbalený na složky; index = pozice bajtu v TDATA (0 = bity [7:0])
template <int CH>
struct Pixel
{
    pixel_t ch[CH];
};

/**
 * @brief Rozbalí TDATA na složky (čisté přeznačení vodičů, v HW nic nestojí).
 * @param data TDATA
 * @return Pixel se složkami
 */
template <int CH>
inline Pixel<CH> unpack(const ap_uint<CH * PIXEL_BITS>& data)
{
#pragma HLS INLINE
    Pixel<CH> px;
    for (int i = 0; i < CH; i++)
    {
#pragma HLS UNROLL
        px.ch[i] = data((i * PIXEL_BITS) + PIXEL_BITS - 1, i * PIXEL_BITS);
    }
    return px;
}

/**
 * @brief Sbalí složky do TDATA.
 * @param px Pixel
 * @return TDATA
 */
template <int CH>
inline ap_uint<CH * PIXEL_BITS> pack(const Pixel<CH>& px)
{
#pragma HLS INLINE
    ap_uint<CH * PIXEL_BITS> data = 0;
    for (int i = 0; i < CH; i++)
    {
#pragma HLS UNROLL
        data((i * PIXEL_BITS) + PIXEL_BITS - 1, i * PIXEL_BITS) = px.ch[i];
    }
    return data;
}

/**
 * @brief Sestaví výstupní paket a převezme postranní signály ze vstupu.
 *
 * Bodová jádra nemají čítače: TUSER a TLAST jen putují s daty, takže resynchronizace
 * i libovolné rozlišení jsou automatické.
 *
 * @param data  TDATA výstupu
 * @param in    Vstupní paket (zdroj TUSER/TLAST)
 * @return Výstupní paket
 */
template <int CH_OUT, int CH_IN>
inline axis_t<CH_OUT> make_packet(const ap_uint<CH_OUT * PIXEL_BITS>& data, const axis_t<CH_IN>& in)
{
#pragma HLS INLINE
    axis_t<CH_OUT> out;
    out.data = data;
    out.keep = -1;
    out.strb = -1;
    out.user = in.user;
    out.last = in.last;
    return out;
}

/**
 * @brief Saturace na 0..255.
 * @param value Vstup se znaménkem
 * @return Saturovaná složka
 */
template <int W>
inline pixel_t saturate_u8(const ap_int<W>& value)
{
#pragma HLS INLINE
    pixel_t result = 0;
    if (value < 0)
    {
        result = 0;
    }
    else if (value > 255)
    {
        result = 255;
    }
    else
    {
        result = value;
    }
    return result;
}

/**
 * @brief Zaokrouhlení half-up a posun: floor((value + 2^(SHIFT-1)) / 2^SHIFT).
 *
 * Shodné s imgproc_round_shift() v golden modelu. ap_int >> je aritmetický posun (floor),
 * v HW jen přičtení konstanty a přeznačení vodičů.
 *
 * @param value Vstup se znaménkem
 * @return Zaokrouhlený podíl
 */
template <int SHIFT, int W>
inline ap_int<W - SHIFT + 1> round_shift(const ap_int<W>& value)
{
#pragma HLS INLINE
    const ap_int<W + 1> biased = static_cast<ap_int<W + 1>>(value) + (ap_int<W + 1>(1) << (SHIFT - 1));
    return static_cast<ap_int<W - SHIFT + 1>>(biased >> SHIFT);
}

} // namespace hlsv

#endif // HLS_COMMON_HLS_VIDEO_HPP_
