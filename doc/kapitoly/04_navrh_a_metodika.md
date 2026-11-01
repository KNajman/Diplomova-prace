<!-- Kapitola 4 (6 stran). Zdroj textu: samostatný Markdown, do LaTeXu se převádí skriptem doc/tools/md2tex.py (konvence viz doc/kapitoly/README.md). -->

# Návrh a metodika srovnání {#kap:metodika}

Zadání práce má čtyři body: seznámit se s nástroji AMD a s platformou KV260, zpracovat rešerši operací zpracování obrazu s analýzou jejich realizace v hardwaru, vybrané algoritmy implementovat v softwaru a hardwaru (v jazyce @ac(VHDL) a pomocí vysokoúrovňové syntézy) a výsledky hardwarových implementací porovnat se softwarovým řešením. První dva body jsem zpracoval v kapitolách @ref(kap:nastroje) a @ref(kap:operace), třetí v kapitole @ref(kap:implementace) a čtvrtý v kapitole @ref(kap:vysledky). Tato kapitola stanoví pravidla, podle kterých jsem implementace navrhoval a porovnával, aby čísla ve výsledcích byla správná a navzájem srovnatelná.

## Cíle a kritéria srovnání {#sec:kriteria}

Každý algoritmus jsem implementoval třikrát se stejnou aritmetikou: v jazyce C, který je zároveň referenčním modelem a softwarovým řešením pro procesor Cortex-A53, v nástroji Vitis @ac(HLS) a ručně v jazyce VHDL. Obě hardwarové verze mají stejné rozhraní a stejnou mapu registrů, takže jsou zaměnitelné a ovládá je jeden ovladač v jazyce C.

Porovnání má smysl, jen když všechny tři verze počítají totéž. Správnost je proto podmínka: implementace, která se s referenčním modelem neshoduje bit po bitu, se dál neposuzuje. Správné implementace porovnávám podle kritérií v tabulce @ref(tab:kriteria). Prostředky jsou počty buněk @ac(LUT) a @ac(FF), bloků @ac(DSP) a pamětí @ac(BRAM), které jádro v obvodu zabere. Prostředky a maximální frekvence popisují samotné jádro a měří se na něm odděleně od zbytku návrhu. Propustnost a rychlost proti softwaru popisují celý řetězec na desce.

Tabulka: Kritéria srovnání HLS, VHDL a softwaru {#tab:kriteria widths=3.3,5.2,5.2}

| Kritérium | Co se měří | Jak a kde |
| --- | --- | --- |
| Správnost | počet chybných bajtů proti referenčnímu modelu | simulace a měřicí aplikace na desce (oddíl @ref(sec:overeni)) |
| Prostředky | @acs(LUT), @acs(FF), @acs(DSP) a @acs(BRAM) jednoho jádra | syntéza mimo kontext (oddíl @ref(sec:ooc)) |
| Maximální frekvence | nejkratší perioda hodin, kterou jádro zvládne | syntéza mimo kontext (oddíl @ref(sec:ooc)) |
| Propustnost | doba zpracování snímku 1920 × 1080 bodů v ms a počet snímků za sekundu | měření na desce (oddíl @ref(sec:deska)) |
| Rychlost proti softwaru | poměr doby softwarového a hardwarového zpracování stejného algoritmu | měření na desce, software na procesoru Cortex-A53 (oddíl @ref(sec:sw)) |

## Referenční model v jazyce C {#sec:model}

OpenCV počítá část operací v plovoucí řádové čárce nebo s jinak zaokrouhlenými koeficienty. Hardware ale potřebuje definici, kterou lze bit po bitu zopakovat v obvodu. Napsal jsem proto celočíselnou knihovnu v jazyce C (`lib_imgproc`), která zachovává sémantiku OpenCV tam, kde ji lze přesně napodobit, a ostatní konvence, tedy zaokrouhlení, saturaci a ošetření okrajů, stanovuje výslovně. Model plní dvě role. Je měřítkem správnosti obou hardwarových verzí a zároveň je softwarovým řešením, které se na procesoru Cortex-A53 měří proti hardwaru.

Konstanty, ve kterých by se verze mohly rozejít, jsem neopisoval ručně. Koeficienty převodu barev a tabulky pro převod RGB na HSV a zpět vytváří generátor z definic jednou a zapisuje je do hlavičkového souboru pro C a HLS a do balíčku pro VHDL. Žádná verze proto nemůže počítat s jinou hodnotou než ostatní.

Protože je model měřítkem pro ostatní, ověřoval jsem nejdřív jeho samotný proti OpenCV:

- bitově se shoduje převod RGB na šedou a RGB na HSV na všech $2^{24}$ barvách, prahování (pět typů pro šest hodnot prahu), medián 3 × 3 s opakováním krajního pixelu a konvoluce s jádrem identity, zostřujícím a Sobelovým,
- s odchylkou nejvýše 1 až 2 úrovně se shoduje převod HSV na RGB a převod RGB na YCbCr a zpět, protože OpenCV je počítá v plovoucí řádové čárce nebo s jinak zaokrouhlenými koeficienty,
- konvoluce průměrem vychází na testovacím obraze shodně, bitová shoda ale není zaručená, protože zlomek 1/9 nelze v pevné řádové čárce vyjádřit přesně.

Odchylky od OpenCV tedy nevznikají v hardwaru, ale v definici operace. U hardwarových verzí se proto vždy požaduje shoda s modelem, ne s OpenCV. Další kontrolu tvoří jednotkové testy modelu (aritmetika, převody barev, medián, filtry), které běží i na procesoru ARM.

<!-- TODO(citace): dokumentace OpenCV (cvtColor, medianBlur, threshold, filter2D) jako zdroj sémantiky operací; podklad k vložení do citace.bib dodá Karel z Citace PRO. -->

## Aritmetika s pevnou řádovou čárkou {#sec:aritmetika}

Obrazové body jsou osmibitová celá čísla, ale koeficienty převodu barev nebo měřítko filtru jsou zlomky. Aritmetika v plovoucí řádové čárce by v obvodu @ac(FPGA) zabrala víc prostředků a měla by delší latenci než celočíselná, a bloky @ac(DSP) mají celočíselnou násobičku se vstupy širokými 27 a 18 bitů. Zlomky jsem proto počítal v pevné řádové čárce.

Číslo ve formátu $Q_{m.n}$ je celé číslo se znaménkovým bitem, $m$ bity celé části a $n$ zlomkovými bity. Uložené celé číslo $X$ představuje hodnotu

$$ x = \frac{X}{2^{n}} . $$ {#eq:q-format}

Například formát $Q_{2.15}$ má 18 bitů, rozsah přibližně od $-4$ do $4$ a rozlišení $2^{-15}$. Koeficient 0,299 se v něm uloží jako celé číslo $9\,798$, protože $0{,}299 \cdot 2^{15} = 9\,797{,}6$.

Pevná řádová čárka vyžaduje dvě konvence, které jsou ve všech třech implementacích stejné. První je zaokrouhlení polovin nahoru při posunu o $n$ bitů vpravo, druhá saturace výsledku na rozsah osmibitového obrazového bodu:

$$ \mathrm{round\_shift}(X, n) = \left\lfloor \frac{X + 2^{n-1}}{2^{n}} \right\rfloor , \qquad \mathrm{sat}_{u8}(v) = \min\bigl(\max(v, 0), 255\bigr) . $$ {#eq:round-sat}

V hardwaru je dělení mocninou dvou jen aritmetický posun, takže zaokrouhlení stojí jednu sčítačku, a u bloku DSP48E2 dokonce žádnou, protože se provede v jeho závěrečné sčítačce.

Příklad ukazuje celý postup. Řádek matice převodu RGB na šedou (BT.601) má v pořadí složek, v jakém leží v paměti, koeficienty $19\,235$ (zelená), $3\,735$ (modrá) a $9\,798$ (červená). Pro pixel s červenou 200, zelenou 100 a modrou 50 vychází součet součinů $19\,235 \cdot 100 + 3\,735 \cdot 50 + 9\,798 \cdot 200 = 4\,069\,850$. Po přičtení poloviny, tedy $2^{14} = 16\,384$, je součet $4\,086\,234$ a posun o 15 bitů dává $124$ (výsledek před posunem je 124,7, posun zaokrouhlí dolů). Výpočet v plovoucí řádové čárce dává $0{,}299 \cdot 200 + 0{,}587 \cdot 100 + 0{,}114 \cdot 50 = 124{,}2$, tedy také 124.

Koeficienty jednoho řádku matice musí dát v součtu přesně $2^{15}$, aby se bílá barva převedla na bílou. Prosté zaokrouhlení každého koeficientu zvlášť to nezaručuje, a proto generátor zbytky po zaokrouhlení rozdělí metodou největšího zbytku: koeficienty se zaokrouhlí dolů a chybějící jednotky se přidělí těm, které měly největší zlomkovou část. Původně jsem používal formát $Q_{3.14}$. Převod RGB na šedou se v něm od OpenCV lišil o jednu úroveň u 0,26 % z $2^{24}$ barev. Přechod na $Q_{2.15}$ spolu s metodou největšího zbytku odchylku odstranil a převod je bitově shodný na všech barvách. Rozsah $\pm 4$ přitom pro koeficienty převodů barev stačí.

Tabulka @ref(tab:formaty) shrnuje formáty a konvence použité u jednotlivých operací. Šířky mezivýsledků jsem nikde nepsal jako konstanty. Součin dvou čísel šířky $W_a$ a $W_b$ má $W_a + W_b$ bitů a součet $N$ čísel šířky $W$ má $W + \lceil \log_{2} N \rceil$ bitů. Jádra jsou díky tomu generická: například konvoluce se pro jiný rozměr jádra nepřepočítává ručně, a nehrozí tak chyba v šířce při změně parametru.

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

Bitovou shodu jsem ověřoval na třech úrovních, které se doplňují. První úroveň, referenční model proti OpenCV, je popsána v oddílu @ref(sec:model). Druhá a třetí ověřují hardwarová jádra proti modelu (tabulka @ref(tab:urovne)).

Tabulka: Úrovně ověření hardwarových jader {#tab:urovne widths=2.4,3.6,3.4,3.7}

| Úroveň | Co ověřuje | Nástroj | Kritérium |
| --- | --- | --- | --- |
| HLS | kód C++ a RTL vygenerované z něj | C-simulace a kosimulace C/RTL ve Vitis HLS | shoda dat i signálů `TUSER` a `TLAST` |
| VHDL | ručně psaný RTL kód | simulace v xsim (Vivado) a GHDL s generickým testbenchem | shoda dat i signálů `TUSER` a `TLAST` |
| Deska | celý řetězec s procesorem, pamětí a DMA | měřicí aplikace na procesoru Cortex-A53 | nulový počet chybných bajtů proti modelu a nulový stavový registr |

Vstupní a očekávané vektory vytváří nástroj z referenčního modelu, takže se nic neopisuje ručně. Testbench jádra posílá data v datovém toku @acs(AXI)4-Stream, ve kterém `TUSER` označuje začátek snímku a `TLAST` konec řádku. Zdroj vkládá do toku náhodné mezery a příjemce náhodně brzdí, aby se ověřilo, že se žádný pixel neztratí ani nezdvojí a že platí zpětné řízení toku. Každý test běží nejméně na dvou snímcích za sebou, protože jádro nesmí držet stav z předchozího snímku. Převod RGB na HSV a zpět jsem navíc v simulaci ověřil na všech $2^{24}$ vstupech.

C-simulace hardwarovou chybu nezachytí vždy. Kód C nemá pipeline, a proto neukáže chybu v předávání mezivýsledku mezi sousedními pixely. Histogram, který přičítá do paměti @ac(BRAM) v každém taktu, prošel C-simulací, ale kosimulace ztrácela pixely u vzorů, kde se stejná hodnota opakuje po jednom nebo dvou pixelech. U takových jader je proto kosimulace povinná. Test na desce odhalil ještě jiný druh chyby, kterou žádná simulace s plynulým tokem dat nezachytila. Popisuje ji oddíl @ref(sec:problemy).

## Metodika měření {#sec:metodika-mereni}

### Syntéza mimo kontext {#sec:ooc}

Prostředky a maximální frekvenci jsem měřil syntézou mimo kontext (out-of-context, @acs(OOC)). Je to syntéza, rozmístění a propojení jednoho jádra samostatně, bez zbytku návrhu (DMA, propojení AXI, procesor). Porty jádra se nepřipojují na piny a jediným omezením jsou hodiny s periodou 5 ns, tedy 200 MHz. Výsledkem jsou prostředky a časování jen tohoto jádra.

Čísla z celého testovacího řetězce totiž závisí na tom, co leží vedle jádra. Jádro `hls_hsv2rgb` mělo samostatně časovou rezervu 1,0 ns, v řetězci se 14 jádry už jen 0,10 ns a tvořilo jeho kritickou cestu. Jádro se nezměnilo, změnilo se rozmístění a propojení. Porovnání HLS a VHDL proto vyžaduje podmínky, které na okolí nezávisejí. RTL vygenerované z HLS prochází stejným skriptem jako VHDL, pro stejný obvod (xck26-sfvc784-2LV-c) a se stejným cílem 5 ns. Použil jsem Vivado 2025.2.

Maximální frekvenci vyjadřuji nejkratší periodou hodin, kterou jádro zvládne:

$$ T = \max\left(5 - \mathrm{WNS},\; 5 - \mathrm{WPWS}\right) \quad [\mathrm{ns}] . $$ {#eq:perioda}

@ac(WNS) je časová rezerva nejhorší logické cesty a @ac(WPWS) je rezerva minimální šířky pulzu hodin. Druhý člen je nutný, protože bloky BRAM a DSP mají minimální periodu danou výrobcem (3,077 ns u BRAM a 3,262 ns u DSP), kterou žádná úprava logiky nezkrátí. Vlastní export nástroje Vitis HLS počítá jen s WNS, a proto u jader s BRAM nebo DSP hlásí kratší periodu, než obvod skutečně zvládne. U histogramu export uvádí 2,73 ns, ale po stejném postupu jako u VHDL vychází 3,08 ns. Počet bloků BRAM udávám v dlaždicích o velikosti 36 Kb. Odhady z HLS syntézy se od výsledku po implementaci výrazně liší, například u jádra hsv2rgb 882 LUT proti 567 po implementaci, a proto používám jen čísla po implementaci.

### Měření na desce {#sec:deska}

Propustnost jsem měřil na desce KV260 v testovacím řetězci, ve kterém je všech 14 jader v jednom bitstreamu na 200 MHz (podrobně oddíl @ref(sec:retezec)). Procesor nastaví registry vybraného jádra a @ac(VDMA) přečte snímek z paměti, pošle ho jádrem a výsledek zapíše zpět do paměti. Měří se tedy celý řetězec paměť, jádro, paměť, ne samotné jádro.

Testovací snímek má rozlišení 1920 × 1080 bodů a 24 bitů na pixel. Aplikace ho při startu vytvoří deterministicky tak, aby obsahoval plynulé přechody (pro převody barev a HSV), ostré hrany (pro Sobelův filtr) a šum (pro medián). Doba zpracování je čas od spuštění čtení z paměti do jeho zastavení po 20 snímcích. Během přenosu se čte jen stav tohoto kanálu, jednou za 100 µs, což odpovídá nejistotě 5 µs na snímek, tedy méně než 0,1 %. Měření se opakuje pětkrát a výsledkem je medián.

Jako strop slouží průchod bez jádra (bypass). Při jednom pixelu za takt a hodinách 200 MHz trvá snímek $1920 \cdot 1080 / 200\,\mathrm{MHz} = 10{,}368\,\mathrm{ms}$, tedy přibližně 96 snímků za sekundu. Žádné jádro nemůže být rychlejší, a rozdíl proti průchodu proto říká, kolik času jádro přidává. Po měření aplikace porovná výstup bajt po bajtu s referenčním modelem přeloženým pro ARM. Měření je úspěšné, jen když je počet chybných bajtů nulový a u jader s okénkem je nulový i stavový registr, který hlásí poruchu synchronizace řádků. Výsledky aplikace vypisuje na sériovou linku a automatický skript je ukládá ve formátu CSV.

### Softwarové řešení na procesoru Cortex-A53 {#sec:sw}

Referenční model, přeložený pro ARM, jsem spouštěl na jednom jádru procesoru Cortex-A53 s hodinami 1333 MHz (podle nastavení generovaného ve Vivadu), bez operačního systému a se zapnutými vyrovnávacími pamětmi. Neběží tak žádný plánovač, který by měření rušil. Kód jsem přeložil s optimalizací `-O0`, `-O2` i `-O3` překladačem dodávaným s nástrojem Vitis 2025.2, protože na úrovni optimalizace závisí, jak výhodné porovnání s hardwarem vychází. Čas se měří čítačem procesoru a výsledkem je medián z 10 běhů každého algoritmu na stejném testovacím snímku jako u hardwaru.
