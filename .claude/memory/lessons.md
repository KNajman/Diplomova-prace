# Poučení a záludnosti (aktualizovat, nejnovější nahoru)

## Vitis HLS 2025.2
- **Stream musí být `ap_axiu`** (`hlsv::axis_t`). Vlastní struct + `AGGREGATE` zabalí TUSER/TLAST do TDATA → nefunguje s VDMA/VFB.
- **`ap_ctrl_none` + skalární `s_axilite` registry → cosim visí** ("0/24576", "non-self-synchronizing top I/O"). Řešení: `ap_ctrl_hs`, jedno volání = jeden řádek, v HW auto-restart (0x81 na 0x00). Režie ~10 taktů/řádek (~0,5 % při 1080p).
- `v++ -c --mode hls` IP nezabalí → navíc `vitis-run --mode hls --package`.
- `export_impl.rpt` (2025.2): perioda v tabulce `| Post-Route | 3.847 |`, splnění `* Timing was met`, prostředky `LUT:  407` atd. (parser v `collect_reports.py` opraven 15. 10.).
- Odhad HLS vs. impl se výrazně liší (CSC: est 3,10 ns / 791 LUT, impl 3,85 ns / 407 LUT) → do DP jen `impl_*`.
- Cesty v `hls_config.cfg` relativní k adresáři .cfg, skripty dělají `pushd`.

## Golden model / aritmetika
- RGB→šedá: Q3.14 dávala ±1 vůči OpenCV u 0,26 % barev → **Q2.15** + dorovnání řádku metodou největšího zbytku = bitová shoda na 2^24.
- `-DNDEBUG` vypnul `assert` → unused-param s `-Werror`. `IMGPROC_ASSERT` je proto vždy aktivní (`abort()`).
- Pořadí složek UG934: TDATA[7:0] = **G**, [15:8] = B, [23:16] = R. Používat `IMGPROC_RGB_IDX_*`.

## Repo / nástroje
- `.gitignore` vzor `hls/` omylem ignoroval `DP/hls/` → správně `/DP/Vitis/**/hls/`. Vzory kotvit lomítkem.
- Whitelist `.gitignore` sledoval 1,2 GB a vynechal text DP → blacklist.
- `.gitattributes`: `*.sh/*.tcl/*.cfg` LF (jinak bash na Ababelu padá na `\r`), `*.bat` CRLF.
- Makefile a `.vscode/` jsou pro zápis z Cowork chráněné → dodat jako snippet, Karel vloží.
- Git ve VM (device_bash) potřebuje povolené mazání v `D:\Repos\_DP` (lock soubory); identita přes `git -c user.name=Karel_Najman -c user.email=karel.najman@tul.cz`.
- VS Code CMake si vybral kit z `kria_passthrough` → nastavit kit/`cmake.sourceDirectory` na `DP/model`.
