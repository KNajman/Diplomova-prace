# Plán dokončení DP: Implementace vybraných algoritmů zpracování obrazu v hradlovém poli

Stav k 30. 9. 2026 · výsledek grill-me session (Claude jako druhý vedoucí/konzultant)

## Cíl
Do 15. 1. 2027 odevzdat DP (~45 stran), která pokryje všechny 4 body zadání: jednotné HLS × VHDL × SW implementace vybraných algoritmů na KV260, férově změřené a porovnané v jednom testovacím řetězci.

## Průběh
- 22. 10. 2026 (SW měřicí aplikace): fronta `sw_app` (commit 5f631b5) na Ababelu **selhala** – platforma i konfigurace -O0/-O2/-O3 prošly, ale `main.c` a `harness_hw.c` se nepřeložily (`xtime_l.h: No such file or directory`), žádné ELF nevzniklo (velikosti tedy zatím nejsou). Příčina: ve Vitis 2025.2 (SDT) platforma `xtime_l.h` neexportuje, `XTime`, `XTime_GetTime` a `COUNTS_PER_SECOND` jsou v `xiltimer.h`. Oprava: `#include <xiltimer.h>` v obou souborech; před spuštěním ověřeno `-fsyntax-only` s toolchainem aarch64 pro všechny 3 úrovně (bez varování `-Wall -Wextra`). Fronta `sw_app` spuštěna znovu, výsledek a velikosti ELF doplnit po dokončení.
- 19. 10. 2026 (implementační plán dokončen kromě testu na desce): **VHDL histogram** ve dvou architekturách (`G_USE_BRAM`): BRAM + forwarding 2 stupňů 183 LUT / 288 FF / 1 BRAM36 (HLS 302 / 422 / 1, tj. −39 % LUT), 256 čítačů ve FF 6,4 tis. LUT (35×) – ukázka „architektura > jazyk“. **VHDL prahování** (5 typů OpenCV, typ dekódovaný mimo pipeline, 81 LUT, úplný test 80 kombinací). **Konvoluce K5/K7 s mapou jako HLS** (zapisovatelné paměťové okno v `axil_regbank`): K7 1 679 → 1 232 LUT, teď pod HLS (1 306). **Testovací řetězec**: skriptovaný BD (VDMA, AXIS přepínače RGB + šedá větev, 11 jader + bypass, 200 MHz), balení VHDL IP s generovanou obálkou, `harness_map.h`; **měřicí aplikace** (bare-metal, HW HLS/VHDL × SW lib_imgproc, bitová kontrola na desce, CSV). Výsledky `DP/results/vysledky.md` sekce 6–8.
- 15. 10. 2026 (večer, VHDL medián): `window_gen` (společný generátor okna K×K) + `line_buffer` (BRAM) + `median_core`/`median_axil`. xsim 17 testů PASS (rozměry, okraje, poruchy, AXI4-Lite). OOC: 631 LUT / 538 FF / 2 BRAM36 / 3,80 ns vs. HLS 768 LUT / 472 FF / 4 BRAM18 / 4,06 ns. K optimalizaci: příznaky pozice v `window_gen` předpočítat o takt dřív (kritická cesta v řízení).
- 15. 10. 2026 (večer, VHDL HSV): `rgb2hsv_core` (8 taktů, 237 LUT / 2 DSP / 3,26 ns), `hsv2rgb_core` (13 taktů, 564 LUT / 1 DSP / 3,33 ns), obálka `hsv_axil`. Úplný test 2^24 v obou směrech PASS. Oprava `imgproc_cli` (HSV vstup PPM). Šablony příkazů pro Ababel (`.claude/scripts/ababel.sh`, `DP/scripts/queues/*.queue`). Deník výsledků `DP/results/vysledky.md`.
- 15. 10. 2026 (večer, optimalizace CSC): v2 = sekvenční zpracování v pipeline DSP + šířky vzorcem + `G_REG_W` (jen platné bity), v3 = pipelinované dekódování adres v regbank (porovnání s konstantami, bez aritmetiky). Samopopisné názvy v celém VHDL. OOC 3→3: v1 325 LUT/558 FF/12 DSP/3,70 ns → v2 257/346/9/3,75 → **v3 210/389/9/3,26 ns** (limit = šířka pulzu DSP, logika má slack 2,55 ns); HLS 407/385/9/3,85. Pipelining adres: −47 LUT za +43 FF.
- 15. 10. 2026 (večer): VHDL CSC kompletní – `axil_regbank` (mapa jako HLS, jeden driver), `csc_axil` top. xsim PASS (6 předvoleb × náhodné mezery, 6 × AXI-Lite konfigurace). OOC 3→3: VHDL 325 LUT / 558 FF / 12 DSP / 3,70 ns vs. HLS 407 LUT / 385 FF / 9 DSP / 3,85 ns. K doladění: regbank ukládá celých 32 b (FF), sčítání mimo DSP kaskádu (12 vs. 9 DSP), sjednotit metodiku Fmax (HLS jen WNS, VHDL i WPWS).
- 15. 10. 2026 (odpoledne): HLS histogram (bypass, 1 volání = 1 snímek, forwarding v BRAM) a medián 3x3 (společná šablona okénkových jader `hls_window.hpp`: řádkové buffery, okraj nuly/replikace, flush, resync) – csim + cosim PASS, impl: histogram 302 LUT / 2 BRAM / 2,73 ns, medián 768 LUT / 4 BRAM / 4,06 ns. Poučení: technika UG1399 pro histogram prošla csim, ale ne cosim. VHDL základ `DP/vhdl`: `video_pkg`, `axis_skid_buffer`, generický testbench řízený HEX z golden modelu (náhodné mezery a backpressure), `csc_core` bitově shodný ve všech 6 předvolbách (GHDL), plná propustnost 1 px/takt.
- 15. 10. 2026: CSC jádro kompletně na Ababelu (csim/syn/cosim/impl PASS). Po implementaci 407 LUT, 385 FF, 9 DSP, 3,847 ns (260 MHz, timing splněn) proti odhadu HLS 791 LUT / 3,098 ns → do DP jen čísla po implementaci. `collect_reports.py` čte formát 2025.2, první `DP/hls/results/hls_results.csv`. Claude se připojuje na Ababel sám (SSH z device_bash), repo se synchronizuje notebook → Ababel přes SSH. Založena paměť `CLAUDE.md` + `.claude/` (připojení, poučení, rozhodnutí, skill `ababel-hls`).
- 3. 10. 2026: HLS infrastruktura `DP/hls` (UG934 typy přes ap_axiu, TB proti golden modelu, skripty .sh/.bat). CSC jádro na Ababelu: C-sim PASS, syntéza II=1, hloubka 5, odhad Fmax 323 MHz při cíli 5 ns, 9 násobiček (DSP).
- 2. 10. 2026: úklid repa (blacklist .gitignore) hotový. Golden C model `DP/model/lib_imgproc` hotový (Jablotron C standard, poznámky k návrhovým rozhodnutím v komentářích), generátor konstant (`generated/imgproc_coeffs.h`, `imgproc_coeffs_pkg.vhd`) a `imgproc_cli` (PPM/PGM → HEX pro testbenche). Ověřeno proti OpenCV 4.13: RGB→šedá, RGB→HSV (2^24), prahování, medián (replikace) a filter2D bitově shodné; RGB→YCbCr ±1; HSV→RGB ±2. Nástroje pro PC se přeloží na Linuxu i Windows (`pc_file_open`: fopen_s / fopen).

## Výchozí stav (audit)
- Text: 34 stran PDF, reálně ~10–12 stran vlastního textu. Hotové jsou Nástroje a Barevné prostory (předimenzované). Chybí úvod, abstrakty, rešerše HW realizace, histogram/medián/prahování, implementace, výsledky, závěr. Literatura: 3 položky (chybí klíč `cie15_2018`, necituješ Šonku ani Harrise).
- HLS: 8 jader s TB (passthrough, threshold, histogram, rgb2hsv, hsv2rgb, color_space_convert, filter_2d, median).
- VHDL: rgb2hsv, hsv2rgb hotové. `filter_2d` rozpracované, s chybami. `color_space_conversion` se nezkompiluje.
- HW: na desce běží jen passthrough (VDMA, bare-metal). Měření HW vs. SW chybí.

## Nalezené chyby (akční seznam)
- `mac_pipeline`: valid zpožděný o 4 takty, data o 3 → posun o 1 pixel.
- `sliding_window`: první pixel v IDLE nezvýší `in_x` → flush o pixel později.
- `filter_2d`: během FLUSHING `s_axis_tready = 1` → polyká další snímek. Chybí TUSER/TLAST.
- `filter_2d` syntéza: 33k FF, 0 DSP, BRAM chybí → line buffery ve FF, násobení v LUT.
- `color_space_conversion.vhdl`: nedeklarované generiky `G_COEFF_INT_BITS`, `G_COEFF_FRAC_BITS`, `G_BITS_PER_CHAN`.
- HLS `hls_video_types.hpp`: Rec.709 a Rec.2020 mají Cb/Cr zkopírované z Rec.601, Y u Rec.2020 je chybné ({63,173,20} → ≈{67,174,15}).
- HLS color convert: `>>8` ořezává místo zaokrouhlení. Ignoruje vstupní TUSER, jede na čítač.
- Pořadí kanálů: VHDL R[23:16] G[15:8] B[7:0], HLS R[7:0]. Ani jedno není UG934 (G[7:0] B[15:8] R[23:16]).
- rgb2hsv: HLS (Q.16, ořez) ≠ VHDL (Q.8, zaokrouhlení).
- HLS median: režim VALID, `MAX_IMG_WIDTH = 7680`.
- HLS histogram: sink bez výstupního streamu.
- Tabulky prostředků v textu obsahují IO (syntéza s piny, ne OOC).
- `hls_config.cfg`: absolutní Windows cesty.
- V repu jsou velké binárky (fractal.zip 330 MB, .bit, .xsa, runs).

## Rozhodnutí
### Rozsah
| Algoritmus | HLS | VHDL | SW (C, A53) |
|---|---|---|---|
| Lineární převod barev (generická matice) | ✔ | ✔ | ✔ |
| RGB ↔ HSV | ✔ | ✔ | ✔ |
| Prahování (5 typů OpenCV + maxval) | ✔ | ✔ (P2) | ✔ |
| 2D konvoluce (mean, Sobel, zostření) | ✔ | ✔ | ✔ |
| Mediánový filtr 3×3 | ✔ | ✔ | ✔ |
| Histogram jasu | ✔ (BRAM + registry přes pragmu) | ✔ čítače (P1) | ✔ |

### Společná pravidla
- Hodiny: OOC srovnání všech jader s cílem 5 ns (200 MHz). Na desce 200, případně 148,5, případně 100 MHz.
- Rozhraní: AXI4-Stream Video podle UG934 (TUSER = SOF, TLAST = EOL), RGB 24 b G[7:0] B[15:8] R[23:16], šedá 8 b, plný backpressure, `aresetn` synchronní aktivní v 0, `G_MAX_WIDTH = 3840`, měření na 1080p, resynchronizace na TUSER povinná.
- VHDL-2008 a jen ověřené konstrukty (AXIS v recordech). Žádné VHDL-2019 interfaces (xsim je nepodporuje).
- Konfigurace: VHDL jádra = `axil_regbank` + jádro, zabalená jako IP. Mapa registrů stejná jako u HLS, jeden C driver.
- Stavový registr ve všech jádrech (sticky EARLY_EOL, LATE_EOL, EARLY_SOF + čítač snímků).
- Bodová jádra: čistá pipeline, TUSER/TLAST putují s daty, bez čítačů. V HLS jedno volání = jeden řádek (smyčka do TLAST), `ap_ctrl_hs` + auto-restart (změna 3. 10.: `ap_ctrl_none` se skalárními registry nejde ve Vitis 2025.2 co-simulovat).
- Okénková jádra: geometrie z čítačů (width/height), TLAST jen kontrolovaný, snímek se vždy dokončí (W×H), flush po W×H s `s_axis_tready = 0`, globální enable + 2místný skid buffer, BRAM line buffery (šablona UG901), pipelinovaný sčítací strom, jedna konstanta latence pro valid/user/last.

### Aritmetika a reference
- Golden model = vlastní celočíselný C model (sémantika OpenCV s explicitními konvencemi). HW se s ním musí shodovat bitově. Odchylka vůči OpenCV/float se jen reportuje (max. chyba, MAE, PSNR).
- Koeficienty se generují z definic (Kr, Kb) do `.h` a VHDL package. Nikdy se neopisují ručně.
- Převod barev: **Q2.15** (18 b, port B DSP48E2; změna z Q3.14 2. 10. – s Q2.15 je RGB→šedá bitově shodná s OpenCV na všech 2^24 barvách, rozsah ±4 stačí), koeficienty se dorovnávají metodou největšího zbytku, half-up, saturace. Offset se přičítá v akumulátoru před posunem. Konfigurace: RGB→šedá (601), YCbCr 601 full, YCbCr 709 full, studio range, šedá→RGB (1→3).
- RGB→HSV: celočíselný algoritmus OpenCV (shift 12, tabulky sdiv/hdiv180), H 0–179 → bitová shoda s `cv::cvtColor`. HSV→RGB: vlastní celočíselný algoritmus.
- Úplný test všech 2^24 barev (C model + na desce) pro převody barev a HSV.
- Konvoluce: 8b celočíselné jádro, přesná akumulace, `scale` Q.14 + half-up, `delta`, saturace, nulový padding, jen SAME. Na desce 3×3, OOC 3×3/5×5/7×7.
- Medián: síť jako v HLS (7× sort3). Okraj REPLICATE (bitová shoda s `medianBlur`) s limitem 1 MD, jinak nulový padding.
- Histogram: bypass (video jde beze změny), nulování při SOF, ARM čte po frame-done.

### Testovací řetězec a měření
- Jeden bitstream: VDMA MM2S → AXIS Switch 1→N → jádra → Switch N→1 → VDMA S2MM. Přepínání jen mezi snímky.
- Šedotónová jádra: vlastní převod RGB→šedá na vstupu a šedá→RGB na výstupu.
- VFB Read/Write jako experiment s limitem 1 MD.
- Verifikace VHDL: vlastní generický AXIS testbench (VHDL-2008, textio, xsim): soubory z C modelu, náhodné mezery ve valid, náhodný backpressure, kontrola TUSER/TLAST, víc snímků, TUSER uprostřed snímku, malé rozlišení + 1× 1080p.
- Metriky: LUT/FF/BRAM/DSP (OOC, bez IO), WNS/Fmax, latence [takty], fps @1080p na desce (XTime), přesnost, příkon (odhad z report_power), náročnost vývoje v MD (krok 0,5) + příznak AI + řádky kódu.
- SW: bare-metal, 1× A53, C model, cache zapnutá, -O0/-O2/-O3, medián z 10 běhů.
- Build: skriptovaný flow na Ababelu (Linux, Vivado 2025.2), OOC skript → CSV → LaTeX (csvsimple/pgfplots), .gitignore pro generované soubory.
- Text: lokální TeX Live + VS Code + git (XeLaTeX + biber), s vedoucím se sdílí PDF.

### Struktura textu (~45 stran)
1. Úvod (1–2): motivace včetně učebního charakteru práce (proč ne VVL)
2. Platforma a nástroje (6): bod 1
3. Rešerše operací + analýza HW realizace + Vitis Vision Library jako související práce (11): bod 2. Barvy zkrátit, CIE ½ strany.
4. Návrh a metodika (6): včetně výkladu aritmetiky s pevnou řádovou čárkou a formátů Qx.y (Q2.15 pro CSC, Q.14 pro scale filtru, shift 12 pro HSV), zaokrouhlení half-up a saturace
5. Implementace (11): bod 3
6. Výsledky a srovnání (7): bod 4
7. Závěr (1–2)

## Priority (škrty shora dolů)
- **Nikdy:** testovací řetězec, C model, HLS všech 7, VHDL převod barev + HSV + konvoluce + **medián**, SW měření, kapitoly 1–7
- **P1:** VHDL histogram (čítače) – hotovo 19. 10. (+ BRAM varianta z bonusu)
- **P2:** Sobel se dvěma jádry (fallback jeden směr), OOC 5×5/7×7, replikace okrajů, VHDL prahování
- **Bonus:** Otsu (ARM z histogramu), VFB, OpenCV na Ubuntu, VVL filter2D (jen prostředky, 1 MD), BRAM histogram ve VHDL, -Os

## Kapacita
~26 MD v celých dnech (2 dny/týden) + zrychlení díky Sonnetu. Odhad potřeby ~29 MD. Večery jsou rezerva pro nenáročnou práci (buildy, citace, obrázky, korektury).

## Harmonogram
| Období | Práce | Text |
|---|---|---|
| 1.–12. 10. | úklid repa, skripty, C model, generátor | zkrácení barev, kostra |
| 13. 10. – 15. 11. | společné VHDL bloky + TB, úpravy HLS, testovací řetězec, SW aplikace | kap. 2 |
| **15. 11. M1** | všechna HLS jádra v jednom bitstreamu na desce, SW změřeno | |
| 16. 11. – 13. 12. | VHDL jádra | kap. 3 |
| **13. 12. M2** | všechna VHDL jádra na desce, OOC CSV | |
| 14.–18. 12. | měření, grafy | kap. 4 + 5 → **částečný draft (kap. 1–5) vedoucímu do 18. 12.** |
| 22.–28. 12. | volno | |
| 29. 12. – 3. 1. | | kap. 6 + 7, abstrakty → **kompletní draft vedoucímu přes svátky** |
| 4.–11. 1. | zapracování připomínek, formální kontrola | |
| 12.–15. 1. | tisk, vazba, STAG, ZIP s kódem | |

Pravidlo: každé dokončené jádro dostane svůj odstavec v kap. 5 ten samý týden.

## Konzultace s dr. Rozkovcem (e-mail + osobní schůzky)
1. **Úvodní konzultace (první polovina října):** termín 15. 1. 2027 a formality kolem posunu; rozsah a metodika srovnání; uvedení AI podle pravidel TUL; volba normy u Sobela; struktura a rozsah (počítají se přílohy?); příloha ZIP a bitstreamy; vybavení ústavu na měření příkonu; **jestli zvládne přečíst kompletní draft přes svátky (29. 12. – 4. 1.)**.
2. **Kolem M1 (polovina listopadu):** ukázka testovacího řetězce na desce, první tabulka, kap. 2 k připomínkám.
3. **Kolem M2 / 18. 12.:** výsledky VHDL × HLS, interpretace, částečný draft kap. 1–5.
4. **Začátek ledna:** kompletní draft, abstrakty, formální stránka.

## Předpoklady
- Termín 15. 1. 2027 je pevný a posun termínu je formálně vyřízený.
- 2 celé dny týdně jsou k dispozici po celé období.
- KV260 + VDMA řetězec je reprodukovatelný. Ababel má Vivado/Vitis 2025.2.
- AI je povolená, pokud se přizná.
- Vedoucí stihne číst drafty v uvedených oknech.

## Rizika a jak se řeší
- Chybí ~3 MD → pořadí škrtů + kontrolní body M1/M2 (při skluzu > 2 MD se škrtá).
- Timing na 200 MHz s ~12 jádry v jednom bitstreamu → frekvence na desce 148,5/100 MHz, OOC srovnání zůstává na 5 ns.
- Chyby v kódu od AI → každé jádro musí projít generickým testbenchem a bitovou shodou.
- Zaseknutí v BD nebo VDMA → stavové registry v jádrech, VFB jen jako experiment s limitem.
- Posun textu na leden → pravidlo „jádro = odstavec ten týden“ + částečný draft do 18. 12.
- Vedoucí přes svátky nestihne číst → ověřit na úvodní konzultaci, případně přesunout kompletní draft dřív.

## Otevřené body
- **Metodika srovnání Fmax:** HLS `export_impl` počítá periodu z WNS, VHDL `collect_vhdl.py` bere i minimální šířku pulzu (WPWS, u DSP ~3,26 ns). Návrh: prohnat HLS RTL stejným `ooc_impl.tcl`. Probrat s dr. Rozkovcem.
- **Norma u Sobela:** L1 / L∞ / α-max-β-min (C1: α=1, β=1/2, ≈12 %; C2: 15/16, 15/32, ≈6 %) / přesná L2. Rozhodne student po nastudování teorie, případně s dr. Rozkovcem, nejpozději před začátkem VHDL konvoluce. Výchozí volba C1.
- Frekvence PS (A53) podle `psu_init`: ověřit a uvést.
- Měření příkonu: podle vybavení ústavu.
