#!/usr/bin/env python3
"""
Sběr výsledků OOC implementace VHDL jader do CSV (protějšek DP/hls/scripts/collect_reports.py).

Použití:  python3 collect_vhdl.py [build/ooc] [výstup.csv]   (výchozí ../build/ooc -> ../results/vhdl_results.csv)

Z build/ooc/<varianta>/ čte utilization.rpt, timing.rpt a power.rpt (po route_design).
Dosažitelná perioda = max(cíl - WNS, cíl - WPWS): u jader s DSP omezuje frekvenci často
minimální šířka pulzu hodin (WPWS), ne logická cesta (WNS). Samotné WNS by Fmax nadhodnotilo.
"""
import csv, glob, os, re, sys

TARGET_NS = 5.0
COLUMNS = ["component", "impl_lut", "impl_ff", "impl_dsp", "impl_bram", "impl_lutram",
           "wns_ns", "wpws_ns", "impl_cp_ns", "impl_fmax_mhz", "limit", "timing_met", "power_dyn_w"]


def read(path):
    return open(path, encoding="utf-8", errors="replace").read() if os.path.isfile(path) else ""


def util_value(text, name):
    m = re.search(r"^\|\s*%s\s*\|\s*([\d.]+)" % re.escape(name), text, re.MULTILINE)
    return m.group(1) if m else ""


def parse(dir_):
    util = read(os.path.join(dir_, "utilization.rpt"))
    tim = read(os.path.join(dir_, "timing.rpt"))
    pwr = read(os.path.join(dir_, "power.rpt"))
    row = {"component": os.path.basename(dir_),
           "impl_lut": util_value(util, "CLB LUTs"), "impl_ff": util_value(util, "CLB Registers"),
           "impl_dsp": util_value(util, "DSPs"), "impl_bram": util_value(util, "Block RAM Tile"),
           "impl_lutram": util_value(util, "LUT as Memory")}
    # Řádek čísel pod hlavičkou "WNS(ns) TNS(ns) ... WPWS(ns) ..." v Design Timing Summary
    m = re.search(r"WNS\(ns\).*?\n\s*-+.*?\n\s*([-\d.]+)\s+[-\d.]+\s+\d+\s+\d+\s+[-\d.]+\s+[-\d.]+\s+\d+\s+\d+\s+([-\d.]+)", tim)
    if m:
        wns, wpws = float(m.group(1)), float(m.group(2))
        cp_wns, cp_pw = TARGET_NS - wns, TARGET_NS - wpws
        cp = max(cp_wns, cp_pw)
        row.update({"wns_ns": "%.3f" % wns, "wpws_ns": "%.3f" % wpws, "impl_cp_ns": "%.3f" % cp,
                    "impl_fmax_mhz": "%.1f" % (1000.0 / cp), "limit": "pulse_width" if cp_pw > cp_wns else "logic",
                    "timing_met": "yes" if (wns >= 0 and wpws >= 0) else "no"})
    m = re.search(r"\|\s*Dynamic \(W\)\s*\|\s*([\d.]+)", pwr)
    if m:
        row["power_dyn_w"] = m.group(1)
    return row


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    build = sys.argv[1] if len(sys.argv) > 1 else os.path.join(here, "..", "build", "ooc")
    out = sys.argv[2] if len(sys.argv) > 2 else os.path.join(here, "..", "results", "vhdl_results.csv")
    rows = [parse(d) for d in sorted(glob.glob(os.path.join(build, "*"))) if os.path.isdir(d)]
    os.makedirs(os.path.dirname(os.path.abspath(out)), exist_ok=True)
    with open(out, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=COLUMNS)
        w.writeheader()
        for r in rows:
            w.writerow({c: r.get(c, "") for c in COLUMNS})
    print("Zapsano %d variant do %s" % (len(rows), out))
    for r in rows:
        print("  %-32s LUT %-5s FF %-5s DSP %-3s BRAM %-3s  %s ns (%s)" % (r["component"], r["impl_lut"], r["impl_ff"],
              r["impl_dsp"], r["impl_bram"], r.get("impl_cp_ns", "-"), r.get("limit", "-")))


if __name__ == "__main__":
    main()
