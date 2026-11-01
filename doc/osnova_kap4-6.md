# Osnova kapitol 4 až 6 (návrh ke schválení, 25. 10. 2026)

Podle `dp-kapitola`: nejdřív osnova, potom text. Rozsah dle plánu: kap. 4 ≈ 6 stran, kap. 5 ≈ 11 stran, kap. 6 ≈ 7 stran.
Čísla odkazují na sekce `DP/results/vysledky.md` (V#), kořenový `README.md` (R), `plan_dokonceni_DP.md` (P) a `lessons.md` (L).
Citace dodá Karel z Citace PRO (viz dp-citace), zde jen kde je potřeba zdroj.

## Kapitola 4: Návrh a metodika (≈ 6 stran)

**Cíl kapitoly:** čtenář pochopí, co přesně se porovnává a jak se zaručuje, že jsou čísla férová a implementace správné.

| oddíl | obsah (jedna věta) | podklady | obrázek / tabulka / kód |
| --- | --- | --- | --- |
| 4.1 Cíle a kritéria srovnání | čtyři body zadání a z nich odvozená kritéria: bitová shoda, prostředky, Fmax, propustnost, rychlost proti SW | zadání, P (Cíl, Rozhodnutí) | tabulka kritérií a způsobu měření |
| 4.2 Referenční model v C | golden model `lib_imgproc` je zdroj pravdy; konstanty se generují, ne opisují; shoda s OpenCV | R (Společné konvence), V15, `DP/model` | schéma toku: model → generátor konstant → HLS / VHDL / SW |
| 4.3 Aritmetika s pevnou řádovou čárkou | Q2.15 u převodu barev (proč Q3.14 nestačilo), Q.14 měřítko filtru, posun 12 u HSV, zaokrouhlení polovin nahoru, saturace, šířky vzorcem | R (Aritmetika, Šířky vzorcem), L (Golden model) | tabulka formátů Qx.y; příklad šířek (Wa+Wb, max(W)+clog2(N)) |
| 4.4 Tři úrovně ověření | C-simulace, kosimulace a xsim, test na desce; proč C-sim nestačí (histogram, řádková jádra) | R (Tři úrovně ověření), L (HLS), V17 (xsim test ocasu) | diagram úrovní |
| 4.5 Metodika měření | OOC syntéza 5 ns a Fmax = max(5 − WNS, 5 − WPWS) pro HLS i VHDL; měření na desce (strop 1 px/takt, doba MM2S); SW na A53 1333 MHz bare-metal | V9, V19, V18, P (Otevřené body: A53 1333 MHz) | tabulka rozdílu export HLS × OOC (V9), schéma měření doby snímku |

Zdroje k citování: OpenCV dokumentace (reference pro RGB→šedá, HSV), UG1399 (HLS), formát Q (aritmetika s pevnou čárkou).

## Kapitola 5: Implementace (≈ 11 stran)

**Před kapitolou deklarace AI ke kódu** (dp-ai, umístění potvrdit s vedoucím).
**Cíl kapitoly:** ukázat, jak byl každý algoritmus implementován třemi způsoby (HLS, VHDL, SW) a proč tak.
Každý algoritmus má stejnou šablonu: co dělá, matematika, model v C, HLS, VHDL, ověření, odkaz na výsledek v kap. 6.

| oddíl | obsah (jedna věta) | podklady | poznámka |
| --- | --- | --- | --- |
| 5.1 Společné bloky | AXI4-Stream podle UG934 (TUSER = SOF, TLAST = konec řádku), mapa registrů `axil_regbank` shodná u HLS i VHDL, generátor okna `window_gen` + `line_buffer`, HLS šablona `hls_window.hpp` | R (Společné konvence), `DP/vhdl`, `DP/hls/common` | schéma okna K×K s řádkovými pamětmi |
| 5.2 Převod barev (CSC) | jedna matice Q2.15 pro RGB→YCbCr, RGB→šedá, šedá→RGB a inverzi; VHDL v1 až v3 (sekvenční zpracování v pipeline DSP) | R §1, V2, V15 | příklad „dvě cesty, volba a důvod“: kolik DSP (12 → 9), šířky vzorcem |
| 5.3 RGB ↔ HSV | HLS i VHDL počítají podle OpenCV, převrácené hodnoty v tabulkách, HSV→RGB násobení v LUT nebo DSP (`G_USE_DSP`) | R §2, V3, V11, V13 | tabulka stupňů pipeline, LUT × DSP |
| 5.4 Prahování | typ prahu v registru, Otsu se počítá na ARM z histogramu | R §3, V8 | krátký úryvek HLS |
| 5.5 Konvoluce K×K a Sobel | okno K×K, mapa pro K ≥ 5 (okno `coeff`), měřítko Q.14 + delta; norma u Sobela dle rozhodnutí | R §4, V6, P (Norma u Sobela) | otevřená otázka normy (viz níže) |
| 5.6 Medián 3×3 | třídicí síť (sorting network) místo třídění, sdílené okno s konvolucí | R §5, V4, V5 | schéma sítě |
| 5.7 Histogram | BRAM s forwardingem proti 256 čítačům, proč C-simulace nestačí | R §6, V7, L (HLS) | **nejlepší příklad „dvou způsobů“**: obě architektury a jejich cena |
| 5.8 Testovací řetězec a měřicí aplikace | jeden bitstream s 14 jádry, VDMA + AXIS přepínače, bypass (strop), `harness_app` na A53, `board_test` (UART) | R (Testovací řetězec), V12, V19 | blokové schéma řetězce (R) |
| 5.9 Nalezené problémy | řádková HLS jádra s auto-rewind držela ocas řádku (SOFLateErr), oprava `enable_auto_rewind=0`; chování VDMA S2MM; PS UART v hardwaru | V16, V17, L (Test na desce) | je to negativní výsledek, který stojí za okomentování (Metodika 2.2.2) |

Doporučení: matematiku a kód každého algoritmu převzít z R (je psaný jako podklad pro tento text), nepřepisovat znovu.

## Kapitola 6: Výsledky a srovnání (≈ 7 stran)

**Cíl kapitoly:** odpovědět číslem, kdy se vyplatí HLS, kdy VHDL a o kolik je HW rychlejší než SW.
Každá tabulka má v textu konfiguraci měření (zařízení, 5 ns, verze nástrojů, rozlišení), čísla se berou přesně z V#.

| oddíl | obsah | podklady | tabulka / graf |
| --- | --- | --- | --- |
| 6.1 Ověření funkce | bitová shoda všech 16 jader proti golden modelu na třech úrovních SW, odchylky u inverzního CSC (≤ 1 úroveň) | V16 až V18, V15 | tabulka PASS (jádro × úroveň) |
| 6.2 Prostředky a Fmax (OOC) | HLS × VHDL po jádrech: LUT, FF, DSP, BRAM, perioda a limit (logika, šířka pulzu BRAM a DSP) | R (Výsledky), V2 až V9, V11, V13, V14 | souhrnná tabulka (R) a sloupcový graf prostředků |
| 6.3 Propustnost na desce | všechna jádra na 10,37 ms na snímek (96 fps, 1 px/takt při 200 MHz); okénka +15 µs; cena vypnutí auto-rewind +30 až +40 µs | V19, V17 | tabulka doby snímku HLS × VHDL |
| 6.4 HW × SW | zrychlení 3,4× (histogram) až 55× (Sobel) při -O2, vliv optimalizace překladače -O0/-O2/-O3 | V18 | tabulka SW × HW, graf zrychlení v logaritmické ose |
| 6.5 Celý řetězec | využití zařízení a rezerva časování při 200 MHz, kritická cesta v HLS HSV→RGB | V12, **podklad je z 22. 10., obnovit pro finální bitstream** | tabulka využití, výřez časování |
| 6.6 Diskuse | HLS je menší a rychlejší na návrh, VHDL kratší kritická cesta a deterministická latence; kompromisy bez superlativů; limity měření | V2, V9, V11, V13, P | bez nové tabulky |

## Co chybí v podkladech (zjistit nebo změřit)

1. **Finální využití a časování bitstreamu** (po vypnutí auto-rewind a zapnutí UART): `DP/hw/build/harness/{timing,utilization}.rpt` na Ababelu; V12 je z 22. 10.
2. **Příkon** (podle vybavení ústavu), případně odhad z Vivada.
3. **Rozptyl SW měření** (medián z 10 běhů, jeden běh na úroveň): zvážit tři běhy a uvést rozptyl.
4. **Sobel Y a norma gradientu**: na desce se měří jen Sobel X (P2 v plánu).
5. **Grafy**: formát (pgfplots v LaTeXu, nebo Python → PDF); data jsou v CSV (`DP/hls/results`, `DP/vhdl/results`, `DP/results/deska`).
6. **Stávající `doc/DP.tex`** má jinou strukturu kapitol (Nástroje, HW platforma a metodika návrhu, Reprezentace obrazových dat a barevné prostory, Hardwarová architektura a implementace, Závěr) než osnova z plánu. Je potřeba rozhodnout, co z toho přesunout do kap. 2 a 3 a co do 4 až 6.

## Otevřené otázky pro Karla a vedoucího

- Umístění a znění deklarace AI před kap. 5 (dp-ai).
- Poměr rešerše a vlastní práce: s kap. 4 až 6 ≈ 24 stran proti kap. 2 a 3 ≈ 17 stran vychází 1 : 1,4, což vyhovuje Dvacateru (nejvýše 1 : 1).
- Norma u Sobela (C1 jako výchozí) a rozsah Sobela ve výsledcích.
- Zda do kap. 6 patří přepočet na příkon, pokud ho nebude možné změřit.
- Zda se řádková HLS jádra a auto-rewind (5.9) mají v textu rozepsat podrobně, nebo stačí odstavec a příloha s testbenchem.
