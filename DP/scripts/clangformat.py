#!/usr/bin/env python3
"""
@file    clangformat.py
@brief   clang-format pro C/C++ v DP + odsazení #pragma HLS podle kódu
@author  Bc. Karel Najman
@date    2026-11-22
@copyright Bc. Karel Najman, Technická univerzita v Liberci

clang-format (DP/.clang-format, IndentPPDirectives: Leave) odsazení direktiv jen zachová - pragma, která už
stojí ve sloupci 0 (např. po formátování výchozím stylem), tam zůstane. Skript proto po clang-formatu odsadí
každý řádek #pragma HLS stejně jako nejbližší následující řádek kódu (přeskočí další direktivy a prázdné řádky).

Použití (z libovolného adresáře):
    python DP/scripts/clangformat.py                 všechny .c/.h/.cpp/.hpp v DP/hls, DP/model/lib_imgproc, DP/sw
    python DP/scripts/clangformat.py soubor.cpp ...  jen zadané soubory
    python DP/scripts/clangformat.py --check [...]   jen kontrola, exit 1 když je potřeba formátovat
clang-format 22+: v PATH, nebo cesta v proměnné prostředí CLANG_FORMAT.
"""

import os
import re
import subprocess
import sys

DP_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEFAULT_DIRS = ["hls", os.path.join("model", "lib_imgproc"), os.path.join("sw", "harness_app")]
EXTENSIONS = (".c", ".h", ".cpp", ".hpp")
SKIP_DIRS = {"build", "generated", ".git"}
PRAGMA_RE = re.compile(r"^\s*#\s*pragma\s+HLS\b")
DIRECTIVE_RE = re.compile(r"^\s*#")


def find_sources(paths):
    """Seznam zdrojových souborů ze zadaných souborů a adresářů (rekurzivně, bez build/generated)."""
    sources = []
    for path in paths:
        if os.path.isfile(path):
            sources.append(path)
            continue
        for root, dirs, files in os.walk(path):
            dirs[:] = sorted(d for d in dirs if d not in SKIP_DIRS)
            sources.extend(os.path.join(root, f) for f in sorted(files) if f.endswith(EXTENSIONS))
    return sources


def indent_pragmas(text):
    """Odsadí řádky #pragma HLS jako následující řádek kódu."""
    lines = text.split("\n")
    for i, line in enumerate(lines):
        if not PRAGMA_RE.match(line):
            continue
        indent = ""
        for following in lines[i + 1:]:
            if following.strip() and not DIRECTIVE_RE.match(following):
                indent = following[:len(following) - len(following.lstrip())]
                if following.lstrip().startswith("}"):
                    indent += "    "      # pragma na konci bloku: o úroveň hlouběji než }
                break
        lines[i] = indent + line.lstrip()
    return "\n".join(lines)


def format_file(clang_format, path):
    """Vrátí naformátovaný obsah souboru."""
    result = subprocess.run([clang_format, "--style=file", "--assume-filename=" + path, path],
                            capture_output=True, check=True)
    return indent_pragmas(result.stdout.decode("utf-8"))


def main():
    args = sys.argv[1:]
    check = "--check" in args
    paths = [a for a in args if a != "--check"] or [os.path.join(DP_DIR, d) for d in DEFAULT_DIRS]
    clang_format = os.environ.get("CLANG_FORMAT", "clang-format")

    changed = []
    for path in find_sources(paths):
        with open(path, encoding="utf-8", newline="") as f:
            original = f.read()
        formatted = format_file(clang_format, path)
        if formatted != original:
            changed.append(path)
            if not check:
                with open(path, "w", encoding="utf-8", newline="") as f:
                    f.write(formatted)

    for path in changed:
        print(("potřebuje formátovat: " if check else "naformátováno: ") + os.path.relpath(path))
    if check and changed:
        sys.exit(1)


if __name__ == "__main__":
    main()
