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
| VHDL v2 – sekvenční zpracování v pipeline DSP, šířky vzorcem, `G_REG_W` | 257 | 346 | 9 | 3,75 ns | 267 MHz | dekódování adresy |
| **VHDL v3 – pipelinované dekódování adres (konstanty)** | **210** | **389** | **9** | **3,26 ns** | **307 MHz** | šířka pulzu DSP |

Ostatní varianty (v3): RGB→šedá 102 LUT / 197 FF / 3 DSP / 3,26 ns; šedá→RGB 268 LUT / 360 FF / 3 DSP / 3,26 ns.

Rozpad v3 (hierarchický report): jádro `csc_core` 64 LUT / 96 FF / 9 DSP (z toho skid buffer 17 LUT / 54 FF),
registrová banka `axil_regbank` 146 LUT / 293 FF.

**Poznatky**
- **Struktura datové cesty rozhoduje o DSP:** strom sčítaček (v1) → 4 DSP na kanál; sekvenční zpracování v pipeline (součiny po sobě,
  PCIN → P) → 3 DSP. HLS takovou pipeline navrhl sám, ve VHDL ji musí návrhář zvolit vědomě.
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

## 8. Prahování – HLS × VHDL (19. 10. 2026)

| varianta | LUT | FF | DSP | BRAM | perioda | limit |
|---|---|---|---|---|---|---|
| VHDL `threshold_core` | 25 | 60 | 0 | 0 | 2,78 ns | šířka pulzu |
| VHDL `threshold_axil` | 81 | 141 | 0 | 0 | 2,78 ns | šířka pulzu |
| HLS `hls_threshold` (OOC stejným skriptem) | 122 | 118 | 0 | 0 | 2,78 ns | šířka pulzu |

**Poznatky**
- Typ prahování se dekóduje mimo pipeline (registr se mění jen zápisem z ARM): z typu se předpočítá zdroj výsledku nad/pod
  prahem (nula / maxval / thresh / hodnota). Datová cesta = komparátor + multiplexor 4:1, 3 takty.
- Úplný test v jednom běhu: 8 typů (5 platných + neplatné → 0) × prahy {0, 1, 127, 254, 255} × maxval {255, 77} na rampě
  se všemi 256 hodnotami = 80 kombinací, PASS. Obálka s Otsuovým prahem šedého obrazu (108).
- Mapa registrů 0x10 thresh, 0x18 maxval, 0x20 type – HLS se stejným pořadím argumentů dá stejnou mapu.
- **HLS × VHDL (celá IP):** HLS 122 LUT / 118 FF, VHDL 81 LUT / 141 FF (−34 % LUT, +19 % FF – VHDL má pipeline 3 takty
  + skid buffery, HLS 2 takty). Obojí limituje šířka pulzu (2,78 ns), logika má rezervu přes 2 ns.
- HLS volání = řádek: cosim 71 taktů na řádek 64 px, tj. ~7 taktů režie na řádek (u 1920 px 0,4 %). VHDL běží bez přestávek.
- HLS převedeno z `DP/Vitis/hls_threshold` (3 typy, maxval pevně 255, čítač width × height) do `DP/hls/threshold`.

Zdroj: `DP/vhdl/results/vhdl_results.csv` (`threshold_*`), log `~/logs/vhdl_threshold.log`.

---

## 9. Metodika Fmax: RTL z HLS stejným OOC postupem jako VHDL (19. 10. 2026)

Konfigurace: RTL vygenerované Vitis HLS (`hls/impl/ip/hdl/verilog`) prohnané `DP/hls/scripts/ooc_impl_hls.tcl` – stejné
příkazy, cíl 5 ns a reporty jako `DP/vhdl/scripts/ooc_impl.tcl`. Perioda = max(5 − WNS, 5 − WPWS) jako u VHDL.
BRAM v dlaždicích 36 Kb (export HLS hlásí BRAM18 → přepočteno /2).

| jádro | LUT export / OOC | FF export / OOC | BRAM36 | perioda export HLS | perioda OOC | limit OOC |
|---|---|---|---|---|---|---|
| `hls_csc_rgb` | 407 / 408 | 385 / 493 | 0 | 3,85 ns | 3,92 ns | logika |
| `hls_histogram` | 302 / 300 | 422 / 422 | 1 | **2,73 ns** | **3,08 ns** | šířka pulzu BRAM |
| `hls_median` | 768 / 740 | 472 / 472 | 2 | 4,06 ns | 3,90 ns | logika |
| `hls_filter2d_3x3` | 655 / 640 | 621 / 621 | 2 | 3,92 ns | 4,05 ns | logika |
| `hls_filter2d_5x5` | 959 / 950 | 863 / 861 | 5 | 4,17 ns | 4,49 ns | logika |
| `hls_filter2d_7x7` | 1306 / 1341 | 1244 / 1247 | 7 | 4,37 ns | 4,35 ns | logika |

**Poznatky**
- **Prostředky sedí** (±3 % LUT, FF shodně) – kromě FF u CSC (+108 FF v OOC; export HLS zřejmě pouští jiné opt_design/
  phys_opt nastavení, ověřit v `impl/verilog/*.tcl`). Do tabulek DP tedy lze brát kterékoli, ale **jednotně**.
- **Perioda se liší až o 0,35 ns:** u histogramu export HLS hlásí 2,73 ns (366 MHz), ale BRAM má minimální šířku pulzu
  hodin 3,077 ns → reálné maximum je 325 MHz, stejně jako u VHDL. U logických cest je rozdíl ±0,3 ns = rozptyl P&R.
- **Rozhodnutí (návrh pro dr. Rozkovce):** v DP srovnávat HLS × VHDL na číslech z **jednoho OOC skriptu** (sloupec OOC),
  export HLS uvést jen jako „co hlásí nástroj“. Odstraní to otevřený bod metodiky z plánu.

Zdroj: `DP/hls/results/hls_ooc_results.csv` (OOC), `DP/hls/results/hls_results.csv` (export), log `~/logs/hls_ooc.log`.

## 10. Měřicí aplikace – velikost programu podle úrovně optimalizace (22. 10. 2026)

Konfigurace: bare-metal A53 (`DP/sw/harness_app`, Vitis 2025.2, toolchain `aarch64-none-elf`), build `build_app.py O0 O2 O3`,
commit 2f2a5fd. Velikosti z `aarch64-none-elf-size` (bajty).

| úroveň | text | data | bss | ELF na disku |
|---|---|---|---|---|
| -O0 | 103 296 | 3 164 | 22 831 916 | 403 512 |
| -O2 |  96 740 | 3 164 | 22 832 020 | 432 504 |
| -O3 |  98 332 | 3 164 | 22 831 972 | 439 328 |

**Poznatky**
- `bss` ≈ 22,8 MB tvoří statické snímkové buffery (`g_input`, `g_hw_output`, `g_golden`, `g_gray`, `g_gray_result`) pro
  maximální rozlišení – leží v DDR, do ELF se neukládají.
- Kód je malý (97–103 kB); -O3 je o 1,6 kB větší než -O2 (rozbalování smyček). Rozdíl velikosti ELF na disku dělají
  ladicí informace, ne kód.
- Varování v logu pocházejí jen ze zdrojů BSP od AMD (`xbasic_types.h` deprecated, `psu_init.c` redefinice) – vlastní kód
  je bez varování.

Zdroj: `~/logs/sw_app.log`, `~/logs/sw_app_steps/01.log`, ELF v `DP/sw/build/workspace/harness_app_O*/build/`.

## 11. RGB ↔ HSV – HLS × VHDL (22. 10. 2026)

Konfigurace: xck26-sfvc784-2LV-c, cíl 5 ns, **stejný OOC skript** pro RTL z HLS i VHDL (perioda = max(5 − WNS, 5 − WPWS),
viz sekce 9). HLS jádra `DP/hls/hsv` (commit 9be3bee), obě s AXI4-Lite řízením (jen ap_ctrl) → srovnávat s `hsv_axil`.
Ověření HLS: C-sim **úplný test 2^24 vstupů v obou směrech** (0 chyb, ~4,5 min), cosim vzor + rozmítání 6 × 256 × 256 PASS.

| varianta | stupně pipeline | LUT | FF | DSP | BRAM36 | LUTRAM | perioda | limit |
|---|---|---|---|---|---|---|---|---|
| HLS `hls_rgb2hsv` | 7 | 249 | 200 | 2 | 1 | 11 | 4,16 ns | logika |
| VHDL `hsv_axil` RGB→HSV | 8 | 275 | 255 | 2 | 0 | 10 | 3,26 ns | šířka pulzu DSP |
| HLS `hls_hsv2rgb` | 6 | 567 | 266 | 1 | 0 | 14 | 4,00 ns | logika |
| VHDL `hsv_axil` HSV→RGB | 13 | 603 | 422 | 1 | 0 | 38 | 3,54 ns | logika |
| VHDL `hsv2rgb_core` `G_USE_DSP = true` (bez AXI4-Lite) | 13 | 158 | 184 | 11 | 0 | 46 | 3,26 ns | šířka pulzu DSP |

Stupně pipeline: HLS = `iter_latency` z reportu syntézy, VHDL = návrh. Prostředky VHDL z `DP/vhdl/results/vhdl_results.csv`
(sekce 3 a 5). LUTRAM = posuvné registry a skid buffery (SRL), tabulky ROM v LUT jsou ve sloupci LUT.

**Poznatky**
- **HLS je o něco menší, VHDL je rychlejší.** RGB→HSV: HLS −9 % LUT, −22 % FF, ale perioda 4,16 ns proti 3,26 ns
  (240 proti 307 MHz). HSV→RGB: HLS −6 % LUT, −37 % FF, perioda 4,00 proti 3,54 ns. Příčina je stejná: HLS vkládá
  registry jen tolik, aby splnil zadaných 5 ns (6–7 stupňů), VHDL má registr za každou operací (8 a 13 stupňů).
  Méně registrů = méně FF, ale delší logika mezi nimi.
- **Tabulky převrácených hodnot:** HLS dal jednu z tabulek do BRAM (1 blok), druhou a VHDL obě do LUT. Pro DP: příklad, že
  HLS volí paměť sám podle velikosti pole (256 × 32 b deklarovaný typ `int32_t`), VHDL má šířku tabulky ze vzorce (20 a 17 b).
  Úspora by šla v HLS vynutit typem s menší šířkou nebo pragmou `BIND_STORAGE`.
- **HSV→RGB a `G_USE_DSP`:** HLS (bez vynucení) i výchozí VHDL dávají malá násobení 8 × 8 b do LUT (~570–600 LUT, 1 DSP).
  Vynucení DSP ve VHDL dá 158 LUT za 11 DSP. Rozhodnutí o výchozím `G_USE_DSP` je na Karlovi (zatím `false` kvůli
  srovnatelnosti s HLS).
- Odhad syntézy HLS (`est_*`) se od OOC liší výrazně: hsv2rgb odhad 882 LUT proti 567 po implementaci, rgb2hsv 505 proti 249.
  Do tabulek DP jen čísla po implementaci.

Zdroj: `DP/hls/results/hls_ooc_results.csv`, `DP/hls/results/hls_results.csv`, log `~/logs/hls_hsv.log`.

## 12. Testovací řetězec – všechna jádra (22. 10. 2026)

Konfigurace: `DP/hw/harness/build_harness.tcl 200`, KV260, 200 MHz, commit 3639f04. Oproti 19. 10. přibyla HLS jádra
RGB→HSV a HSV→RGB (všech 14 jader řetězce je teď v bitstreamu).

| stav | WNS | WHS | LUT | FF | BRAM36 | DSP |
|---|---|---|---|---|---|---|
| 19. 10. (bez HLS HSV) | +0,58 ns | – | 13,3 tis. | 17,5 tis. | 15 | – |
| 22. 10. (kompletní) | **+0,104 ns** | +0,010 ns | 14 024 (12,0 %) | 18 062 (7,7 %) | 16 (11,1 %) | 64 (5,1 %) |

**Poznatky**
- Časování při 200 MHz je splněné, ale rezerva klesla na 0,1 ns. **Kritická cesta je uvnitř HLS `hls_hsv2rgb`**:
  `fraction_reg` → násobička `mul_8ns_8ns_16` (S · f, resp. S · (255 − f)), kterou Vivado sbalil do DSP včetně
  předsčítačky (`_psdsp`) bez vnitřních registrů – 12 úrovní (z toho 9 uvnitř DSP), 4,79 ns, logika 73 %. Tři nejhorší cesty
  jsou všechny tato násobička. V OOC měla stejná cesta 4,00 ns; v plném návrhu přibylo směrování a rozmístění.
- Pro DP: názorný příklad, že HLS při cíli 5 ns dá mezi registry tolik logiky, kolik se do periody vejde, a v hustém návrhu
  pak rezerva mizí; VHDL verze (registr za každou operací) v řetězci kritickou cestu netvoří. Náprava v HLS (jen pokud by bylo
  potřeba): `BIND_OP ... op=mul impl=dsp latency=2` nebo přísnější cíl hodin – obojí mění srovnání při 5 ns, proto zatím ne.
- Měřicí aplikace se s novou `harness_map.h` přeložila (-O0/-O2/-O3).

Zdroj: `DP/hw/build/harness/{timing,utilization}.rpt` na Ababelu, log `~/logs/hls_hsv.log` kroky 8–10.

## 13. HSV → RGB: jeden parametr – násobení v LUT nebo v DSP, VHDL × HLS (23. 10. 2026)

Konfigurace: stejný OOC skript, cíl 5 ns, obě varianty s AXI4-Lite řízením. Parametr:
VHDL generikum `G_USE_DSP` (`hsv_axil` → `hsv2rgb_core`, atribut `use_dsp = "yes"`),
HLS makro `HSV_MUL_IMPL_DSP` (`BIND_OP op=mul impl=dsp` na pět násobení 8 × 8 b, `hls_config_hsv2rgb_dsp.cfg`).
Ověření: VHDL xsim obálky s oběma hodnotami PASS; HLS varianta s DSP C-sim úplný test 2^24 PASS, cosim PASS (commit d0ebd60).

| varianta | parametr | LUT | FF | DSP | perioda | limit |
|---|---|---|---|---|---|---|
| VHDL `hsv_axil` HSV→RGB | `G_USE_DSP = false` | 603 | 422 | 1 | 3,54 ns | logika |
| VHDL `hsv_axil` HSV→RGB | `G_USE_DSP = true` | **203** | **235** | 11 | **3,26 ns** | šířka pulzu DSP |
| HLS `hls_hsv2rgb` | výchozí | 567 | 266 | 1 | 3,97 ns | logika |
| HLS `hls_hsv2rgb_dsp` | `HSV_MUL_IMPL_DSP = 1` | **237** | **211** | 11 | 4,35 ns | logika |
| HLS `hls_hsv2rgb_dsp_lat` | `HSV_MUL_IMPL_DSP = 2` (+ `latency=3`) | 265 | 224 | 6 | **3,26 ns** | šířka pulzu DSP |

**Poznatky**
- **VHDL: jeden parametr zlepší všechno kromě počtu DSP** – LUT −66 %, FF −44 %, perioda 3,54 → 3,26 ns (strop daný
  šířkou pulzu DSP48E2), za 10 DSP navíc (0,8 % z 1 248 na KV260). Pipeline je v návrhu, registry se přesunou do
  registrů A/B/M/P uvnitř DSP.
- **HLS: plocha klesne podobně (LUT −58 %, FF −21 %), ale perioda se zhorší** z 3,97 na 4,35 ns. HLS ponechal počet
  stupňů pipeline (6) a DSP použil jako kombinační násobičku – vnitřní registry DSP nevyužil. VHDL má registr za každou
  operací, takže syntéza je do DSP sbalit může.
- **HLS s latencí násobení (`BIND_OP ... impl=dsp latency=3`, 23. 10.) dosáhne stejné periody jako VHDL:** 3,26 ns
  (strop DSP), 265 LUT, 224 FF, jen 6 DSP (HLS spojil část násobení do jednoho bloku). Cena: pipeline se prodloužila
  z 6 na 10 stupňů (latence pixelu, propustnost 1 px/takt zůstává). C-sim i cosim PASS.
  **Závěr pro DP:** ve VHDL stačí jeden parametr (`G_USE_DSP`), protože pipeline je navržená ručně; v HLS jsou potřeba
  dva (implementace a latence násobení) a vývojář musí vědět, že druhý existuje. Výsledek je pak srovnatelný
  (VHDL 203 LUT / 11 DSP, HLS 265 LUT / 6 DSP, obojí 3,26 ns).
- HLS výchozí varianta po pojmenování součinů v kódu: 567 LUT, 266 FF jako dřív, perioda 3,97 proti 4,00 ns
  (rozptyl rozmístění) – úprava kódu výsledek nezměnila.
- Export HLS (`impl_*` v `hls_results.csv`) hlásí u varianty s DSP jen 6 DSP a 295 LUT; OOC stejného RTL dal 11 DSP.
  Do DP čísla z jednoho OOC skriptu (sekce 9).
- Pro DP: přímá ukázka, že stejný algoritmus se dá jedním parametrem přesunout mezi prostředky (LUT ↔ DSP) a že ve
  VHDL se tím zlepší i frekvence, protože pipeline je navržená ručně.

Zdroj: `DP/vhdl/results/vhdl_results.csv`, `DP/hls/results/hls_ooc_results.csv`, `DP/hls/results/hls_results.csv`,
logy `~/logs/hsv_dsp.log`, `~/logs/hsv_dsp_finish.log`.

## 14. VHDL po úklidu varování Sigasi – srovnání před a po (23. 10. 2026)

Konfigurace: OOC všech 28 konfigurací z `DP/vhdl/scripts/ooc_all.txt` (4 paralelně), commit 83e0b93 (úklid d596cef:
mrtvé registry `d_bin`/`d_write` v `histogram_core`, nepoužitý `regs` v `hsv_axil`, `ro_in` v `csc_axil`/`threshold_axil`,
`addr_value` jako constant v `axil_regbank`). Xsim regrese 15 TB PASS lokálně (Karel). Před = `~/logs/vhdl_results_pre_lint.csv`.

- **25 z 28 konfigurací beze změny** (LUT, FF, DSP, BRAM i perioda totožné) – odstraněné registry a signály syntéza
  odstraňovala už dřív.
- Změnily se jen obálky s AXI4-Lite, které obsahují `axil_regbank`:

| konfigurace | LUT před → po | perioda před → po |
|---|---|---|
| `filter2d_axil` K = 3 | 1 282 → 1 283 | 4,37 → **3,40 ns** |
| `filter2d_axil` K = 3, `G_USE_DSP` | 506 → 508 | 3,81 → 3,57 ns |
| `median_axil` | 692 → 692 | 4,07 → 3,86 ns |

- Prostředky se prakticky nezměnily, perioda se zlepšila. Logická změna v registrové bance je jen `variable` → `constant`
  (stejný obvod), takže rozdíl připisuji jinému rozmístění a propojení po změně síťového seznamu (rozptyl P&R),
  ne lepšímu obvodu. Pro DP: nové hodnoty jsou platné (stejný skript), ale rozdíl ±0,2–1 ns u obálek s registrovou bankou
  ukazuje, jak velký je rozptyl implementace. `filter2d_axil` K = 3 bez DSP: kritickou cestu ověřit v `timing.rpt`.

Zdroj: `DP/vhdl/results/vhdl_results.csv` (po), `~/logs/vhdl_results_pre_lint.csv` (před), log `~/logs/vhdl_ooc_lint_hls_lat.log`.

## 15. Zpětný převod YCbCr → RGB na jádrech CSC (23. 10. 2026)

Konfigurace: nové předvolby 6–8 (`ycbcr_to_rgb_bt601_full`, `_bt601_studio`, `_bt709_studio`), matice = inverze dopředné
matice téhož standardu (Kr, Kb), **HW beze změny** – celočíselný offset 10 b (rozhodnutí Karla). Commit c13eb9b.

| ověření | výsledek |
|---|---|
| model proti `cv::cvtColor(COLOR_YCrCb2RGB)`, BT.601 full, všech 2^24 vstupů | max. odchylka 1, liší se 25,5 % složek (12 829 468 z 50 331 648) |
| návrat RGB → YCbCr → RGB, 2^24 barev (BT.601 full / 601 studio / 709 studio) | max. odchylka 2 u všech tří |
| unit testy `test_imgproc` | 124/124 (černá a bílá přesně, šedá 128 ve studio BT.601 → 129) |
| VHDL xsim `tb_csc` + `tb_csc_axil`, předvolby 0–8 | 18/18 PASS |
| HLS C-sim (všechny předvolby a top funkce) + cosim `hls_csc_rgb` | PASS |

**Poznatky**
- Koeficienty inverze až 2,11 (BT.709 studio, Cb → B), offsety −289 až 136 – vejdou se do Q2.15 a 10 b, jádra ani mapa
  registrů se nemění. Zpětný převod je jen jiná sada koeficientů pro stejné IP.
- Příčina odchylky: konstantní člen inverze (např. −179,4 u R v BT.601) se zaokrouhlí na celé číslo; OpenCV navíc počítá
  se zaokrouhlenými koeficienty 1,403 / 1,773. Odchylka je stejného řádu jako kvantizace na 8 bitů (1 úroveň z 256).
  Bitovou shodu by dal offset s 15 zlomkovými bity (registr 26 b) – kompromis přesnost × velikost HW zvolen ve prospěch
  jednotného jádra.
- Pro DP: formulovat jako „HW aproximace s odchylkou nejvýš 1 úrovně“, ne jako shodu s OpenCV.

Zdroj: `make verify` (DP/model, lokálně), log `~/logs/csc_inverse.log`.


## 16. Test na desce KV260 – první úspěšné měření, SW -O2 (25. 10. 2026)

Konfigurace: bitstream testovacího řetězce z 22. 10. (200 MHz), 1080p RGB 24 b, 10 snímků × 5 měření (medián), SW golden
`lib_imgproc` na Cortex-A53, -O2. Výstup aplikace přes JTAG (DCC), UART v platformě není povolený.

| jádro | HW HLS [µs/snímek] | HW VHDL [µs/snímek] | fps | SW A53 -O2 [µs] | zrychlení HW/SW | shoda s golden |
| --- | --- | --- | --- | --- | --- | --- |
| bypass RGB (strop řetězce) | – | 10 368 | 96,4 | 2 706 | – | PASS |
| bypass šedá | – | 10 368 | 96,4 | 889 | – | PASS |
| CSC RGB→YCbCr | **FAIL** | 10 368 | 96,4 | 273 689 | 26× | VHDL PASS |
| RGB→HSV | **FAIL** | 10 368 | 96,4 | 182 113 | 18× | VHDL PASS |
| HSV→RGB | **FAIL** | 10 368 | 96,4 | 115 842 | 11× | VHDL PASS |
| prahování (Otsu) | 10 368 | 10 368 | 96,4 | 57 865 | 5,6× | PASS |
| medián 3×3 | 10 383 | 10 383 | 96,3 | 550 250 | 53× | PASS |
| Sobel X 3×3 | 10 383 | 10 383 | 96,3 | 567 395 | 55× | PASS |
| histogram | 10 370 | 10 369 | 96,4 | 35 215 | 3,4× | PASS |

**Poznatky**
- Všechna jádra, která prošla, jsou bitově shodná s golden modelem (0 chybných bajtů) a běží na stropu řetězce: 1 pixel
  za takt při 200 MHz je 1920 × 1080 / 200 MHz = 10,368 ms. Okénková jádra přidávají jen latenci řádků (+15 µs).
  HLS a VHDL se v propustnosti neliší, rozdíl je v prostředcích a Fmax (kapitola Výsledky v README).
- Tři HLS jádra s řádkovým voláním (CSC, RGB→HSV, HSV→RGB) selhala: S2MM hlásí `DMAIntErr` + `EOLLateErr`
  (DMASR 0x14810), tedy TLAST přichází později, než odpovídá šířce řádku. Samotná data protékají. Příčina zatím neznámá.
  VHDL varianty stejných algoritmů procházejí, stejně jako HLS jádra volaná na celý snímek.
- Postup ladění a poučení: S2MM hlásí dokončení snímku až s SOF dalšího, doba snímku se proto bere z odstupu příznaků
  (`harness_hw.c`); `FrameCntEn` na S2MM nepoužívat. UART v hardwaru povolit (`PSU__UART1`), do té doby DCC přes xsdb.

Zdroj: `DP/results/deska/deska_2026-10-25_1924_O2.csv`, `uart_2026-10-25_1924_O2.txt`.

## 17. Řádková HLS jádra bez auto-rewind – všech 16 měření na desce PASS (25. 10. 2026)

Konfigurace: stejný řetězec jako v sekci 16 (200 MHz, 1080p RGB 24 b, SW -O2), HLS jádra CSC, RGB→HSV a HSV→RGB znovu
vysyntetizovaná s `syn.compile.enable_auto_rewind=0`; měření: MM2S se čte po 2 ms, doba snímku = start až zastavení MM2S,
50 snímků na měření.

| jádro | HW HLS [µs/snímek] | HW VHDL [µs/snímek] | shoda s golden |
| --- | --- | --- | --- |
| bypass RGB / šedá | – | 10 401 | PASS |
| CSC RGB→YCbCr | 10 401 | 10 401 | PASS (HLS i VHDL) |
| RGB→HSV | 10 441 | 10 401 | PASS |
| HSV→RGB | 10 441 | 10 401 | PASS |
| prahování, medián 3×3, Sobel X, histogram | 10 401 | 10 401 | PASS |

**Příčina selhání (sekce 16)**
- Řádková HLS jádra (jedno volání = jeden řádek až do TLAST, II=1, auto-restart) přeložil Vitis HLS jako „loop auto-rewind stp“.
  U smyček s latencí iterace větší než 2 (CSC 5, RGB→HSV 7, HSV→RGB 6 taktů) po přečtení beatu s TLAST hned začne čekat
  další iterace na vstup a pipeline se zastaví. **Posledních 3 až 4 pixely řádku včetně TLAST zůstanou v jádře, dokud nepřijde
  první pixel dalšího řádku.** Mezera mezi snímky (blanking, kterou dělá MM2S) se tak v jádře ztratí, S2MM dostane TLAST
  posledního řádku těsně před SOF dalšího snímku a hlásí SOFLateErr + DMAIntErr (DMASR 0x15810). Prahování má také auto-rewind,
  ale s latencí 2 a čte i zapisuje ve stejné fázi, proto neselhávalo.
- Ocas posledního snímku v běhu zůstal v jádře napořád (hw_core_stop ho nevyprázdní) a přenášel se do dalšího běhu.
- Důkaz v simulaci: xsim testbench řádkového jádra (bubliny, zpětný tlak, čtení AP_CTRL, mezera 300 taktů před snímkem) na RTL
  z 22. 10. držel ocas 305 taktů a po posledním snímku zůstaly v jádře 3 beaty; po vypnutí rewind je ocas 4 až 8 taktů a
  po posledním snímku nic nezůstane (PASS). Cosim CSC prošel, funkce jádra beze změny.
- Proč chybu odhalovalo čtení registrů z procesoru: jádro, VDMA ani přepínač nejsou chybné; s mezerou mezi TLAST a SOF
  kratší než zpracování konce snímku v S2MM jde o závod, jehož výsledek závisí na časování. Procesor zastavený po startu
  přenosu chybu neukázal, čtení kteréhokoli registru AXI-Lite (VDMA, přepínač, jádro) ve smyčce ano, a to jen u HLS
  řádkových jader (bypass a VHDL ne). **Přesný mechanismus, jak čtení registrů časování ovlivní, není ověřený.**

**Poznatky**
- Cena opravy: ~5 taktů mezi řádky (≈ 27 µs na snímek, 0,26 %). Naměřený rozdíl 10 441 proti 10 401 µs u HSV je o jeden krok
  měření (2 ms / 50 snímků = 40 µs), nelze ho přisoudit jádru; ostatní HLS i VHDL jsou na stropu řetězce 1 px/takt.
- Poučení: u řádkových HLS jader kontrolovat v csynth reportu typ smyčky; „auto-rewind stp“ s latencí > 2 držet pryč;
  testovat s mezerou mezi snímky a se zpětným tlakem, ne jen s plynulým proudem (cosim to neodhalí).
- U ostatních jader se auto-rewind nenastavovalo (prahování, medián, filtr, histogram procházejí).

Zdroj: `DP/results/deska/` (běh 25. 10. 22:0x, SW -O2), xsim testbench `tb_row_core_tail.sv`.

## 18. Test na desce KV260 – SW na A53 při -O0, -O2, -O3 × HW (25. 10. 2026)

Konfigurace: stejný bitstream a aplikace jako v sekci 17 (200 MHz, 1080p RGB 24 b, 50 snímků × 5 měření HW, SW medián z 10 běhů),
přeloženo -O0 / -O2 / -O3. Všech 16 měření na všech třech úrovních PASS (0 chybných bajtů, status 0). HW čas je na všech
úrovních stejný (10 401 µs, HLS HSV 10 441 µs = jeden krok měření), mění se jen SW.

| algoritmus | SW -O0 [ms] | SW -O2 [ms] | SW -O3 [ms] | HW [ms] | zrychlení HW/SW -O0 | -O2 | -O3 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| převod barev RGB→YCbCr | 1 147,7 | 278,0 | 228,7 | 10,40 | 110× | 27× | 22× |
| RGB→HSV | 544,5 | 182,1 | 182,1 | 10,40 | 52× | 18× | 18× |
| HSV→RGB | 521,6 | 115,9 | 115,9 | 10,40 | 50× | 11× | 11× |
| prahování (Otsu) | 206,9 | 57,9 | 43,4 | 10,40 | 20× | 5,6× | 4,2× |
| medián 3×3 | 2 734,5 | 549,9 | 561,0 | 10,40 | 263× | 53× | 54× |
| Sobel X 3×3 | 2 334,1 | 567,4 | 538,5 | 10,40 | 224× | 55× | 52× |
| histogram | 91,1 | 35,2 | 35,1 | 10,40 | 8,8× | 3,4× | 3,4× |

**Poznatky**
- HW čas nezávisí na algoritmu ani na implementaci (HLS × VHDL): všechna jádra běží na stropu řetězce 1 px/takt při
  200 MHz (1920 × 1080 / 200 MHz = 10,368 ms). Propustnost řetězce tedy nerozlišuje HLS a VHDL; rozdíl je v prostředcích a Fmax.
- Optimalizace překladače pomáhá SW hodně z -O0 na -O2 (2× až 5×), z -O2 na -O3 už jen u převodu barev (−18 %) a prahování
  (−25 %); u mediánu je -O3 mírně horší (+2 %). Do DP uvádět HW/SW poměr vůči -O2 jako rozumnou výchozí volbu a -O3 jako nejlepší SW.
- Nejmenší zrychlení má histogram (3,4×): SW je jeden průchod s přičtením do koše, HW je omezený propustností 1 px/takt.
  Největší má medián (53×) a Sobel (55×), kde SW počítá na každý pixel okénko 3×3.
- Čísla SW mají na A53 bare-metal (cache zapnutá, bez OS) řádově stejnou nejistotu jako medián z 10 běhů (rozdíly mezi
  úrovněmi přes 1 % jsou reálné, pod 1 % ne).

Zdroj: `DP/results/deska/deska_2026-10-25_2204_O2.csv`, `…_2212_O0.csv`, `…_2216_O3.csv`.

## 19. Test na desce – UART výstup a zpřesněné měření HW času (25. 10. 2026)

Změny oproti sekci 18: PS UART1 povolený v hardwaru (výstup aplikace přes FTDI/COM místo JTAG DCC), `hw_vdma_run` čte stav MM2S
po 100 µs místo 2 ms a měří 20 snímků místo 50. SW -O2, bitstream 200 MHz, všech 16 měření PASS (0 chybných bajtů).

| jádro | HW HLS [µs/snímek] | HW VHDL [µs/snímek] | rozdíl HLS − VHDL |
| --- | --- | --- | --- |
| bypass RGB / šedá (strop řetězce) | – | 10 371 | – |
| CSC RGB→YCbCr | 10 401 | 10 371 | +30 µs |
| RGB→HSV | 10 411 | 10 371 | +40 µs |
| HSV→RGB | 10 406 | 10 371 | +35 µs |
| prahování, histogram | 10 371 | 10 371 | 0 |
| medián 3×3, Sobel X 3×3 | 10 386 | 10 386 | 0 |

**Poznatky**
- Teoretický strop 1 px/takt při 200 MHz je 10 368 µs; naměřených 10 371 µs je o 0,03 % víc (krok čtení 100 µs / 20 snímků = 5 µs na snímek).
  Zpřesnění proti sekci 17 (krok 40 µs) je dost, aby bylo vidět, co stojí vypnutí auto-rewind u řádkových HLS jader:
  CSC +30 µs ≈ 5 taktů × 1080 řádků (27 µs), RGB→HSV a HSV→RGB +35 až +40 µs (delší latence smyčky). VHDL jádra, prahování,
  medián, Sobel a histogram nemají žádný rozdíl; okénková jádra mají +15 µs oproti bypassu (latence dvou řádků).
- Čtení stavu MM2S po 100 µs HLS jádra nerozbije (po vypnutí auto-rewind); stejný přístup dříve u HLS CSC selhával.
- Pro tabulky v DP se používají hodnoty z tohoto běhu (nebo opakovat tři běhy a brát medián), protože jsou nejpřesnější.

Zdroj: `DP/results/deska/deska_2026-10-25_22*_O2.csv` (poslední běh s UART), skript `board_test.bat -Levels O2` (výchozí UART, `-Dcc` záloha).

## 20. Souhrn pro kapitolu 6 – běh 25. 10. 22:43 (UART), SW -O0 / -O2 / -O3 × HW (13. 11. 2026)

Konfigurace: stejný bitstream a aplikace jako v sekci 19 (200 MHz, 1080p RGB 24 b, HW 20 snímků, čtení stavu MM2S po 100 µs,
SW medián z 10 běhů na A53 1333 MHz bare-metal), jeden běh `board_test` pro každou úroveň -O0, -O2, -O3. Všech 48 měření PASS
(0 chybných bajtů / košů). Tabulky generuje `doc/tools/tabulky_06.py` z CSV a vkládá je do `doc/kapitoly/06_vysledky_a_srovnani.md`;
nahrazují sekci 18 (ta byla z běhu s krokem měření 40 µs).

**Doba snímku na desce (-O2; -O0 a -O3 se liší nejvýš o 1 µs)**

| Algoritmus | HLS [µs] | VHDL [µs] | HLS [snímků/s] | VHDL [snímků/s] | Proti průchodu HLS / VHDL [µs] |
| --- | --- | --- | --- | --- | --- |
| průchod RGB | – | 10 371 | – | 96,4 | 0 |
| průchod šedá | – | 10 371 | – | 96,4 | 0 |
| převod barev RGB→YCbCr | 10 401 | 10 371 | 96,1 | 96,4 | +30 / 0 |
| RGB→HSV | 10 412 | 10 371 | 96,0 | 96,4 | +41 / 0 |
| HSV→RGB | 10 407 | 10 371 | 96,0 | 96,4 | +36 / 0 |
| prahování (Otsu) | 10 371 | 10 371 | 96,4 | 96,4 | 0 / 0 |
| medián 3×3 | 10 386 | 10 386 | 96,2 | 96,2 | +15 / +15 |
| Sobel X 3×3 | 10 386 | 10 386 | 96,2 | 96,2 | +15 / +15 |
| histogram | 10 371 | 10 371 | 96,4 | 96,4 | 0 / 0 |

**SW × HW (HW = VHDL; HLS pomalejší nejvýš o 0,4 %, poměr se na uvedenou přesnost nemění)**

| Algoritmus | SW -O0 [ms] | SW -O2 [ms] | SW -O3 [ms] | HW [ms] | SW/HW -O0 | -O2 | -O3 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| převod barev RGB→YCbCr | 1 147,7 | 278,0 | 228,7 | 10,37 | 111× | 27× | 22× |
| RGB→HSV | 544,5 | 182,1 | 182,1 | 10,37 | 52× | 18× | 18× |
| HSV→RGB | 521,6 | 115,8 | 115,8 | 10,37 | 50× | 11× | 11× |
| prahování (Otsu) | 206,9 | 57,9 | 43,4 | 10,37 | 20× | 5,6× | 4,2× |
| medián 3×3 | 2 728,1 | 549,9 | 561,1 | 10,39 | 263× | 53× | 54× |
| Sobel X 3×3 | 2 334,1 | 567,4 | 538,5 | 10,39 | 225× | 55× | 52× |
| histogram | 91,1 | 35,2 | 35,1 | 10,37 | 8,8× | 3,4× | 3,4× |

**Vliv optimalizace překladače**

| Algoritmus | Zrychlení -O0 → -O2 | Změna -O2 → -O3 |
| --- | --- | --- |
| převod barev RGB→YCbCr | 4,1× | −17,7 % |
| RGB→HSV | 3,0× | 0,0 % |
| HSV→RGB | 4,5× | 0,0 % |
| prahování (Otsu) | 3,6× | −25,0 % |
| medián 3×3 | 5,0× | +2,0 % |
| Sobel X 3×3 | 4,1× | −5,1 % |
| histogram | 2,6× | −0,1 % |

**Poznatky**
- Oproti sekci 18 se změnil jen HW čas (10,37 místo 10,40 ms, přesnější měření), a tím poměr SW/HW u převodu barev při -O0
  (111× místo 110×) a u Sobela při -O0 (225× místo 224×). HSV→RGB při -O2 je 115,8 ms (sekce 18: 115,9 ms z jiného běhu).
- -O2 → -O3 pomáhá převodu barev (−17,7 %), prahování (−25,0 %) a také Sobelovi (−5,1 %, v sekci 18 nezmíněno); medián +2,0 %.
- -O0 → -O2 zrychlí SW 2,6× (histogram) až 5,0× (medián).

Zdroj: `DP/results/deska/deska_2026-10-25_2243_O{0,2,3}.csv`, `uart_2026-10-25_2243_O*.txt`.

## 21. Řádková HLS jádra bez auto-rewind – OOC a kosimulace (16. 11. 2026)

Konfigurace: fronta `final_hls_rows` (commit ad92eb0, 13:45–14:07), syntéza HLS převodu barev a všech variant RGB↔HSV
s `syn.compile.enable_auto_rewind=0` (stejné RTL jako v bitstreamu z 25. 10.), kosimulace RGB→HSV a HSV→RGB, OOC stejným
skriptem jako VHDL (sekce 9), cíl 5 ns. V csynth reportu už žádná smyčka nemá auto-rewind; iterační latence beze změny
(CSC 5, RGB→HSV 7, HSV→RGB 6, HSV→RGB DSP 6, s latencí násobení 10). Kosimulace obou směrů PASS (zkrácený test, 0 chyb).

| jádro | LUT před → po | FF před → po | LUTRAM před → po | perioda před → po | limit po |
| --- | --- | --- | --- | --- | --- |
| `hls_csc_rgb` | 408 → 407 | 493 → **361** | 3 → 0 | 3,92 → 3,88 ns | logika |
| `hls_rgb2hsv` | 249 → 249 | 200 → 214 | 11 → 10 | 4,16 → **4,44 ns** | logika |
| `hls_hsv2rgb` | 567 → 556 | 266 → 296 | 14 → 0 | 3,97 → 4,05 ns | logika |
| `hls_hsv2rgb_dsp` | 237 → 224 | 211 → 241 | 14 → 0 | 4,35 → 4,23 ns | logika |
| `hls_hsv2rgb_dsp_lat` | 265 → 262 | 224 → 273 | 30 → 21 | 3,26 → 3,26 ns | šířka pulzu DSP |

**Poznatky**
- Vypnutí auto-rewind nezměnilo počet LUT (±2 %) ani stupně pipeline. U převodů HSV přibylo 14 až 49 FF a ubyly posuvné
  registry v LUTRAM (SRL): řízení smyčky bez rewind drží stav v registrech. U převodu barev naopak ubylo 132 FF.
- Perioda se změnila o −0,12 až +0,28 ns. RGB→HSV 4,44 ns je nejhorší z HLS jader; rozdíl proti VHDL (3,26 ns) se zvětšil.
  Změny do ±0,3 ns jsou v rozptylu rozmístění a propojení (sekce 14), u RGB→HSV je změna na hraně.
- Závěry sekcí 11 a 13 platí dál: HLS menší v LUT a FF u převodů HSV, VHDL kratší perioda; parametr DSP v HLS bez latence
  periodu nezlepší (4,05 → 4,23 ns), s latencí 3 dosáhne stropu DSP 3,26 ns jako VHDL.
- Odhad syntézy HLS u HSV→RGB 893 LUT proti 556 po implementaci (+61 %).
- `hls_results.csv` (export Vitis HLS) se nepřepisoval: fronta nespouštěla `export_impl`, sloupce impl_* řádkových jader
  jsou z RTL s auto-rewind. V DP se používají jen čísla z OOC. Kapitola 6 a README přepočítané (`doc/tools/tabulky_06.py`).

Zdroj: `DP/hls/results/hls_ooc_results.csv` (z `~/logs/hls_ooc_results.csv`), log `~/logs/final_hls_rows.log`.

## 22. Testovací řetězec – finální bitstream: využití, časování, příkon (16. 11. 2026)

Konfigurace: bitstream z 25. 10. 21:34 (fronta `uart_rebuild`, 200 MHz, HLS řádková jádra bez auto-rewind, PS UART1), se kterým
proběhla všechna měření v sekcích 19 a 20. Reporty Vivada staženy z Ababelu do `DP/results/retezec_2026-10-25/`
(`utilization.rpt`, `utilization_hier.rpt`, `timing.rpt`, `power.rpt`, `address_map.txt`).

| | WNS | WHS | WPWS | LUT | FF | BRAM36 | DSP | URAM |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 22. 10. (sekce 12) | +0,104 ns | +0,010 ns | – | 14 024 (12,0 %) | 18 062 (7,7 %) | 16 (11,1 %) | 64 (5,1 %) | – |
| **25. 10. (finální)** | **+0,229 ns** | +0,010 ns | +1,000 ns | 14 006 (12,0 %) | 17 969 (7,7 %) | 16 (11,1 %) | 64 (5,1 %) | 2 (3,1 %) |
| k dispozici (xck26) | | | | 117 120 | 234 240 | 144 | 1 248 | 64 |

Rozdělení po blocích (`utilization_hier.rpt`): 7 jader HLS 2 647 LUT (19 %), 7 jader VHDL 2 525 (18 %), převod na šedou
a zpět 371 (3 %), VDMA 2 973 (21 %), přepínače AXI4-Stream 1 436 (10 %), propojení AXI4-Lite 1 962 (14 %), SmartConnect
do DDR 2 097 (15 %). Jádra dohromady 37 % LUT řetězce. URAM (2) používá jen VDMA.

Kritická cesta: `hls_hsv2rgb/inst/fraction_reg_786_reg[5]` → DSP `biased_1_fu_361_p2` (ALU_OUT), 4,630 ns
(logika 74 %), 11 úrovní, z toho 8 uvnitř DSP48E2 (předsčítačka, násobička, ALU) bez vnitřních registrů.

Odhad příkonu Vivado (report_power, výchozí aktivita): celkem 3,087 W, z toho PS8 2,421 W, statický PL 0,303 W;
PL dynamicky jen asi 0,36 W (signály 0,062 W, BRAM 0,019 W, DSP 0,031 W, MMCM 0,098 W, …). Jde o odhad bez simulované
aktivity, ne o měření.

**Poznatky**
- Využití je prakticky stejné jako 22. 10.; rezerva se zlepšila z 0,104 na 0,229 ns (jiné rozmístění po vypnutí auto-rewind
  a přidání UART). Kritická cesta je stále v násobení jádra `hls_hsv2rgb`.
- **Otevřené:** `hls_hsv2rgb` v řetězci zabírá 232 LUT / 264 FF / 11 DSP, tedy jako varianta `_dsp` (OOC 224 / 241 / 11),
  ne výchozí (OOC 556 / 296 / 1). Všechny tři varianty mají stejné VLNV `xilinx.com:hls:hls_hsv2rgb:1.0` a `build_harness.tcl`
  přidává do katalogu všechny adresáře `hls/build/*/hls/impl/ip`, takže výběr IP není jednoznačný. Druhá možnost: syntéza IP
  v blokovém návrhu mapuje násobení 8 × 8 do DSP sama (sekce 12 z 22. 10., kdy `_dsp` neexistovala, měla kritickou cestu
  také v DSP). Oprava v každém případě: odlišit názvy IP variant (`package.ip.name`) a bitstream přeložit znovu.
- Ostatní jádra v řetězci odpovídají OOC: LUT nejvýš o 8 % méně (histogram HLS 276 proti 300, konvoluce HLS 606 proti 640), FF nejvýš o 5 %, DSP shodně.

Zdroj: `DP/results/retezec_2026-10-25/*.rpt` (Ababel `DP/hw/build/harness`, 25. 10. 21:34).

## 23. Medián 3×3 – zápis třídicí sítě a co odstraní syntéza (17.–19. 11. 2026)

Konfigurace: `median_core` (bez AXI4-Lite), OOC stejným skriptem, cíl 5 ns, běh `2026-11-17_1422_vhdl_median_sit` (commit 842002f,
data v `DP/results/runs/`). Varianty zápisu, výstup ve všech bitově stejný (xsim 12 scénářů PASS):

| zápis sítě | LUT | FF | CARRY8 po syntéze | perioda |
| --- | --- | --- | --- | --- |
| 0: `sort3` jako v modelu (každý výstup vlastní porovnání) | 590 | 433 | 38 | 3,50 ns |
| 1: `sort3` se sdílenými porovnáními (3 na `sort3`) | **557** | 433 | **32** | 3,61 ns |
| 2: jako 1, v E2 a E3 jen použité výstupy (19 porovnání) | 557 | 433 | 32 | 3,61 ns |

**Poznatky**
- Varianta 2 je s variantou 1 totožná ve všech číslech: **syntéza nepoužité výstupy `sort3` odstraní sama**, síť zapsaná jako
  7 × `sort3` (21 porovnání) má v obvodu 19 porovnání (Paethova síť 20). Ověřeno, ne jen předpoklad.
- Sdílení porovnání v `sort3` ušetřilo 33 LUT (−5,6 %) a 6 CARRY8 (každé 8bitové porovnání = 1 CARRY8, zbytek CARRY8 jsou čítače
  v `window_gen`). Původní zápis porovnával `low_ab < c` i `low_ab > c`; kvůli rovnosti je syntéza nesloučí.
- Rozdíl period 0,1 ns je v rozptylu rozmístění a propojení (sekce 14).
- Rozhodnutí (Karel, 19. 11.): `sort3` jen s ostrými porovnáními `>` (sdílenými) v C, HLS i VHDL, commit 118f651; ekvivalence
  se starým `sort3` ověřena na všech 2^24 trojicích (lo, mid, hi). Parametr experimentu odstraněn.

**Nová verze (`sort3` jen přes `>`), běh `2026-11-19_1636_median_porovnani`:** unit testy modelu 124/124, HLS C-sim + kosimulace
PASS (11 scénářů), xsim `tb_median` 15 scénářů + `tb_median_axil` 2 PASS. OOC:

| jádro | LUT před → po | FF | CARRY8 | perioda před → po | kritická cesta po |
| --- | --- | --- | --- | --- | --- |
| VHDL `median_core` | 590 → **549** | 433 | 38 → 32 | 3,50 → 3,66 ns | `window_gen`: příznaky pozice (9 úrovní, 69 % propojení) |
| VHDL `median_axil` | 692 → **643** | 532 | → 33 | 3,86 → **4,31 ns** | `window_gen`: příznaky pozice (9 úrovní, 70 % propojení) |
| HLS `hls_median` | 740 → **701** | 472 | → 34 | 3,90 → 3,99 ns | síť mediánu (`r_mid`, 10 úrovní) |

- LUT klesly u VHDL o 7 % (obálka), u HLS o 5 %; ostré porovnání ušetřilo proti sdílenému z experimentu dalších 8 LUT (549 proti 557).
- Perioda VHDL obálky se zhoršila, ale kritická cesta není v síti mediánu – je v řízení `window_gen`, které se neměnilo; jde o
  rozptyl rozmístění a propojení (obálka s registrovou bankou kolísá 3,86 až 4,31 ns, sekce 14). VHDL tím ztratil u mediánu
  kratší periodu proti HLS (4,31 proti 3,99 ns). Náprava, pokud bude čas: příznaky pozice ve `window_gen` předpočítat o takt dřív
  (pomůže mediánu i konvoluci).
- HLS dává do stupně pipeline víc logiky sítě (kritická cesta je v ní), VHDL má síť rozloženou po taktech.
- Export blokového návrhu: `write_bd_layout` v batch režimu selhává (BD 5-349, potřebuje GUI) → fronta `bd_export` přes xvfb.

## 24. `window_gen` v3 – příznaky pozice bez sčítačky v cestě (19. 11. 2026)

Konfigurace: commit e609616, běh `2026-11-19_1656_vhdl_window_v3` (`DP/results/runs/`), OOC stejným skriptem, cíl 5 ns.
Změna: příznaky pozice x + 1 a y + 1 porovnáním `pos_x` / `pos_y` s konstantami snímku předpočítanými před snímkem;
sloupcové a řádkové příznaky odděleně, výběr další pozice až za porovnáním. Regrese 45 testů xsim PASS (medián 17,
konvoluce 3×3 10, 5×5 a 7×7 12, obálky 3, reset uprostřed snímku K = 3, 5, 7).

| jádro | LUT v2 → v3 | FF v2 → v3 | perioda v2 → v3 | omezení v3 | kritická cesta v3 |
| --- | --- | --- | --- | --- | --- |
| medián `median_core` | 549 → 543 | 433 → 513 | 3,66 → **3,40 ns** | logika | síť mediánu (okno → `rows_sorted`, 6 úrovní) |
| medián `median_axil` | 643 → 602 | 532 → 612 | 4,31 → **3,55 ns** | logika | povolení hodin z výstupního skid bufferu (1 úroveň, 94 % propojení) |
| konvoluce 3×3 jádro, DSP | 350 → 350 | 318 → 398 | 3,55 → **3,26 ns** | šířka pulzu DSP | strom sčítaček v DSP |
| konvoluce 3×3 obálka, DSP | 508 → 506 | 558 → 638 | 3,57 → **3,26 ns** | šířka pulzu DSP | strom sčítaček v DSP |
| konvoluce 5×5 obálka, DSP | 766 → 724 | 951 → 1 044 | 3,76 → **3,26 ns** | šířka pulzu DSP | strom sčítaček v DSP |
| konvoluce 7×7 obálka, DSP | 1 232 → 1 435 | 1 489 → 1 565 | 4,00 → **3,26 ns** | logika (3,263) | povolení hodin DSP z `stage_c.valid` (91 % propojení) |

**Poznatky**
- `window_gen` už kritickou cestu netvoří u žádného jádra. Konvoluce 3×3 a 5×5 jsou na stropu bloku DSP (307 MHz), 7×7 o 1 ps nad ním.
  Medián se zrychlil o 0,26 až 0,76 ns a VHDL má zase kratší periodu než HLS (3,55 proti 3,99 ns).
- Cena: +80 FF (konstanty snímku W − 1, W − 2, H + K − 2 − k … jako registry), LUT u 5 z 6 konfigurací stejně nebo méně.
  Konvoluce 7×7 +203 LUT (+16 %): konstanty H + K − 2 − k pro 7 řádků a porovnání; část může být rozptyl (v1 této obálky měla 1 679 LUT).
- Nové kritické cesty jsou krátké logicky a dlouhé v propojení (rozvod povolení hodin `pipe_enable` / `valid` na velký počet registrů).
  Další krok, pokud bude třeba: duplikovat registr povolení (max_fanout).
- **Ostatní konfigurace z `ooc_all.txt` (konvoluce bez DSP, 5×5 a 7×7 jádra) běžely ještě s v2** → pro konzistentní tabulky
  přepočítat všech 28 konfigurací (v sobotním finálním sestavení, nebo dřív). Do té doby CSV a tabulky kap. 6 beze změny.
