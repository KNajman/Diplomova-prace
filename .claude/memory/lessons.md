# Poučení a záludnosti (aktualizovat, nejnovější nahoru)

## Vitis 2025.2 bare-metal (SDT)
- **`xtime_l.h` v exportu platformy není** (jen v `bsp/libsrc/standalone/...`, mimo include cesty aplikace). `XTime`, `XTime_GetTime()` a `COUNTS_PER_SECOND` jsou v `<xiltimer.h>` (`COUNTS_PER_SECOND` = `XPAR_CPU_TIMESTAMP_CLK_FREQ` přes `xtimer_config.h`). Včas se to ukáže až při překladu aplikace (fronta `sw_app`, 19. 10. spadla na všech 3 úrovních).
- **Rychlá předkontrola zdrojů bez spuštění Vitisu:** na Ababelu `aarch64-none-elf-gcc -fsyntax-only -DSDT -DSW_OPT_LEVEL=O2 -I<src_staging> -isystem <platforma>/export/harness_platform/sw/standalone_a53/include main.c` (staging zůstane po předchozím běhu v `DP/sw/build/src_staging`). Jedno ssh, vteřiny místo minut.
- `vitis -s` vrací 0 i při chybě překladu aplikace; `build_app.py` proto končí `sys.exit()` při chybějícím ELF (fronta pak vidí chybu).

## Vitis HLS 2025.2
- **C-sim neověří časování pipeline.** Histogram s technikou UG1399 (přičítání v registru, závislost přes BRAM nechaná na HLS) prošel csim, ale cosim ztrácela pixely u vzorů a,b,a. Řešení: explicitní forwarding posledních 3 zápisů + `DEPENDENCE inter false`; TB musí mít vzory s opakováním po 1–4 px. U všech jader s RMW do paměti spouštět cosim, ne jen csim.
- **Stream musí být `ap_axiu`** (`hlsv::axis_t`). Vlastní struct + `AGGREGATE` zabalí TUSER/TLAST do TDATA → nefunguje s VDMA/VFB.
- **`ap_ctrl_none` + skalární `s_axilite` registry → cosim visí** ("0/24576", "non-self-synchronizing top I/O"). Řešení: `ap_ctrl_hs`, jedno volání = jeden řádek, v HW auto-restart (0x81 na 0x00). Režie ~10 taktů/řádek (~0,5 % při 1080p).
- `v++ -c --mode hls` IP nezabalí → navíc `vitis-run --mode hls --package`.
- `export_impl.rpt` (2025.2): perioda v tabulce `| Post-Route | 3.847 |`, splnění `* Timing was met`, prostředky `LUT:  407` atd. (parser v `collect_reports.py` opraven 15. 10.).
- Odhad HLS vs. impl se výrazně liší (CSC: est 3,10 ns / 791 LUT, impl 3,85 ns / 407 LUT) → do DP jen `impl_*`.
- Cesty v `hls_config.cfg` relativní k adresáři .cfg, skripty dělají `pushd`.

## VHDL (GHDL 4.1 / xsim)
- **Karlova pravidla návrhu:** šířky součinů/součtů vždy vzorcem (Wa+Wb, max(W)+clog2(N)), žádné ručně spočítané konstanty; maximální pipeline – každá operace za registrem, skalární součin jako pipeline DSP (sekvenční zpracování) (ne 3 součiny v jednom taktu + strom sčítaček: v1 CSC = 12 DSP, v pipeline 9).
- Řetězce v `report` jen ASCII/Latin-1 (diakritika v UTF-8 = chyba v GHDL i xsim). Komentáře s diakritikou nevadí.
- Podmíněný výraz `'1' when c else '0'` jako parametr procedury nebo uvnitř výrazu je až VHDL-2019 → přes proměnnou nebo funkci.
- VHDL se vyvíjí v cloudu (GHDL, `DP/vhdl/scripts/run_ghdl.sh`), vektory generuje `tb/gen_vectors.sh` z golden modelu na Karlově PC, finální ověření xsim na Ababelu.

## Golden model / aritmetika
- RGB→šedá: Q3.14 dávala ±1 vůči OpenCV u 0,26 % barev → **Q2.15** + dorovnání řádku metodou největšího zbytku = bitová shoda na 2^24.
- `-DNDEBUG` vypnul `assert` → unused-param s `-Werror`. `IMGPROC_ASSERT` je proto vždy aktivní (`abort()`).
- Pořadí složek UG934: TDATA[7:0] = **G**, [15:8] = B, [23:16] = R. Používat `IMGPROC_RGB_IDX_*`.

## Repo / nástroje
- **device_commit_files: pro každý přenos nová (unikátní) složka v /mnt/user-data/outputs/** (např. `stage_HHMMSS/`).
  Při opakovaném použití stejné cesty se 2× odeslal starý obsah (regbank v3, TB HSV 15. 10.). Po zápisu vždy `grep` ověřit obsah na disku.
- **Karel má soubory otevřené ve VS Code (Sigasi formátuje).** Před úpravou souboru vždy vzít aktuální verzi z disku (ne starou kopii v cloudu), po zápisu ověřit obsah (`grep`), commitovat jen své soubory. Zápis souboru a příkaz, který ho používá, nikdy nespouštět paralelně.
- Ababel: firewall omezuje počet nových SSH spojení (zablokování portu 22 po smyčce ssh co 10 s). ControlMaster + čekání v jednom spojení (viz ababel.md).
- `.gitignore` vzor `hls/` omylem ignoroval `DP/hls/` → správně `/DP/Vitis/**/hls/`. Vzory kotvit lomítkem.
- Whitelist `.gitignore` sledoval 1,2 GB a vynechal text DP → blacklist.
- `.gitattributes`: `*.sh/*.tcl/*.cfg` LF (jinak bash na Ababelu padá na `\r`), `*.bat` CRLF.
- Makefile a `.vscode/` jsou pro zápis z Cowork chráněné → dodat jako snippet, Karel vloží.
- Git ve VM (device_bash) potřebuje povolené mazání v `D:\Repos\_DP` (lock soubory); identita přes `git -c user.name=Karel_Najman -c user.email=karel.najman@tul.cz`.
- VS Code CMake si vybral kit z `kria_passthrough` → nastavit kit/`cmake.sourceDirectory` na `DP/model`.
- Dvě fronty se xsim nesmí běžet souběžně: `build/xsim` (knihovna xsim.dir) a `tb/data` jsou sdílené. Paralelně jen fronty bez xsim/gen_vectors (např. čisté OOC). Úprava: per-TB WORK v run_xsim.sh – měnit jen když žádná fronta neběží (bash čte skript průběžně).
- `ababel.sh stop` zabíjel jen přímé potomky fronty: běhy Vivada z `launch_runs` (synth_1/impl_1) přežily a zapisovaly do projektu souběžně s novým během → poškozený `harness.xpr` ("XML parser ... Not well formed"). Stop teď zabíjí celou session (`pkill -s`) a vypíše zbylé procesy z `DP/*/build`.
- Sigasi lint: 238 (neúplný reset) u datových registrů je záměr (reset jen řídicích; platnost dat nese valid, po resetu je vstupní skid prázdný) – ověřuje `tb_filter2d_reset`. 71 „dead state“ je falešné, když přechod je za `case` přes proměnnou. 236 hlásí i `integer`/`natural` proměnné ve funkcích (simulace, ne hardware). Klíče pravidel nejsou zdokumentované → nastavovat v GUI (Project Settings → Linting) a číst `.settings/com.sigasi.hdt.vhdl.linting.prefs`.
- Xsim na Windows: `xelab -generic_top G=1` se v obalu rozdělí na `G 1` → generic předat přes soubor `-f args.f` (řádek `-generic_top "G=1"`). Lokální `tb/data` generovat `gen_vectors.sh` (golden CLI v `DP/model/build` je Linux ELF → pro Windows přeložit gcc do scratchpadu, `make` tam není).
