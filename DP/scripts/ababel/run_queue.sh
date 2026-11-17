#!/usr/bin/env bash
# =============================================================================
#  Spustí frontu příkazů na Ababelu (sekvenčně, s logem). Běží NA SERVERU.
#  Použití:  bash DP/scripts/ababel/run_queue.sh DP/scripts/queues/<jméno>.queue
#  Fronta:   jeden příkaz na řádek, relativně ke kořeni repa, '#' = komentář.
#  Výstup:   ~/runs/<RRRR-MM-DD_HHMM>_<jméno>/   jeden adresář na každý běh (nic se nepřepisuje):
#                summary.log  souhrn (čas, krok, PASS/FAIL řádky, návratový kód)
#                steps/NN.log úplný výstup každého kroku
#                queue.txt    kopie fronty, commit.txt  commit, ze kterého běh vychází
#                *.csv, *.log výstupy kroků, které zapisují do "$RUN_DIR" (proměnná je exportovaná)
#            ~/runs/INDEX.md          tabulka všech běhů (start, konec, fronta, commit, výsledek, adresář)
#            ~/logs/<jméno>.log       odkaz na summary.log posledního běhu (tail -f funguje jako dřív)
#            ~/logs/<jméno>_steps     odkaz na steps/ posledního běhu
#            ~/logs/<jméno>.pid      PID fronty (pro zastavení: kill $(cat ...))
#  Konec:    řádek "== HOTOVO" v souhrnu (případně "== CHYBY: N")
#  Direktiva '# @stop_on_error' kdekoli ve frontě: po prvním neúspěšném kroku se fronta ukončí
#            (pro kroky, které na sobě závisí - např. balení IP -> block design -> bitstream).
# =============================================================================
set -u
QUEUE_FILE="$1"
REPO="$HOME/Diplomova-prace"
NAME="$(basename "$QUEUE_FILE" .queue)"
START="$(date +%Y-%m-%d_%H%M)"
RUN_DIR="$HOME/runs/${START}_$NAME"
LOG="$RUN_DIR/summary.log"
STEPS="$RUN_DIR/steps"
INDEX="$HOME/runs/INDEX.md"
export RUN_DIR
SUMMARY_PATTERN='VYSLEDEK|PASS|FAIL|ERROR|Error:|OOC HOTOVO|Zapsano|Zapsáno [0-9]+ jader|^  [a-z]'

mkdir -p "$HOME/logs" "$STEPS"
echo $$ > "$HOME/logs/$NAME.pid"
: > "$LOG"
cp "$QUEUE_FILE" "$RUN_DIR/queue.txt"
# dřívější běhy zapisovaly přímo do ~/logs/<jméno>.log a <jméno>_steps/ -> přejmenovat, ať se dají nahradit odkazem
[ -e "$HOME/logs/$NAME.log" ] && [ ! -L "$HOME/logs/$NAME.log" ] && mv "$HOME/logs/$NAME.log" "$HOME/logs/$NAME.log.old"
[ -e "$HOME/logs/${NAME}_steps" ] && [ ! -L "$HOME/logs/${NAME}_steps" ] && mv "$HOME/logs/${NAME}_steps" "$HOME/logs/${NAME}_steps.old"
ln -sfn "$LOG" "$HOME/logs/$NAME.log"
ln -sfn "$STEPS" "$HOME/logs/${NAME}_steps"
[ -f "$INDEX" ] || printf '| start | konec | fronta | commit | kroky | chyby | adresář |\n| --- | --- | --- | --- | --- | --- | --- |\n' > "$INDEX"
# settings64.sh od Xilinxu používá nedefinované proměnné (PYTHONPATH) -> načíst bez 'set -u'
set +u
source /tools/Xilinx/2025.2/Vitis/settings64.sh > /dev/null 2>&1
source /tools/Xilinx/2025.2/Vivado/settings64.sh > /dev/null 2>&1
set -u

step=0
failures=0
stop_on_error=0
grep -qE '^# *@stop_on_error' "$QUEUE_FILE" && stop_on_error=1
cd "$REPO" || exit 1
git log --oneline -1 > "$RUN_DIR/commit.txt"
echo "== $(date +%T) fronta $NAME, commit $(git log --oneline -1), adresář $RUN_DIR" >> "$LOG"
while IFS= read -r line || [ -n "$line" ]; do
    case "$line" in ''|\#*) continue ;; esac
    step=$((step + 1))
    step_log=$(printf "%s/%02d.log" "$STEPS" "$step")
    echo "== $(date +%T) [$step] $line" >> "$LOG"
    ( cd "$REPO" && eval "$line" ) > "$step_log" 2>&1 < /dev/null
    status=$?
    grep -E "$SUMMARY_PATTERN" "$step_log" | grep -v "^INFO" | head -20 >> "$LOG"
    echo "   -> exit $status $(date +%T)" >> "$LOG"
    if [ $status -ne 0 ]; then
        failures=$((failures + 1))
        if [ $stop_on_error -eq 1 ]; then
            echo "== STOP: krok $step selhal (@stop_on_error)" >> "$LOG"
            break
        fi
    fi
done < "$QUEUE_FILE"

if [ $failures -eq 0 ]; then
    echo "== HOTOVO $(date +%T)" >> "$LOG"
else
    echo "== CHYBY: $failures krok(y) selhalo, detail v $STEPS/ ($(date +%T))" >> "$LOG"
    echo "== HOTOVO $(date +%T)" >> "$LOG"
fi
echo "| $START | $(date +%Y-%m-%d_%H%M) | $NAME | $(git log --format=%h -1) | $step | $failures | ${START}_$NAME |" >> "$INDEX"
rm -f "$HOME/logs/$NAME.pid"
