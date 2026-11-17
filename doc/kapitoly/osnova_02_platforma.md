# Osnova kapitoly 2: Platforma a použité nástroje (návrh 2. 11. 2026, **schváleno Karlem 17. 11. 2026**)

Rozsah ≈ 6 stran. Cíl kapitoly: splnit 1. bod zadání (seznámení s nástroji AMD Vitis, Vitis HLS, Vivado a s platformou KV260) a ukázat, **co z nich jsem v práci skutečně použil a k čemu**. Čtenář (inženýr mimo FPGA) si z ní odnese, na čem práce běží a jaké prostředky obvod nabízí.

Zdroje: stávající text v `DP.tex` (790 slov), `README.md`, `DP/hls/README.md`, `vysledky.md` (V12), plán (rozhodnutí), `lessons.md`. Citace: `amd_vitis`, `amd_vivado`, `amd_kv260` už v `citace.bib` jsou, další dodáš z Citace PRO.

## Osnova

| oddíl | obsah (jedna věta) | použít ze stávajícího textu | nové / podklad |
| --- | --- | --- | --- |
| 2.1 Platforma Kria KV260 | modul K26 SOM se Zynq UltraScale+ MPSoC (procesorová část PS, programovatelná logika PL, paměť DDR) na nosné desce | tabulka specifikace desky (zkrátit na to, co práce používá), odstavec o KV260 | A53 1333 MHz (z `psu_init`), DDR 4 GB, HP port pro VDMA |
| 2.2 Prostředky programovatelné logiky | LUT, FF, LUTRAM, DSP a BRAM: co jsou, kolik jich obvod má a k čemu je v práci používám | pododdíly LUT, FF, LUTRAM, DSP, BRAM (krátké věty) | **počty prostředků xck26** (viz otázka 1), příklady použití: BRAM = řádkové paměti a histogram, DSP = násobení v převodu barev a konvoluci |
| 2.3 Vivado | integrace blokového návrhu, syntéza, rozmístění a propojení, bitstream; v práci: skriptovaný blokový návrh testovacího řetězce, syntéza mimo kontext, simulace v xsim | odstavec o Vivadu a fázích návrhu | V9, V12, `build_harness.tcl`, verze 2025.2 |
| 2.4 Vitis HLS | překlad C++ do RTL; pragmata; C-simulace, kosimulace, export IP; v práci: šablony `hls_window.hpp`, postup csim → syn → cosim → impl | odstavec o HLS, „programovací model“ (úlohy, vektory, proudy), obrázek metodiky | `DP/hls/README.md`, skripty `run_hls.sh` |
| 2.5 Vitis a software pro procesor | překlad bare-metal aplikace pro A53, nahrání přes JTAG | nic | `build_app.py`, `run_board.tcl`, `board_test` |
| 2.6 VHDL a simulace | VHDL-2008, simulace v xsim a GHDL, kontrola kódu v Sigasi | nic | README (VHDL), plán (omezení: jen ověřené konstrukty) |
| 2.7 Testovací řetězec v hrubých rysech | jeden bitstream se všemi jádry: VDMA, přepínače AXI4-Stream, jádra, měřicí aplikace; podrobnosti v oddílu @ref(sec:retezec) | nic | R (Testovací řetězec), blokové schéma |

Pokud rozsah přeroste 6 stran, sloučit 2.5 a 2.6 do 2.3 a 2.4 (jako odstavce) a prostředky přesunout k tabulce desky.

## Co se stávajícím textem navrhuji

Podle `dp-styl` text nepřepisuji potichu, uvádím návrhy. U kapitoly, která se píše znovu v Markdownu, by ses jich držel při psaní:

1. Reklamní slova ve stávajícím textu, která zmizí: „pokročilý vývojový nástroj“, „klíčový prvek“, „vysoce optimalizovaná IP jádra“, „komplexní integrované vývojové prostředí“, „bohatá sada rozhraní“, „moderní verze … využívají strojové učení“. Nahradí je věcný popis a číslo (např. kolik LUT, DSP a BRAM obvod má).
2. Překlepy a chyby, které je nutné opravit: „DRR“ místo DDR, „slice's (řezy/blokyú“, „Passthrouht“ (už opraveno v nadpisu), věta o NTD (New Timing Driven) flow vyžaduje ověření.
3. Stávající texty o nástrojích jsou psané „jak to zdůrazňují materiály AMD“. Pro tuto kapitolu platí opak: popisovat, co nástroj dělá a co jsem s ním udělal já, v 1. osobě.

## Otázky pro Karla (rozhodni nebo doplň)

1. **Počet DSP v tabulce desky je pravděpodobně chybně.** V `DP.tex` je „1 176 DSP slices“. Z využití v `vysledky.md` sekce 12 (64 DSP = 5,1 %, 14 024 LUT = 12,0 %, 18 062 FF = 7,7 %, 16 BRAM = 11,1 %) vychází celkem asi 1 248 DSP, 117 tisíc LUT, 234 tisíc FF a 144 BRAM. Přesné hodnoty chci potvrdit z datasheetu K26 nebo z výpisu využití z Vivada (po připojení Ababelu).
2. **Oddíl „Problém s 2023 a 2025“.** První odstavec (verze 2023.2 měla neúplné soubory desky a směrování selhalo) a druhý (změna formátu v 2025.2) potřebuji od tebe upřesnit: byl to skutečný problém, který jsi řešil (kdy, jak jsi zjistil příčinu)? Pokud ano, napsal bych z toho 3 až 4 věty do oddílu o Vivadu. Pokud ne, vypustit.
3. **Rozsah „seznámení s nástroji“** (zadání, bod 1). Chceš tam i vlastní zkušenost, tedy jak jsi se s nástroji učil (první průchod bez jádra jako cvičení, kroky), nebo jen přehled? Učební charakter práce je v plánu jako motivace pro Úvod, ne pro kapitolu 2, takže bych se držel přehledu a odkaz na učební charakter nechal v Úvodu.
4. **Vitis (software) a xsdb** (2.5): zařadit jako samostatný oddíl, nebo jen věta u testovacího řetězce?
5. **Výpočetní server Ababel** (Linux, Vivado 2025.2, fronty buildů): zmínit v kapitole 2 jako součást pracovního prostředí (kvůli reprodukovatelnosti), nebo jen v příloze?
6. **Obrázek metodiky** (`methodology.png`) v oddílu o HLS: je převzatý z dokumentace AMD (pak jde do popisku s citací), nebo jsi ho kreslil sám?

## Odpovědi a rozhodnutí Karla (17. 11. 2026)

Osnova schválena beze změny (2.1 KV260, 2.2 prostředky PL, 2.3 Vivado, 2.4 Vitis HLS, 2.5 Vitis a xsdb, 2.6 VHDL a simulace,
2.7 pracovní prostředí s Ababelem, 2.8 testovací řetězec v hrubých rysech).

1. **Počet DSP:** 1 248 (výpis využití Vivada finálního bitstreamu, sloupec Available); celkem 117 120 LUT, 234 240 FF,
   144 BRAM36, 64 URAM. V textu doplněno, citovat datasheet K26 (podklad pro Citace PRO v komentáři).
2. **Odstavec „Problém s 2023 a 2025“ (board files):** vypustit. Místo něj obecný odstavec o zkušenosti (bod 3).
3. **Zkušenost s učením:** ano. Problémy mezi verzemi 2023 a 2025, grafické prostředí Vitis často padá, nejspolehlivější
   je konzolový přístup, na který bylo stejně nutné přejít, protože většina překladů a sestavení běžela na Ababelu.
   Jako konkrétní příklad přechod na SDT ve Vitis 2025.2 (`xtime_l.h` → `xiltimer.h`), už je v oddílu 2.5.
4. **Vitis a xsdb:** samostatný oddíl 2.5.
5. **Ababel:** v kapitole 2 (oddíl Pracovní prostředí a pomůcky), kvůli reprodukovatelnosti.
6. **Obrázek metodiky (`doc/methodology.png`):** převzatý ze stránky AMD Vitis HLS („Vitis HLS programming model“),
   citovat `amd_vitis` v popisku.
