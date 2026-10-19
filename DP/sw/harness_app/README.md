# Měřicí aplikace testovacího řetězce (KV260)

Bare-metal aplikace pro Cortex-A53. Pro každé jádro v bitstreamu (HLS i VHDL) změří dobu snímku 1080p
přes VDMA, porovná výstup bit po bitu s golden modelem `lib_imgproc` spočítaným na ARM a změří stejný
algoritmus v SW. Výsledky vypisuje na UART jako CSV.

## Sestavení (Ababel)

Fronty v pořadí: `hw_ip` (VHDL IP, jen po změně VHDL), `hw_harness` (BD + bitstream + XSA + `harness_map.h`),
`sw_app` (platforma + aplikace `-O0/-O2/-O3`):

```bash
bash .claude/scripts/ababel.sh start hw_harness      # ~1 h
bash .claude/scripts/ababel.sh start sw_app          # po hw_harness
```

## Spuštění na desce (Windows, Vitis 2025.2)

1. Stáhnout z Ababelu `DP/sw/build/workspace/` (WinSCP), deska připojená USB (JTAG + UART).
2. Terminál na druhém COM portu desky: 115200 Bd, 8N1.
3. `xsdb run_board.tcl O2` z `DP/sw/harness_app` (případně `O0`, `O3` pro SW měření).
4. Řádky `CSV,...` zkopírovat do `DP/results/` (hlavička je ve výpisu).

## Co se měří

| sloupec | význam |
|---|---|
| `hw_us_snimek` | medián z 5 měření po 10 snímcích, paměť → jádro → paměť (VDMA) |
| `hw_fps` | 10^6 / `hw_us_snimek` |
| `sw_us` | samotný algoritmus `lib_imgproc` na A53 (medián z 10 běhů), bez převodníků |
| `chybne_bajty`, `chybne_kose` | rozdíl proti golden modelu (musí být 0) |
| `status` | stavový registr okénkových jader (0 = bez poruchy synchronizace) |

Port 0 přepínačů je bypass: `bypass_rgb` a `bypass_gray` dávají režii řetězce (VDMA, převodníky), od které
se odvíjí strop propustnosti (200 MHz, 1 px/takt → 96 fps při 1080p).
