#!/usr/bin/env bash
# =============================================================================
#  Projde všechny komponenty DP/hls/*/hls_config*.cfg a spustí zvolený krok.
#  Použití:  ./build_all.sh [csim|syn|cosim|all]      (výchozí: all)
#  Na konci vypíše souhrn PASS/FAIL - vhodné spouštět na Ababelu přes noc (nohup).
# =============================================================================
set -uo pipefail
STEP="${1:-all}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HLS_DIR="$(dirname "$SCRIPT_DIR")"
LOG_DIR="$HLS_DIR/build/logs"
mkdir -p "$LOG_DIR"
declare -a SUMMARY=()

for cfg in "$HLS_DIR"/*/hls_config*.cfg; do
    name="$(basename "$(dirname "$cfg")")_$(basename "$cfg" .cfg)"
    if "$SCRIPT_DIR/run_hls.sh" "$cfg" "$STEP" > "$LOG_DIR/$name.log" 2>&1; then
        SUMMARY+=("PASS  $name")
    else
        SUMMARY+=("FAIL  $name   (log: build/logs/$name.log)")
    fi
done
printf '%s\n' "${SUMMARY[@]}"
