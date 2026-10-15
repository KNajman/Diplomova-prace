# Deník výsledků (podklad pro kapitolu 6 – Výsledky a srovnání)

Každé srovnání = tabulka + konfigurace + interpretace + zdroj dat. Surová data: `DP/hls/results/hls_results.csv`,
`DP/vhdl/results/vhdl_results.csv` (generují `collect_reports.py` a `collect_vhdl.py`). Do textu DP se tabulky převedou
z CSV (csvsimple), tady jsou ručně vybrané řádky a hlavně **co z nich plyne**.

Společné podmínky (pokud není uvedeno jinak): KV260 (xck26-sfvc784-2LV-c), Vivado / Vitis HLS 2025.2, OOC syntéza +
implementace, cíl 5 ns (200 MHz), bez IO bufferů. Perioda VHDL = max(5 − WNS, 5 − WPWS); HLS `export_impl` = Post-Route
perioda (jen z WNS) – viz otevřený bod o sjednocení metodiky v plánu.

---

## 1. HLS jádra – první sada (15. 10. 2026)

| jádro | II | LUT | FF | DSP | BRAM | perioda (impl) | odhad HLS | cosim |
|---|---|---|---|---|---|---|---|---|
| CSC RGB→RGB (`hls_csc_rgb`) | 1 | 407 | 385 | 9 | 0 | 3,85 ns | 3,10 ns / 791 LUT | PASS |
| histogram (bypass) | 1 | 302 | 422 | 0 | 2 | 2,73 ns | 2,44 ns | PASS |
| medián 3×3 | 1 | 768 | 472 | 0 | 4 | 4,06 ns | 3,47 ns / 1701 LUT | PASS |

**Poznatky**
- Odhad HLS syntézy se od implementace výrazně liší (CSC: perioda −20 %, LUT +94 %) → do DP jen čísla po implementaci.
- Všechna jádra splňují 200 MHz s rezervou; medián je nejpomalejší (síť 7× sort3 + multiplexory okrajů).
- Histogram: technika z UG1399 (přičítání v registru do změny hodnoty) prošla C-sim, ale ne cosim → explicitní forwarding
  posledních 3 zápisů + `DEPENDENCE inter false`. **C-sim neověří časování pipeline – cosim je povinná.**
- CSC: řídicí rozhraní AXI4-Lite (`control_s_axi`) zabírá 424 LUT / 300 FF v odhadu, víc než samotný výpočet.
- Medián: 4 BRAM18 = 2 řádkové buffery × 3840 × 8 b (2 BRAM18 na buffer).

Zdroj: `DP/hls/results/hls_results.csv`, commit `accf161`.

---

## 2. CSC – HLS × VHDL a postup optimalizace VHDL (15. 10. 2026)

Převod RGB→YCbCr (matice 3×3, Q2.15), varianta 3→3, top-level s AXI4-Lite (stejná mapa registrů):

| verze | LUT | FF | DSP | perioda | Fmax | limit |
|---|---|---|---|---|---|---|
| HLS `hls_csc_rgb` | 407 | 385 | 9 | 3,85 ns | 260 MHz | logika |
| VHDL v1 – 3 součiny v 1 taktu + strom sčítaček, registry 32 b | 325 | 558 | 12 | 3,70 ns | 270 MHz | logika |
| VHDL v2 – systolická kaskáda DSP, šířky vzorcem, `G_REG_W` | 257 | 346 | 9 | 3,75 ns | 267 MHz | dekódování adresy |
| **VHDL v3 – pipelinované dekódování adres (konstanty)** | **210** | **389** | **9** | **3,26 ns** | **307 MHz** | šířka pulzu DSP |

Ostatní varianty (v3): RGB→šedá 102 LUT / 197 FF / 3 DSP / 3,26 ns; šedá→RGB 268 LUT / 360 FF / 3 DSP / 3,26 ns.

Rozpad v3 (hierarchický report): jádro `csc_core` 64 LUT / 96 FF / 9 DSP (z toho skid buffer 17 LUT / 54 FF),
registrová banka `axil_regbank` 146 LUT / 293 FF.

**Poznatky**
- **Struktura datové cesty rozhoduje o DSP:** strom sčítaček (v1) → 4 DSP na kanál; systolická kaskáda (součiny po sobě,
  PCIN → P) → 3 DSP. HLS kaskádu navrhl sám, ve VHDL ji musí návrhář zvolit vědomě.
- **Šířky registrů:** ukládat jen platné bity (18 b koeficient, 10 b offset) = −192 FF (v1 → v2) a menší čtecí multiplexor.
- **Kritická cesta se přesunula do řízení:** v2 omezovalo dekódování adresy `(addr − 16) / 8` (9 úrovní logiky, 3× CARRY8).
  Porovnání s konstantami + registr (v3) → logika má rezervu 2,55 ns, strop dává jen min. šířka pulzu DSP (3,26 ns).
- **Pipelining je výměna LUT za FF:** v2 → v3 −47 LUT, +43 FF.
- **Řízení stojí víc než výpočet:** jádro 64 LUT, AXI4-Lite 146 LUT (VHDL) / ~424 LUT (HLS odhad).
- **Shrnutí HLS × VHDL (stejná architektura výpočtu, 9 DSP):** VHDL −48 % LUT, FF ≈ stejně, +18 % Fmax.
  Za cenu: 3 iterace návrhu (cca 1 MD) proti jedné direktivě `PIPELINE` v HLS.
- Další zrychlení už ne návrhem – jen jiný speed grade / konfigurace DSP.

Bitová shoda: xsim 6 předvoleb × náhodné mezery/backpressure + 6 × konfigurace přes AXI4-Lite, vše PASS.
Zdroj: `DP/vhdl/results/vhdl_results.csv` (řádky `*_v1`, `*_v2`, bez přípony = v3), commity `2f19eee`, `c3ae141`, `f8042a6`.

---

## 3. VHDL RGB ↔ HSV (15. 10. 2026)

Celočíselný algoritmus OpenCV (RGB→HSV bitově = `cv::cvtColor`), HSV→RGB podle golden modelu (OpenCV počítá přes float).
Ověřeno: xsim testovací obraz + rampa 256×256 (náhodné mezery 60/60), obálky přes AXI4-Lite a **úplný test všech 2^24
kombinací v obou směrech** (4 části 2048×2048) – vše PASS, 0 chyb, 1 px/takt.

| jádro | takty pipeline | LUT | FF | DSP | BRAM | perioda | limit |
|---|---|---|---|---|---|---|---|
| `rgb2hsv_core` | 8 | 237 | 204 | 2 | 0 | 3,26 ns | šířka pulzu DSP |
| `hsv_axil` RGB→HSV (s AXI4-Lite) | 8 | 275 | 255 | 2 | 0 | 3,26 ns | šířka pulzu DSP |
| `hsv2rgb_core` | 13 | 564 | 371 | 1 | 0 | 3,33 ns | logika (násobení v LUT) |
| `hsv_axil` HSV→RGB (s AXI4-Lite) | 13 | 603 | 422 | 1 | 0 | 3,54 ns | logika |

**Poznatky**
- RGB→HSV: dělení nahrazují 2 tabulky převrácených hodnot (256 položek, sdiv 20 b, hdiv180 17 b) – Vivado je realizoval
  v LUT (ROM), BRAM 0 – a 2 násobení v DSP. Kritická cesta = rozvod globálního povolení na CE vstupy DSP (0 úrovní logiky).
- HSV→RGB: 5 násobení 8×8/8×9 b syntéza (výchozí `use_dsp = auto`) umístila do LUT (jen 1 DSP) → 564 LUT a kritická cesta
  `S * (255 − f)` přes 3× CARRY8. **Možná optimalizace:** vynutit DSP (`use_dsp = "yes"`) → očekávané −300 až −400 LUT, +4 DSP,
  perioda na limitu DSP 3,26 ns. Výměna LUT za DSP – rozhodnout podle srovnání s HLS.
- Řídicí rozhraní bez parametrů (jen ap_ctrl/GIE/IER/ISR): 38 LUT / 51 FF – u bodových jader bez registrů je režie AXI4-Lite malá.
- Úplný test 2^24 v xsim: ~30–45 s na 4,2 M pixelů na Ababelu → celý prostor barev za ~6 min.
- Golden vektory HSV→RGB byly do 15. 10. špatně (chyba čtení PPM v `imgproc_cli`), **odhalil to VHDL testbench** – argument
  pro nezávislé ověření nástrojů, ne jen jader.

Zdroj: `DP/vhdl/results/vhdl_results.csv` (řádky `rgb2hsv_core`, `hsv2rgb_core`, `hsv_axil_*`), log `~/logs/vhdl_hsv.log` na Ababelu.

---

## 4. Medián 3×3 – HLS × VHDL, první okénkové jádro (15. 10. 2026)

Společný generátor okna (`window_gen` ve VHDL, `hls_window.hpp` v HLS): řádkové buffery v BRAM, okraj nuly/replikace,
flush pravého a dolního okraje, resynchronizace na TUSER, stavový registr. Síť 7× sort3 v obou verzích.
Ověřeno (xsim): 6 rozměrů (64×48, 8×1, 8×2, 9×3, 17×5, 33×4) × oba okraje × náhodné mezery 70/70, poruchy (pixely před
TUSER, TLAST o 3 px dřív, obojí + mezery 40/60) se správným statusem, obálka přes AXI4-Lite (přerušení, ISR, ap_vld COR).

| verze | LUT | FF | DSP | BRAM | perioda | Fmax |
|---|---|---|---|---|---|---|
| HLS `hls_median` | 768 | 472 | 0 | 4× BRAM18 | 4,06 ns | 246 MHz |
| VHDL `median_axil` | **631** | 538 | 0 | 2× BRAM36 (= 4× BRAM18) | **3,80 ns** | 263 MHz |
| VHDL jen `median_core` (bez AXI4-Lite) | 600 | 439 | 0 | 2× BRAM36 | 3,82 ns | 262 MHz |

Rozpad VHDL: `window_gen` 446 LUT / 285 FF / 2 BRAM, síť mediánu + skid buffery ~120 LUT, `axil_regbank` 66 LUT / 99 FF.

**Poznatky**
- Paměť stejná (2 řádkové buffery 4096 × 8 b = 2× BRAM36 = 4× BRAM18; pozor na jednotky – Vivado počítá dlaždice 36 Kb,
  HLS BRAM_18K).
- **Režii okénkového jádra tvoří řízení, ne výpočet:** generátor okna (pozice, okraje, flush) = 70 % LUT, síť mediánu ~20 %.
- Kritická cesta VHDL: `frame_height` → porovnání `need_input` → `fire` → čítač `pos_y` (7 úrovní, 1× CARRY8).
  **Možná optimalizace (v2):** předpočítat příznaky pozice (need_input, okraje řádku) o takt dopředu z čítačů s registry
  místo porovnávání v taktu provedení – stejný princip jako dekódování adres v CSC v3. Přínos i pro konvoluci (sdílený `window_gen`).
- Režie flush: (W + R)(H + R) − W·H = 113 taktů na 64×48 (1,8 %), u 1080p 0,15 %.
- Chyba nalezená testy: první verze neposouvala okno v řádku dolního okraje (sloučené příznaky „sloupec ve snímku“
  a „pixel ze vstupu“) – odhalil ji hned první test 64×48 (poslední řádek konstantní).

Zdroj: `DP/vhdl/results/vhdl_results.csv` (`median_core`, `median_axil`), `DP/hls/results/hls_results.csv` (`median`), log `~/logs/vhdl_median.log`.
