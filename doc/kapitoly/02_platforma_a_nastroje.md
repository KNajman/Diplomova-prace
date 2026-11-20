<!-- Kapitola 2, verze 2 (17. 11. 2026, osnova schválena, odpovědi Karla zapracovány; verze 1 z 2. 11.). Osnova: osnova_02_platforma.md. Převod do LaTeXu: doc/tools/md2tex.py. -->
<!-- Zkratky použité bez \ac (nejsou v seznamu zkratek v DP.tex, doplnit při převodu): DDR, JTAG, UART, QSPI, URAM, XSA, ISP, CSI. -->

# Platforma a použité nástroje {#kap:nastroje}

Zadání požaduje seznámit se s nástroji AMD Vitis, Vitis HLS a Vivado a s platformou KV260. Tato kapitola popisuje desku, na které práce běží, a nástroje, které jsem použil. U každého nástroje uvádím, k čemu jsem ho potřeboval a na jaké problémy jsem při práci narazil.

Nástroje jsem se učil přímo na desce. Jako první jsem sestavil průchod bez zpracování (passthrough), na kterém jsem si vyzkoušel celý postup od blokového návrhu přes bitstream po spuštění programu na procesoru. Práci jsem začal v nástrojích verze 2023 a dokončil ve verzi 2025.2. Mezi verzemi se změnil způsob popisu platformy procesoru a s ním část postupu sestavení (příklad uvádím v oddílu @ref(sec:vitis-sw)). Grafické prostředí Vitis při práci často padalo. Postupně jsem proto přešel na ovládání z příkazové řádky a na skripty, které se ukázaly jako spolehlivější. Tento přístup byl nutný i z dalšího důvodu: většinu překladů a sestavení jsem spouštěl na výpočetním serveru v dávkovém režimu (oddíl @ref(sec:prostredi)).

<!-- Odstavec podle Karlovy odpovědi 17. 11. 2026 (problémy mezi verzemi 2023 a 2025, padající GUI Vitis, přechod na konzoli kvůli Ababelu). TODO(Karel): zkontrolovat; případně doplnit, co bylo při učení nejtěžší a z jakých návodů jsi vycházel (pak citovat). -->

## Platforma Kria KV260 {#sec:kv260}

Vývojová deska Kria KV260 se skládá z modulu K26 @ac(SOM) a nosné desky s rozhraními pro kamery, displeje a síť @cite(amd_kv260). AMD ji nabízí jako startovací sadu pro aplikace počítačového vidění. Modul obsahuje obvod Zynq UltraScale+ @ac(MPSoC) s označením xck26-sfvc784-2LV-c a 4 GB paměti DDR4.

Obvod má 2 části. Procesorová část (@ac(PS)) obsahuje čtyřjádrový procesor Arm Cortex-A53, dva procesory Cortex-R5F, grafický procesor a řadič paměti. Programovatelná logika (@ac(PL)) je hradlové pole, do kterého se nahrává vlastní obvod. Obě části propojuje sběrnice @ac(AXI). Přes ni procesor nastavuje registry jader v programovatelné logice a jádra čtou a zapisují do paměti DDR. Procesor A53 v mém návrhu běží na 1333 MHz.

Z rozhraní desky využívám jen málo (tabulka @ref(tab:kv260)). Jedním kabelem micro-USB vede rozhraní JTAG, přes které se nahrává bitstream a program, i sériová linka UART, na kterou měřicí aplikace vypisuje výsledky. Deska se napájí ze zdroje 12 V. Kamery ani displej práce nepotřebuje, snímky čte z paměti DDR a výsledky zapisuje zpět.

Deska po zapnutí spustí firmware z paměti QSPI, který drží procesorovou část i programovatelnou logiku. Před nahráním vlastního návrhu přes JTAG proto přepínám režim startu na JTAG zápisem do registru a resetuji celý systém. Stejný postup používá i vývojové prostředí Vitis při spuštění programu na desce.

Tabulka: Vybrané parametry desky Kria KV260 @cite(amd_kv260) {#tab:kv260 widths=4.0,9.5}

| Část | Parametry |
| --- | --- |
| Obvod | Zynq UltraScale+ MPSoC na modulu K26 SOM (xck26-sfvc784-2LV-c) |
| Procesorová část | 4 × Arm Cortex-A53, 2 × Arm Cortex-R5F, grafický procesor |
| Programovatelná logika | 256 tisíc logických buněk, 144 bloků BRAM, 64 bloků UltraRAM, 1 248 bloků DSP |
| Paměť | 4 GB DDR4, 512 Mb QSPI, slot pro kartu SD |
| Rozhraní | 3 × MIPI CSI-2 (kamery), HDMI 1.4, DisplayPort 1.2a, Ethernet 1 Gb/s, 4 × USB, PMOD |
| Ladění | micro-USB (JTAG a UART) |

<!-- TODO(citace): počty BRAM, UltraRAM a DSP jsou ověřené výpisem využití Vivada (sloupec Available v DP/results/retezec_2026-10-25/utilization.rpt): 144 BRAM36, 64 URAM, 1 248 DSP. Stránka výrobce uváděla 1 176 DSP. Pro tabulku citovat datasheet modulu K26 (podklad do Citace PRO: AMD, Kria K26 SOM Data Sheet, číslo dokumentu DS987 – ověřit číslo, verzi a tabulku prostředků v originále). -->

## Prostředky programovatelné logiky {#sec:prostredky}

Programovatelná logika se skládá z opakujících se prostředků. U každého jádra v kapitole @ref(kap:vysledky) uvádím, kolik jich zabere, a proto je tu stručně popisuji.

- **LUT.** Vyhledávací tabulka (@acs(LUT), Look-Up Table) je malá paměť se šesti vstupy, která realizuje libovolnou logickou funkci těchto vstupů. Z LUT se skládá kombinační logika: sčítačky, porovnání a multiplexory.
- **FF.** Klopný obvod (@acs(FF), Flip-Flop) uloží 1 bit do další hrany hodin. V jádrech tvoří hlavně registry mezi stupni pipeline, protože každou operaci dávám za registr, aby jádro dosáhlo 200 MHz.
- **LUTRAM.** Část buněk LUT může pracovat jako malá paměť nebo posuvný registr. Jádra je používají pro zpožďovací linky a malé vyrovnávací paměti.
- **DSP.** Blok pro číslicové zpracování signálu (@acs(DSP), v tomto obvodu typ DSP48E2) obsahuje násobičku 27 × 18 bitů, předsčítačku a 48bitovou sčítačku s akumulátorem. Používám ho pro násobení v převodu barev, v převodu HSV a v konvoluci.
- **BRAM.** Bloková paměť (@acs(BRAM), Block RAM) je dvouportová paměť o velikosti 36 Kb, kterou lze rozdělit na 2 bloky po 18 Kb. Ukládám do něj řádky obrazu u okénkových operací a koše histogramu. Obvod má i větší paměťové bloky UltraRAM, ty v práci nepotřebuji.

Obvod xck26 má 117 120 buněk LUT, 234 240 klopných obvodů, 1 248 bloků DSP, 144 bloků BRAM po 36 Kb a 64 bloků UltraRAM. Celý testovací řetězec se 14 jádry z toho zabírá přibližně osminu buněk LUT a bloků BRAM (oddíl @ref(sec:vretezec)).

<!-- TODO(citace): počty z výpisu využití Vivada (DP/results/retezec_2026-10-25/utilization.rpt, sloupec Available); citovat stejný datasheet K26 jako tabulku desky. -->

## Vivado {#sec:vivado}

Vivado je vývojové prostředí AMD pro návrh obvodů FPGA @cite(amd_vivado). Převede popis obvodu (VHDL, Verilog nebo blokový návrh) na seznam spojů, rozmístí a propojí ho v obvodu, ověří časování a vytvoří bitstream, tedy konfiguraci programovatelné logiky. Spolu s bitstreamem exportuje popis hardwaru (soubor XSA), ze kterého se potom překládá software pro procesor.

Vivado jsem v práci použil 3 způsoby. Blokový návrh testovacího řetězce (IP Integrator) jsem nevytvářel klikáním, ale skriptem v jazyce Tcl (`build_harness.tcl`), který ho postaví celý od začátku. Díky tomu se dá kdykoli zopakovat a každá změna je vidět v historii repozitáře. Jádra psaná ve VHDL jsem dalším skriptem zabalil do IP jader, aby se dala vložit do blokového návrhu stejně jako jádra z HLS. Syntézu mimo kontext (oddíl @ref(sec:ooc)) a simulaci v xsim jsem spouštěl také skriptem, bez grafického prostředí.

## Vitis HLS {#sec:vitis-hls}

Vitis HLS překládá kód v C++ na popis obvodu na úrovni registrů (@ac(RTL)) ve VHDL nebo Verilogu @cite(amd_vitis). Nástroj rozvrhne operace do taktů, přiřadí je prostředkům obvodu (DSP, BRAM) a vytvoří řadiče rozhraní. Jak má výsledný obvod vypadat, se řídí direktivami (pragmaty) přímo v kódu, například `PIPELINE` (zřetězení smyčky), `UNROLL` (rozvinutí smyčky) nebo `ARRAY_PARTITION` (rozdělení pole do registrů). Pro souběžné zpracování nabízí nástroj úlohy (HLS tasks), vektory a datové proudy.

<!-- TODO(obrázek): doc/methodology.png je obrázek „Vitis HLS programming model“ ze stránky AMD Vitis HLS (Karel 17. 11. 2026; klíč amd_vitis v citace.bib má stejnou URL). Vložit v LaTeXu s popiskem „Programovací model Vitis HLS. Převzato z~\cite{amd_vitis}“ a v textu na něj odkázat. Pozn. dp-citace: produktová stránka jen pro obecný popis, technická tvrzení o HLS citovat z UG1399. -->

Každé jádro prochází 4 kroky: C-simulace ověří kód v C++, syntéza z něj vytvoří RTL, kosimulace pustí stejný test nad RTL a implementace ve Vivadu dá skutečné prostředky a časování. Kroky spouštím skriptem (`run_hls.sh`) přes příkazovou řádku nástroje (`v++` a `vitis-run`), ne v grafickém prostředí. Obraz do jádra a z jádra jde rozhraním AXI4-Stream, registry jsou na rozhraní AXI4-Lite. Pro datový proud používám typ `ap_axiu`, který kromě dat nese i signály `TUSER` (začátek snímku) a `TLAST` (konec řádku). Okénková jádra (konvoluce, medián) sdílejí jednu šablonu (`hls_window.hpp`).

Při práci jsem narazil na vlastnosti nástroje, které v dokumentaci nejsou zřejmé. Jádro bez řídicího protokolu (`ap_ctrl_none`) se skalárními registry nešlo kosimulovat, kosimulace se zastavila. Jádra proto používají řízení `ap_ctrl_hs` se samočinným restartem. Syntéza příkazem `v++` jádro nezabalí jako IP, k tomu je potřeba další příkaz (`vitis-run --package`).

<!-- TODO(Karel, 20. 11. 2026): přehled všech použitých pragmat HLS s vysvětlením, co dělají (tabulka). Podklad: README, oddíl „Použitá pragmata HLS“ (9 druhů, počty výskytů, kde a proč). Rozhodnout, zda tabulka patří sem (kap. 2.4), nebo do kap. 5.1 Společné bloky. -->

## Vitis a software pro procesor {#sec:vitis-sw}

Vitis (prostředí pro software) z exportu XSA vytvoří platformu, tedy ovladače a knihovny pro daný návrh, a nad ní přeloží aplikaci pro procesor. Měřicí aplikace běží bez operačního systému (bare-metal) na jednom jádru A53. Překlad pro 3 úrovně optimalizace jsem napsal jako skript přes rozhraní Pythonu (`build_app.py`), takže se platforma i aplikace dají sestavit bez grafického prostředí.

Program i bitstream nahrávám do desky nástrojem xsdb přes JTAG (skript `run_board.tcl`). Celý test na desce, tedy nahrání, čtení výsledků z UART a uložení do CSV, spouští jeden skript (`board_test`).

Verze 2025.2 popisuje platformu novým způsobem (System Device Tree). S tím souvisely problémy, které jsem musel obejít. Hlavičkový soubor `xtime_l.h` pro měření času se do platformy nedostal, stejné funkce jsou v `xiltimer.h`. Skriptovaný překlad (`vitis -s`) navíc vracel úspěch i při chybě překladu, takže chybu kontroluji podle toho, zda vznikl výsledný soubor programu.

## VHDL a simulace {#sec:vhdl}

Ručně psaná jádra jsou ve VHDL-2008. Používám jen konstrukce, které podporují oba simulátory i syntéza ve Vivadu. Například rozhraní (interfaces) z normy VHDL-2019 simulátor xsim nepodporuje, a proto je nepoužívám. Jádra simuluji ve dvou simulátorech: v xsim, který je součástí Vivada, a v otevřeném simulátoru GHDL (verze 4.1). Kód při psaní kontroluje rozšíření Sigasi ve VS Code, které upozorní na chyby a varování ještě před syntézou.

## Pracovní prostředí a pomůcky {#sec:prostredi}

Práci jsem dělal na notebooku s Windows a 12 GB paměti. To stačí na psaní kódu, simulaci jednotlivých jader a ovládání desky, ale ne na implementaci celého řetězce ve Vivadu. Velké běhy (syntéza a implementace, kosimulace a sestavení bitstreamu) proto běží na výpočetním serveru Ababel ústavu ITE TUL s Linuxem a nástroji AMD ve verzi 2025.2. Server je dostupný přes VPN TUL a SSH. Běhy spouštím jako fronty kroků (skripty v `DP/scripts/queues`), které běží na pozadí a výsledky ukládají do souborů CSV.

Zdrojové kódy, skripty i text práce verzuji v systému Git, repozitář je na GitHubu. Referenční model v C překládám na PC pomocí CMake a ověřuji ho proti knihovně OpenCV skriptem v Pythonu. Výsledky z výpisů nástrojů sbírají skripty v Pythonu do souborů CSV, ze kterých jsou tabulky v kapitole @ref(kap:vysledky). Text práce je v LaTeXu se šablonou tulthesis.

Při psaní kódu a textu jsem používal nástroj umělé inteligence Claude. Rozsah použití a způsob ověření výstupů popisuje prohlášení o použití nástrojů umělé inteligence na začátku práce.

## Testovací řetězec v hrubých rysech {#sec:retezec-prehled}

Aby se dala všechna jádra změřit za stejných podmínek, jsou všechna v jednom bitstreamu a sdílejí jeden testovací řetězec. @ac(VDMA) přečte snímek z paměti DDR a pošle ho přes přepínač AXI4-Stream do vybraného jádra. Výstup jádra jde přes druhý přepínač zpět do VDMA, která ho zapíše do paměti. Přepínače se nastavují registrem mezi snímky a jejich port 0 je průchod bez jádra. Šedotónová jádra (prahování, medián, konvoluce a histogram) jsou za převodníky z RGB na šedou a zpět, aby celý řetězec pracoval s jedním formátem dat.

Všechno běží na hodinách 200 MHz. Procesor jen nastaví registry jádra, spustí přenos a výsledek porovná s referenčním modelem. Podrobnosti jsou v oddílu @ref(sec:retezec).

<!-- TODO(obrázek): blokové schéma testovacího řetězce (podle README, kapitola Testovací řetězec). -->
