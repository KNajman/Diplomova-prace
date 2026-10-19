# Ababel – připojení a vzdálené běhy

## Server
- `ababeel.ite.tul.cz` (147.230.73.33), port 22, uživatel `karel`. Pozor: v adrese jsou **dvě e** ("ababeel"), mluví se o něm jako "Ababel".
- 32 jader, 251 GB RAM, Linux. Xilinx: `/tools/Xilinx/2025.2/` (Vitis, Vivado), env: `source /tools/Xilinx/2025.2/Vitis/settings64.sh`.
- Klon repa: `~/Diplomova-prace` (origin = GitHub HTTPS, **bez credentials** → z Ababelu se nepushuje). Aktualizuje se jen z notebooku přes SSH, **ne `git pull` z GitHubu** (GitHub je jen občasná záloha při milnících).
- Karel nemá právo spouštět skripty jako programy (`./x.sh`) → vždy `bash x.sh`.
- Logy dlouhých běhů: `~/logs/`.
- Z notebooku je potřeba VPN TUL (port 22 z VM ven funguje).

## Karel (Windows)
- PuTTY + WinSCP se stejným klíčem `.ppk` v Pageantu (WinSCP: Import Sites z PuTTY). Heslo se nezadává.

## Claude (device_bash VM na Karlově PC)
- Vlastní klíč `~/.ssh/id_ed25519_ababel` (komentář `claude-cowork@karel`), veřejná část je v `~karel/.ssh/authorized_keys` na Ababelu.
- `~/.ssh/config`:
  ```
  Host ababel
      HostName ababeel.ite.tul.cz
      User karel
      Port 22
      IdentityFile ~/.ssh/id_ed25519_ababel
      BatchMode yes
      ServerAliveInterval 30
      ControlMaster auto
      ControlPath ~/.ssh/cm-%r@%h-%p
      ControlPersist 30m
  ```
- **POZOR – mnoho nových SSH spojení = VPN TUL Karla odpojí kvůli "podezřelé komunikaci"** (15. 10.: smyčka `ssh` každých 10 s, ~20 spojení za pár minut → Connection refused, pak timed out, Karel odpojen z VPN). Proto: ControlMaster (jedno sdílené spojení) a čekání na konec běhu **uvnitř jednoho ssh** na serveru, nikdy smyčka ssh na straně VM.
- **Když klíč v nové session chybí** (VM home se nemusí zachovat): `ssh-keygen -q -t ed25519 -N "" -C claude-cowork@karel -f ~/.ssh/id_ed25519_ababel`, znovu vytvořit config, Karel přidá nový `.pub` do `authorized_keys` (starý řádek `claude-cowork@karel` smazat). Test: `ssh ababel hostname`.
- Odvolání přístupu Claude: smazat řádek `claude-cowork@karel` z `~/.ssh/authorized_keys`.

## Šablony (POUŽÍVAT PŘEDNOSTNĚ)
- `.claude/scripts/ababel.sh sync|start|status|stop|fetch|results|watch` (z kořene repa ve VM) – sync s kontrolou HEAD,
  odložení netrackovaných konfliktních souborů do `~/logs/*.bak`, spuštění fronty odpojeně, zastavení podle PID.
- `DP/scripts/ababel/run_queue.sh` (běží na serveru) + fronty `DP/scripts/queues/*.queue`
  (`vhdl_*`, `hls_*`, `template`). **Fronty zapisují souhrnná CSV jen do `~/logs/`** (ne do repa na Ababelu – blokovalo by to merge), do notebooku je stáhne `ababel.sh results`. Souhrn `~/logs/<fronta>.log`, detail `~/logs/<fronta>_steps/NN.log`.

## Synchronizace repa notebook → Ababel (bez GitHubu) – ruční postup
```
cd ~/mnt/_DP
git push -q ababel:Diplomova-prace main:refs/heads/laptop
ssh ababel 'cd ~/Diplomova-prace && git merge --ff-only laptop && git branch -D laptop'
```
- Jen fast-forward. Když merge odmítne (necommitované změny / untracked soubory na Ababelu, které jsou v commitu), nejdřív je na Ababelu prověřit, nemazat naslepo.
- Rychlé zkoušení bez commitu: `rsync -rq --no-perms` (NE `-a`: přenese z Windows spustitelný bit a git pak hlásí změněné soubory) `soubor ababel:Diplomova-prace/cesta/` (pak před merge vrátit `git checkout -- soubor`).
- Výsledky zpět: `rsync ababel:Diplomova-prace/DP/hls/results/hls_results.csv DP/hls/results/`.

## Dlouhé běhy (syn/cosim/impl trvají minuty)
- **Zastavení vlastní fronty:** NIKDY `pkill -f <název skriptu>` přes ssh – vzor se shoduje i s textem vlastního ssh příkazu a zabije ho (15. 10.). Použít `pgrep -f`, vypsat PID a zabít konkrétní PID, nebo `kill $(cat ~/logs/<fronta>.pid)`. Nezabíjet obecně `xsim`/`vivado` – Karel může mít na Ababelu vlastní běhy (např. cosim v GUI).
- **CSV vytvořené na Ababelu nejdřív zkopírovat do `~/logs/`, teprve pak `git checkout`/merge** (15. 10. checkout přepsal čerstvé výsledky v2 verzí v1 – obnoveno z build/ooc).
- **Před spuštěním fronty ověřit, že merge prošel** (`git log --oneline -1` na Ababelu = commit z notebooku). Netrackované soubory, které jsou v novém commitu, merge zablokují (např. `results/*.csv` vytvořené na Ababelu) → přesunout do `~/logs/`.
- device_bash má limit ~120–180 s → běh pustit na pozadí a odpojit se:
  ```
  ssh -f ababel 'cd ~/Diplomova-prace/DP/hls/scripts && setsid nohup bash -c "source /tools/Xilinx/2025.2/Vitis/settings64.sh && bash run_hls.sh ../csc/hls_config_rgb.cfg impl" > ~/logs/impl_csc_rgb.log 2>&1 < /dev/null &'
  ```
  (Bez `-f`/`setsid` ssh čeká na proces a příkaz vyprší – běh ale pokračuje.)
- Čekání: jedno spojení, smyčka běží na serveru (max ~160 s kvůli limitu device_bash, pak znovu):
  `ssh ababel 'for i in $(seq 1 16); do pgrep -f run_hls.sh >/dev/null || break; sleep 10; done; tail -5 ~/logs/<log>; pgrep -f run_hls.sh >/dev/null && echo RUNNING || echo DONE'`
- Orientační doby (CSC): impl ~3,5 min, cosim ~1–2 min.
