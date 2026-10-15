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
SRC=( "$HERE"/../model/generated/imgproc_coeffs_pkg.vhd "$HERE"/common/*.vhd "$HERE"/*/rtl/*.vhd "$HERE"/tb/*.vhd "$HERE"/*/tb/*.vhd )
GEN=()
for g in "$@"; do GEN+=( -generic_top "$g" ); done
SNAP="${TB}_$(echo "$*" | tr ' =' '__')"
xvhdl --2008 --nolog "${SRC[@]}" > xvhdl.log 2>&1 || { tail -20 xvhdl.log; exit 1; }
xelab --nolog --relax -debug off "${GEN[@]}" -s "$SNAP" "$TB" > xelab.log 2>&1 || { tail -20 xelab.log; exit 1; }
xsim --nolog "$SNAP" -R > "$SNAP.log" 2>&1
grep -E "VYSLEDEK|Error:|Failure" "$SNAP.log" | head -5
grep -q "VYSLEDEK.*PASS" "$SNAP.log"
