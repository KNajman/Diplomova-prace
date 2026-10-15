# VHDL jádra DP (VHDL-2008, Vivado 2025.2)

```
DP/vhdl/
  common/video_pkg.vhd        typy AXIS (record), UG934, stavové bity a CSC typy - shodné s HLS
  common/axis_skid_buffer.vhd 2místný skid buffer, registrovaný TREADY (výstup každého jádra)
  common/axil_regbank.vhd     AXI4-Lite banka s mapou jako HLS s_axilite (jeden C driver pro HLS i VHDL)
  csc/rtl/csc_core.vhd        převod barev (matice 3x3 Q2.15), 5 stupňů, globální enable
  csc/rtl/csc_axil.vhd        top-level IP: regbank + csc_core (porty jako HLS IP)
  tb/axis_file_source/sink    generický testbench: HEX z golden modelu, náhodné mezery a backpressure
  tb/gen_vectors.sh           testovací vektory z golden modelu (imgproc_cli) -> tb/data/ (gitem ignorováno)
  scripts/run_ghdl.sh         rychlá simulace (GHDL, vývoj)
  scripts/run_xsim.sh         finální simulace (Vivado xsim, Ababel)
  scripts/ooc_impl.tcl        OOC syntéza + implementace na 5 ns -> build/ooc/<varianta>/*.rpt
  scripts/collect_vhdl.py     reporty -> results/vhdl_results.csv (tabulky DP)
```

## Spuštění (Ababel)
```
source /tools/Xilinx/2025.2/Vivado/settings64.sh
cd DP/vhdl/tb && bash gen_vectors.sh
cd ../scripts && bash run_xsim.sh tb_csc G_PRESET=1 G_VALID_PCT=50 G_READY_PCT=50
vivado -mode batch -nojournal -nolog -source ooc_impl.tcl -tclargs csc_axil G_CH_IN=3 G_CH_OUT=3
python3 collect_vhdl.py
```

## Pravidla
1. Rozhraní jako HLS: AXI4-Stream Video UG934, `aresetn` synchronní aktivní v 0, plný backpressure.
2. Každé jádro = pipeline s globálním enable `en` + výstupní `axis_skid_buffer`; `s_axis_tready = en` (registrované).
3. Aritmetika = golden model, konstanty z `DP/model/generated/imgproc_coeffs_pkg.vhd`.
4. Testbench: golden HEX, aspoň 100/100 (propustnost 1 px/takt) + náhodné mezery/backpressure, víc snímků.
5. Fmax = max(5 - WNS, 5 - WPWS) – u DSP jader omezuje minimální šířka pulzu, ne logika.
6. Řetězce v `report` bez diakritiky (Latin-1).
