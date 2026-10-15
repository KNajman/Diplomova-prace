#!/usr/bin/env bash
# =============================================================================
#  Rychlá simulace VHDL v GHDL (VHDL-2008) - vývoj mimo Vivado.
#  Použití:  bash run_ghdl.sh <tb_entita> [-gGENERIC=hodnota ...]
#  Finální ověření se dělá v xsim (Vivado 2025.2) na Ababelu - scripts/run_xsim.sh.
#  Spouští se z adresáře DP/vhdl/tb (cesty k datům jsou relativní).
# =============================================================================
set -euo pipefail
shopt -s nullglob
TB="$1"; shift
HERE="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$HERE/build/ghdl"
mkdir -p "$WORK"
SRC=( "$HERE"/../model/generated/imgproc_coeffs_pkg.vhd "$HERE"/common/*.vhd "$HERE"/*/rtl/*.vhd "$HERE"/tb/*.vhd "$HERE"/*/tb/*.vhd )
# -i + -m: GHDL si pořadí překladu (závislosti entit) zjistí sám
ghdl -i --std=08 --workdir="$WORK" "${SRC[@]}"
ghdl -m --std=08 --workdir="$WORK" "$TB" > /dev/null
ghdl -r --std=08 --workdir="$WORK" "$TB" "$@" --assert-level=failure 2>&1 | grep -E "VYSLEDEK|error|failure|TIMEOUT|Propustnost" || true
