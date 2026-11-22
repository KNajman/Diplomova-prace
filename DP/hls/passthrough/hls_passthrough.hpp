/**
 * @file    hls_passthrough.hpp
 * @brief   HLS propust AXI4-Stream Video (data beze změny) s resynchronizací a kontrolou TUSER/TLAST
 * @author  Bc. Karel Najman
 * @date    2026-11-22
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Sémantika snímku shodná s VHDL passthrough_core a s okénkovými jádry (hls_video::window_frame):
 * čeká se na TUSER, snímek má vždy width x height pixelů, TUSER/TLAST výstupu jsou z čítačů,
 * poruchy vstupu se hlásí ve status (WIN_STATUS_*). Data 24 b (RGB), pořadí složek se nemění.
 * Jedno volání = jeden snímek.
 */

#ifndef HLS_PASSTHROUGH_HLS_PASSTHROUGH_HPP_
#define HLS_PASSTHROUGH_HLS_PASSTHROUGH_HPP_

#include "../common/hls_video.hpp"
#include "../common/hls_window.hpp"

/// Propust jednoho snímku: mapa registrů 0x10 width, 0x18 height, 0x20 status, 0x24 status_ap_vld
void hls_passthrough(hls_video::stream_rgb_t& s_axis_video, hls_video::stream_rgb_t& m_axis_video,
                     hls_video::win_dim_t width, hls_video::win_dim_t height, hls_video::win_status_t& status);

#endif // HLS_PASSTHROUGH_HLS_PASSTHROUGH_HPP_
