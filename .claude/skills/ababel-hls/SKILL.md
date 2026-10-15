---
name: ababel-hls
description: Spuštění HLS kroku (csim/syn/cosim/impl/all) jádra DP na serveru Ababel, sběr výsledků do hls_results.csv a synchronizace repa notebook → Ababel. Použij, když se má jádro z DP/hls přeložit, nasimulovat, implementovat nebo změřit na Ababelu.
---

# HLS běh na Ababelu

Podrobnosti připojení a řešení problémů: `.claude/memory/ababel.md`.

## 1. Spojení
```
ssh ababel hostname     # musí vrátit "ababel"
```
Selže-li (klíč/config chybí v nové VM): postup "Když klíč v nové session chybí" v ababel.md. Timeout → Karel nemá zapnutou VPN TUL.

## 2. Synchronizace repa (změny musí být commitnuté lokálně)
```
cd ~/mnt/_DP
git status -s                                    # necommitované změny v DP/hls? commitnout (git -c user.name=Karel_Najman -c user.email=karel.najman@tul.cz)
git push -q ababel:Diplomova-prace main:refs/heads/laptop
ssh ababel 'cd ~/Diplomova-prace && git merge --ff-only laptop && git branch -D laptop && git log --oneline -1'
```

## 3. Spuštění (na pozadí, device_bash má limit ~2–3 min)
```
CFG=../csc/hls_config_rgb.cfg ; STEP=all ; LOG=csc_rgb_$STEP
ssh -f ababel "cd ~/Diplomova-prace/DP/hls/scripts && setsid nohup bash -c 'source /tools/Xilinx/2025.2/Vitis/settings64.sh && bash run_hls.sh $CFG $STEP' > ~/logs/$LOG.log 2>&1 < /dev/null &"
```
- Všechna jádra najednou: místo `run_hls.sh …` použij `bash build_all.sh <step>`.
- Kroky: `csim` → (PASS) → `syn` → `cosim` → `impl`. `all` = csim+syn+cosim (impl zvlášť).

## 4. Čekání a kontrola
```
for i in $(seq 1 16); do ssh ababel 'pgrep -f run_hls.sh >/dev/null' || break; sleep 10; done
ssh ababel "tail -5 ~/logs/$LOG.log; pgrep -f run_hls.sh >/dev/null && echo RUNNING || echo DONE"
```
Opakuj, dokud není DONE. Při chybě hledej v logu `ERROR`, `FAIL`, `mismatch`; csim/cosim logy jsou v `DP/hls/build/<jádro>/hls/`.

## 5. Výsledky
```
ssh ababel 'cd ~/Diplomova-prace/DP/hls && python3 scripts/collect_reports.py'
rsync -q ababel:Diplomova-prace/DP/hls/results/hls_results.csv ~/mnt/_DP/DP/hls/results/
```
Výsledek commitnout lokálně, Karlovi stručně tabulka: II, est vs. impl perioda, LUT/FF/DSP/BRAM, cosim PASS. Do DP patří jen `impl_*`.

## 6. Úklid a zápis
- Nové poznatky → `.claude/memory/lessons.md`, milník → sekce Průběh v `plan_dokonceni_DP.md`.
- GitHub se průběžně neudržuje (push jen při velkých milnících, dělá ho Karel) – po běžném běhu push nepřipomínat.
- Nic nemazat na Ababelu mimo `DP/hls/build/` bez souhlasu.
