#!/usr/bin/env bash
# =============================================================================
#  Spustí frontu příkazů na Ababelu (sekvenčně, s logem). Běží NA SERVERU.
#  Použití:  bash DP/scripts/ababel/run_queue.sh DP/scripts/queues/<jméno>.queue
#  Fronta:   jeden příkaz na řádek, relativně ke kořeni repa, '#' = komentář.
#  Výstup:   ~/logs/<jméno>.log      souhrn (čas, krok, PASS/FAIL řádky, návratový kód)
#            ~/logs/<jméno>_steps/   úplný výstup každého kroku (NN.log)
#            ~/logs/<jméno>.pid      PID fronty (pro zastavení: kill $(cat ...))
#  Konec:    řádek "== HOTOVO" v souhrnu (případně "== CHYBY: N")
# =============================================================================
set -u
QUEUE_FILE="$1"
REPO="$HOME/Diplomova-prace"
NAME="$(basename "$QUEUE_FILE" .queue)"
LOG="$HOME/logs/$NAME.log"
STEPS="$HOME/logs/${NAME}_steps"
SUMMARY_PATTERN='VYSLEDEK|PASS|FAIL|ERROR|Error:|OOC HOTOVO|Zapsano|Zapsáno [0-9]+ jader|^  [a-z]'

mkdir -p "$HOME/logs" "$STEPS"
rm -f "$STEPS"/*.log
echo $$ > "$HOME/logs/$NAME.pid"
: > "$LOG"
# settings64.sh od Xilinxu používá nedefinované proměnné (PYTHONPATH) -> načíst bez 'set -u'
set +u
source /tools/Xilinx/2025.2/Vitis/settings64.sh > /dev/null 2>&1
source /tools/Xilinx/2025.2/Vivado/settings64.sh > /dev/null 2>&1
set -u

step=0
failures=0
cd "$REPO" || exit 1
echo "== $(date +%T) fronta $NAME, commit $(git log --oneline -1)" >> "$LOG"
while IFS= read -r line || [ -n "$line" ]; do
    case "$line" in ''|\#*) continue ;; esac
    step=$((step + 1))
    step_log=$(printf "%s/%02d.log" "$STEPS" "$step")
    echo "== $(date +%T) [$step] $line" >> "$LOG"
    ( cd "$REPO" && eval "$line" ) > "$step_log" 2>&1 < /dev/null
    status=$?
    grep -E "$SUMMARY_PATTERN" "$step_log" | grep -v "^INFO" | head -20 >> "$LOG"
    echo "   -> exit $status $(date +%T)" >> "$LOG"
    [ $status -ne 0 ] && failures=$((failures + 1))
done < "$QUEUE_FILE"

if [ $failures -eq 0 ]; then
    echo "== HOTOVO $(date +%T)" >> "$LOG"
else
    echo "== CHYBY: $failures krok(y) selhalo, detail v $STEPS/ ($(date +%T))" >> "$LOG"
    echo "== HOTOVO $(date +%T)" >> "$LOG"
fi
rm -f "$HOME/logs/$NAME.pid"
