/**
 * @file    hls_median.cpp
 * @brief   HLS jádro mediánového filtru 3x3 (šedotónové video)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Poznámka k volbě sítě: 7x sort3 (21 compare-exchange) místo optimálních 19 (Paeth) - pravidelná
 * struktura řádky -> sloupce -> diagonála se snadno pipelinuje a je totožná s golden modelem
 * i VHDL verzí, takže srovnání HLS x VHDL je férové.
 */

#include "hls_median.hpp"

namespace // anonymní namespace, jen pro vnitřní linkování
{

/// Seřazená trojice
struct Sorted3
{
    hls_video::pixel_t min;
    hls_video::pixel_t mid;
    hls_video::pixel_t max;
};

/**
 * @brief Seřadí tři hodnoty (3 ostrá porovnání >, sdílená mezi min, mid a max), shodné se sort3() v median.c.
 */
Sorted3 sort3(hls_video::pixel_t a, hls_video::pixel_t b, hls_video::pixel_t c)
{
    #pragma HLS INLINE
    const bool a_gt_b = (a > b);
    const hls_video::pixel_t min_ab = a_gt_b ? b : a;
    const hls_video::pixel_t max_ab = a_gt_b ? a : b;
    const bool max_gt_c = (max_ab > c);
    const bool c_gt_min = (c > min_ab);
    Sorted3 r;
    r.min = c_gt_min ? min_ab : c;
    r.max = max_gt_c ? max_ab : c;
    r.mid = (!max_gt_c) ? max_ab : ((!c_gt_min) ? min_ab : c);
    return r;
}

/// Funktor pro hls_video::window_frame: medián okna 3x3 (shodný s imgproc_median9)
struct Median3x3
{
    hls_video::pixel_t operator()(const hls_video::pixel_t win[3][3]) const
    {
        #pragma HLS INLINE
        const Sorted3 row0 = sort3(win[0][0], win[0][1], win[0][2]);
        const Sorted3 row1 = sort3(win[1][0], win[1][1], win[1][2]);
        const Sorted3 row2 = sort3(win[2][0], win[2][1], win[2][2]);
        const Sorted3 mins = sort3(row0.min, row1.min, row2.min);
        const Sorted3 mids = sort3(row0.mid, row1.mid, row2.mid);
        const Sorted3 maxs = sort3(row0.max, row1.max, row2.max);
        return sort3(mins.max, mids.mid, maxs.min).mid;
    }
};

} // anonymní namespace

void hls_median(hls_video::stream_gray_t& s_axis_video, hls_video::stream_gray_t& m_axis_video, hls_video::win_dim_t width,
                hls_video::win_dim_t height, ap_uint<1> border, hls_video::win_status_t& status)
{
    #pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
    #pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
    #pragma HLS INTERFACE mode=s_axilite port=width bundle=control
    #pragma HLS INTERFACE mode=s_axilite port=height bundle=control
    #pragma HLS INTERFACE mode=s_axilite port=border bundle=control
    #pragma HLS INTERFACE mode=s_axilite port=status bundle=control
    #pragma HLS INTERFACE mode=s_axilite port=return bundle=control

    const Median3x3 op;
    hls_video::window_frame<3>(s_axis_video, m_axis_video, width, height, border == 1, status, op);
}
