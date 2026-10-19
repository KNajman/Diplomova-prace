# CLAUDE.md – Diplomová práce Karla Najmana

Pracovní paměť pro Claude (Cowork i Claude Code). Načti na začátku každé session.
Podrobnosti jsou v `.claude/memory/`, plán a průběh v `plan_dokonceni_DP.md` (jediný zdroj pravdy pro plán).

## Projekt
- **Téma:** Implementace vybraných algoritmů zpracování obrazu v hradlovém poli (TUL, FM/ITE).
- **Odevzdání: 15. 1. 2027.** Milníky: M1 15. 11., M2 13. 12., částečný draft kap. 1–5 Rozkovcovi do 18. 12., plný draft přes svátky.
- **Vedoucí:** Ing. Martin Rozkovec, Ph.D. (e-mail + osobní konzultace). Claude = druhý vedoucí / konzultant.
- **Cíl:** HLS × VHDL × SW (C na Cortex-A53) implementace stejných algoritmů na AMD KV260, bitově shodné s golden C modelem, férově změřené (OOC 5 ns) a porovnané.

## Karel
- Bc. Karel Najman, student TUL (karel.najman@tul.cz), pracuje v Jablotronu (karel.najman@jablotron.cz). Komunikace česky.
- Kapacita: ~2 dny v týdnu + večery. Odhady v MD, ne v hodinách.
- **Jednoduché kroky dělá sám** ve svém prostředí (rychlejší, šetří tokeny). Claude připravuje infrastrukturu, referenční implementace, opravy a review.
- V kódu má rád **komentáře vysvětlující návrhová rozhodnutí** ("Poznámka k volbě …").
- **Samopopisný kód:** názvy signálů, proměnných a konstant říkají, co obsahují (`product0`, `sum01`, `in_pixel1_dly1`, `pipe_enable`, `golden_data`), žádné zkratky typu `m0`, `p1`, `rd`, `n`, `x_r`. Konvenční indexy smyček jen tam, kde je význam zřejmý (`x`, `y` = souřadnice); jinak `out_ch`, `in_ch`, `reg_idx`.
- **VHDL:** šířky vždy vzorcem (Wa+Wb, max(W)+clog2(N)), maximální pipeline (každá operace za registrem). Formátování/zarovnání řeší Sigasi ve VS Code – neztrácet čas zarovnáváním.
- C/C++ podle **Jablotron C standardu** (skill `jablotron-c-standard`), odchylky jen zdůvodněné v komentáři.
- Notebook: Windows, 12 GB RAM (velké Vivado běhy → Ababel), VS Code, clang/MinGW/MSVC, Vitis/Vivado 2025.2, Git for Windows (má uložené GitHub credentials), WinSCP + PuTTY + Pageant, VPN TUL.
- Text DP: LaTeX `tulthesis`, lokální TeX Live, `Diplomová_práce/DP.tex`.

## Jak pracujeme
- **Opakované příkazy ukládat jako šablony/skripty** (`.claude/scripts/`, `DP/scripts/queues/`), negenerovat je pokaždé znovu.
- **Na Ababel čeká Karel, ne Claude.** Po spuštění fronty nikdy `sleep`/čekání ani kontrolní dotazy – čas hned využít na další implementaci; Karel dá vědět, až fronta doběhne.
- **Běhy na Ababelu: spustit na pozadí a nechat běžet, NEdotazovat se průběžně.** Karel se může připojit a dá vědět, až výsledek doběhne (případně Claude zkontroluje jednou po odhadnuté době). Šetří to SSH spojení (firewall) i tokeny.
- **Po spuštění jobu na Ababelu vždy na konec odpovědi bash příkaz pro sledování** (např. `tail -f ~/logs/vqueue.log`, Ctrl+C ukončí jen výpis).
- **Během delší práce průběžné reporty** (SendUserMessage): co je hotovo, co se pokazilo, co se chystá. Ne až na konci.
- Kód píše Claude (Sonnet pro rutinu), Karel spouští a kontroluje. Každé jádro: csim → syn → cosim → impl, výsledky do `DP/hls/results/hls_results.csv`.
- **Ababel** (výpočetní server ITE): Claude se připojuje sám přes SSH z device_bash, viz `.claude/memory/ababel.md` a skill `.claude/skills/ababel-hls`.
- **Git:** zdroj pravdy = lokální repo na notebooku (`D:\Repos\_DP`, větev `main`). Claude commituje lokálně (autor `Karel_Najman <karel.najman@tul.cz>` přes `git -c`) a na Ababel synchronizuje přes SSH fast-forward (viz ababel.md).
- **GitHub (`KNajman/Diplomova-prace`) se NEudržuje průběžně** – pushuje se jen při velkých milnících (rozhodnutí Karla 15. 10.). Claude push nepřipomíná po každém commitu; při milníku (hotová skupina jader, M1, M2, draft) se Karla zeptá, jestli pushnout. Push dělá Karel z Windows (VM ani Ababel nemají credentials). Na Ababelu nikdy `git pull` z GitHubu – stav by byl starší než notebook.
- Nikdy necommitovat klíče, hesla, velké binárky (`.bit`, `.xsa`, `runs/`, zip). `.gitignore` je blacklist.
- **Každé srovnání / tabulka výsledků → `DP/results/vysledky.md`** (tabulka + konfigurace + poznatky + zdroj dat), surová čísla zůstávají v CSV.
- Po každé větší práci: zápis do sekce **Průběh** v `plan_dokonceni_DP.md`, nové poučení do `.claude/memory/lessons.md`.

## Kde co je
| Cesta | Obsah |
|---|---|
| `plan_dokonceni_DP.md` | plán, rozhodnutí, priority, harmonogram, konzultace, průběh |
| `DP/model/` | golden C model `lib_imgproc` (CMake + Makefile), generátor konstant, CLI, test proti OpenCV |
| `DP/model/generated/` | `imgproc_coeffs.h` + `imgproc_coeffs_pkg.vhd` – konstanty NIKDY neopisovat ručně |
| `DP/hls/` | nová HLS jádra (README = pravidla + postup převodu), `scripts/` run_hls.sh/.bat, build_all.sh, collect_reports.py |
| `DP/hls/results/hls_results.csv` | výsledky (verzováno), do tabulek DP jen `impl_*` |
| `DP/results/vysledky.md` | **deník výsledků** – tabulky s interpretací pro kap. 6 |
| `DP/Vitis/`, `DP/Vivado/` | původní HLS/VHDL projekty (postupně nahrazovat) |
| `Diplomová_práce/` | text DP (LaTeX), `citace.bib` |
| `.claude/memory/` | `ababel.md` (připojení a běhy), `lessons.md` (poučení a záludnosti), `decisions.md` (rychlý výtah rozhodnutí) |
| `.claude/skills/` | projektové skilly (`ababel-hls`) |
| `.claude/scripts/ababel.sh` | **šablony příkazů pro Ababel** (sync, start/status/stop fronty, fetch) |
| `DP/scripts/queues/*.queue` | fronty běhů na Ababelu (spouští `DP/scripts/ababel/run_queue.sh`) |

## Skilly
- Projektové: `ababel-hls` – spuštění HLS kroku na Ababelu, sběr výsledků, sync repa.
- Účtové (claude.ai): `jablotron-c-standard` (C/C++), `grill-me` (/grill-me – výslech plánu).

## Aktuální stav (aktualizuj)
- HLS hotovo (csim/cosim/impl PASS): CSC, histogram, medián 3x3, filter2d 3x3/5x5/7x7 (šablona `hls_window.hpp`). Výsledky `DP/hls/results/hls_results.csv`.
- HLS prahování převedeno z `DP/Vitis` do `DP/hls/threshold` (19. 10., mapa = VHDL). HLS zbývá (Karel podle README): rgb2hsv, hsv2rgb. Staré `DP/Vitis/hls_threshold`, `hls_histogram`, `filter_2d*` jsou nahrazené (nic se z nich nepoužívá).
- VHDL (`DP/vhdl`) vše hotové a ověřené (xsim + OOC): CSC v3, RGB↔HSV, medián, konvoluce K×K (mapa K≥5 jako HLS: okno coeff),
  histogram (`G_USE_BRAM`: BRAM + forwarding / 256 čítačů), prahování. `axil_regbank`: paměťové okno (čtení i zápis s WSTRB),
  registry za oknem. Srovnání v `DP/results/vysledky.md` sekce 1–8.
- Testovací řetězec: `DP/hw/harness/build_harness.tcl` (VDMA, AXIS přepínače RGB + šedá větev, bypass port 0, 200 MHz, chybějící
  HLS IP přeskočí), VHDL IP balí `DP/vhdl/scripts/package_ip.tcl` (vygenerovaná obálka s pevnými šířkami). Generuje
  `DP/hw/build/harness/harness_map.h` (adresy + porty). Fronty `hw_ip` → `hw_harness` → `sw_app`.
- Měřicí aplikace `DP/sw/harness_app` (bare-metal A53, přímé registry, VDMA v režimu počtu snímků, golden lib_imgproc na ARM,
  CSV na UART), build `build_app.py` (Vitis Python API, -O0/-O2/-O3). Na desce zatím nevyzkoušeno.
- Další: test na desce (Karel), HLS point jádra (Karel), text. Otevřené: metodika Fmax (WPWS u HLS), `axil_addr_w` má min. 8 b (HLS má
  přesnou šířku, např. medián 6 b) – kosmetické, sjednotit při příležitosti.
