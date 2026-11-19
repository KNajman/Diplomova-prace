#!/usr/bin/env bash
# =============================================================================
#  Export diagramů DP (TikZ) do samostatných souborů pro prezentaci a výstřižky.
#  Použití (z doc/obrazky):  bash export.sh [obrazek ...]     bez argumentu všechny *.tex kromě dp_styl a _*
#  Výstup:   export/<obrazek>.pdf  (vektor, do prezentace nebo k vložení jako obrázek)
#            export/<obrazek>.svg  (vektor; pdftocairo, jinak dvisvgm z TeX Live)
#            export/<obrazek>.png  (300 dpi; pdftoppm, jinak Ghostscript)
#  Do textu DP se obrázky NEexportují: DP.tex je vkládá přímo přes \input{obrazky/<obrazek>}.
# =============================================================================
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p export
list=("$@")
if [ ${#list[@]} -eq 0 ]; then
    for f in *.tex; do case "$f" in dp_styl.tex|_*) ;; *) list+=("${f%.tex}") ;; esac; done
fi
for n in "${list[@]}"; do
    xelatex -interaction=nonstopmode -halt-on-error -output-directory=export -jobname="$n" \
        "\\def\\obrazek{$n}\\input{_samostatny}" > "export/$n.out" 2>&1 \
        || { echo "CHYBA: $n (export/$n.log)"; continue; }
    if command -v pdftocairo > /dev/null; then pdftocairo -svg "export/$n.pdf" "export/$n.svg"
    elif command -v dvisvgm > /dev/null; then dvisvgm --pdf -o "export/$n.svg" "export/$n.pdf" > /dev/null 2>&1 || echo "  SVG se nepodařilo (dvisvgm)"
    else echo "  SVG: chybí pdftocairo i dvisvgm"; fi
    if command -v pdftoppm > /dev/null; then pdftoppm -png -r 300 -singlefile "export/$n.pdf" "export/$n"
    elif command -v gswin64c > /dev/null || command -v gs > /dev/null; then
        GS=$(command -v gswin64c || command -v gs); "$GS" -q -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pngalpha -r300 -sOutputFile="export/$n.png" "export/$n.pdf"
    else echo "  PNG: chybí pdftoppm i Ghostscript"; fi
    rm -f "export/$n.aux" "export/$n.out" "export/$n.log"
    echo "OK: $n"
done
