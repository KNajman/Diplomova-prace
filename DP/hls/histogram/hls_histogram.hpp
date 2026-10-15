/**
 * @file    hls_histogram.hpp
 * @brief   HLS jádro histogramu jasu (256 košů) s průchozím videem (bypass)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Video prochází jádrem beze změny, histogram snímku se po jeho dokončení zkopíruje do pole
 * hist[] v AXI4-Lite (ARM ho čte po ap_done, má na to celý další snímek). Výsledek je
 * bitově shodný s imgproc_histogram() golden modelu.
 */

#ifndef HLS_HISTOGRAM_HLS_HISTOGRAM_HPP_
#define HLS_HISTOGRAM_HLS_HISTOGRAM_HPP_

#include "../common/hls_video.hpp"

constexpr int HIST_BINS = 256;          ///< Počet košů (8bitový jas)
constexpr int HIST_COUNT_BITS = 32;     ///< Šířka čítače koše (4K = 8 294 400 px potřebuje 23 b, 32 b = celé slovo AXI4-Lite)
constexpr int HIST_HEIGHT_BITS = 12;    ///< Šířka registru výšky (max 4095 >= 2160 řádků 4K)

constexpr unsigned HIST_STATUS_SKIPPED = 1u;    ///< bit0: před SOF přišly pixely (resynchronizace), do histogramu se nepočítaly
constexpr unsigned HIST_STATUS_EARLY_SOF = 2u;  ///< bit1: TUSER uprostřed snímku, histogram tohoto snímku je neplatný

using hist_count_t = ap_uint<HIST_COUNT_BITS>;
using hist_height_t = ap_uint<HIST_HEIGHT_BITS>;
using hist_status_t = ap_uint<2>;

/**
 * @brief Histogram jednoho snímku šedotónového videa, video prochází beze změny.
 * @param s_axis_video  Vstup AXI4-Stream Video (8 b)
 * @param m_axis_video  Výstup (kopie vstupu)
 * @param height        Výška snímku v řádcích (0 se bere jako 1)
 * @param hist          Výstup: histogram snímku (pole v AXI4-Lite)
 * @param status        Výstup: příznaky HIST_STATUS_* posledního snímku
 */
void hls_histogram(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hist_height_t height,
                   hist_count_t hist[HIST_BINS], hist_status_t& status);

#endif // HLS_HISTOGRAM_HLS_HISTOGRAM_HPP_
