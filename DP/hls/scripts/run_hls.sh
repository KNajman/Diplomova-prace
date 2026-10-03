#!/usr/bin/env bash
# =============================================================================
#  Spuštění Vitis HLS 2025.2 (unified CLI) pro jednu komponentu bez GUI - Linux / Ababel
#
#  Použití:  ./run_hls.sh <cesta/k/hls_config_*.cfg> [csim|syn|cosim|all]
#  Příklad:  ./run_hls.sh ../csc/hls_config_rgb.cfg all
#
#  Předpoklad: nastavené prostředí Vitis, např.
#     source /tools/Xilinx/2025.2/Vitis/settings64.sh
#  Výstupy:  DP/hls/build/<jádro>_<varianta>/   (pracovní adresář, ignorován gitem)
#            DP/hls/ip_repo/<ip>.zip            (zabalené IP pro Vivado)
# =============================================================================
set -euo pipefail

if [[ $# -lt 1 ]]; then
    sed -n '3,15p' "$0"; exit 1
fi

CFG="$(realpath "$1")"
STEP="${2:-all}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HLS_DIR="$(dirname "$SCRIPT_DIR")"
CORE="$(basename "$(dirname "$CFG")")"
VARIANT="$(basename "$CFG" .cfg | sed 's/^hls_config_\{0,1\}//')"
WORK="$HLS_DIR/build/${CORE}${VARIANT:+_$VARIANT}"
IP_REPO="$HLS_DIR/ip_repo"

mkdir -p "$WORK" "$IP_REPO"
cd "$(dirname "$CFG")"          # relativní cesty v .cfg jsou vůči adresáři konfigurace

run_csim()  { echo "== C simulace: $CFG";   vitis-run --mode hls --csim  --config "$CFG" --work_dir "$WORK"; }
run_syn()   { echo "== Syntéza + IP: $CFG"; v++ -c --mode hls --config "$CFG" --work_dir "$WORK"
              find "$WORK" -path '*impl/ip/*.zip' -exec cp -v {} "$IP_REPO/" \; ; }
run_cosim() { echo "== C/RTL cosim: $CFG";  vitis-run --mode hls --cosim --config "$CFG" --work_dir "$WORK"; }

case "$STEP" in
    csim)  run_csim ;;
    syn)   run_syn ;;
    cosim) run_cosim ;;
    all)   run_csim; run_syn; run_cosim ;;
    *)     echo "Neznámý krok: $STEP (csim|syn|cosim|all)"; exit 1 ;;
esac
