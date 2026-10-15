#!/usr/bin/env bash
# =============================================================================
#  Simulace VHDL testbenche ve Vivado xsim (VHDL-2008) - finální ověření.
#  Použití:  bash run_xsim.sh <tb_entita> [GENERIC=hodnota ...]
#  Příklad:  bash run_xsim.sh tb_csc G_PRESET=1 G_VALID_PCT=50 G_READY_PCT=50
#  Předpoklad: source settings64.sh, vektory vygenerované (tb/gen_vectors.sh).
#  Návratový kód 0 jen když testbench vypíše PASS.
# =============================================================================
set -uo pipefail
TB="$1"; shift
HERE="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$HERE/build/xsim"
mkdir -p "$WORK" && cd "$WORK"
ln -sfn "$HERE/tb/data" data
shopt -s nullglob
# Pořadí překladu: balíčky, společné bloky, jádra, top-level obálky (*_axil), testbenche
RTL=( "$HERE"/*/rtl/*.vhd )
CORE=(); TOP=()
for f in "${RTL[@]}"; do case "$f" in *_axil.vhd) TOP+=( "$f" );; *) CORE+=( "$f" );; esac; done
# společné bloky: nejdřív balíček a bloky bez závislostí, pak ostatní (window_gen používá line_buffer)
COMMON_FIRST=( video_pkg axis_skid_buffer axil_regbank line_buffer )
COMMON=()
for name in "${COMMON_FIRST[@]}"; do COMMON+=( "$HERE/common/$name.vhd" ); done
for f in "$HERE"/common/*.vhd; do
    case " ${COMMON_FIRST[*]} " in *" $(basename "$f" .vhd) "*) ;; *) COMMON+=( "$f" );; esac
done
SRC=( "$HERE"/../model/generated/imgproc_coeffs_pkg.vhd "${COMMON[@]}" "${CORE[@]}" "${TOP[@]}" "$HERE"/tb/*.vhd "$HERE"/*/tb/*.vhd )
GEN=()
for g in "$@"; do GEN+=( -generic_top "$g" ); done
SNAP="${TB}_$(echo "$*" | tr ' =' '__')"
xvhdl --2008 --nolog "${SRC[@]}" > xvhdl.log 2>&1 || { tail -20 xvhdl.log; exit 1; }
xelab --nolog --relax -debug off "${GEN[@]}" -s "$SNAP" "$TB" > xelab.log 2>&1 || { tail -20 xelab.log; exit 1; }
xsim --nolog "$SNAP" -R > "$SNAP.log" 2>&1
grep -E "VYSLEDEK|Error:|Failure" "$SNAP.log" | head -5
grep -q "VYSLEDEK.*PASS" "$SNAP.log"
