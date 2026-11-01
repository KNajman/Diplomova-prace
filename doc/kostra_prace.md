# Kostra diplomové práce (návrh ke schválení, 1. 11. 2026)

Navazuje na `doc/osnova_kap4-6.md` (schválená). Tento dokument určuje **celkovou strukturu, názvy kapitol a mapování
stávajícího textu v `doc/DP.tex`**. Po schválení se `DP.tex` přestaví mechanicky: nadpisy se přejmenují, existující bloky
se přesunou do nových kapitol a nic se nemaže. Škrty a krácení se řeší až po přestavbě, kapitola po kapitole.

Rozsah ~45 stran textu (bez příloh a úvodních listů). Poměr teorie a vlastní práce: kap. 2 + 3 ≈ 17 stran proti kap. 4 až 6 ≈ 24 stran.

## Pořadí dokumentu (Metodika FM, příl. F)

Titulní list a zadání ze STAGu (`\ThesisStart`), prohlášení → poděkování → abstrakt a klíčová slova CZ a EN (250 až 500 slov, s výsledky) → obsah, seznam obrázků a tabulek → seznam zkratek (abecedně, `acronym`) → kapitoly 1 až 7 → literatura → seznam příloh → přílohy.

## Kapitoly, názvy, rozsah

| č. | název (návrh) | rozsah | co obsahuje | dnešní stav v `DP.tex` |
| --- | --- | --- | --- | --- |
| 1 | **Úvod** | 1–2 s | motivace (učební charakter, proč vlastní jádra a ne Vitis Vision Library), cíle podle zadání, metoda, struktura práce; bez výsledků | prázdný odstavec |
| 2 | **Platforma a použité nástroje** | 6 s | Kria KV260 a Zynq UltraScale+ (LUT, FF, LUTRAM, DSP, BRAM), Vivado, Vitis HLS, VHDL, testovací řetězec v hrubých rysech | kap. „Nástroje“ + „HW platforma a metodika návrhu“ |
| 3 | **Operace zpracování obrazu a jejich hardwarová realizace** | 11 s | barevné prostory (CIE jen ½ strany), RGB↔YCbCr, RGB↔HSV, prahování a histogram, konvoluce, medián; u každé operace, co je pro FPGA obtížné; související práce (Vitis Vision Library) | kap. „Reprezentace obrazových dat a barevné prostory“ (zkrátit) |
| 4 | **Návrh a metodika srovnání** | 6 s | referenční model v C, aritmetika s pevnou čárkou, úrovně ověření, metodika měření (OOC 5 ns, Fmax, deska, SW na A53) | část kap. „Hardwarová architektura“ (Metodologie designu, Aritmetika) |
| 5 | **Implementace algoritmů** | 11 s | společné bloky, ke každému algoritmu stejná šablona, testovací řetězec a měřicí aplikace, nalezené problémy | zbytek kap. „Hardwarová architektura“ |
| 6 | **Výsledky a srovnání** | 7 s | bitová shoda, prostředky a Fmax HLS × VHDL, propustnost na desce, HW × SW, využití řetězce, diskuse | nic |
| 7 | **Závěr** | 1–2 s | zhodnocení bod po bodu proti zadání, srovnání s SW a Vitis Vision, pokračování | prázdná kapitola |

Před kapitolou 5 stojí deklarace AI ke kódu (dp-ai, umístění potvrdit s vedoucím).

## Mapování stávajícího textu (nic se nemaže)

Čísla řádků jsou z `doc/DP.tex` ke dni 1. 11. 2026.

| stávající blok (řádky) | cíl v nové kostře | poznámka |
| --- | --- | --- |
| Nástroje: Vitis HLS, Vivado, kria KV260 (143–216) | 2.1 až 2.3 | krátit na vlastní zkušenost, bez reklamních popisů |
| HW platforma: LUT, FF, LUTRAM, DSP, BRAM (217–231) | 2.4 Zdroje zařízení | zůstává, doplnit čísla KV260 |
| Fyzikální podstata obrazu, CIE 1931 (233–420) | 3.1 Barevné prostory (½ strany) | největší škrt: ~190 řádků na pár odstavců |
| Akvizice a model RGB (421–465) | 3.1 | krátce, jen pro definici formátu pixelu |
| RGB na HSV (466–514) | 3.2 Převody RGB↔HSV | ponechat vzorce, doplnit obtížnost pro FPGA (dělení) |
| YUV, BT.601/709/2020, podvzorkování (515–765) | 3.3 Převod RGB↔YCbCr | ponechat matice BT.601 a BT.709, BT.2020 a podvzorkování zkrátit |
| Histogram (766–770) | 3.4 Prahování a histogram | doplnit prahování a Otsu |
| Filtrace: průměrování, hranové filtry, morfologie (771–884) | 3.5 Konvoluce a mediánový filtr | morfologii zkrátit nebo vypustit (v práci se neimplementuje) |
| Metodologie designu (898–930) | 4.1 až 4.3 | „Problém s 2023 a 2025“ přepsat nebo vypustit (ověřit s Karlem, co to bylo) |
| Aritmetika s pevnou řádovou čárkou (931–956) | 4.3 Aritmetika | doplnit Q2.15, Q.14, posun 12 z `README.md` |
| Zpracování video streamu (957–977) | 5.1 Společné bloky | AXI4-Stream, TUSER/TLAST |
| Převody do barevných soustav (978–989) | 5.2 | sloučit s níže uvedeným |
| Architektura IP jádra (990–1031) | 5.1 a 5.2 | HLS šablona, paralelizace, šablonové metaprogramování |
| Passthrough (1032–1035) | 5.8 Testovací řetězec (bypass) | |
| RGB na HSV: VHDL, HLS (1036–1057) | 5.3 | |
| HSV na RGB: VHDL, HLS (1058–1077) | 5.3 | |
| 2D filter: sčítací strom, MAC, HLS, VHDL, srovnání (1078–1108) | 5.5 | srovnání přesunout do kap. 6 |
| Závěr (1109) | 7 | prázdný |

## Technická poznámka k přestavbě `DP.tex`

- Kostra je beze změny třídy a balíků; mění se jen `\chapter`, `\section` a přesun bloků.
- Dnes jsou některé nadpisy bez textu (např. prázdný `\subsection{}` na řádku 764, „Passthrouht“) a dva překlepy v nadpisech
  („Passthrouht“, „Multiplay-Accumulate“); opravit při přestavbě.
- `Diplomová_práce/DP.tex` v `CLAUDE.md` je zastaralá cesta, soubor je `doc/DP.tex`.
- Před zásahem vzít aktuální verzi souboru z disku (Karel ji může mít otevřenou ve VS Code) a nechat ověřit překlad
  (XeLaTeX + biber, `python3 doc/tools/dp_check.py all doc/DP.tex doc/citace.bib`).

## K rozhodnutí

1. **Názvy kapitol** podle tabulky výše (zejména 3, 4 a 6), nebo jiné?
2. **Kap. 3 a rešerše:** zachovat samostatnou kapitolu, nebo část obecné teorie o barvách (CIE, gamuty) přesunout do úvodu operací v kap. 5? Dvacatero chce poměr nejvýše 1 : 1.
3. **Morfologické operace a BT.2020:** vypustit, nebo nechat jako krátký odstavec?
4. **Kap. 4 samostatně**, nebo sloučit s kap. 5 (kratší práce, ale metodika zapadne)?
5. **Anglický abstrakt a české/anglické názvy:** pojmy pevná řádová čárka, bitová shoda, syntéza mimo kontext (OOC) a jejich zkratky do seznamu zkratek.
