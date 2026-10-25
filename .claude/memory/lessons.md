# Poučení a záludnosti (aktualizovat, nejnovější nahoru)

## Test na desce KV260, VDMA, xsdb (25. 10. 2026)
- **Zdrojem pravdy je výpis registrů, ne domněnka.** První tři hypotézy selhání (rychlost zápisů do VDMA, pauzy, čas startu jádra) byly špatně. Rozhodlo až půlení: zastavit A53 breakpointem těsně před/po startu přenosu a zkoušet stejný přenos z xsdb (v HW zastavený procesor = bez čtení registrů). Postup viz `DP/results/vysledky.md` sekce 16 a 17.
- **PS UART v platformě není povolený** (`build_harness.tcl` ho nezapíná, preset KV260 SOM ho nepovoluje): `RST_LPD_IOU2` drží UART0/1 v resetu, `STDOUT_BASEADDRESS = 0xfe800000` = CoreSight DCC. `printf` jde jen do JTAG. Nouzově: `xsdb run_board.tcl O2 dcc <s>` nebo `board_test.bat` (výchozí DCC), `readjtaguart -start` musí být před `con`. Trvale: `CONFIG.PSU__UART1__PERIPHERAL__ENABLE 1`, `IO {MIO 36 .. 37}` + nový bitstream.
- **xsdb a PL:** zápis do `0xA0000000..` z A53 cíle vyžaduje `memmap -addr 0xA0000000 -size 0x100000 -flags 3`, jinak „PL AXI slave ports access is not allowed“. Breakpoint v ELF: `bpadd -addr <adresa z nm/objdump>`, čekat smyčkou na `state`. Zápis do `.bss` proměnné před startem se při `rst -processor` smaže (startup nuluje bss) → nastavovat až po prvním breakpointu.
- **AXI VDMA (PG020) v bare-metal režimu:** S2MM s `FrameCntEn` nikdy nenastaví FrmCntIrq a nezastaví se (MM2S ano, po N snímcích se sám zastaví). S2MM nastaví FrmCntIrq (bit 12) až se SOF dalšího snímku → N snímků dá N−1 příznaků, jediný snímek příznak nedá. Bity DMASR: 4 VDMAIntErr, 5 SlvErr, 6 DecErr, 8 SOFEarly, 9 EOLEarly, 11 SOFLate, 12 FrmCnt, 14 ErrIrq, 15 EOLLate. MM2S DMASR[23:16] = čítač snímků; dokončení = bit0 Halted.
- **Měření propustnosti:** doba = start až zastavení MM2S, 50 snímků (krok čtení 2 ms = chyba pod 0,5 %). Čtení registrů ve smyčce rozbilo řádková HLS jádra (viz níže), proto se během přenosu čte jen MM2S jednou za 2 ms.
- **Windows:** `ssh` z Git Bash nepodporuje ControlMaster (`mux_client_request_session`) → v `~/.ssh/config` bez něj. Klíč `~/.ssh/id_ababel` (`claude-code@karel`), alias `ababel`, `rsync` v Git Bash chybí → `ababel.sh` má `scp` fallback, `ababel.sh board` stahuje celou složku export (padá na zamčených souborech, stahovat jednotlivě `harness.bit`, `psu_init.tcl`, `harness_app_O*.elf` do `workspace/.../build/`).
- **Terminál panelu:** xsdb se smyčkou čtení DCC drží JTAG, před dalším během tab zavřít (`stop_terminal_tab close`). Procesy na Ababelu zabíjet podle PID, ne podle názvu.
- **Zápis řetězců z nástrojů:** `
` v parametrech Edit/Python heredocu se změnil na skutečný CR LF a rozbil `printf` ("missing terminating"). U souborů se zápisem escape sekvencí do C používat bajty (`bytes([92])`) a po zápisu kontrolovat `repr()` řádku.

## Vitis 2025.2 bare-metal (SDT)
- **`xtime_l.h` v exportu platformy není** (jen v `bsp/libsrc/standalone/...`, mimo include cesty aplikace). `XTime`, `XTime_GetTime()` a `COUNTS_PER_SECOND` jsou v `<xiltimer.h>` (`COUNTS_PER_SECOND` = `XPAR_CPU_TIMESTAMP_CLK_FREQ` přes `xtimer_config.h`). Včas se to ukáže až při překladu aplikace (fronta `sw_app`, 19. 10. spadla na všech 3 úrovních).
- **Rychlá předkontrola zdrojů bez spuštění Vitisu:** na Ababelu `aarch64-none-elf-gcc -fsyntax-only -DSDT -DSW_OPT_LEVEL=O2 -I<src_staging> -isystem <platforma>/export/harness_platform/sw/standalone_a53/include main.c` (staging zůstane po předchozím běhu v `DP/sw/build/src_staging`). Jedno ssh, vteřiny místo minut.
- `vitis -s` vrací 0 i při chybě překladu aplikace; `build_app.py` proto končí `sys.exit()` při chybějícím ELF (fronta pak vidí chybu).

## Vitis HLS 2025.2
- **Řádkové HLS jádro (jedno volání = jeden řádek do TLAST, II=1, auto-restart) NESMÍ být „loop auto-rewind stp“ s latencí iterace > 2:** po TLAST čeká další iterace na vstup a zastaví pipeline, posledních 3–4 pixely řádku (i s TLAST) zůstanou v jádře do prvního pixelu dalšího řádku. Mezera mezi snímky se ztratí, S2MM hlásí SOFLateErr, ocas posledního snímku zůstane v jádře napořád. Oprava: `syn.compile.enable_auto_rewind=0` v `hls_config_*.cfg` (cena ~5 taktů na řádek). V csynth reportu kontrolovat typ smyčky (musí být „Pipeline: no“, ne „loop auto-rewind stp“). C-sim ani cosim to neodhalí – ověřovat xsim testbenchem s mezerou před snímkem, bublinami a zpětným tlakem. `ap_ctrl_none` jako náhrada nejde (cosim visí).
- **`run_hls.sh impl` je Vivado OOC implementace (měření timingu), ne export IP.** IP balí krok `syn` (`vitis-run --package`). Pro přestavbu harnessu stačí `syn`.
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
