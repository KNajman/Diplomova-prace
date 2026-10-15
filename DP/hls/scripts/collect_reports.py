#!/usr/bin/env python3
"""
Sběr výsledků HLS jader do CSV pro tabulky v DP (jen standardní knihovna Pythonu 3.6+).

Použití:  python3 collect_reports.py [build_dir] [výstup.csv]
          výchozí: ../build  ->  ../results/hls_results.csv

Projde build/<jádro>_<varianta>/hls/ a z reportů vytáhne:
  syn/report/<top>_csynth.rpt        odhad HLS: perioda, II, latence iterace, LUT/FF/DSP/BRAM
  sim/report/<top>_cosim.rpt         C/RTL cosim: stav, latence a interval transakce (v taktech)
  impl/report/vhdl/export_impl.rpt   Vivado OOC po implementaci: LUT/FF/DSP/BRAM/SRL, dosažená perioda
Chybějící report = prázdné buňky (např. když se nespustil krok impl).

Poznámka: pro srovnání HLS x VHDL se v DP používají čísla PO IMPLEMENTACI (impl_*).
Odhady z HLS syntézy (est_*) slouží jen pro ilustraci rozdílu odhad vs. realita.
"""

import csv
import glob
import os
import re
import sys

COLUMNS = [
    "component", "top", "target_ns",
    "est_ns", "est_fmax_mhz", "ii", "iter_latency", "est_lut", "est_ff", "est_dsp", "est_bram",
    "cosim_status", "cosim_latency_avg", "cosim_interval_avg", "cosim_interval_max",
    "impl_lut", "impl_ff", "impl_dsp", "impl_bram", "impl_srl", "impl_cp_ns", "impl_fmax_mhz", "impl_timing_met",
]


def read(path):
    """Vrátí obsah souboru, nebo prázdný řetězec, když neexistuje."""
    if path and os.path.isfile(path):
        with open(path, encoding="utf-8", errors="replace") as handle:
            return handle.read()
    return ""


def table_row(text, first_cell):
    """Najde řádek tabulky |first_cell|...| a vrátí jeho buňky bez okrajů."""
    for line in text.splitlines():
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if cells and cells[0] == first_cell:
            return cells
    return []


def fmax(period_ns):
    """Převod periody v ns na frekvenci v MHz (prázdné při chybějící hodnotě)."""
    try:
        return "%.1f" % (1000.0 / float(period_ns))
    except (TypeError, ValueError, ZeroDivisionError):
        return ""


def parse_csynth(text):
    """Odhad z HLS syntézy: perioda, II a latence iterace (první smyčka), prostředky (řádek Total)."""
    res = {}
    clock = re.search(r"\|\s*ap_clk\s*\|\s*([\d.]+)\s*ns\s*\|\s*([\d.]+)\s*ns", text)
    if clock:
        res["target_ns"], res["est_ns"] = clock.group(1), clock.group(2)
        res["est_fmax_mhz"] = fmax(clock.group(2))
    loop = re.search(r"\|-\s*\S+\s*\|[^|]*\|[^|]*\|\s*(\d+)\s*\|\s*(\d+)\s*\|", text)
    if loop:
        res["iter_latency"], res["ii"] = loop.group(1), loop.group(2)
    util = text.split("Utilization Estimates")[-1] if "Utilization Estimates" in text else ""
    total = table_row(util, "Total")
    if len(total) >= 5:   # | Total | BRAM_18K | DSP | FF | LUT | URAM |
        res["est_bram"], res["est_dsp"], res["est_ff"], res["est_lut"] = total[1], total[2], total[3], total[4]
    return res


def parse_cosim(text):
    """Cosim: řádek VHDL (nebo Verilog) - stav, latence avg, interval avg/max."""
    for rtl in ("VHDL", "Verilog"):
        row = table_row(text, rtl)
        if len(row) >= 8 and row[1] != "NA":   # RTL | Status | lat min avg max | int min avg max | total
            return {"cosim_status": row[1], "cosim_latency_avg": row[3],
                    "cosim_interval_avg": row[6], "cosim_interval_max": row[7]}
    return {}


def parse_impl(text):
    """Vivado OOC po implementaci (export_impl.rpt): prostředky a dosažená perioda."""
    res = {}
    section = text.split("Post-Implementation Resource usage")[-1] if "Post-Implementation" in text else text
    for key, col in (("LUT", "impl_lut"), ("FF", "impl_ff"), ("DSP", "impl_dsp"),
                     ("BRAM", "impl_bram"), ("SRL", "impl_srl")):
        match = re.search(r"^\s*%s:\s*(\d+)" % key, section, re.MULTILINE)
        if match:
            res[col] = match.group(1)
    # Vitis 2025.2: tabulka "| Post-Route | 3.847 |" v sekci "Place & Route Timing Summary"
    # (starší verze psaly "CP achieved post-implementation: 3.847")
    cp = (re.search(r"\|\s*Post-Route\s*\|\s*([\d.]+)", text)
          or re.search(r"CP achieved post-implementation:\s*([\d.]+)", text))
    if cp:
        res["impl_cp_ns"] = cp.group(1)
        res["impl_fmax_mhz"] = fmax(cp.group(1))
    if text:
        met = re.search(r"Timing (was |constraints are )?met", text, re.I)
        res["impl_timing_met"] = "yes" if met and not re.search(r"Timing was NOT met", text) else "no"
    return res


def first(pattern):
    """První soubor odpovídající vzoru, nebo None."""
    matches = sorted(glob.glob(pattern))
    return matches[0] if matches else None


def collect(build_dir):
    """Projde všechny komponenty v build_dir a vrátí seznam řádků CSV."""
    rows = []
    for comp_dir in sorted(glob.glob(os.path.join(build_dir, "*", "hls"))):
        component = os.path.basename(os.path.dirname(comp_dir))
        csynth = first(os.path.join(comp_dir, "syn", "report", "*_csynth.rpt"))
        if csynth is None:
            continue
        row = {"component": component, "top": os.path.basename(csynth).replace("_csynth.rpt", "")}
        row.update(parse_csynth(read(csynth)))
        row.update(parse_cosim(read(first(os.path.join(comp_dir, "sim", "report", "*_cosim.rpt")))))
        row.update(parse_impl(read(first(os.path.join(comp_dir, "impl", "report", "*", "export_impl.rpt")))))
        rows.append(row)
    return rows


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    build_dir = sys.argv[1] if len(sys.argv) > 1 else os.path.join(here, "..", "build")
    out_csv = sys.argv[2] if len(sys.argv) > 2 else os.path.join(here, "..", "results", "hls_results.csv")
    rows = collect(build_dir)
    os.makedirs(os.path.dirname(os.path.abspath(out_csv)), exist_ok=True)
    with open(out_csv, "w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=COLUMNS)
        writer.writeheader()
        for row in rows:
            writer.writerow({c: row.get(c, "") for c in COLUMNS})
    print("Zapsáno %d jader do %s" % (len(rows), out_csv))
    for row in rows:
        print("  %-28s II=%-2s est=%sns impl=%sns  LUT %s/%s  DSP %s/%s  cosim %s" % (
            row["component"], row.get("ii", "?"), row.get("est_ns", "-"), row.get("impl_cp_ns", "-"),
            row.get("est_lut", "-"), row.get("impl_lut", "-"), row.get("est_dsp", "-"), row.get("impl_dsp", "-"),
            row.get("cosim_status", "-")))


if __name__ == "__main__":
    main()
