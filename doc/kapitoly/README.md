# Kapitoly diplomové práce v Markdownu

Kapitoly se **píšou a upravují zde jako Markdown** (`doc/kapitoly/NN_nazev.md`). Do LaTeXu se převádějí až nakonec
skriptem `doc/tools/md2tex.py`, výsledek jde do `doc/kapitoly/tex/NN_nazev.tex` a z `doc/DP.tex` se vkládá příkazem
`\input{kapitoly/tex/NN_nazev}`. Soubory `tex/*.tex` jsou **generované**: needitovat, opravy dělat v `.md` a převod
spustit znovu. Obrázky, vzorce se složitou sazbou a další úpravy se doplňují až v LaTeXu.

## Postup

1. Upravit `doc/kapitoly/NN_nazev.md`.
2. Převést: `python doc/tools/md2tex.py doc/kapitoly/NN_nazev.md` (nebo `python doc/tools/md2tex.py --all`).
3. Přeložit `doc/DP.tex` (XeLaTeX + biber), zkontrolovat chyby a nedefinované odkazy.

## Konvence zápisu

| co | jak se píše v Markdownu | výsledek v LaTeXu |
| --- | --- | --- |
| kapitola, oddíl, pododdíl | `# Název`, `## Název`, `### Název` | `\chapter`, `\section`, `\subsection` |
| návěští nadpisu | `## Název {#sec:model}` na konci řádku | `\label{sec:model}` |
| odstavec | prázdný řádek mezi odstavci | totéž |
| odrážky | řádky začínající `- ` | `itemize` |
| tučně, kurzívou | `**tučně**`, `*kurzívou*` | `\textbf`, `\emph` |
| kód, názvy souborů | `` `lib_imgproc` `` | `\texttt{lib\_imgproc}` |
| matematika v textu | `$Q_{2.15}$` | beze změny, `×` uvnitř se převede na `\times` |
| zobrazená rovnice | `$$ ... $$ {#eq:id}` (jeden blok bez prázdných řádků) | `equation` s `\label` |
| zkratka | `@ac(FPGA)`, krátký tvar `@acs(FPGA)` | `\ac{FPGA}`, `\acs{FPGA}` |
| odkaz na kapitolu, oddíl, tabulku | `@ref(sec:model)` (mezeru před ním převodník změní na nezlomitelnou) | `~\ref{sec:model}` |
| citace | `@cite(klic)` | `~\cite{klic}` |
| tabulka | řádek `Tabulka: Popisek {#tab:id widths=3.3,5.2,5.2}`, pod ním tabulka v Markdownu (sloupce oddělené svislou čarou) | `table` s `booktabs`, sloupce `p{...cm}` |
| komentář, úkol | `<!-- TODO(citace): ... -->` | `% TODO(citace): ...` |

Převodník doplňuje sám:

- nezlomitelnou mezeru za jednopísmennými slovy (k, s, v, z, o, u, a, i),
- tenkou mezeru kolem `×` mezi čísly (`1920 × 1080`), před jednotkou (`5 ns`, `200 MHz`, `100 µs`, `36 Kb`) a před `%`,
- escapování znaků `&`, `%`, `#`, `_` v textu a v kódu.

V Markdownu se tedy píše běžným způsobem (`5 ns`, `v kapitole`), bez `~` a bez `\,`.

## Co převodník neumí

Obrázky, výpisy kódu (`lstlisting`), vnořené seznamy, poznámky pod čarou a vícestránkové tabulky. Tyto prvky se vkládají
až do vygenerovaného nebo sloučeného LaTeXu, případně se doplní do převodníku, až budou potřeba.

## Pravidla textu

Text kapitol se řídí skilly `dp-styl` (jazyk), `dp-kapitola` (stavba) a `dp-latex` (sazba, odkazy); citace přidává Karel
do `doc/citace.bib` z Citace PRO, v textu zůstávají jen klíče nebo `TODO(citace)`.

## Stav kapitol

| kapitola | soubor | stav |
| --- | --- | --- |
| 4 Návrh a metodika srovnání | `04_navrh_a_metodika.md` | napsáno (6 stran), čeká na revizi |
| 6 Výsledky a srovnání | `06_vysledky_a_srovnani.md` | tabulky z CSV (`doc/tools/tabulky_06.py`), text 6.1–6.5 první návrh, 6.6 v bodech |
