/**
 * @file    harness_hw.c
 * @brief   Ovládání testovacího řetězce na KV260: AXIS přepínače, AXI VDMA, řízení jader (mapa HLS)
 * @author  Bc. Karel Najman
 * @date    2026-10-19
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 */
#include "harness_hw.h"

#include <stdio.h>
#include <xil_cache.h>
#include <xil_io.h>
#include <xiltimer.h>   // 2025.2 (SDT): XTime, XTime_GetTime a COUNTS_PER_SECOND jsou zde, xtime_l.h se neexportuje

/* AXIS Switch (PG085), ROUTING_MODE = 1: řízení registry */
#define SWITCH_REG_CTRL         (0x00u)     ///< bit1 REG_UPDATE: převezme nové nastavení MI_MUX
#define SWITCH_REG_MI_MUX(mi)   (0x40u + (4u * (mi)))   ///< Výstup mi: číslo vstupu, bit31 = výstup vypnutý
#define SWITCH_CTRL_REG_UPDATE  (0x02u)
#define SWITCH_MI_DISABLED      (0x80000000u)

/* AXI VDMA (PG020), přímý režim bez scatter-gather */
#define VDMA_MM2S_DMACR         (0x00u)
#define VDMA_MM2S_DMASR         (0x04u)
#define VDMA_MM2S_VSIZE         (0x50u)
#define VDMA_MM2S_HSIZE         (0x54u)
#define VDMA_MM2S_STRIDE        (0x58u)
#define VDMA_MM2S_START(n)      (0x5Cu + (4u * (n)))
#define VDMA_S2MM_DMACR         (0x30u)
#define VDMA_S2MM_DMASR         (0x34u)
#define VDMA_S2MM_VSIZE         (0xA0u)
#define VDMA_S2MM_HSIZE         (0xA4u)
#define VDMA_S2MM_STRIDE        (0xA8u)
#define VDMA_S2MM_START(n)      (0xACu + (4u * (n)))
#define VDMA_DMACR_RS           (0x00000001u)   ///< Run/Stop
#define VDMA_DMACR_CIRCULAR     (0x00000002u)   ///< Kruhový režim přes rámce (jinak park)
#define VDMA_DMACR_RESET        (0x00000004u)
#define VDMA_DMACR_FRMCNT_EN    (0x00000010u)   ///< Zastavit po IRQFrameCount snímcích
#define VDMA_DMACR_FRMCNT_SHIFT (16u)
#define VDMA_DMASR_HALTED       (0x00000001u)
#define VDMA_DMASR_ERR_MASK     (0x00000070u)   ///< DMAIntErr | DMASlvErr | DMADecErr
#define VDMA_DMASR_FRMCNT_IRQ   (0x00001000u)
#define VDMA_NUM_FSTORES        (3u)            ///< Shodně s c_num_fstores v build_harness.tcl
#define VDMA_BYTES_PER_PIXEL    (3u)
#define VDMA_TIMEOUT_TICKS      ((uint64_t)COUNTS_PER_SECOND * 5u)
#define VDMA_POLL_US            (2000u)         ///< Krok čtení stavu MM2S (časté čtení rozbilo HLS řádková jádra)
#define VDMA_DMASR_S2MM_ERR_MASK (0x00008B70u)  ///< Int/Slv/Dec chyba + SOFEarly, EOLEarly, SOFLate, EOLLate (PG020)

static void spin_us(uint32_t microseconds)
{
    XTime begin = 0u;
    XTime now = 0u;
    const XTime wait_ticks = ((XTime)COUNTS_PER_SECOND * microseconds) / 1000000u;

    XTime_GetTime(&begin);
    do
    {
        XTime_GetTime(&now);
    } while ((now - begin) < wait_ticks);
}

void hw_write(uintptr_t base, uint32_t offset, uint32_t value)
{
    Xil_Out32(base + offset, value);
}

uint32_t hw_read(uintptr_t base, uint32_t offset)
{
    return Xil_In32(base + offset);
}

void hw_core_start(uintptr_t base)
{
    hw_write(base, HW_REG_AP_CTRL, HW_AP_START | HW_AP_AUTO_RESTART);
}

void hw_core_stop(uintptr_t base)
{
    hw_write(base, HW_REG_AP_CTRL, 0u);
}

void hw_route(uintptr_t switch_in_base, uintptr_t switch_out_base, uint32_t num_ports, uint32_t port)
{
    uint32_t mi = 0u;

    /* 1 -> N: jen vybraný výstup bere vstup 0, ostatní vypnuté (jinak by zablokovaly backpressure) */
    for (mi = 0u; mi < num_ports; mi++)
    {
        hw_write(switch_in_base, SWITCH_REG_MI_MUX(mi), (mi == port) ? 0u : SWITCH_MI_DISABLED);
    }
    hw_write(switch_in_base, SWITCH_REG_CTRL, SWITCH_CTRL_REG_UPDATE);
    /* N -> 1: jediný výstup bere vybraný vstup */
    hw_write(switch_out_base, SWITCH_REG_MI_MUX(0u), port);
    hw_write(switch_out_base, SWITCH_REG_CTRL, SWITCH_CTRL_REG_UPDATE);
}

/**
 * @brief Resetuje oba kanály VDMA a počká na dokončení resetu.
 * @param vdma_base Báze AXI VDMA
 */
static void vdma_reset(uintptr_t vdma_base)
{
    hw_write(vdma_base, VDMA_S2MM_DMACR, VDMA_DMACR_RESET);
    hw_write(vdma_base, VDMA_MM2S_DMACR, VDMA_DMACR_RESET);
    while (((hw_read(vdma_base, VDMA_S2MM_DMACR) | hw_read(vdma_base, VDMA_MM2S_DMACR)) & VDMA_DMACR_RESET) != 0u)
    {
        /* reset trvá několik taktů */
    }
}

/**
 * @brief Nastaví kanál VDMA (adresy rámců, řádek) - spustí ho až zápis VSIZE.
 * @param dmacr_frame_count Bity DMACR pro počítání snímků (FrameCntEn + IRQFrameCount), nebo 0 pro volný běh
 */
static void vdma_setup_channel(uintptr_t vdma_base, uint32_t dmacr, uint32_t start_reg0, uint32_t hsize_reg,
                               uint32_t stride_reg, uintptr_t buffer, uint32_t width, uint32_t dmacr_frame_count)
{
    uint32_t n = 0u;

    hw_write(vdma_base, dmacr, VDMA_DMACR_RS | VDMA_DMACR_CIRCULAR | dmacr_frame_count);
    for (n = 0u; n < VDMA_NUM_FSTORES; n++)
    {
        hw_write(vdma_base, start_reg0 + (4u * n), (uint32_t)buffer);   /* všechny rámce do stejného bufferu */
    }
    hw_write(vdma_base, stride_reg, width * VDMA_BYTES_PER_PIXEL);
    hw_write(vdma_base, hsize_reg, width * VDMA_BYTES_PER_PIXEL);
}

bool hw_vdma_run(uintptr_t vdma_base, const uint8_t* input, uint8_t* output, uint32_t width, uint32_t height,
                 uint32_t frames, uint64_t* ticks)
{
    const uint32_t frame_bytes = width * height * VDMA_BYTES_PER_PIXEL;
    XTime start = 0u;
    XTime now = 0u;
    uint32_t mm2s_status = 0u;
    uint32_t s2mm_status = 0u;
    bool done = false;
    bool ok = true;

    Xil_DCacheFlushRange((UINTPTR)input, frame_bytes);
    Xil_DCacheInvalidateRange((UINTPTR)output, frame_bytes);
    vdma_reset(vdma_base);

    /* Poznámka k volbě režimu: MM2S se po frames snímcích zastaví sám (FrameCntEn). U S2MM s FrameCntEn
       měřením na KV260 (25. 10.) VDMA data přenesla celá, ale nikdy nenastavila FrmCntIrq ani se nezastavila,
       proto S2MM běží volně (IRQFrameCount = 1) a doběhne se na něj až po zastavení MM2S. */
    /* Poznámka k měření: HLS jádra volaná po řádcích (CSC, RGB-HSV, HSV-RGB) selhala (SOFLateErr na S2MM),
       když A53 četl registry VDMA ve smyčce během přenosu; s procesorem zastaveným po startu nebo s čtením
       jednou za 20 ms prošla. Příčina není potvrzená (podezření: zatížení cesty PS-PL a zpětný tlak na výstupu
       jádra). Proto se během přenosu čte jen stav MM2S jednou za VDMA_POLL_US a S2MM se zkontroluje až po
       doběhnutí. Doba snímku = (start až zastavení MM2S) / frames; rozlišení polling kroku se ředí počtem
       snímků v měření. Zastavení MM2S nastane, až jádro přijme poslední beat posledního snímku, takže zahrnuje
       zpětný tlak celého řetězce. */
    /* S2MM nejdřív (příjemce musí být připravený), pak MM2S; VSIZE kanál spouští */
    vdma_setup_channel(vdma_base, VDMA_S2MM_DMACR, VDMA_S2MM_START(0u), VDMA_S2MM_HSIZE, VDMA_S2MM_STRIDE,
                       (uintptr_t)output, width, 0u);
    hw_write(vdma_base, VDMA_S2MM_VSIZE, height);
    vdma_setup_channel(vdma_base, VDMA_MM2S_DMACR, VDMA_MM2S_START(0u), VDMA_MM2S_HSIZE, VDMA_MM2S_STRIDE,
                       (uintptr_t)input, width, VDMA_DMACR_FRMCNT_EN | (frames << VDMA_DMACR_FRMCNT_SHIFT));
    XTime_GetTime(&start);
    hw_write(vdma_base, VDMA_MM2S_VSIZE, height);

    while (!done)
    {
        spin_us(VDMA_POLL_US);
        mm2s_status = hw_read(vdma_base, VDMA_MM2S_DMASR);
        XTime_GetTime(&now);
        if ((mm2s_status & VDMA_DMASR_HALTED) != 0u)
        {
            done = true;
        }
        else if (((mm2s_status & VDMA_DMASR_ERR_MASK) != 0u) || ((now - start) > VDMA_TIMEOUT_TICKS))
        {
            done = true;
            ok = false;
        }
    }

    if (ok)
    {
        /* poslední snímek se dopíše do paměti během dvou dob snímku (S2MM hlásí snímek až se SOF dalšího) */
        const XTime frame_ticks = (now - start) / (XTime)frames;
        const XTime settle_end = now + (2u * frame_ticks);
        XTime settle_now = now;

        *ticks = (uint64_t)(now - start);
        while (settle_now < settle_end)
        {
            XTime_GetTime(&settle_now);
        }
        s2mm_status = hw_read(vdma_base, VDMA_S2MM_DMASR);
        ok = ((s2mm_status & (VDMA_DMASR_S2MM_ERR_MASK | VDMA_DMASR_HALTED)) == 0u)
             && ((s2mm_status & VDMA_DMASR_FRMCNT_IRQ) != 0u);   /* aspoň jeden dokončený snímek */
    }
    else
    {
        *ticks = (uint64_t)(now - start);
        s2mm_status = hw_read(vdma_base, VDMA_S2MM_DMASR);
    }

    if (!ok)
    {
        printf("VDMA chyba/timeout: S2MM DMASR 0x%08lX, MM2S DMASR 0x%08lX, PARKPTR 0x%08lX\r\n",
               (unsigned long)s2mm_status, (unsigned long)mm2s_status, (unsigned long)hw_read(vdma_base, 0x28u));
    }
    Xil_DCacheInvalidateRange((UINTPTR)output, frame_bytes);
    vdma_reset(vdma_base);
    return ok;
}
