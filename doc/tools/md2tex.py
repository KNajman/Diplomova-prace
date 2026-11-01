#!/usr/bin/env python3
"""md2tex.py - převod kapitoly z Markdownu do LaTeXu pro doc/DP.tex.

Kapitoly se píšou a upravují jako Markdown (doc/kapitoly/*.md), do LaTeXu se převádějí až nakonec. Skript podporuje
jen malou podmnožinu Markdownu (konvence viz doc/kapitoly/README.md): nadpisy, odstavce, seznamy, tabulky, rovnice,
zkratky, odkazy a citace. Používá jen standardní knihovnu Pythonu.

Použití:
    python doc/tools/md2tex.py doc/kapitoly/04_navrh_a_metodika.md        -> doc/kapitoly/tex/04_navrh_a_metodika.tex
    python doc/tools/md2tex.py --all                                       (všechny kapitoly v doc/kapitoly)

Poznámka k návrhu: zpětné lomítko se ve zdroji skládá z chr(92) a regulární výrazy nepoužívají escape sekvence,
protože se zdroj při předávání mezi nástroji několikrát poškodil (zpětná lomítka a konce řádků se slévala).
"""
import argparse
import pathlib
import re
import sys

BS = chr(92)        # zpětné lomítko
NL = chr(10)        # konec řádku
PH = chr(1)         # značka pro chráněné úseky

UNITS = 'ns|µs|ms|MHz|GHz|Kb|MB|kB'
ONE_LETTER = 'KkSsVvZzOoUuAaIi'

ID = '[A-Za-z0-9:_.-]+'
RE_HEADING = re.compile('^(#{1,3}) (.+?)(?: [{]#(' + ID + ')[}])?$')
RE_CAPTION = re.compile('^Tabulka: (.+?) [{]#(' + ID + ')(?: widths=([0-9.,]+))?[}]$')
RE_DISPLAY = re.compile('^[$][$](.*)[$][$](?: [{]#(' + ID + ')[}])?$')


class Stash:
    """Chrání už hotové kusy LaTeXu (matematika, kód, odkazy), aby je další pravidla nepoškodila."""

    def __init__(self):
        self.items = []

    def put(self, tex):
        self.items.append(tex)
        return PH + str(len(self.items) - 1) + PH

    def restore(self, text):
        pattern = re.compile(PH + '([0-9]+)' + PH)
        # vnořené značky (odkaz uvnitř odkazu) se řeší opakováním
        while pattern.search(text):
            text = pattern.sub(lambda m: self.items[int(m.group(1))], text)
        return text


def escape_text(text):
    """Znaky, které má LaTeX speciální, mimo matematiku a kód."""
    for char in ('&', '%', '#', '_'):
        text = text.replace(char, BS + char)
    return text


def inline(text):
    """Převede vnitroodstavcové značky Markdownu na LaTeX."""
    stash = Stash()

    # kód v zadních apostrofech -> \texttt{...}
    text = re.sub('`([^`]+)`', lambda m: stash.put(BS + 'texttt{' + escape_text(m.group(1)) + '}'), text)

    # matematika $...$ (× uvnitř matematiky -> \times)
    def math(m):
        return stash.put('$' + m.group(1).replace('×', BS + 'times ') + '$')
    text = re.sub('[$]([^$]+)[$]', math, text)

    # zkratky, odkazy, citace
    text = re.sub('@acs[(]([A-Za-z0-9]+)[)]', lambda m: stash.put(BS + 'acs{' + m.group(1) + '}'), text)
    text = re.sub('@ac[(]([A-Za-z0-9]+)[)]', lambda m: stash.put(BS + 'ac{' + m.group(1) + '}'), text)
    text = re.sub('( ?)@ref[(](' + ID + ')[)]',
                  lambda m: stash.put(('~' if m.group(1) else '') + BS + 'ref{' + m.group(2) + '}'), text)
    text = re.sub('( ?)@cite[(]([A-Za-z0-9_:,.-]+)[)]',
                  lambda m: stash.put(('~' if m.group(1) else '') + BS + 'cite{' + m.group(2) + '}'), text)

    # typografie, která by se jinak psala ručně: tenká mezera kolem × u čísel, mezera před jednotkou a procentem
    thin = BS + ','
    text = re.sub('([0-9]) × ([0-9])', lambda m: m.group(1) + stash.put(thin + '×' + thin) + m.group(2), text)
    text = re.sub('([0-9]) (' + UNITS + ')(?![A-Za-zµ])',
                  lambda m: m.group(1) + stash.put(thin) + m.group(2), text)
    text = re.sub('([0-9]) %', lambda m: m.group(1) + stash.put(thin + BS + '%'), text)

    text = escape_text(text)

    # tučně a kurzívou
    text = re.sub('[*][*]([^*]+)[*][*]', lambda m: BS + 'textbf{' + m.group(1) + '}', text)
    text = re.sub('[*]([^*]+)[*]', lambda m: BS + 'emph{' + m.group(1) + '}', text)

    # nezlomitelná mezera za jednopísmennými předložkami a spojkami (k, s, v, z, o, u, a, i)
    tie = re.compile('(?<![^ („~])([' + ONE_LETTER + ']) (?=[^ ])')       # předchozí znak je mezera, závorka, uvozovka, ~ nebo začátek
    text = tie.sub(lambda m: m.group(1) + '~', text)

    return stash.restore(text)


def display_math(math_text, label):
    math_text = math_text.strip().replace('×', BS + 'times ')
    lines = [BS + 'begin{equation}', '    ' + math_text]
    if label:
        lines.append('    ' + BS + 'label{' + label + '}')
    lines.append(BS + 'end{equation}')
    return lines


def table(caption, label, widths, rows):
    columns = len(rows[0])
    if not widths:
        widths = [round(14.0 / columns, 1)] * columns
    spec = ''.join('p{' + str(w) + 'cm}' for w in widths)
    lines = [BS + 'begin{table}[htbp]', '    ' + BS + 'centering',
             '    ' + BS + 'caption{' + inline(caption) + '}',
             '    ' + BS + 'label{' + label + '}',
             '    ' + BS + 'begin{tabular}{' + spec + '}', '        ' + BS + 'toprule']
    end_row = ' ' + BS + BS
    for index, row in enumerate(rows):
        lines.append('        ' + ' & '.join(inline(cell.strip()) for cell in row) + end_row)
        if index == 0:
            lines.append('        ' + BS + 'midrule')
    lines += ['        ' + BS + 'bottomrule', '    ' + BS + 'end{tabular}', BS + 'end{table}']
    return lines


def split_row(line):
    return line.strip().strip('|').split('|')


def convert(markdown, source_name):
    lines = markdown.split(NL)
    out = ['% GENEROVÁNO skriptem doc/tools/md2tex.py ze souboru ' + source_name + '. Needitovat, upravuje se Markdown.', '']
    i = 0
    heading_commands = {1: 'chapter', 2: 'section', 3: 'subsection'}
    while i < len(lines):
        line = lines[i]
        if not line.strip():
            i += 1
            continue

        if line.startswith('<!--'):                       # komentář -> % ...
            block = []
            while True:
                block.append(lines[i])
                if '-->' in lines[i]:
                    break
                i += 1
            i += 1
            text = ' '.join(block).replace('<!--', '').replace('-->', '').strip()
            out.append('% ' + text)
            out.append('')
            continue

        heading = RE_HEADING.match(line)
        if heading:
            level = len(heading.group(1))
            out.append(BS + heading_commands[level] + '{' + inline(heading.group(2)) + '}')
            if heading.group(3):
                out.append(BS + 'label{' + heading.group(3) + '}')
            out.append('')
            i += 1
            continue

        if line.startswith('$$'):                         # zobrazená rovnice
            block = []
            while i < len(lines) and lines[i].strip():
                block.append(lines[i].strip())
                i += 1
            match = RE_DISPLAY.match(' '.join(block))
            if not match:
                sys.exit('chyba: neplatná rovnice v ' + source_name + ': ' + ' '.join(block)[:60])
            out.extend(display_math(match.group(1), match.group(2)))
            out.append('')
            continue

        caption = RE_CAPTION.match(line)
        if caption:                                       # popisek tabulky a tabulka s |
            i += 1
            while i < len(lines) and not lines[i].strip():      # prázdný řádek mezi popiskem a tabulkou
                i += 1
            rows = []
            while i < len(lines) and lines[i].lstrip().startswith('|'):
                cells = split_row(lines[i])
                if not all(set(c.strip()) <= set('-: ') for c in cells):     # řádek se --- se přeskočí
                    rows.append(cells)
                i += 1
            if not rows:
                sys.exit('chyba: tabulka bez řádků v ' + source_name)
            widths = [float(w) for w in caption.group(3).split(',')] if caption.group(3) else None
            out.extend(table(caption.group(1), caption.group(2), widths, rows))
            out.append('')
            continue

        if line.startswith('- '):                         # seznam
            items = []
            while i < len(lines) and lines[i].strip():
                if lines[i].startswith('- '):
                    items.append(lines[i][2:].strip())
                else:
                    items[-1] += ' ' + lines[i].strip()
                i += 1
            out.append(BS + 'begin{itemize}')
            out.extend('    ' + BS + 'item ' + inline(item) for item in items)
            out.append(BS + 'end{itemize}')
            out.append('')
            continue

        block = []                                        # odstavec
        while i < len(lines) and lines[i].strip() and not lines[i].startswith('<!--'):
            block.append(lines[i].strip())
            i += 1
        out.append(inline(' '.join(block)))
        out.append('')

    return NL.join(out).rstrip(NL) + NL


def main():
    parser = argparse.ArgumentParser(description='Markdown kapitola -> LaTeX')
    parser.add_argument('input', nargs='?', help='soubor .md')
    parser.add_argument('-o', '--output', help='výstupní .tex (výchozí doc/kapitoly/tex/<název>.tex)')
    parser.add_argument('--all', action='store_true', help='převést všechny doc/kapitoly/*.md')
    args = parser.parse_args()

    root = pathlib.Path(__file__).resolve().parent.parent / 'kapitoly'
    sources = sorted(root.glob('*.md')) if args.all else [pathlib.Path(args.input)]
    sources = [s for s in sources if s.name.lower() != 'readme.md']
    if not sources:
        sys.exit('není co převádět')
    for source in sources:
        target = pathlib.Path(args.output) if (args.output and not args.all) else root / 'tex' / (source.stem + '.tex')
        target.parent.mkdir(parents=True, exist_ok=True)
        tex = convert(source.read_text(encoding='utf-8'), 'kapitoly/' + source.name)
        target.write_text(tex, encoding='utf-8', newline=NL)
        print('převedeno:', source, '->', target)


if __name__ == '__main__':
    main()
