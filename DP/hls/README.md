# HLS jádra DP (Vitis HLS 2025.2)

```
DP/hls/
  common/hls_video.hpp    typy AXI4-Stream Video (UG934, ap_axiu), pack/unpack, saturace, round_shift
  common/tb_video.hpp     testbench: testovací vzor, push_frame/check_frame proti golden modelu
  csc/                    převod barev - REFERENČNÍ JÁDRO (vzor pro bodová jádra)
  histogram/              histogram jasu, bypass - vzor pro jádra s voláním po snímcích
  hsv/                    RGB -> HSV a HSV -> RGB (dvě top funkce, dva .cfg), úplný test 2^24 v C-sim (TB_HSV_FULL=1)
  scripts/run_hls.sh/.bat jedna komponenta: csim | syn | cosim | impl | all (Linux / Windows)
  scripts/build_all.sh    všechny komponenty, souhrn PASS/FAIL
  scripts/collect_reports.py  reporty všech jader -> results/hls_results.csv (tabulky DP)
  build/, ip_repo/        generované (gitem ignorované)
```

## Spuštění

**Windows (tvůj PC):** otevři *Vitis 2025.2 Command Prompt* a v `DP\hls\scripts` spusť
```
run_hls.bat ..\csc\hls_config_rgb.cfg all
```

**Linux / Ababel bez práva spouštět skripty:** skript není nutné spouštět jako program, stačí ho předat bashi
(funguje i na adresáři připojeném s `noexec`):
```
source /tools/Xilinx/2025.2/Vitis/settings64.sh
cd DP/hls/scripts
bash run_hls.sh ../csc/hls_config_rgb.cfg all
bash build_all.sh syn
```
Kdyby nešlo ani to, příkazy ze skriptu se dají zadat ručně (z adresáře s `.cfg`):
`vitis-run --mode hls --csim --config hls_config_rgb.cfg --work_dir ../build/csc_rgb`,
`v++ -c --mode hls --config hls_config_rgb.cfg --work_dir ../build/csc_rgb`.

> Klíče v `hls_config.cfg` a přepínače `vitis-run` / `v++ -c --mode hls` odpovídají unified flow 2025.x.
> Při prvním spuštění zkontroluj log. Kdyby některý klíč verze 2025.2 nepřijala, oprav ho jednou
> ve všech `.cfg` (jsou stejně postavené).

## Výsledky do CSV

Po `syn`, `cosim` a `impl` spusť `python3 scripts/collect_reports.py`. Projde `build/*/hls/` a do
`results/hls_results.csv` zapíše odhad HLS (`est_*`), cosim (latence a interval v taktech)
a čísla po implementaci ve Vivadu (`impl_*`). **Do tabulek DP patří `impl_*`.** CSV se verzuje.

## Pravidla pro všechna jádra

1. **Stream jen přes `hlsv::axis_t<CH>`** (= `ap_axiu`). Vlastní struktura s `AGGREGATE` zabalí TUSER/TLAST do TDATA.
2. **Bodová jádra:** jedno volání = jeden řádek (`do { … } while (!last)` s `PIPELINE II=1`), řízení `ap_ctrl_hs` (`s_axilite port=return`) a v HW auto-restart (ARM zapíše `0x81` na offset `0x00`). TUSER/TLAST se kopírují ze vstupu (`hlsv::make_packet`). Žádná šířka, výška ani čítače. `ap_ctrl_none` **ne**: Vitis 2025.2 jádro se skalárními registry neumí co-simulovat (cosim visí na 0 transakcích).
3. **Parametry = skalární registry `s_axilite`** (ne pole). Stejná mapa registrů pak poslouží VHDL verzi.
4. **Aritmetika = golden model** (`DP/model/lib_imgproc`). Konstanty (tabulky HSV, matice) brát z `DP/model/generated/imgproc_coeffs.h`, nikdy je neopisovat ručně.
5. **Testbench:** `tbv::fill_pattern` → golden model → jádro → `tbv::check_frame`. `main()` vrací 0 jen při bitové shodě dat i TUSER/TLAST. Testují se dva snímky za sebou.
6. **Samopopisné názvy** proměnných a funkcí (stejná zásada jako ve VHDL), žádné jednopísmenné zkratky kromě souřadnic `x`, `y`.
7. `clock=5ns` ve všech `.cfg` (společný cíl srovnání HLS × VHDL).

## Postup převodu dalšího bodového jádra (hotové: prahování v `threshold/`, RGB↔HSV v `hsv/` – vzory)

1. Zkopíruj `csc/` jako `threshold/` (resp. `rgb2hsv/`, `hsv2rgb/`) a přejmenuj soubory a `syn.top`.
2. Tělo pixelu nahraď funkcí podle golden modelu:
   - prahování: `imgproc_threshold_pixel()`, registry `thresh`, `maxval`, `type` (3 b, 5 typů OpenCV),
   - RGB→HSV: `imgproc_rgb_to_hsv_pixel()`. Tabulky `IMGPROC_HSV_SDIV` / `IMGPROC_HSV_HDIV180` vlož z `generated/imgproc_coeffs.h`, v HW z nich bude ROM. Bez registrů.
   - HSV→RGB: `imgproc_hsv_to_rgb_pixel()` (tvoje původní HLS logika, jen přes `hlsv::Pixel`). Bez registrů.
3. V testbenchi zavolej odpovídající funkci golden modelu místo `imgproc_csc()`.
4. `./run_hls.sh ../<jádro>/hls_config.cfg csim`. Teprve když projde, spusť `syn` a `cosim`.
5. Pozor na pořadí složek: index 0 = TDATA[7:0] = **G** u RGB (UG934). V `Pixel` používej konstanty `IMGPROC_RGB_IDX_*`.

## Histogram (volání po snímcích)

Na rozdíl od bodových jader musí jádro poznat konec snímku, aby předalo výsledek:

- **Jedno volání = jeden snímek.** Registr `height`, šířku ohraničuje TLAST. `ap_done` = histogram je platný
  (přerušení pro ARM), auto-restart jako u bodových jader.
- **Video prochází beze změny** (bypass), histogram se počítá do interní BRAM a po snímku se zkopíruje do pole
  `hist[256]` v AXI4-Lite. ARM ho čte během dalšího snímku (dvojí buffer zadarmo). Režie 2 × 256 taktů na snímek.
- **Read-modify-write do BRAM s II=1 vyžaduje forwarding** posledních zápisů (`HIST_FWD_DEPTH = 3`)
  a `DEPENDENCE inter false`. Technika „přičítej v registru do změny hodnoty“ z UG1399 prošla C-sim, ale v cosim
  ztrácela pixely. **U jader s RMW do paměti je cosim povinná** a TB musí obsahovat vzory s opakováním po 1–4 px.
- **`status`:** bit0 = před TUSER přišly pixely (resynchronizace, nepočítají se), bit1 = TUSER uprostřed snímku
  (histogram neplatný). Nejpozději druhý snímek po poruše je opět správný.
