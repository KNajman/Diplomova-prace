# Poznatky odstraněné z kapitoly 4 (2. 11. 2026)

Kapitola 4 popisuje metodu a rozhodnutí před měřením. Co se zjistilo až při testování a měření, patří do kapitol 5 a 6.
Tady jsou odstraněné pasáže a kam je přesunout. Čísla jsou z `DP/results/vysledky.md` (V#).

| odstraněný poznatek | původní místo v kap. 4 | kam patří | podklad |
| --- | --- | --- | --- |
| C-simulace nezachytila chybu v předávání mezivýsledku: histogram s přičítáním do BRAM v každém taktu prošel C-simulací, kosimulace ztrácela pixely u vzorů s opakovanou hodnotou po jednom nebo dvou pixelech; proto je kosimulace u takových jader povinná | 4.4 Úrovně ověření | kap. 5, oddíl Histogram (implementace) | README (Ověření a měření), V7, lessons.md |
| Test na desce odhalil chybu, kterou simulace s plynulým tokem nezachytila (řádková HLS jádra s auto-rewind držela ocas řádku, SOFLateErr, oprava `enable_auto_rewind=0`) | 4.4 Úrovně ověření (odkaz na oddíl Nalezené problémy) | kap. 5, oddíl Nalezené problémy | V16, V17, lessons.md |
| Výsledek porovnání modelu s OpenCV: bitová shoda (RGB na šedou a na HSV na všech 2^24 barvách, prahování 5 typů pro 6 prahů, medián 3 × 3 s opakováním okraje, konvoluce identity, zostření a Sobel); odchylka nejvýše 1 až 2 úrovně (HSV na RGB, RGB na YCbCr a zpět); konvoluce průměrem bez zaručené shody (1/9 nejde přesně v pevné čárce) | 4.2 Referenční model v C (odrážky) | kap. 6, oddíl Ověření funkce | README (Ověření a měření), V15 |
| Historie formátu: původně Q3.14, převod RGB na šedou se od OpenCV lišil o jednu úroveň u 0,26 % z 2^24 barev; přechod na Q2.15 spolu s metodou největšího zbytku odchylku odstranil | 4.3 Aritmetika | kap. 5, oddíl Převod barev (nebo kap. 6, ověření funkce) | lessons.md (Golden model), plán (Aritmetika) |
| OOC proti kontextu: jádro `hls_hsv2rgb` mělo samostatně časovou rezervu 1,0 ns, v řetězci se 14 jádry 0,10 ns a tvořilo kritickou cestu | 4.5.1 Syntéza mimo kontext | kap. 6, oddíl Využití zařízení celým řetězcem | V11, V12 |
| Export Vitis HLS proti OOC: u histogramu export uvádí 2,73 ns, po stejném postupu jako u VHDL vychází 3,08 ns | 4.5.1 | kap. 6, oddíl Prostředky a maximální frekvence | V9 |
| Odhad HLS syntézy proti implementaci: u jádra hsv2rgb 882 LUT proti 567 | 4.5.1 | kap. 6, oddíl Prostředky a maximální frekvence | V11 |
