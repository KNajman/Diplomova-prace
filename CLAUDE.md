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
- C/C++ podle **Jablotron C standardu** (skill `jablotron-c-standard`), odchylky jen zdůvodněné v komentáři.
- Notebook: Windows, 12 GB RAM (velké Vivado běhy → Ababel), VS Code, clang/MinGW/MSVC, Vitis/Vivado 2025.2, Git for Windows (má uložené GitHub credentials), WinSCP + PuTTY + Pageant, VPN TUL.
- Text DP: LaTeX `tulthesis`, lokální TeX Live, `Diplomová_práce/DP.tex`.

## Jak pracujeme
- **Běhy na Ababelu: spustit na pozadí a nechat běžet, NEdotazovat se průběžně.** Karel se může připojit a dá vědět, až výsledek doběhne (případně Claude zkontroluje jednou po odhadnuté době). Šetří to SSH spojení (firewall) i tokeny.
- **Po spuštění jobu na Ababelu vždy na konec odpovědi bash příkaz pro sledování** (např. `tail -f ~/logs/vqueue.log`, Ctrl+C ukončí jen výpis).
- **Během delší práce průběžné reporty** (SendUserMessage): co je hotovo, co se pokazilo, co se chystá. Ne až na konci.
- Kód píše Claude (Sonnet pro rutinu), Karel spouští a kontroluje. Každé jádro: csim → syn → cosim → impl, výsledky do `DP/hls/results/hls_results.csv`.
- **Ababel** (výpočetní server ITE): Claude se připojuje sám přes SSH z device_bash, viz `.claude/memory/ababel.md` a skill `.claude/skills/ababel-hls`.
- **Git:** zdroj pravdy = lokální repo na notebooku (`D:\Repos\_DP`, větev `main`). Claude commituje lokálně (autor `Karel_Najman <karel.najman@tul.cz>` přes `git -c`) a na Ababel synchronizuje přes SSH fast-forward (viz ababel.md).
- **GitHub (`KNajman/Diplomova-prace`) se NEudržuje průběžně** – pushuje se jen při velkých milnících (rozhodnutí Karla 15. 10.). Claude push nepřipomíná po každém commitu; při milníku (hotová skupina jader, M1, M2, draft) se Karla zeptá, jestli pushnout. Push dělá Karel z Windows (VM ani Ababel nemají credentials). Na Ababelu nikdy `git pull` z GitHubu – stav by byl starší než notebook.
- Nikdy necommitovat klíče, hesla, velké binárky (`.bit`, `.xsa`, `runs/`, zip). `.gitignore` je blacklist.
- Po každé větší práci: zápis do sekce **Průběh** v `plan_dokonceni_DP.md`, nové poučení do `.claude/memory/lessons.md`.

## Kde co je
| Cesta | Obsah |
|---|---|
| `plan_dokonceni_DP.md` | plán, rozhodnutí, priority, harmonogram, konzultace, průběh |
| `DP/model/` | golden C model `lib_imgproc` (CMake + Makefile), generátor konstant, CLI, test proti OpenCV |
| `DP/model/generated/` | `imgproc_coeffs.h` + `imgproc_coeffs_pkg.vhd` – konstanty NIKDY neopisovat ručně |
| `DP/hls/` | nová HLS jádra (README = pravidla + postup převodu), `scripts/` run_hls.sh/.bat, build_all.sh, collect_reports.py |
| `DP/hls/results/hls_results.csv` | výsledky (verzováno), do tabulek DP jen `impl_*` |
| `DP/Vitis/`, `DP/Vivado/` | původní HLS/VHDL projekty (postupně nahrazovat) |
| `Diplomová_práce/` | text DP (LaTeX), `citace.bib` |
| `.claude/memory/` | `ababel.md` (připojení a běhy), `lessons.md` (poučení a záludnosti), `decisions.md` (rychlý výtah rozhodnutí) |
| `.claude/skills/` | projektové skilly (`ababel-hls`) |

## Skilly
- Projektové: `ababel-hls` – spuštění HLS kroku na Ababelu, sběr výsledků, sync repa.
- Účtové (claude.ai): `jablotron-c-standard` (C/C++), `grill-me` (/grill-me – výslech plánu).

## Aktuální stav (aktualizuj)
- HLS hotovo (csim/cosim/impl PASS): CSC, histogram, medián 3x3 (+ šablona `hls_window.hpp` pro konvoluci). Výsledky v `DP/hls/results/hls_results.csv`.
- HLS zbývá: threshold, rgb2hsv, hsv2rgb (Karel podle README), filter2d (Claude, nad `hls_window.hpp`).
- VHDL (`DP/vhdl`): `video_pkg`, `axis_skid_buffer`, generický TB, `csc_core` (GHDL PASS). Zbývá: ověření v xsim + OOC impl na Ababelu, AXI4-Lite registrová banka, HSV, konvoluce, medián, (histogram P1, prahování P2).
- Další: testovací BD, SW měření, text.
