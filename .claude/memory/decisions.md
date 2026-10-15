# Rychlý výtah rozhodnutí (detail a zdůvodnění v plan_dokonceni_DP.md)

- Rozsah: CSC (generická matice), RGB↔HSV, prahování, 2D konvoluce (mean/Sobel/zostření), medián 3×3, histogram – vše HLS + VHDL + SW. Medián VHDL se neškrtá nikdy.
- Priority škrtů: P1 VHDL histogram; P2 Sobel dual/OOC 5×5 7×7/replicate/VHDL prahování; bonus Otsu, VFB, OpenCV na Ubuntu, VVL, BRAM histogram, -Os.
- Rozhraní: AXI4-Stream Video UG934, TUSER=SOF, TLAST=EOL, plný backpressure, `aresetn` sync aktivní v 0, max šířka 3840, resync na TUSER povinná, stavový registr.
- Hodiny: OOC cíl 5 ns pro všechna jádra; na desce 200 → 148,5 → 100 MHz.
- VHDL-2008, AXIS v recordech, žádné VHDL-2019 interfaces. Mapa registrů shodná s HLS, jeden C driver.
- Bodová jádra: bez čítačů, TUSER/TLAST putují s daty; HLS `ap_ctrl_hs` po řádcích + auto-restart.
- Okénková jádra: geometrie z čítačů (varianta 2), flush s `s_axis_tready=0`, skid buffer, BRAM line buffery, resync na TUSER.
- Aritmetika: golden C model bitově závazný. CSC Q2.15 half-up + saturace; HSV algoritmus OpenCV (shift 12); konvoluce scale Q.14, SAME, zero padding (replicate pokud snadné); medián 7× sort3; magnituda gradientu – otevřené (default AMBM α=1, β=1/2).
- Jeden bitstream, histogram v bypass režimu, vlastní TB (2–4 povinné), SW -O0/-O2/-O3.
- Výsledky: skripty na Ababelu → CSV → LaTeX tabulky.
