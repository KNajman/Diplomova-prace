#!/usr/bin/env python3
"""Kontrola formální stránky textu diplomové práce (LaTeX + citace).

Použití:
    python3 dp_check.py latex DP.tex            # sazba, typografie, objekty, zkratky
    python3 dp_check.py cite  DP.tex citace.bib # citace a seznam literatury
    python3 dp_check.py all   DP.tex citace.bib

Skript jen hlásí nálezy (řádek: pravidlo: úryvek -> návrh), nic neupravuje.
Rozhodnutí o opravě je na autorovi; část nálezů jsou kandidáti (falešné poplachy
jsou možné, např. číslo verze 2025.2 vypadá jako desetinná tečka).

Poznámka k návrhu: místo plného parseru LaTeXu skript řádek po řádku maskuje
komentáře, matematiku a výpisy kódu a na zbytek pouští regulární výrazy. Je to
jednoduché a pro kontrolu jednoho dokumentu stačí; cenou jsou ojedinělé
falešné nálezy, které autor snadno přeskočí.
"""

import re
import sys
from collections import Counter, defaultdict

VERBATIM_ENVS = ("lstlisting", "verbatim", "minted", "tikzpicture", "axis")
MATH_ENVS = ("equation", "equation*", "align", "align*", "gather", "gather*",
             "multline", "multline*", "eqnarray", "displaymath")
UNITS = r"(?:ns|us|µs|ms|s|Hz|kHz|MHz|GHz|nm|mm|cm|m|kB|MB|GB|KiB|MiB|Kib|b|B|px|bit|bitů|bity|V|mV|W|mW|°C|%)"
ONE_LETTER = "kKsSvVzZoOuUaAiI"


class Finding:
    def __init__(self, line_no, rule, excerpt, suggestion):
        self.line_no = line_no
        self.rule = rule
        self.excerpt = excerpt.strip()
        self.suggestion = suggestion

    def __str__(self):
        excerpt = self.excerpt if len(self.excerpt) <= 70 else self.excerpt[:67] + "..."
        return f"{self.line_no:5d}: [{self.rule}] {excerpt}  ->  {self.suggestion}"


def strip_comment(line):
    """Odstraní komentář % (ne \\%)."""
    return re.sub(r"(?<!\\)%.*$", "", line)


def mask_inline_math(line):
    """Nahradí $...$ a \\(...\\) mezerami stejné délky (zachová sloupce)."""
    line = re.sub(r"\\\((.*?)\\\)", lambda m: " " * len(m.group(0)), line)
    return re.sub(r"(?<!\\)\$(.+?)(?<!\\)\$", lambda m: " " * len(m.group(0)), line)


def read_lines(path):
    with open(path, encoding="utf-8") as tex_file:
        return tex_file.read().split("\n")


def classify_lines(lines):
    """Vrátí pro každý řádek (text_bez_komentáře, je_verbatim, je_matematika)."""
    result = []
    verbatim_depth = 0
    math_depth = 0
    display_math = False
    for raw_line in lines:
        line = strip_comment(raw_line)
        for env in VERBATIM_ENVS:
            if re.search(r"\\begin\{" + re.escape(env) + r"\}", line):
                verbatim_depth += 1
        for env in MATH_ENVS:
            if re.search(r"\\begin\{" + re.escape(env) + r"\}", line):
                math_depth += 1
        if re.search(r"\\\[", line):
            display_math = True
        in_verbatim = verbatim_depth > 0
        in_math = math_depth > 0 or display_math
        result.append((line, in_verbatim, in_math))
        for env in VERBATIM_ENVS:
            if re.search(r"\\end\{" + re.escape(env) + r"\}", line):
                verbatim_depth = max(0, verbatim_depth - 1)
        for env in MATH_ENVS:
            if re.search(r"\\end\{" + re.escape(env) + r"\}", line):
                math_depth = max(0, math_depth - 1)
        if re.search(r"\\\]", line):
            display_math = False
    return result


# --------------------------------------------------------------------------- latex

def check_latex(tex_path):
    lines = read_lines(tex_path)
    full_text = "\n".join(strip_comment(line) for line in lines)
    findings = []
    uses_xevlna = re.search(r"\\usepackage(\[[^\]]*\])?\{(xevlna|luavlna)\}", full_text) is not None
    uses_icomma = re.search(r"\\usepackage(\[[^\]]*\])?\{icomma\}", full_text) is not None
    uses_booktabs = re.search(r"\\usepackage(\[[^\]]*\])?\{booktabs\}", full_text) is not None
    in_document = False
    one_letter_lines = []

    for line_idx, (line, in_verbatim, in_math) in enumerate(classify_lines(lines)):
        line_no = line_idx + 1
        if "\\begin{document}" in line:
            in_document = True
        if not in_document or in_verbatim:
            continue

        # Matematika: desetinná čárka.
        math_parts = re.findall(r"(?<!\\)\$(.+?)(?<!\\)\$", line) if not in_math else [line]
        if not uses_icomma:
            for math_part in math_parts:
                for match in re.finditer(r"\d,\d", math_part):
                    findings.append(Finding(line_no, "čárka v matematice", math_part,
                                            "v $...$ je čárka interpunkce (16, 7): psát 16{,}7 nebo načíst balík icomma"))
        for math_part in math_parts:
            for match in re.finditer(r"\d\s*[x*]\s*\d", math_part):
                findings.append(Finding(line_no, "násobení", match.group(0),
                                        "\\cdot (součin) nebo \\times (rozměr), ne x ani *"))
        if in_math:
            continue

        text = mask_inline_math(line)

        # Uvozovky.
        if re.search(r'(?<!\\)"', text) or "``" in text or "“" in text and "„" not in text:
            findings.append(Finding(line_no, "uvozovky", text,
                                    "české uvozovky „…“ nebo \\enquote{…} (csquotes)"))

        # Pomlčka.
        for match in re.finditer(r"\S\s-\s\S", text):
            findings.append(Finding(line_no, "pomlčka", match.group(0),
                                    "spojovník s mezerami: pomlčka je -- (s mezerami ve větě, bez mezer v rozsahu 25--28)"))
        for match in re.finditer(r"\d-\d", text):
            if not re.search(r"[A-Za-z]\d-\d|\d-\d[A-Za-z]", text[max(0, match.start() - 1):match.end() + 1]):
                findings.append(Finding(line_no, "rozsah", match.group(0),
                                        "rozsah čísel pomlčkou bez mezer: 3--5"))

        # Křížové odkazy a citace bez pevné mezery.
        for match in re.finditer(r"\S( +)\\(ref|eqref|cite|autoref|pageref)\{", text):
            findings.append(Finding(line_no, "pevná mezera", match.group(0),
                                    f"před \\{match.group(2)} dát ~ (obrázek~\\ref{{…}}, text~\\cite{{…}})"))

        # Citace za tečkou.
        for match in re.finditer(r"[.!?]\s*\\cite\{", text):
            findings.append(Finding(line_no, "citace za tečkou", match.group(0),
                                    "odkaz patří před tečku: …text~\\cite{key}."))

        # Jednopísmenná slova.
        if not uses_xevlna:
            for match in re.finditer(r"(?:(?<=\s)|^)([" + ONE_LETTER + r"]) +(?=\S)", text):
                one_letter_lines.append(line_no)

        # Číslo a jednotka.
        for match in re.finditer(r"\d+( +)" + UNITS + r"(?![A-Za-zá-žÁ-Ž])", text):
            findings.append(Finding(line_no, "číslo a jednotka", match.group(0),
                                    "pevná mezera mezi číslem a jednotkou: 5~ns nebo 5\\,ns (jednotně)"))

        # Desetinná tečka u čísla s jednotkou.
        for match in re.finditer(r"\d\.\d+\s*(?:~|\\,)?\s*" + UNITS + r"(?![A-Za-z])", text):
            findings.append(Finding(line_no, "desetinná tečka", match.group(0),
                                    "desetinná čárka: 3,08~ns"))

        # Násobení písmenem x v textu (rozměry, kratší zápis).
        for match in re.finditer(r"\d+ ?x ?\d+", text):
            findings.append(Finding(line_no, "násobení", match.group(0),
                                    "rozměr: $3 \\times 3$ nebo 3~×~3; „krát“: 5× / 5krát"))

        # Ruční odřádkování.
        if re.search(r"\\\\\s*$", text) and not re.search(r"&", text):
            findings.append(Finding(line_no, "\\\\ v odstavci", text,
                                    "odstavec ukončit prázdným řádkem, ne \\\\"))

        # Nadpisy.
        heading = re.search(r"\\(chapter|section|subsection|subsubsection|paragraph)\*?\{(.*)\}", text)
        if heading:
            level, title = heading.groups()
            if level in ("subsubsection", "paragraph"):
                findings.append(Finding(line_no, "úroveň nadpisu", text,
                                        "nejvýše tři úrovně (kapitola, sekce, podsekce)"))
            if title.rstrip().endswith("."):
                findings.append(Finding(line_no, "tečka v nadpisu", title, "nadpis bez tečky na konci"))
            if "™" in title or "®" in title or "\\texttrademark" in title:
                findings.append(Finding(line_no, "značka v nadpisu", title,
                                        "™/® do nadpisu nepatří (reklamní prvek); případně jednou v textu"))
            if re.search(r"[A-Za-z]{3,} (for|and|of|the|with) [A-Za-z]", title):
                findings.append(Finding(line_no, "anglický nadpis", title, "nadpis česky (viz dp-styl)"))

        # Placeholdery.
        if re.search(r"\\caption\{\s*Caption\s*\}|\\label\{[^}]*placeholder[^}]*\}", text):
            findings.append(Finding(line_no, "zástupný text", text, "doplnit skutečný popisek / label"))

        # Wikipedie a vyhledávače v textu.
        if re.search(r"wikipedia\.org|google\.|chatgpt|gemini\.google|claude\.ai", text, re.I):
            findings.append(Finding(line_no, "zakázaný zdroj", text,
                                    "odkaz na Wikipedii/vyhledávač/AI nahradit citací primárního zdroje (Dvacatero 15f)"))

        # Tabulky se svislými čarami při booktabs.
        tabular = re.search(r"\\begin\{tabular\}\{([^}]*)\}", text)
        if tabular and "|" in tabular.group(1) and uses_booktabs:
            findings.append(Finding(line_no, "tabulka", tabular.group(0),
                                    "booktabs: bez svislých čar, \\toprule/\\midrule/\\bottomrule místo \\hline"))

    if one_letter_lines:
        # Poznámka k volbě: jednopísmenných slov jsou v textu stovky, výpis každého
        # by přehlušil ostatní nálezy; řešení je stejně jedno (xevlna nebo ~).
        first_lines = ", ".join(str(number) for number in sorted(set(one_letter_lines))[:8])
        findings.append(Finding(one_letter_lines[0], "jednopísmenná slova",
                                f"{len(one_letter_lines)}× bez ~ (řádky {first_lines}, …)",
                                "\\usepackage{xevlna} za polyglossia (XeLaTeX) vyřeší celý dokument; jinak ručně k~, s~, v~, z~, o~, u~, a~, i~"))
    findings.extend(check_floats(lines))
    findings.extend(check_acronyms(lines))
    return findings


def check_floats(lines):
    """Pořadí \\caption a obsahu, \\label za \\caption, prefix labelu."""
    findings = []
    text = "\n".join(strip_comment(line) for line in lines)
    env_pattern = re.compile(r"\\begin\{(figure|table|lstlisting)\*?\}(.*?)\\end\{\1\*?\}", re.S)
    for match in env_pattern.finditer(text):
        env, body = match.group(1), match.group(2)
        line_no = text.count("\n", 0, match.start()) + 1
        caption_pos = body.find("\\caption")
        label_match = re.search(r"\\label\{([^}]*)\}", body)
        if env == "lstlisting":
            continue
        if caption_pos < 0:
            findings.append(Finding(line_no, f"{env} bez popisku", env, "doplnit \\caption"))
            continue
        content_markers = ("\\includegraphics", "\\begin{tikzpicture}", "\\begin{tabular", "\\input")
        content_positions = [body.find(marker) for marker in content_markers if body.find(marker) >= 0]
        if content_positions:
            content_pos = min(content_positions)
            if env == "table" and caption_pos > content_pos:
                findings.append(Finding(line_no, "popisek tabulky", "\\caption pod tabulkou",
                                        "u tabulky je popisek NAD tabulkou"))
            if env == "figure" and caption_pos < content_pos:
                findings.append(Finding(line_no, "popisek obrázku", "\\caption nad obrázkem",
                                        "u obrázku je popisek POD obrázkem"))
        if label_match:
            if body.find("\\label") < caption_pos:
                findings.append(Finding(line_no, "label před caption", label_match.group(0),
                                        "\\label až za \\caption, jinak odkaz ukáže číslo kapitoly"))
            expected_prefix = {"figure": "fig:", "table": "tab:"}[env]
            if not label_match.group(1).startswith(expected_prefix):
                findings.append(Finding(line_no, "prefix labelu", label_match.group(0),
                                        f"jednotný prefix {expected_prefix}"))
        else:
            findings.append(Finding(line_no, f"{env} bez labelu", env, "doplnit \\label a odkázat na objekt v textu"))
    for match in re.finditer(r"\\begin\{lstlisting\}(\[[^\]]*\])?", text):
        options = match.group(1) or ""
        line_no = text.count("\n", 0, match.start()) + 1
        if "caption" not in options:
            findings.append(Finding(line_no, "kód bez popisku", match.group(0),
                                    "\\begin{lstlisting}[language=…, caption={…}, label={lst:…}]"))
    labels = re.findall(r"\\label\{([^}]*)\}", text)
    referenced = set(re.findall(r"\\(?:ref|eqref|autoref|pageref)\{([^}]*)\}", text))
    for label in labels:
        if label not in referenced:
            findings.append(Finding(0, "neodkazovaný objekt", label,
                                    "na každý obrázek, tabulku a vzorec má text odkazovat"))
    for duplicate, count in Counter(labels).items():
        if count > 1:
            findings.append(Finding(0, "duplicitní label", duplicate, f"{count}× stejný label"))
    return findings


def check_acronyms(lines):
    findings = []
    text = "\n".join(strip_comment(line) for line in lines)
    defined = re.findall(r"\\acro\{([^}]*)\}", text)
    if not defined:
        return findings
    if defined != sorted(defined, key=str.lower):
        findings.append(Finding(0, "seznam zkratek", ", ".join(defined[:6]) + " …",
                                "řadit podle abecedy (Metodika příl. F)"))
    used = set(re.findall(r"\\acs?p?l?f?\*?\{([^}]*)\}", text))
    body = text.split("\\end{acronym}", 1)[-1]
    body_plain = re.sub(r"\\[a-zA-Z]+\*?(\[[^\]]*\])?\{[^}]*\}", " ", body)
    for acronym in defined:
        plain_count = len(re.findall(r"(?<![\\{A-Za-z])" + re.escape(acronym) + r"(?![A-Za-z}])", body_plain))
        if acronym not in used:
            findings.append(Finding(0, "nepoužitá zkratka", acronym,
                                    "s printonlyused se nevytiskne; v textu psát \\ac{" + acronym + "}"))
        elif plain_count:
            findings.append(Finding(0, "zkratka bez \\ac", f"{acronym} ({plain_count}×)",
                                    "používat \\ac{} všude (první výskyt rozepíše, seznam je úplný)"))
    for acronym in sorted(used - set(defined)):
        findings.append(Finding(0, "nedefinovaná zkratka", acronym, "doplnit \\acro do seznamu zkratek"))
    return findings


# --------------------------------------------------------------------------- citace

def parse_bib(bib_path):
    with open(bib_path, encoding="utf-8") as bib_file:
        content = bib_file.read()
    entries = {}
    for match in re.finditer(r"@(\w+)\s*\{\s*([^,\s]+)\s*,(.*?)\n\}", content, re.S):
        entry_type, key, body = match.group(1).lower(), match.group(2), match.group(3)
        fields = {}
        for field_match in re.finditer(r"(\w+)\s*=\s*(\{(?:[^{}]|\{[^{}]*\})*\}|\"[^\"]*\"|\d+)", body):
            fields[field_match.group(1).lower()] = field_match.group(2).strip("{}\"")
        line_no = content.count("\n", 0, match.start()) + 1
        raw_author = re.search(r"author\s*=\s*(\{.*?\}),?\s*\n", body, re.S | re.I)
        entries[key] = (entry_type, fields, line_no, raw_author.group(1) if raw_author else "")
    return entries


def check_cite(tex_path, bib_path):
    findings = []
    text = "\n".join(strip_comment(line) for line in read_lines(tex_path))
    cited = Counter()
    for match in re.finditer(r"\\(?:cite|parencite|textcite|footcite|autocite)\*?(?:\[[^\]]*\]){0,2}\{([^}]*)\}", text):
        for key in match.group(1).split(","):
            cited[key.strip()] += 1
    entries = parse_bib(bib_path)
    for key in sorted(cited):
        if key not in entries:
            findings.append(Finding(0, "chybí v .bib", key, "doplnit záznam do citace.bib (jinak v textu [key] tučně)"))
    for key, (entry_type, fields, line_no, raw_author) in sorted(entries.items(), key=lambda item: item[1][2]):
        prefix = f"bib:{key}"
        if key not in cited:
            findings.append(Finding(line_no, "necitovaný zdroj", prefix,
                                    "v seznamu jen citované zdroje; buď citovat, nebo odstranit"))
        if "accessed" in fields:
            findings.append(Finding(line_no, "pole accessed", prefix,
                                    "biblatex-iso690 zná jen urldate = {RRRR-MM-DD}; accessed se ignoruje"))
        if "url" in fields and "urldate" not in fields:
            findings.append(Finding(line_no, "chybí urldate", prefix,
                                    "u online zdroje datum citování urldate (vytiskne [online] a [cit. …])"))
        if "medium" in fields:
            findings.append(Finding(line_no, "pole medium", prefix,
                                    "zbytečné: [online] doplní styl sám podle urldate"))
        if entry_type == "misc" and "url" in fields:
            findings.append(Finding(line_no, "typ záznamu", prefix,
                                    "web @online; dokumentace výrobce @manual (number, version)"))
        url = fields.get("url", "")
        if re.search(r"docs\.amd\.com|xilinx\.com/.*(ug|pg|ds|wp)\d+|/(ug|pg|ds|am|wp)\d{3,4}", url, re.I):
            if entry_type != "manual" or "number" not in fields:
                findings.append(Finding(line_no, "dokumentace AMD", prefix,
                                        "@manual s number = {UG1399}, version = {…}, date"))
        if re.search(r"wikipedia\.org|google\.|bit\.ly|tinyurl|chatgpt|claude\.ai", url, re.I):
            findings.append(Finding(line_no, "zakázaný zdroj", prefix,
                                    "Wikipedie/vyhledávač/AI/zkracovač: nahradit primárním zdrojem s plným URL"))
        if not any(field in fields for field in ("year", "date")):
            findings.append(Finding(line_no, "chybí rok", prefix, "doplnit year nebo date"))
        author = fields.get("author", "")
        if author and " " in author.strip() and " and " not in author and "," not in author \
                and not raw_author.startswith("{{"):
            findings.append(Finding(line_no, "korporativní autor", prefix,
                                    "víceslovný název instituce do dvojitých závorek: {{Advanced Micro Devices}}"))
        if entry_type == "book" and not any(field in fields for field in ("isbn", "doi")):
            findings.append(Finding(line_no, "chybí identifikátor", prefix, "u knihy ISBN (nebo DOI)"))
    return findings


# --------------------------------------------------------------------------- main

def print_report(title, findings):
    print(f"== {title}: {len(findings)} nálezů")
    rule_counts = Counter(finding.rule for finding in findings)
    for finding in sorted(findings, key=lambda item: item.line_no):
        print(finding)
    if findings:
        print("-- souhrn: " + ", ".join(f"{rule} {count}" for rule, count in rule_counts.most_common()))
    print()


def main(argv):
    if len(argv) < 3 or argv[1] not in ("latex", "cite", "all"):
        print(__doc__)
        return 2
    mode, tex_path = argv[1], argv[2]
    if mode in ("latex", "all"):
        print_report("LaTeX a typografie", check_latex(tex_path))
    if mode in ("cite", "all"):
        if len(argv) < 4:
            print("chybí cesta k .bib")
            return 2
        print_report("Citace", check_cite(tex_path, argv[3]))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
