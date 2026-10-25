#!/usr/bin/env bash
# =============================================================================
#  Ovládání Ababelu – šablony místo ručně skládaných příkazů. Funguje z VM Cowork (Linux, rsync, ControlMaster)
#  i z Git Bash na Windows (Claude Code): bez rsync se kopíruje přes scp. Potřebuje ssh alias "ababel" (~/.ssh/config).
#  Použití (z kořene repa ~/mnt/_DP):
#    bash .claude/scripts/ababel.sh sync              notebook -> Ababel (git fast-forward), ověří shodu HEAD
#    bash .claude/scripts/ababel.sh start <fronta>    sync + spustí DP/scripts/queues/<fronta>.queue na pozadí
#    bash .claude/scripts/ababel.sh status <fronta>   souhrn fronty (1 spojení)
#    bash .claude/scripts/ababel.sh stop <fronta>     zastaví frontu podle PID (nikdy pkill -f!)
#    bash .claude/scripts/ababel.sh fetch <cesta>     stáhne soubor z repa na Ababelu do stejné cesty v notebooku
#    bash .claude/scripts/ababel.sh results           stáhne ~/logs/{hls,vhdl}_results.csv do DP/*/results/
#    bash .claude/scripts/ababel.sh board             stáhne soubory pro test na desce (bitstream, psu_init, ELF O0/O2/O3)
#    bash .claude/scripts/ababel.sh watch <fronta>    vypíše příkaz pro Karla (tail -f)
#  Pravidla: jedno ssh spojení na příkaz (ControlMaster), žádné smyčky ssh (VPN odpojení),
#  CSV/výsledky vytvořené na Ababelu se před merge odkládají do ~/logs/.
# =============================================================================
set -euo pipefail
CMD="${1:-}"
ARG="${2:-}"
REPO_REMOTE="Diplomova-prace"

# Kopírování ze serveru: rsync (VM Cowork), jinak scp (Git Bash na Windows rsync nemá).
# Poznámka: bez ControlMaster (Windows) je každé scp nové spojení - kopírovat po celých složkách, ne po souborech.
copy_from() {   # copy_from <cesta na Ababelu vůči ~> <místní cíl>
    if command -v rsync > /dev/null 2>&1; then
        rsync -rq --no-perms "ababel:$1" "$2"
    else
        scp -rq "ababel:$1" "$2"
    fi
}

sync_repo() {
    local local_head remote_head
    local_head=$(git log --format=%h -1)
    git push -q ababel:"$REPO_REMOTE" main:refs/heads/laptop
    # soubory, které by merge přepsal (typicky results/*.csv vytvořené na Ababelu): záloha do ~/logs/*.bak,
    # netrackované se přesunou, upravené trackované se vrátí na verzi z gitu
    ssh ababel "cd ~/$REPO_REMOTE && for f in \$(git diff --name-only HEAD laptop); do
        [ -e \"\$f\" ] || continue
        backup=~/logs/\$(echo \$f | tr / _).bak
        if ! git ls-files --error-unmatch \"\$f\" >/dev/null 2>&1; then mv \"\$f\" \"\$backup\";
        elif ! git diff --quiet -- \"\$f\"; then cp \"\$f\" \"\$backup\" && git checkout -q -- \"\$f\"; fi
    done; git merge -q --ff-only laptop && git branch -q -D laptop"
    remote_head=$(ssh ababel "cd ~/$REPO_REMOTE && git log --format=%h -1")
    if [ "$local_head" != "$remote_head" ]; then
        echo "CHYBA: Ababel je na $remote_head, notebook na $local_head" >&2
        exit 1
    fi
    echo "sync OK: $local_head"
}

case "$CMD" in
    sync)
        sync_repo ;;
    start)
        [ -f "DP/scripts/queues/$ARG.queue" ] || { echo "Fronta DP/scripts/queues/$ARG.queue neexistuje" >&2; exit 1; }
        sync_repo
        ssh ababel "setsid nohup bash ~/$REPO_REMOTE/DP/scripts/ababel/run_queue.sh ~/$REPO_REMOTE/DP/scripts/queues/$ARG.queue > /dev/null 2>&1 < /dev/null &"
        sleep 3
        ssh ababel "head -2 ~/logs/$ARG.log"
        echo "Sledování (Karel, PuTTY):  tail -f ~/logs/$ARG.log" ;;
    status)
        ssh ababel "cat ~/logs/$ARG.log; if [ -f ~/logs/$ARG.pid ] && ps -p \$(cat ~/logs/$ARG.pid) > /dev/null; then echo '(běží)'; elif [ -f ~/logs/$ARG.pid ]; then echo '(SPADLO - proces neexistuje, PID soubor zůstal)'; else echo '(neběží)'; fi" ;;
    stop)
        # fronta běží přes setsid -> PID = ID session; zabít celou session (i běhy Vivada z launch_runs),
        # jinak osiřelé synth/impl dál zapisují do projektu a nový běh ho poškodí (19. 10.: rozbitý .xpr)
        ssh ababel "[ -f ~/logs/$ARG.pid ] && P=\$(cat ~/logs/$ARG.pid) && pkill -TERM -s \$P; kill \$P 2>/dev/null; rm -f ~/logs/$ARG.pid; sleep 2; ps -eo pid,args | grep -E 'Diplomova-prace/DP/.*/build' | grep -v grep | cut -c1-150; echo zastaveno" ;;
    fetch)
        copy_from "$REPO_REMOTE/$ARG" "$ARG" && echo "staženo: $ARG" ;;
    results)
        # souhrnná CSV, která fronty zapisují do ~/logs/ (ne do repa na Ababelu) -> results/ v notebooku
        copy_from logs/hls_results.csv DP/hls/results/hls_results.csv 2>/dev/null && echo "staženo: DP/hls/results/hls_results.csv"
        copy_from logs/vhdl_results.csv DP/vhdl/results/vhdl_results.csv 2>/dev/null && echo "staženo: DP/vhdl/results/vhdl_results.csv"
        true ;;
    board)
        # bitstream + psu_init.tcl (export platformy) a ELF měřicí aplikace -> stejné cesty v notebooku (run_board.tcl)
        ws=DP/sw/build/workspace
        mkdir -p "$ws/harness_platform"
        copy_from "$REPO_REMOTE/$ws/harness_platform/export" "$ws/harness_platform/"
        for level in O0 O2 O3; do
            mkdir -p "$ws/harness_app_$level/build"
            copy_from "$REPO_REMOTE/$ws/harness_app_$level/build/harness_app_$level.elf" "$ws/harness_app_$level/build/"
        done
        ls -l "$ws"/harness_app_O*/build/*.elf ;;
    watch)
        echo "tail -f ~/logs/$ARG.log" ;;
    *)
        sed -n '3,15p' "$0"; exit 1 ;;
esac
