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

---

## 5. Optimalizace: `window_gen` v2 a HSV→RGB v DSP (15. 10. 2026)

| jádro | LUT | FF | DSP | BRAM | perioda | kritická cesta |
|---|---|---|---|---|---|---|
| `hsv2rgb_core` (násobení v LUT, `use_dsp` auto) | 564 | 371 | 1 | 0 | 3,33 ns | S·(255−f) přes 3× CARRY8 |
| `hsv2rgb_core` `G_USE_DSP = true` | **158** | **184** | 11 | 0 | **3,26 ns** | limit šířky pulzu DSP |
| `median_core` v1 | 600 | 439 | 0 | 2 | 3,82 ns | frame_height → need_input → fire → pos_y (7 úrovní) |
| `median_core` v2 (předpočet příznaků pozice) | 590 | 433 | 0 | 2 | **3,50 ns** | pos_y → výpočet row_source (předpočet, 7 úrovní) |
| `median_axil` v1 | 631 | 538 | 0 | 2 | 3,80 ns | řízení window_gen |
| `median_axil` v2 | 692 | 532 | 0 | 2 | 4,07 ns | síť mediánu (sort3: 2 porovnání za sebou, 6 úrovní) |

**Poznatky**
- **HSV→RGB:** vynucení DSP ušetří 72 % LUT a 50 % FF (registry pipeline se schovají do registrů A/B/M/P v DSP) za 10 DSP navíc
  (z 1 248 na KV260 je to 0,9 %). U malých násobení 8×8 b je výchozí volba syntézy (LUT) horší ve všech parametrech kromě DSP.
  Kandidát na výchozí nastavení; rozhodnout po srovnání s HLS hsv2rgb.
- **window_gen v2:** v samotném jádře −0,32 ns (+9 %), řízení už není úzké hrdlo. S obálkou výsledek kolísá (4,07 vs 3,80 ns)
  – kritická cesta je teď v síti mediánu a o pořadí rozhoduje rozmístění (P&R). Všechny varianty splňují 200 MHz s rezervou
  ≥ 0,9 ns, další optimalizace (rozdělit sort3 na stupně compare-exchange, inkrementální příznaky řádků) by přinesla
  desetiny ns za cenu FF → **zastaveno, není potřeba pro cíl 200 MHz**. Zmínit v textu jako možnost.
- Obecný vzorec postupu optimalizace (CSC, medián): odstranit kritickou cestu → přesune se jinam; končí se, když je
  splněný cíl, nebo když limituje hardware (šířka pulzu DSP 3,26 ns).

Zdroj: `DP/vhdl/results/vhdl_results.csv` (`*_v1` = před optimalizací), log `~/logs/vhdl_opt.log`.

---

## 6. 2D konvoluce K×K – HLS × VHDL (16.–19. 10. 2026)

Konfigurace: OOC syntéza + implementace, 5 ns (200 MHz), KV260. Max. šířka 3840 px, okraj constant/replicate, koeficienty
int8, scale Q.14 (18 b), delta int16. HLS: celé IP (s_axilite vždy součástí). VHDL: `filter2d_axil` = jádro + `axil_regbank`,
`filter2d_core` = jen jádro (`window_gen` + aritmetika). BRAM v dlaždicích 36 Kb (HLS hlásí BRAM_18K, přepočteno /2).

| varianta | LUT | FF | DSP | BRAM36 | perioda | Fmax | limit |
|---|---|---|---|---|---|---|---|
| HLS `hls_filter2d_3x3` | 655 | 621 | 10 | 2 | 3,92 ns | 255 MHz | logika |
| VHDL `filter2d_axil` K3 (součiny v LUT) | 1282 | 919 | 1 | 2 | 4,37 ns | 229 MHz | logika |
| VHDL `filter2d_axil` K3 `G_USE_DSP` | **506** | **558** | 14 | 2 | **3,81 ns** | 263 MHz | logika |
| VHDL `filter2d_core` K3 | 1120 | 679 | 1 | 2 | 3,26 ns | 307 MHz | šířka pulzu |
| VHDL `filter2d_core` K3 `G_USE_DSP` | 350 | 318 | 14 | 2 | 3,55 ns | 282 MHz | logika |
| HLS `hls_filter2d_5x5` | 959 | 863 | 26 | 5 | 4,17 ns | 240 MHz | logika |
| VHDL `filter2d_axil` K5 `G_USE_DSP` v1 (koeficienty jako registry) | 874 | 940 | 38 | 4 | 4,17 ns | 240 MHz | logika |
| VHDL `filter2d_axil` K5 `G_USE_DSP` v2 (okno coeff jako HLS) | **766** | 951 | 38 | 4 | **3,76 ns** | 266 MHz | logika |
| VHDL `filter2d_core` K5 | 2789 | 1510 | 1 | 4 | 4,20 ns | 238 MHz | logika |
| VHDL `filter2d_core` K5 `G_USE_DSP` | **603** | **539** | 38 | 4 | **3,82 ns** | 262 MHz | logika |
| HLS `hls_filter2d_7x7` | 1306 | **1244** | 50 | 7 | 4,37 ns | 229 MHz | logika |
| VHDL `filter2d_axil` K7 `G_USE_DSP` v1 (koeficienty jako registry) | 1679 | 1479 | 72 | 6 | 4,08 ns | 245 MHz | logika |
| VHDL `filter2d_axil` K7 `G_USE_DSP` v2 (okno coeff jako HLS) | **1232** | 1489 | 72 | 6 | **4,00 ns** | 250 MHz | logika |
| VHDL `filter2d_core` K7 | 5238 | 2702 | 1 | 6 | 4,18 ns | 239 MHz | logika |
| VHDL `filter2d_core` K7 `G_USE_DSP` | 1213 | 837 | 72 | 6 | 4,24 ns | 236 MHz | logika |

Rozpad VHDL K3 `G_USE_DSP` (jádro): `window_gen` 282 LUT / 255 FF / 2 BRAM36, aritmetika jen **16 LUT / 19 FF + 14 DSP**.

**Poznatky**
- **Bez DSP je VHDL výrazně větší než HLS** (K3 2×, K7 4× LUT): součiny 8×9 b syntéza (auto) skládá z LUT. HLS dává
  součiny do DSP sám. Férové srovnání je tedy proti variantě `G_USE_DSP`.
- **v1 – s DSP vycházelo VHDL menší jen pro malé K:** celé IP K3 −23 % LUT / −10 % FF, K5 −9 % LUT / +9 % FF, K7 +29 % LUT /
  +19 % FF proti HLS. Samotné jádro bylo menší vždy (K7 1 213 vs 1 306 LUT); rozdíl dělala **registrová banka**: K7 měla
  5 + 49 registrů, obálka − jádro = 466 LUT / 642 FF (dekódování 54 adres + čtecí multiplexor 49 registrů).
- **v2 – mapa jako HLS:** HLS dává pole koeficientů K ≥ 5 do paměťového okna s_axilite (4 × int8 ve slově, 5×5: 0x40–0x5F,
  status 0x60; 7×7: 0x40–0x7F, status 0x80; ověřeno z `xhls_filter2d_*_hw.h`). VHDL banka dostala zapisovatelné okno
  (WSTRB) a registry za oknem; koeficienty se zapisují po slovech přímo do registrů obálky, zpětné čtení = multiplexor slov.
  Výsledek: **K7 −27 % LUT (1 679 → 1 232) a −0,08 ns, K5 −12 % LUT a −0,4 ns**, FF beze změny (koeficienty jádro potřebuje
  paralelně – stejně jako HLS po `copy_coeff`). Proti HLS teď VHDL **K5 −20 % LUT / +10 % FF, K7 −6 % LUT / +20 % FF**,
  perioda o 0,4 ns lepší. Navíc jeden driver pro HLS i VHDL i u K ≥ 5.
- Poučení pro text: velikost IP neurčuje jen datová cesta – u parametrického jádra může řídicí rozhraní (dekódování adres
  a čtecí multiplexor) přerůst výpočet. Přebytek FF ve VHDL K7 je v `window_gen` (okno 7×7 + replikace okrajů, 732 FF).
- Cena VHDL: víc DSP (14/38/72 vs 10/26/50). Atribut `use_dsp` je jen na signálu součinů, ale Vivado do DSP vtáhne i strom
  sčítaček (post-adder / kaskáda PCIN) a škálování – aritmetika K3 má jen 16 LUT. HLS strom sčítá v LUT a do DSP dá jen
  součiny + 1 škálování. Na KV260 (1 248 DSP) je 72 DSP 5,8 % – přijatelné; kdyby DSP chyběly, VHDL bez DSP pořád splní 200 MHz.
- **Generičnost:** jedno VHDL jádro pro libovolné K (šířky vzorcem `sum_w`, adresa AXI vzorcem `axil_addr_w`), HLS
  šablona `window_frame<K, Op>` – obojí škáluje bez ručních zásahů. Paměť roste lineárně s K − 1 řádkovými buffery.
- **BRAM:** VHDL K − 1 bufferů (2/4/6 BRAM36). HLS o jeden BRAM36 víc u K5/K7 – pole koeficientů v s_axilite je v BRAM
  adaptéru (VHDL má koeficienty v registrech banky).
- **Perioda** všech variant 3,3–4,4 ns, cíl 200 MHz splněn všude s rezervou ≥ 0,6 ns. U K3 jádra bez DSP limituje
  šířka pulzu (jediný DSP pro škálování), DSP varianta má o 0,3 ns horší logickou cestu (kaskáda DSP).
- Co do textu: graf LUT/FF/DSP v závislosti na K pro HLS × VHDL × VHDL+DSP.

Zdroj: `DP/vhdl/results/vhdl_results.csv` (`filter2d_*`), `DP/hls/results/hls_results.csv` (`filter_*`), logy
`~/logs/vhdl_filter.log`, `~/logs/vhdl_filter_dsp.log`, `~/logs/vhdl_filter_axil.log` (v1), `~/logs/vhdl_filter_map.log` (v2),
`~/logs/hls_filter.log`. Mapa HLS: `DP/hls/build/filter_*/hls/.autopilot/db/driver/src/xhls_filter2d_*_hw.h` na Ababelu.

---

## 7. Histogram – HLS × VHDL, dvě architektury (19. 10. 2026)

Konfigurace: OOC, 5 ns, 4K (čítač 23 b), mapa registrů jako HLS (`height` 0x10, `status` 0x18, okno `hist[256]` 0x400–0x7FF,
ověřeno z `xhls_histogram_hw.h`). VHDL: `G_USE_BRAM` přepíná paměť košů, řízení snímku je společné.
BRAM v dlaždicích 36 Kb (0,5 = jedna BRAM18).

| varianta | LUT | FF | DSP | BRAM36 | perioda | limit |
|---|---|---|---|---|---|---|
| HLS `hls_histogram` (BRAM + forwarding 3 zápisů) | 302 | 422 | 0 | 1 | 2,73 ns | logika (jen WNS) |
| VHDL `histogram_axil` v1 – 256 čítačů ve FF | 6316 | 6333 | 0 | 0,5 | 3,67 ns | logika (routing 92 %) |
| VHDL `histogram_axil` v2 `G_USE_BRAM = false` | 6437 | 6370 | 0 | 0,5 | 3,08 ns | šířka pulzu BRAM |
| VHDL `histogram_axil` v2 `G_USE_BRAM = true` | **183** | **288** | 0 | 1 | 3,08 ns | šířka pulzu BRAM |
| VHDL `histogram_core` v2 `G_USE_BRAM = true` | 124 | 188 | 0 | 0,5 | 3,08 ns | šířka pulzu BRAM |
| VHDL `histogram_core` v2 `G_USE_BRAM = false` | 6378 | 6270 | 0 | 0 | 2,80 ns | logika |

**Poznatky**
- **Architektura rozhoduje víc než jazyk:** čítače ve FF jsou 35× větší než BRAM (6,4 tis. vs 183 LUT). Je to přímá realizace
  „histogram = 256 čítačů“ z učebnice; BRAM varianta potřebuje read-modify-write a forwarding, ale je zdaleka nejlevnější.
  Do textu: obě varianty jako ukázka kompromisu logika × paměť.
- **VHDL BRAM proti HLS −39 % LUT, −32 % FF**, stejná paměť (BRAM18 koše + BRAM18 výsledek). Forwarding ve VHDL ze 2 stupňů
  (plyne přímo z pipeline A–D, příznaky shody registrované o takt dřív), HLS drží 3 poslední zápisy s porovnáním v cyklu.
  Výsyp a nulování v jednom průchodu (256 taktů/snímek, HLS 2 × 256); nulování po resetu průchodem paměti.
- Testbench ověřuje obě cesty forwardingu: mutace (vypnutý forwarding z C nebo z D) → 6 chyb na vzoru a,b,a / 3 na plochém obrazu.
- v1 → v2 u čítačů (3,67 → 3,08 ns): operace jdou registrovanou pipeline (čítače bez resetu – nuluje je průchod CLEAR),
  odpadl rozvod stavu na 5 888 FF.
- Perioda: VHDL i HLS jsou pod limitem šířky pulzu BRAM (3,077 ns); u HLS se limit nepočítá (metodika jen WNS, viz otevřené body).

Zdroj: `DP/vhdl/results/vhdl_results.csv` (`histogram_*`, `*_v1` = první verze), `DP/hls/results/hls_results.csv` (`histogram`),
log `~/logs/vhdl_hist.log`.

---

## 8. Prahování – VHDL (19. 10. 2026)

| varianta | LUT | FF | DSP | BRAM | perioda | limit |
|---|---|---|---|---|---|---|
| VHDL `threshold_core` | 25 | 60 | 0 | 0 | 2,78 ns | šířka pulzu |
| VHDL `threshold_axil` | 81 | 141 | 0 | 0 | 2,78 ns | šířka pulzu |
| HLS `hls_threshold` | – | – | – | – | – | (Karel, zatím chybí) |

**Poznatky**
- Typ prahování se dekóduje mimo pipeline (registr se mění jen zápisem z ARM): z typu se předpočítá zdroj výsledku nad/pod
  prahem (nula / maxval / thresh / hodnota). Datová cesta = komparátor + multiplexor 4:1, 3 takty.
- Úplný test v jednom běhu: 8 typů (5 platných + neplatné → 0) × prahy {0, 1, 127, 254, 255} × maxval {255, 77} na rampě
  se všemi 256 hodnotami = 80 kombinací, PASS. Obálka s Otsuovým prahem šedého obrazu (108).
- Mapa registrů 0x10 thresh, 0x18 maxval, 0x20 type – HLS se stejným pořadím argumentů dá stejnou mapu.

Zdroj: `DP/vhdl/results/vhdl_results.csv` (`threshold_*`), log `~/logs/vhdl_threshold.log`.
