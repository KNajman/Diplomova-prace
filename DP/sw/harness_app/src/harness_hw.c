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
#include <xtime_l.h>

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
 */
static void vdma_setup_channel(uintptr_t vdma_base, uint32_t dmacr, uint32_t start_reg0, uint32_t hsize_reg,
                               uint32_t stride_reg, uintptr_t buffer, uint32_t width, uint32_t frames)
{
    uint32_t n = 0u;

    hw_write(vdma_base, dmacr, VDMA_DMACR_RS | VDMA_DMACR_CIRCULAR | VDMA_DMACR_FRMCNT_EN
                                   | (frames << VDMA_DMACR_FRMCNT_SHIFT));
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
    uint32_t status = 0u;
    bool done = false;
    bool ok = true;

    Xil_DCacheFlushRange((UINTPTR)input, frame_bytes);
    Xil_DCacheInvalidateRange((UINTPTR)output, frame_bytes);
    vdma_reset(vdma_base);

    /* S2MM nejdřív (příjemce musí být připravený), pak MM2S; VSIZE kanál spouští */
    vdma_setup_channel(vdma_base, VDMA_S2MM_DMACR, VDMA_S2MM_START(0u), VDMA_S2MM_HSIZE, VDMA_S2MM_STRIDE,
                       (uintptr_t)output, width, frames);
    hw_write(vdma_base, VDMA_S2MM_VSIZE, height);
    vdma_setup_channel(vdma_base, VDMA_MM2S_DMACR, VDMA_MM2S_START(0u), VDMA_MM2S_HSIZE, VDMA_MM2S_STRIDE,
                       (uintptr_t)input, width, frames);
    XTime_GetTime(&start);
    hw_write(vdma_base, VDMA_MM2S_VSIZE, height);

    while (!done)
    {
        status = hw_read(vdma_base, VDMA_S2MM_DMASR);
        XTime_GetTime(&now);
        if ((status & (VDMA_DMASR_HALTED | VDMA_DMASR_FRMCNT_IRQ)) != 0u)
        {
            done = true;
        }
        else if (((status & VDMA_DMASR_ERR_MASK) != 0u) || ((now - start) > VDMA_TIMEOUT_TICKS))
        {
            printf("VDMA chyba/timeout: S2MM DMASR 0x%08lX, MM2S DMASR 0x%08lX\r\n", (unsigned long)status,
                   (unsigned long)hw_read(vdma_base, VDMA_MM2S_DMASR));
            done = true;
            ok = false;
        }
    }
    *ticks = (uint64_t)(now - start);
    Xil_DCacheInvalidateRange((UINTPTR)output, frame_bytes);
    vdma_reset(vdma_base);
    return ok;
}
