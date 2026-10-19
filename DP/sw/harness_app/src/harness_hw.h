/**
 * @file    harness_hw.h
 * @brief   Ovládání testovacího řetězce na KV260: AXIS přepínače, AXI VDMA, řízení jader (mapa HLS)
 * @author  Bc. Karel Najman
 * @date    2026-10-19
 * @copyright Bc. Karel Najman, Technická univerzita v Liberci
 *
 * Poznámky k návrhu:
 *  - Registry se zapisují přímo (Xil_Out32), bez driverů Xilinxu. HLS i VHDL jádra mají stejnou mapu
 *    registrů, takže stejná funkce ovládá obě implementace (jen jiná bázová adresa).
 *  - VDMA běží v režimu "počet snímků": po N snímcích se sama zastaví (DMACR.FrmCnt_En), čas se měří
 *    od spuštění MM2S do zastavení S2MM. Měří se tedy celý řetězec paměť -> jádro -> paměť.
 *  - Adresy a čísla portů přepínačů generuje build_harness.tcl do harness_map.h.
 */
#ifndef HARNESS_HW_H_
#define HARNESS_HW_H_

#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/// Mapa registrů řízení jádra (HLS s_axilite, shodná pro VHDL axil_regbank)
#define HW_REG_AP_CTRL          (0x00u)     ///< bit0 ap_start, bit1 ap_done (COR), bit2 ap_idle, bit7 auto_restart
#define HW_REG_GIE              (0x04u)     ///< Globální povolení přerušení
#define HW_REG_IER              (0x08u)     ///< Povolení přerušení (bit0 ap_done)
#define HW_REG_ISR              (0x0Cu)     ///< Stav přerušení (TOW)
#define HW_REG_ARG(index)       (0x10u + (8u * (index)))   ///< Skalární argument jádra č. index
#define HW_AP_START             (0x01u)
#define HW_AP_DONE              (0x02u)
#define HW_AP_IDLE              (0x04u)
#define HW_AP_AUTO_RESTART      (0x80u)

/// Zápis 32bitového registru periferie
void hw_write(uintptr_t base, uint32_t offset, uint32_t value);

/// Čtení 32bitového registru periferie
uint32_t hw_read(uintptr_t base, uint32_t offset);

/// Spustí jádro v trvalém běhu (ap_start + auto_restart)
void hw_core_start(uintptr_t base);

/// Zastaví jádro (vypne auto_restart, rozpracovaný snímek/řádek dokončí)
void hw_core_stop(uintptr_t base);

/**
 * @brief Nastaví cestu přepínačem 1 -> N a N -> 1 na daný port (ostatní výstupy vypne).
 * @param switch_in_base    Báze přepínače 1 -> N
 * @param switch_out_base   Báze přepínače N -> 1
 * @param num_ports         Počet portů (N)
 * @param port              Vybraný port (0 = bypass)
 */
void hw_route(uintptr_t switch_in_base, uintptr_t switch_out_base, uint32_t num_ports, uint32_t port);

/**
 * @brief Provede frames snímků přes VDMA (MM2S z input, S2MM do output) a vrátí dobu v tikách XTime.
 * @param vdma_base     Báze AXI VDMA
 * @param input         Vstupní snímek (RGB 24 b, UG934)
 * @param output        Výstupní snímek
 * @param width         Šířka [px]
 * @param height        Výška [px]
 * @param frames        Počet snímků (1..255)
 * @param ticks         Výstup: doba od spuštění MM2S do zastavení S2MM [tiky XTime]
 * @return true = proběhlo, false = timeout nebo chyba VDMA (stavové registry vypíše na UART)
 */
bool hw_vdma_run(uintptr_t vdma_base, const uint8_t* input, uint8_t* output, uint32_t width, uint32_t height,
                 uint32_t frames, uint64_t* ticks);

#ifdef __cplusplus
}
#endif

#endif /* HARNESS_HW_H_ */
