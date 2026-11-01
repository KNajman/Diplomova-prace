<!-- Kapitola 4, verze 3 (2. 11. 2026, styl podle Karlova úvodu): bez poznatků z testování (ty jsou v poznamky_k_prenosu.md), přepsáno přímějším stylem. Převod do LaTeXu: doc/tools/md2tex.py. -->

# Návrh a metodika srovnání {#kap:metodika}

Každý algoritmus má 3 implementace: v C, v HLS a ve VHDL. Aby jejich porovnání mělo smysl, musí platit dvě podmínky. Všechny tři varianty musí dojít ke stejnému výsledku a musí být ověřeny stejným testem. Tato kapitola popisuje, jak jsem obojí zajistil. Naměřené hodnoty jsou porovnány a věnuji se jim v kapitole @ref(kap:vysledky).

## Cíle a kritéria srovnání {#sec:kriteria}

Zadání požaduje implementovat vybrané algoritmy v softwaru a hardwaru (ve VHDL a pomocí HLS) a hardwarové verze porovnat se softwarem. Software je obecný celočíselný kód v C (C11) a je zároveň referenčním modelem. Obě hardwarové verze mají stejné rozhraní a stejnou mapu registrů. Jsou proto zaměnitelné a ovládá je jeden ovladač v C.

Na prvním místě je správnost. Implementace, která se s referenčním modelem neshoduje bit po bitu, se dál neposuzuje, protože rychlost ani velikost špatně počítajícího obvodu nic neříká. Správné implementace porovnávám podle kritérií v tabulce @ref(tab:kriteria). Prostředky jsou počty buněk @acs(LUT) a @acs(FF), bloků @acs(DSP) a pamětí @acs(BRAM), které jádro v obvodu zabere. Prostředky a maximální frekvenci měřím na samotném jádře. Propustnost a rychlost proti softwaru měřím na celém řetězci na desce.

Tabulka: Kritéria srovnání HLS, VHDL a softwaru {#tab:kriteria widths=3.3,5.2,5.2}

| Kritérium | Co se měří | Jak a kde |
| --- | --- | --- |
| Správnost | počet chybných bajtů proti referenčnímu modelu | simulace a měřicí aplikace na desce (oddíl @ref(sec:overeni)) |
| Prostředky | @acs(LUT), @acs(FF), @acs(DSP) a @acs(BRAM) jednoho jádra | syntéza mimo kontext (oddíl @ref(sec:ooc)) |
| Maximální frekvence | nejkratší perioda hodin, kterou jádro zvládne | syntéza mimo kontext (oddíl @ref(sec:ooc)) |
| Propustnost | doba zpracování snímku 1920 × 1080 bodů v ms a počet snímků za sekundu | měření na desce (oddíl @ref(sec:deska)) |
| Rychlost proti softwaru | poměr doby softwarového a hardwarového zpracování stejného algoritmu | měření na desce, software na procesoru Cortex-A53 (oddíl @ref(sec:sw)) |

## Omezení daná cílovým obvodem {#sec:obvod}

Cílovým obvodem je Zynq UltraScale+ na desce KV260 (označení xck26-sfvc784-2LV-c). Návrh jader vychází z toho, co obvod nabízí: z počtu buněk @acs(LUT) a @acs(FF), bloků @acs(DSP) a pamětí @acs(BRAM). Z toho plynou 4 omezení, kterými se řídí všechny implementace.

<!-- TODO(doplnit): celkový počet LUT, FF, DSP a BRAM obvodu xck26 (z datasheetu K26 nebo ze sloupce Available ve výpisu využití z Vivada, např. DP/hw/build/harness/utilization.rpt na Ababelu). Čísla do textu nedávám, dokud nejsou ze zdroje. -->

- **Frekvence.** Cílem je 200 MHz, tedy perioda 5 ns. Bloky BRAM a DSP mají minimální periodu hodin danou výrobcem, 3,077 ns u BRAM a 3,262 ns u DSP, což odpovídá přibližně 325 MHz a 307 MHz. Cíl 200 MHz leží pod oběma limity, takže jádra s těmito bloky ho splnit mohou.
- **Propustnost.** Jádro zpracuje 1 pixel za takt, aby udrželo tok dat z paměti. Při 200 MHz je to 200 milionů pixelů za sekundu.
- **Aritmetika.** Násobička v bloku DSP48E2 má vstupy 27 a 18 bitů. Koeficienty proto mají nejvýš 18 bitů a obrazový bod (8 bitů) se násobí v jednom bloku.
- **Paměť.** Okénkové operace (konvoluce, medián) potřebují při šířce snímku 1920 bodů paměť na celé řádky. Řádky ukládám do bloků BRAM, malé paměti do distribuované paměti v buňkách LUT. Histogram potřebuje paměť na 256 hodnot.

Všech 14 jader se musí vejít do jednoho obvodu spolu s DMA a propojením, a proto je u každého jádra důležitá velikost, ne jen rychlost.

## Referenční model v jazyce C {#sec:model}

OpenCV jsem jako referenci přímo nepoužil. Část operací počítá v plovoucí řádové čárce nebo zaokrouhluje jinak než obvod, a hardware potřebuje definici, kterou lze zopakovat bit po bitu. Napsal jsem proto vlastní celočíselnou knihovnu v C (`lib_imgproc`). Kde to jde, drží se chování OpenCV. Zaokrouhlení, saturaci a okraje stanovuje výslovně.

Model má 2 role. Je měřítkem správnosti hardwarových verzí a zároveň je softwarovým řešením, které se spouští na procesoru desky a měří proti hardwaru.

Konstanty neopisuji ručně. Generátor z definic vytvoří koeficienty převodu barev a tabulky pro převod mezi RGB a HSV a zapíše je do hlavičky pro C a HLS a do balíčku pro VHDL. Všechny tři implementace tak používají stejné hodnoty.

Protože je model měřítkem pro všechno ostatní, porovnávám ho nejdřív s OpenCV. Odchylky od OpenCV se jen vyhodnotí (kapitola @ref(kap:vysledky)), hardwarové verze se vždy porovnávají s modelem. Aritmetiku, převody barev, medián a filtry navíc kontrolují jednotkové testy, které běží i na procesoru ARM.

<!-- TODO(citace): dokumentace OpenCV (cvtColor, medianBlur, threshold, filter2D) jako zdroj sémantiky operací; podklad k vložení do citace.bib dodá Karel z Citace PRO. -->

## Aritmetika s pevnou řádovou čárkou {#sec:aritmetika}

Obrazové body jsou 8bitová celá čísla, ale koeficienty převodu barev nebo měřítko filtru jsou zlomky. V obvodu @ac(FPGA) by počítání v plovoucí řádové čárce stálo víc prostředků a trvalo by déle než celočíselné. Bloky @acs(DSP) mají navíc celočíselnou násobičku se vstupy 27 a 18 bitů. Zlomky proto počítám v pevné řádové čárce.

Číslo ve formátu $Q_{m.n}$ je celé číslo se znaménkovým bitem, $m$ bity celé části a $n$ zlomkovými bity. Uložené celé číslo $X$ představuje hodnotu

$$ x = \frac{X}{2^{n}} . $$ {#eq:q-format}

Pro převody barev jsem zvolil formát $Q_{2.15}$. Má 18 bitů, rozsah přibližně od $-4$ do $4$ (pro koeficienty stačí) a rozlišení $2^{-15}$. Těch 18 bitů přesně vyplní širší vstup násobičky v bloku DSP48E2. Koeficient 0,299 se v tomto formátu uloží jako celé číslo $9\,798$, protože $0{,}299 \cdot 2^{15} = 9\,797{,}6$.

Pevná řádová čárka potřebuje 2 konvence, které jsou ve všech 3 implementacích stejné: zaokrouhlení polovin nahoru při posunu o $n$ bitů vpravo a saturaci výsledku na rozsah 8bitového obrazového bodu:

$$ \mathrm{round\_shift}(X, n) = \left\lfloor \frac{X + 2^{n-1}}{2^{n}} \right\rfloor , \qquad \mathrm{sat}_{u8}(v) = \min\bigl(\max(v, 0), 255\bigr) . $$ {#eq:round-sat}

V hardwaru je dělení mocninou dvou jen posun. Zaokrouhlení tedy stojí jednu sčítačku, u bloku DSP48E2 žádnou, protože se provede v jeho závěrečné sčítačce.

Příklad: řádek matice pro převod RGB na šedou (BT.601) má v pořadí složek, v jakém leží v paměti, koeficienty $19\,235$ (zelená), $3\,735$ (modrá) a $9\,798$ (červená). Vstupem je pixel s červenou 200, zelenou 100 a modrou 50. Součet součinů je $19\,235 \cdot 100 + 3\,735 \cdot 50 + 9\,798 \cdot 200 = 4\,069\,850$. Přičtu polovinu, tedy $2^{14} = 16\,384$, a dostanu $4\,086\,234$. Posun o 15 bitů dá $124$, protože hodnota před posunem je 124,7 a posun zaokrouhlí dolů. V plovoucí řádové čárce vychází $0{,}299 \cdot 200 + 0{,}587 \cdot 100 + 0{,}114 \cdot 50 = 124{,}2$, tedy také 124.

Koeficienty jednoho řádku musí v součtu dát přesně $2^{15}$, aby se bílá převedla na bílou. Prosté zaokrouhlení každého koeficientu to nezaručuje, proto generátor koeficienty zaokrouhlí dolů a chybějící jednotky přidělí těm, které měly největší zlomkovou část (metoda největšího zbytku).

Šířky mezivýsledků nepíšu jako konstanty, ale vzorcem. Součin čísel šířky $W_a$ a $W_b$ má $W_a + W_b$ bitů, součet $N$ čísel šířky $W$ má $W + \lceil \log_{2} N \rceil$ bitů. Jádra jsou díky tomu generická. Konvoluci například nepřepočítávám ručně pro jiný rozměr jádra, a nehrozí tak chyba v šířce při změně parametru. Formáty jednotlivých operací shrnuje tabulka @ref(tab:formaty).

Tabulka: Formáty a konvence aritmetiky u jednotlivých operací {#tab:formaty widths=3.3,5.2,5.2}

| Operace | Formát a měřítko | Zaokrouhlení a saturace |
| --- | --- | --- |
| Převod barev (matice 3 × 3) | koeficienty $Q_{2.15}$, offset se přičítá v akumulátoru před posunem | zaokrouhlení polovin nahoru, saturace 0 až 255 |
| RGB na HSV | celočíselný algoritmus OpenCV, posun o 12 bitů, tabulky podílů a odstínu, odstín v rozsahu 0 až 179 | shodné s OpenCV |
| HSV na RGB | vlastní celočíselný algoritmus s tabulkami převrácených hodnot | zaokrouhlení polovin nahoru, saturace |
| Konvoluce $K × K$ | osmibitové celočíselné jádro, přesná akumulace, měřítko $Q_{.14}$ a posun hodnoty `delta` | zaokrouhlení polovin nahoru, saturace |
| Medián, prahování, histogram | jen celá čísla (porovnávání a počítání) | není potřeba |

<!-- TODO(citace): Q formát / aritmetika s pevnou řádovou čárkou (např. Texas Instruments, ARM, MathWorks), z původních poznámek v DP.tex; podklad k vložení dodá Karel. -->

## Úrovně ověření {#sec:overeni}

Bitovou shodu ověřuji na 3 úrovních. První, referenční model proti OpenCV, je v oddílu @ref(sec:model). Druhá a třetí ověřují hardwarová jádra proti modelu (tabulka @ref(tab:urovne)).

Tabulka: Úrovně ověření hardwarových jader {#tab:urovne widths=2.4,3.6,3.4,3.7}

| Úroveň | Co ověřuje | Nástroj | Kritérium |
| --- | --- | --- | --- |
| HLS | kód C++ a RTL vygenerované z něj | C-simulace a kosimulace C/RTL ve Vitis HLS | shoda dat i signálů `TUSER` a `TLAST` |
| VHDL | ručně psaný RTL kód | simulace v xsim (Vivado) a GHDL s generickým testbenchem | shoda dat i signálů `TUSER` a `TLAST` |
| Deska | celý řetězec s procesorem, pamětí a DMA | měřicí aplikace na procesoru Cortex-A53 | nulový počet chybných bajtů proti modelu a nulový stavový registr |

Vstupní a očekávané vektory vytváří nástroj z modelu, nic se neopisuje ručně. U HLS ověřuje C-simulace kód v C++ a kosimulace stejný test nad RTL, které z něj Vitis HLS vytvořil. Testbench posílá data v toku @acs(AXI)4-Stream, kde `TUSER` označuje začátek snímku a `TLAST` konec řádku. Zdroj vkládá náhodné mezery a příjemce náhodně brzdí, aby se pixely neztrácely ani nezdvojovaly a aby fungovalo zpětné řízení toku. Každý test běží na nejméně 2 snímcích za sebou, protože jádro nesmí držet stav z předchozího snímku. Převod RGB a HSV navíc ověřuji v simulaci na všech $2^{24}$ vstupech.

## Metodika měření {#sec:metodika-mereni}

### Syntéza mimo kontext {#sec:ooc}

Prostředky a maximální frekvenci měřím syntézou mimo kontext (out-of-context, @acs(OOC)). Jádro se syntetizuje, rozmístí a propojí samo, bez zbytku návrhu (DMA, propojení AXI, procesor). Porty se nepřipojují na piny a jediným omezením jsou hodiny s periodou 5 ns, tedy 200 MHz. Výsledek tak nezávisí na tom, co leží vedle jádra. V celém návrhu by časování jádra záviselo i na tom, jak je zaplněný zbytek obvodu.

Aby bylo srovnání HLS a VHDL férové, mají obě verze stejný postup. RTL vygenerované z HLS jde do stejného skriptu jako VHDL, pro stejný obvod (xck26-sfvc784-2LV-c) a se stejným cílem 5 ns. Používám Vivado 2025.2 a jen čísla po implementaci, ne odhady z HLS syntézy.

Maximální frekvenci vyjadřuji nejkratší periodou hodin, kterou jádro zvládne:

$$ T = \max\left(5 - \mathrm{WNS},\; 5 - \mathrm{WPWS}\right) \quad [\mathrm{ns}] . $$ {#eq:perioda}

@ac(WNS) je časová rezerva nejhorší logické cesty a @ac(WPWS) je rezerva minimální šířky pulzu hodin. Druhý člen je nutný, protože bloky BRAM a DSP mají minimální periodu danou výrobcem (3,077 ns u BRAM a 3,262 ns u DSP) a žádná úprava logiky ji nezkrátí. Vlastní export Vitis HLS počítá periodu jen z WNS. U jader s BRAM nebo DSP by tak vyšla kratší, než obvod skutečně zvládne. Počet bloků BRAM udávám v dlaždicích o velikosti 36 Kb.

### Měření na desce {#sec:deska}

Snímek 1920 × 1080 bodů s 24 bity na pixel zabírá 6,2 MB. Při jednom pixelu za takt a 200 MHz projde obvodem za $1920 \cdot 1080 / 200\,\mathrm{MHz} = 10{,}368\,\mathrm{ms}$, tedy přibližně 96 snímků za sekundu. To je strop, který žádné jádro nepřekoná. Měřím ho jako první, na průchodu bez jádra (bypass), a rozdíl proti průchodu ukazuje, kolik času jádro přidává.

Propustnost měřím na desce KV260 v testovacím řetězci, kde je všech 14 jader v jednom bitstreamu na 200 MHz (podrobně oddíl @ref(sec:retezec)). Procesor nastaví registry vybraného jádra, @ac(VDMA) přečte snímek z paměti, pošle ho jádrem a výsledek zapíše zpět do paměti. Měří se tedy celý řetězec paměť, jádro, paměť.

Testovací snímek vytvoří aplikace při startu deterministicky: plynulé přechody (pro převody barev a HSV), ostré hrany (pro Sobelův filtr) a šum (pro medián). Doba zpracování je čas od spuštění čtení z paměti do jeho zastavení po 20 snímcích. Během přenosu aplikace čte jen stav tohoto kanálu, jednou za 100 µs, což odpovídá nejistotě 5 µs na snímek, tedy méně než 0,1 %. Měření opakuji 5krát a beru medián.

Po měření aplikace porovná výstup bajt po bajtu s modelem přeloženým pro ARM. Měření je úspěšné, jen když je počet chybných bajtů nulový a u jader s okénkem i stavový registr, který hlásí poruchu synchronizace řádků. Výsledky aplikace vypisuje na sériovou linku a skript je ukládá do CSV.

### Softwarové řešení na procesoru Cortex-A53 {#sec:sw}

Referenční model přeložený pro ARM spouštím na jednom jádru procesoru Cortex-A53 s hodinami 1333 MHz (podle nastavení z Vivada), bez operačního systému a se zapnutými vyrovnávacími pamětmi, takže měření nic neruší. Překládám s optimalizací `-O0`, `-O2` i `-O3` překladačem z Vitis 2025.2, protože výhodnost porovnání s hardwarem závisí na úrovni optimalizace. Software optimalizuji jen volbou překladače, ruční optimalizace pro procesor nedělám. Čas měřím čítačem procesoru a beru medián z 10 běhů každého algoritmu na stejném snímku jako u hardwaru.
