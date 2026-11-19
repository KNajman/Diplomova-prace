# Podklady k oddílu o syntéze mimo kontext (OOC) – pro Karlův text (19. 11. 2026)

Text píše Karel (stanovisko vedoucího 17. 11.). Tady jsou jen body, čísla a odkazy na podklad. Současný krátký oddíl
je v kap. 4 (`04_navrh_a_metodika.md`, `{#sec:ooc}`); navrhuji ho rozšířit na samostatný oddíl kap. 4.

## Navržená osnova (5 odstavců + 1 obrázek + 1 tabulka)

| odstavec | co má říct | podklad, čísla |
| --- | --- | --- |
| 1 Co je OOC | jedno jádro se syntetizuje, rozmístí a propojí samo, bez zbytku návrhu; porty se nepřipojí na piny, nevloží se IO buffery; jediné omezení jsou hodiny | `ooc_impl.tcl`: `synth_design -mode out_of_context`, `create_clock -period 5.000 [get_ports aclk]` |
| 2 Proč ho používám | (a) čísla nezávisí na okolí, (b) stejné podmínky pro HLS i VHDL, (c) rychlost: minuty na jádro místo celého bitstreamu, takže se dá optimalizovat v rychlých smyčkách | příklad okolí: `hls_hsv2rgb` OOC rezerva 0,95 až 1,0 ns, v řetězci 0,10 ns (22. 10.) a 0,23 ns (25. 10.) a kritická cesta celého řetězce (V11, V12, V22); 3 konfigurace mediánu OOC za 5 min (běh 2026-11-17_1422) |
| 3 Jak jsem ho používal | stejný Tcl skript pro VHDL i pro RTL z HLS; konfigurace = top + generika (název výstupu z nich); seznam 28 konfigurací; 4 běhy paralelně na Ababelu; výsledky sbírá skript do CSV, z něj se generují tabulky kap. 6 | `ooc_impl.tcl`, `ooc_impl_hls.tcl`, `ooc_all.txt`, `collect_vhdl.py`, `tabulky_06.py`; fronty `vhdl_ooc_all_v3` (28 konfigurací za 12 min, 4 paralelně) |
| 4 Maximální frekvence | perioda = max(5 − WNS, 5 − WPWS); vysvětlit WNS a WPWS; minimální perioda BRAM 3,077 ns a DSP 3,262 ns; export Vitis HLS počítá jen WNS | rovnice `eq:perioda` (už v kap. 4); histogram: export HLS 2,73 ns, OOC 3,08 ns (V9) |
| 5 Omezení a spolehlivost | OOC neobsahuje propojení AXI, DMA ani okolní logiku, prázdný obvod = optimističtější směrování; deterministické (stejný kód → stejný výsledek), ale po změně kódu rozptyl rozmístění ±0,2 až 1 ns; příkon jen odhad bez simulované aktivity | 18 z 28 konfigurací identických do ps mezi běhy (V25); obálky s registrovou bankou 3,86 až 4,31 ns (V14, V23); `report_power` vektorově neřízený |

**Obrázek (návrh):** vlevo jádro v celém řetězci (VDMA, přepínače, procesor, sousední jádra sdílejí směrování),
vpravo totéž jádro samotné v OOC (jen hodiny 5 ns, porty bez pinů). Nakreslím v TikZ, pokud chceš.

**Tabulka (návrh):** příklady, kdy OOC řídil optimalizaci – vždy „změna → čísla před/po → za kolik minut“:
CSC v1 → v3 (325 → 210 LUT, 3,70 → 3,26 ns, V2), `G_USE_DSP` u HSV → RGB (603 → 203 LUT, 3,54 → 3,26 ns, V13),
medián `sort3` (590 → 549 LUT, V23), `window_gen` v3 (konvoluce 7×7 4,00 → 3,26 ns, medián 4,31 → 3,55 ns, V24, V25).

## Pojmy (slovníček dp-styl)

- out-of-context synthesis → syntéza mimo kontext (OOC) – zkratku vysvětlit při prvním použití
- place & route → rozmístění a propojení; slack (WNS) → časová rezerva; pulse width → minimální šířka pulzu hodin

## Citace (TODO, podklady do Citace PRO)

- AMD UG901 *Vivado Design Suite User Guide: Synthesis* – režim out-of-context (`-mode out_of_context`); ověřit číslo
  verze 2025.2 a kapitolu.
- AMD UG906 *Design Analysis and Closure Techniques* – WNS, pulse width (report_timing_summary); ověřit.
- AMD UG573 (BRAM) a UG579 (DSP) nebo datasheet DS925 (Zynq UltraScale+ AC/DC) – minimální perioda 3,077 / 3,262 ns;
  ověřit, ve kterém dokumentu jsou hodnoty pro -2LV.

---
Text kapitoly

## OOC - out of context syntéza

Jedná se o (metodu?) kdy se jádro samostaně syntetizuje, nazávisle na tom jak bude v budoucnu zapojeno, neřeší se tedy žádná řežije čtení nebo zápisu, jen funkcionalita. Jedinná závislost je na časování.

```script
```

### Důvody k užití

Výsledek je nezavislý na předchozím zpracování, ani na chybách. Slouží k odladění, zachycení chyb, bootlenecků(český ekvivalent?) lokalizaci kritické cesty, časování, upravám. A udájům o odhadovaných prostředcích a spotřebě .**Přenosnost** Testovací jednotka lze také ověřit i pro jiné způsoby architektury, hypotézy, já ji používa pro ověření jak VHDL tak syntézy z HLS.

[obrazek v Tikz]



### Optimalizační parametry

- **G_USE_DSP**
-
-

[tabulka]