/**
 * @file    hls_histogram.cpp
 * @brief   HLS jádro histogramu jasu (256 košů) s průchozím videem (bypass)
 * @author  Bc. Karel Najman
 * @date    2026-10-15
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Poznámky k návrhu:
 *  - Jedno volání = jeden SNÍMEK (na rozdíl od bodových jader, kde volání = řádek). Jádro musí
 *    poznat konec snímku, aby mohlo histogram předat, proto má registr výšky. Šířku nepotřebuje,
 *    řádky ohraničuje TLAST. Konec volání (ap_done) = histogram je platný (přerušení pro ARM).
 *  - Počítá se do interní BRAM (simple dual port: 1 čtení + 1 zápis za takt), každý pixel dělá
 *    read-modify-write bins[x]++. Mezi čtením a zápisem téhož koše jsou v pipeline ~2 takty
 *    (latence BRAM + sčítačka), takže dva blízké pixely stejné hodnoty by četly ještě nezapsanou
 *    hodnotu. Řešení: posledních HIST_FWD_DEPTH zápisů (koš + hodnota) se drží v registrech
 *    a při shodě koše se hodnota vezme z nich (forwarding). Závislost přes BRAM je pak pro HLS
 *    vypnutá (DEPENDENCE inter false) a smyčka běží s II=1.
 *  - Poučení: původní technika z UG1399 (přičítání v registru do změny hodnoty, závislost nechaná
 *    na HLS) prošla C-simulací, ale v cosim ztrácela pixely u vzorů a,b,a. C-sim časování
 *    pipeline neověří - proto testbench obsahuje vzory se vzdáleností opakování 1 až 4.
 *  - Před snímkem se interní BRAM nuluje (256 taktů), po snímku se kopíruje do pole hist[]
 *    v AXI4-Lite (256 taktů). Režie 512 taktů na snímek = 0,025 % při 1080p. Nulování na začátku
 *    (ne až po kopii) zaručí správný první snímek i po resetu uprostřed snímku - statické pole
 *    v BRAM resetem nezmizí.
 *  - Dvojí buffer zadarmo: ARM čte hist[] celý další snímek, přepíše se až po jeho konci.
 *  - Resynchronizace: jádro čeká na TUSER, pixely před ním jen propustí (status bit0). TUSER
 *    uprostřed snímku jen označí snímek jako neplatný (status bit1), počítání pokračuje do
 *    výšky snímku; další volání pak čeká na nejbližší TUSER. Nejpozději druhý snímek po poruše
 *    je tedy opět správný. Video prochází vždy celé a beze změny.
 */

#include "hls_histogram.hpp"

namespace
{
constexpr int HIST_FWD_DEPTH = 3;     ///< Hloubka forwardingu (vzdálenost zápis -> čtení v pipeline je ~2 takty, 1 rezerva)
} // namespace

void hls_histogram(hlsv::stream_gray_t& s_axis_video, hlsv::stream_gray_t& m_axis_video, hist_height_t height,
                   hist_count_t hist[HIST_BINS], hist_status_t& status)
{
#pragma HLS INTERFACE mode=axis port=s_axis_video register_mode=both
#pragma HLS INTERFACE mode=axis port=m_axis_video register_mode=both
#pragma HLS INTERFACE mode=s_axilite port=height bundle=control
#pragma HLS INTERFACE mode=s_axilite port=hist bundle=control
#pragma HLS INTERFACE mode=s_axilite port=status bundle=control
#pragma HLS INTERFACE mode=s_axilite port=return bundle=control

    static hist_count_t bins[HIST_BINS];
#pragma HLS BIND_STORAGE variable=bins type=ram_s2p impl=bram
    // Mezi iteracemi se závislost přes BRAM řeší forwardingem (fwd_bin/fwd_cnt), ne plánovačem HLS
#pragma HLS DEPENDENCE variable=bins type=inter dependent=false

    const hist_height_t last_row = (height == 0) ? hist_height_t(0) : hist_height_t(height - 1);

clear_bins:
    for (int i = 0; i < HIST_BINS; i++)
    {
#pragma HLS PIPELINE II=1
        bins[i] = 0;
    }

    // Posledních HIST_FWD_DEPTH zápisů; počáteční (koš 0, počet 0) odpovídá vynulované BRAM
    hlsv::pixel_t fwd_bin[HIST_FWD_DEPTH];
    hist_count_t fwd_cnt[HIST_FWD_DEPTH];
#pragma HLS ARRAY_PARTITION variable=fwd_bin type=complete
#pragma HLS ARRAY_PARTITION variable=fwd_cnt type=complete
init_fwd:
    for (int k = 0; k < HIST_FWD_DEPTH; k++)
    {
#pragma HLS UNROLL
        fwd_bin[k] = 0;
        fwd_cnt[k] = 0;
    }

    bool started = false;           // už přišel TUSER (pixely se počítají)
    bool done = false;              // dokončen poslední řádek snímku
    bool skipped = false;
    bool early_sof = false;
    hist_height_t row = 0;
count_pixels:
    do
    {
#pragma HLS PIPELINE II=1
        const hlsv::axis_gray_t in = s_axis_video.read();
        m_axis_video.write(in);     // bypass: paket beze změny včetně TUSER/TLAST/TKEEP

        const hlsv::pixel_t val = in.data;
        const bool sof = (in.user == 1);
        if (sof && started)
        {
            early_sof = true;
        }
        const bool count = started || sof;
        if (!count)
        {
            skipped = true;
        }
        else
        {
            // Nejnovější zápis má přednost (k = 0), proto se prochází od nejstaršího
            hist_count_t cnt = bins[val];
            for (int k = HIST_FWD_DEPTH - 1; k >= 0; k--)
            {
#pragma HLS UNROLL
                if (fwd_bin[k] == val)
                {
                    cnt = fwd_cnt[k];
                }
            }
            cnt++;
            bins[val] = cnt;
            for (int k = HIST_FWD_DEPTH - 1; k > 0; k--)
            {
#pragma HLS UNROLL
                fwd_bin[k] = fwd_bin[k - 1];
                fwd_cnt[k] = fwd_cnt[k - 1];
            }
            fwd_bin[0] = val;
            fwd_cnt[0] = cnt;
            if (in.last == 1)
            {
                done = (row == last_row);
                row++;
            }
        }
        started = count;
    } while (!done);

copy_bins:
    for (int i = 0; i < HIST_BINS; i++)
    {
#pragma HLS PIPELINE II=1
        hist[i] = bins[i];
    }

    status = (early_sof ? HIST_STATUS_EARLY_SOF : 0u) | (skipped ? HIST_STATUS_SKIPPED : 0u);
}
