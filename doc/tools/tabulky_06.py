#!/usr/bin/env python3
"""Tabulky kapitoly 6 (Výsledky a srovnání) generované z CSV s výsledky.

Čísla v kapitole se neopisují ručně: skript je čte z výsledkových CSV a přepíše bloky mezi značkami
v doc/kapitoly/06_vysledky_a_srovnani.md:

    <!-- TAB tab:ooc -->
    ... vygenerovaná tabulka (needitovat) ...
    <!-- /TAB -->

Použití (z kořene repozitáře):
    python doc/tools/tabulky_06.py                      # přepíše tabulky v kapitole
    python doc/tools/tabulky_06.py --check              # jen porovná, při rozdílu vrátí 1
    python doc/tools/tabulky_06.py --beh 2026-10-25_2243 # jiný běh na desce

Zdroje:
    DP/hls/results/hls_ooc_results.csv      OOC RTL z HLS (stejný skript jako VHDL, vysledky.md sekce 9)
    DP/vhdl/results/vhdl_results.csv        OOC VHDL
    DP/results/deska/deska_<beh>_O{0,2,3}.csv  měření na KV260 (vysledky.md sekce 18 a 19)

Jen standardní knihovna Pythonu 3.
"""

import argparse
import csv
import os
import sys

NBSP = ' '  # nezlomitelná mezera mezi tisíci (1 248), v LaTeXu se nezalomí

KAPITOLA = 'doc/kapitoly/06_vysledky_a_srovnani.md'
HLS_OOC = 'DP/hls/results/hls_ooc_results.csv'
VHDL_OOC = 'DP/vhdl/results/vhdl_results.csv'
DESKA = 'DP/results/deska/deska_{beh}_{opt}.csv'
BEH_VYCHOZI = '2026-10-25_2243'
UROVNE = ('O0', 'O2', 'O3')

# Teoretický strop řetězce: 1 pixel za takt, 1920 × 1080 při 200 MHz.
STROP_US = 1920 * 1080 / 200.0

# Minimální perioda primitiv xck26 (-2LV) podle WPWS: 5 ns − WPWS.
LIMIT_PODLE_WPWS = {'1.923': 'šířka pulzu BRAM', '1.738': 'šířka pulzu DSP'}

# Jádra v porovnání HLS × VHDL: popisek, komponenta HLS, komponenta VHDL (obě s AXI4-Lite řízením).
OOC_JADRA = (
    ('převod barev 3→3', 'hls_csc_rgb', 'csc_axil_CH_IN3_CH_OUT3'),
    ('RGB→HSV', 'hls_rgb2hsv', 'hsv_axil_RGB_TO_HSVtrue'),
    ('HSV→RGB', 'hls_hsv2rgb', 'hsv_axil_RGB_TO_HSVfalse'),
    ('prahování', 'hls_threshold', 'threshold_axil'),
    ('medián 3×3', 'hls_median', 'median_axil'),
    ('konvoluce 3×3', 'hls_filter_3x3', 'filter2d_axil_K3_USE_DSPtrue'),
    ('konvoluce 5×5', 'hls_filter_5x5', 'filter2d_axil_K5_USE_DSPtrue'),
    ('konvoluce 7×7', 'hls_filter_7x7', 'filter2d_axil_K7_USE_DSPtrue'),
    ('histogram', 'hls_histogram', 'histogram_axil_USE_BRAMtrue'),
)

# HSV→RGB, násobení v LUT nebo v DSP (vysledky.md sekce 13). Stupně pipeline: HLS iter_latency, VHDL návrh.
HSV_DSP = (
    ('VHDL', '`G_USE_DSP = false`', 13, 'vhdl', 'hsv_axil_RGB_TO_HSVfalse'),
    ('VHDL', '`G_USE_DSP = true`', 13, 'vhdl', 'hsv_axil_RGB_TO_HSVfalse_USE_DSPtrue'),
    ('HLS', 'výchozí', 6, 'hls', 'hls_hsv2rgb'),
    ('HLS', '`HSV_MUL_IMPL_DSP = 1`', 6, 'hls', 'hls_hsv2rgb_dsp'),
    ('HLS', '`HSV_MUL_IMPL_DSP = 2` (latence 3)', 10, 'hls', 'hls_hsv2rgb_dsp_lat'),
)

# Konvoluce K×K ve VHDL bez AXI4-Lite, násobení v LUT nebo v DSP (vysledky.md sekce 6).
FILTR_DSP = (
    (3, 'filter2d_core_K3', 'filter2d_core_K3_USE_DSPtrue'),
    (5, 'filter2d_core_K5', 'filter2d_core_K5_USE_DSPtrue'),
    (7, 'filter2d_core_K7', 'filter2d_core_K7_USE_DSPtrue'),
)

# Histogram: dvě architektury (vysledky.md sekce 7).
HISTOGRAM = (
    ('HLS', 'BRAM, předávání mezivýsledku', 'hls', 'hls_histogram'),
    ('VHDL', 'BRAM, předávání mezivýsledku', 'vhdl', 'histogram_axil_USE_BRAMtrue'),
    ('VHDL', '256 čítačů v registrech', 'vhdl', 'histogram_axil_USE_BRAMfalse'),
)

# Export Vitis HLS (impl_* v hls_results.csv) – opsáno z vysledky.md sekce 9, OOC se čte z CSV.
# Jen jádra, jejichž RTL se od exportu nezměnilo (řádková jádra po vypnutí auto-rewind export nemají).
EXPORT_HLS = (
    ('histogram', 'hls_histogram', 302, 422, '2.73'),
    ('medián 3×3', 'hls_median', 768, 472, '4.06'),
    ('konvoluce 3×3', 'hls_filter_3x3', 655, 621, '3.92'),
    ('konvoluce 5×5', 'hls_filter_5x5', 959, 863, '4.17'),
    ('konvoluce 7×7', 'hls_filter_7x7', 1306, 1244, '4.37'),
)

# Algoritmy na desce v pořadí měřicí aplikace.
ALGORITMY = (
    ('bypass_rgb', 'průchod RGB'),
    ('bypass_gray', 'průchod šedá'),
    ('csc_ycbcr601', 'převod barev RGB→YCbCr'),
    ('rgb2hsv', 'RGB→HSV'),
    ('hsv2rgb', 'HSV→RGB'),
    ('threshold_otsu', 'prahování (Otsu)'),
    ('median3x3', 'medián 3×3'),
    ('filter3x3_sobel_x', 'Sobel X 3×3'),
    ('histogram', 'histogram'),
)


# ---------------------------------------------------------------------------------------------------
# Formátování čísel podle dp-styl: desetinná čárka, tisíce s nezlomitelnou mezerou.
# ---------------------------------------------------------------------------------------------------

def cele(hodnota):
    """Celé číslo s mezerou mezi tisíci (1 248)."""
    text = str(int(round(float(hodnota))))
    skupiny = []
    while len(text) > 3:
        skupiny.insert(0, text[-3:])
        text = text[:-3]
    skupiny.insert(0, text)
    return NBSP.join(skupiny)


def desetinne(hodnota, mista):
    """Desetinné číslo s čárkou; celá část s mezerou mezi tisíci."""
    text = '{:.{}f}'.format(float(hodnota), mista)
    cela, _, zlomek = text.partition('.')
    return cele(cela) + (',' + zlomek if mista else '')


def bram(hodnota):
    """BRAM36 může být 0,5 (jeden blok BRAM18)."""
    cislo = float(hodnota)
    return cele(cislo) if cislo == int(cislo) else desetinne(cislo, 1)


def zrychleni(sw_us, hw_us):
    """Poměr SW/HW: od 10 celé číslo, pod 10 na jedno desetinné místo (jako vysledky.md)."""
    pomer = float(sw_us) / float(hw_us)
    return (cele(pomer) if pomer >= 10 else desetinne(pomer, 1)) + '×'


def procenta(nova, puvodni):
    """Relativní změna v procentech se znaménkem (−17,7 %)."""
    zmena = round(100.0 * (float(nova) - float(puvodni)) / float(puvodni), 1)
    if zmena == 0:
        return '0,0 %'
    znak = '−' if zmena < 0 else '+'
    return znak + desetinne(abs(zmena), 1) + ' %'


def rozdil_us(hodnota, zaklad):
    """Rozdíl celých µs se znaménkem (+30, −2, 0)."""
    rozdil = int(round(float(hodnota) - float(zaklad)))
    if rozdil == 0:
        return '0'
    return ('+' if rozdil > 0 else '−') + cele(abs(rozdil))


def limit(radek):
    """Co omezuje periodu: logika, nebo minimální šířka pulzu hodin některého primitiva."""
    if radek['limit'] == 'logic':
        return 'logika'
    return LIMIT_PODLE_WPWS.get(radek['wpws_ns'], 'šířka pulzu hodin')


# ---------------------------------------------------------------------------------------------------
# Čtení dat
# ---------------------------------------------------------------------------------------------------

def nacti_ooc(cesta):
    with open(cesta, newline='', encoding='utf-8-sig') as soubor:
        return {radek['component']: radek for radek in csv.DictReader(soubor)}


def nacti_desku(beh):
    """Vrací {úroveň: {(algoritmus, implementace): řádek}} a seznam chyb (jiný výsledek než PASS)."""
    data = {}
    chyby = []
    for opt in UROVNE:
        cesta = DESKA.format(beh=beh, opt=opt)
        with open(cesta, newline='', encoding='utf-8-sig') as soubor:
            radky = list(csv.DictReader(soubor))
        data[opt] = {(r['algoritmus'], r['implementace']): r for r in radky}
        for r in radky:
            if r['vysledek'] != 'PASS' or r['chybne_bajty'] != '0':
                chyby.append('{} {} {}: {}'.format(opt, r['algoritmus'], r['implementace'], r['vysledek']))
    return data, chyby


def komponenta(ooc, nazev):
    if nazev not in ooc:
        sys.exit('chyba: komponenta {} v CSV chybí'.format(nazev))
    return ooc[nazev]


# ---------------------------------------------------------------------------------------------------
# Tabulky (Markdown pro md2tex: řádek „Tabulka: …“ a pod ním tabulka)
# ---------------------------------------------------------------------------------------------------

def tabulka(popisek, ident, sirky, hlavicka, radky):
    vystup = ['Tabulka: {} {{#{} widths={}}}'.format(popisek, ident, sirky), '']
    vystup.append('| ' + ' | '.join(hlavicka) + ' |')
    vystup.append('|' + ' --- |' * len(hlavicka))
    for radek in radky:
        vystup.append('| ' + ' | '.join(radek) + ' |')
    return vystup


def tab_overeni(deska):
    # Model proti OpenCV a simulace: README (Ověření a měření), vysledky.md sekce 11, 15. Deska: z CSV.
    model = {
        'csc_ycbcr601': 'odchylka nejvýš 1',
        'rgb2hsv': 'bitově shodný (2^24 barev)',
        'hsv2rgb': 'odchylka nejvýš 2',
        'threshold_otsu': 'bitově shodný',
        'median3x3': 'bitově shodný',
        'filter3x3_sobel_x': 'bitově shodný',
        'histogram': 'neporovnáno',
    }
    simulace = {
        'rgb2hsv': 'PASS, úplný test 2^24',
        'hsv2rgb': 'PASS, úplný test 2^24',
    }
    radky = []
    for alg, nazev in ALGORITMY:
        if alg not in model:
            continue
        stav = []
        for impl in ('HLS', 'VHDL'):
            prosly = sum(1 for opt in UROVNE
                         if deska[opt].get((alg, impl), {}).get('vysledek') == 'PASS')
            stav.append('{}/{}'.format(prosly, len(UROVNE)))
        radky.append([nazev, model[alg], simulace.get(alg, 'PASS'), stav[0], stav[1]])
    return tabulka('Ověření funkce: model proti OpenCV, simulace jader proti modelu a měření na desce '
                   '(počet úrovní -O0, -O2, -O3 s bitovou shodou)', 'tab:overeni',
                   '3.4,3.6,3.2,1.7,1.7',
                   ['Algoritmus', 'Model proti OpenCV', 'Simulace HLS i VHDL', 'Deska HLS', 'Deska VHDL'],
                   radky)


def tab_ooc(hls, vhdl):
    radky = []
    for nazev, k_hls, k_vhdl in OOC_JADRA:
        for impl, zdroj, k in (('HLS', hls, k_hls), ('VHDL', vhdl, k_vhdl)):
            r = komponenta(zdroj, k)
            radky.append([nazev if impl == 'HLS' else '', impl, cele(r['impl_lut']), cele(r['impl_ff']),
                          cele(r['impl_dsp']), bram(r['impl_bram']), desetinne(r['impl_cp_ns'], 2),
                          cele(r['impl_fmax_mhz']), limit(r)])
    return tabulka('Prostředky a nejkratší perioda jader HLS a VHDL (syntéza mimo kontext, xck26-sfvc784-2LV-c, '
                   'cíl 5 ns, Vivado 2025.2, jádro včetně řízení AXI4-Lite)', 'tab:ooc',
                   '2.6,1.2,1.1,1.1,1.0,1.2,1.4,1.3,2.8',
                   ['Jádro', 'Impl.', 'LUT', 'FF', 'DSP', 'BRAM36', 'Perioda [ns]', 'Fmax [MHz]', 'Omezení'],
                   radky)


def tab_hsv_dsp(hls, vhdl):
    radky = []
    for impl, parametr, stupne, zdroj, k in HSV_DSP:
        r = komponenta(hls if zdroj == 'hls' else vhdl, k)
        radky.append([impl, parametr, str(stupne), cele(r['impl_lut']), cele(r['impl_ff']), cele(r['impl_dsp']),
                      desetinne(r['impl_cp_ns'], 2), limit(r)])
    return tabulka('Převod HSV→RGB: násobení v LUT nebo v blocích DSP (syntéza mimo kontext, cíl 5 ns)',
                   'tab:hsvdsp', '1.3,4.0,1.4,1.1,1.1,1.0,1.4,2.8',
                   ['Impl.', 'Parametr', 'Stupně', 'LUT', 'FF', 'DSP', 'Perioda [ns]', 'Omezení'], radky)


def tab_filtr_dsp(vhdl):
    radky = []
    for k, k_lut, k_dsp in FILTR_DSP:
        for zpusob, nazev in (('LUT', k_lut), ('DSP', k_dsp)):
            r = komponenta(vhdl, nazev)
            radky.append(['{}×{}'.format(k, k) if zpusob == 'LUT' else '', zpusob, cele(r['impl_lut']),
                          cele(r['impl_ff']), cele(r['impl_dsp']), bram(r['impl_bram']),
                          desetinne(r['impl_cp_ns'], 2), limit(r)])
    return tabulka('Konvoluce K×K ve VHDL: násobení v LUT nebo v blocích DSP (jádro bez AXI4-Lite, '
                   'syntéza mimo kontext, cíl 5 ns)', 'tab:filtrdsp', '1.4,1.6,1.3,1.3,1.1,1.3,1.6,2.8',
                   ['K', 'Násobení', 'LUT', 'FF', 'DSP', 'BRAM36', 'Perioda [ns]', 'Omezení'], radky)


def tab_histogram(hls, vhdl):
    radky = []
    for impl, architektura, zdroj, k in HISTOGRAM:
        r = komponenta(hls if zdroj == 'hls' else vhdl, k)
        radky.append([impl, architektura, cele(r['impl_lut']), cele(r['impl_ff']), bram(r['impl_bram']),
                      desetinne(r['impl_cp_ns'], 2), limit(r)])
    return tabulka('Histogram ve dvou architekturách (syntéza mimo kontext, cíl 5 ns, jádro včetně AXI4-Lite)',
                   'tab:histarch', '1.3,4.4,1.3,1.3,1.4,1.6,2.8',
                   ['Impl.', 'Architektura', 'LUT', 'FF', 'BRAM36', 'Perioda [ns]', 'Omezení'], radky)


def tab_export(hls):
    radky = []
    for nazev, k, lut_exp, ff_exp, perioda_exp in EXPORT_HLS:
        r = komponenta(hls, k)
        radky.append([nazev, cele(lut_exp) + ' / ' + cele(r['impl_lut']), cele(ff_exp) + ' / ' + cele(r['impl_ff']),
                      desetinne(perioda_exp, 2), desetinne(r['impl_cp_ns'], 2), limit(r)])
    return tabulka('Stejné RTL z HLS: výsledek exportu Vitis HLS proti syntéze mimo kontext stejným skriptem '
                   'jako VHDL', 'tab:exportooc', '3.0,2.4,2.4,1.9,1.9,2.8',
                   ['Jádro', 'LUT export / OOC', 'FF export / OOC', 'Perioda export [ns]', 'Perioda OOC [ns]',
                    'Omezení OOC'], radky)


def tab_propustnost(deska):
    o2 = deska['O2']
    pruchod = float(o2[('bypass_rgb', '-')]['hw_us_snimek'])
    radky = []
    for alg, nazev in ALGORITMY:
        if alg.startswith('bypass'):
            r = o2[(alg, '-')]
            radky.append([nazev, '–', cele(r['hw_us_snimek']), '–', desetinne(r['hw_fps'], 1), '0'])
            continue
        h = o2[(alg, 'HLS')]
        v = o2[(alg, 'VHDL')]
        rozdil = [rozdil_us(x['hw_us_snimek'], pruchod) for x in (h, v)]
        radky.append([nazev, cele(h['hw_us_snimek']), cele(v['hw_us_snimek']), desetinne(h['hw_fps'], 1),
                      desetinne(v['hw_fps'], 1), ' / '.join(rozdil)])
    return tabulka('Doba zpracování snímku 1920 × 1080 na desce KV260 (200 MHz, 20 snímků na měření, '
                   'teoretický strop {} µs)'.format(desetinne(STROP_US, 0)), 'tab:propustnost',
                   '3.6,1.8,1.8,1.5,1.5,3.0',
                   ['Algoritmus', 'HLS [µs]', 'VHDL [µs]', 'HLS [snímků/s]', 'VHDL [snímků/s]',
                    'Proti průchodu HLS / VHDL [µs]'], radky)


def tab_hw_sw(deska):
    radky = []
    for alg, nazev in ALGORITMY:
        if alg.startswith('bypass'):
            continue
        hw = deska['O2'][(alg, 'VHDL')]['hw_us_snimek']
        sw = {opt: deska[opt][(alg, 'VHDL')]['sw_us'] for opt in UROVNE}
        radky.append([nazev] + [desetinne(float(sw[o]) / 1000.0, 1) for o in UROVNE]
                     + [desetinne(float(hw) / 1000.0, 2)] + [zrychleni(sw[o], hw) for o in UROVNE])
    return tabulka('Doba zpracování snímku 1920 × 1080 v softwaru na Cortex-A53 (1333 MHz, bez operačního '
                   'systému) a v hardwaru (VHDL, 200 MHz) a poměr SW/HW', 'tab:hwsw',
                   '3.4,1.4,1.4,1.4,1.3,1.3,1.3,1.3',
                   ['Algoritmus', 'SW -O0 [ms]', 'SW -O2 [ms]', 'SW -O3 [ms]', 'HW [ms]', 'SW/HW -O0', '-O2', '-O3'],
                   radky)


def tab_prekladac(deska):
    radky = []
    for alg, nazev in ALGORITMY:
        if alg.startswith('bypass'):
            continue
        sw = {opt: deska[opt][(alg, 'VHDL')]['sw_us'] for opt in UROVNE}
        radky.append([nazev, desetinne(float(sw['O0']) / float(sw['O2']), 1) + '×', procenta(sw['O3'], sw['O2'])])
    return tabulka('Vliv optimalizace překladače na dobu softwarového zpracování', 'tab:prekladac',
                   '4.6,4.4,4.4',
                   ['Algoritmus', 'Zrychlení -O0 → -O2', 'Změna -O2 → -O3'], radky)


# ---------------------------------------------------------------------------------------------------
# Přepsání bloků v kapitole
# ---------------------------------------------------------------------------------------------------

def nahrad_bloky(text, bloky):
    radky = text.split('\n')
    vystup = []
    nalezene = set()
    i = 0
    while i < len(radky):
        radek = radky[i]
        if radek.startswith('<!-- TAB ') and radek.endswith('-->'):
            ident = radek[len('<!-- TAB '):-len('-->')].strip()
            if ident not in bloky:
                sys.exit('chyba: neznámá tabulka {}'.format(ident))
            konec = i + 1
            while konec < len(radky) and radky[konec].strip() != '<!-- /TAB -->':
                konec += 1
            if konec == len(radky):
                sys.exit('chyba: blok {} nemá ukončení <!-- /TAB -->'.format(ident))
            vystup.append(radek)
            vystup.append('')
            vystup.extend(bloky[ident])
            vystup.append('')
            vystup.append('<!-- /TAB -->')
            nalezene.add(ident)
            i = konec + 1
            continue
        vystup.append(radek)
        i += 1
    chybi = sorted(set(bloky) - nalezene)
    if chybi:
        print('upozornění: v kapitole chybí značky pro ' + ', '.join(chybi), file=sys.stderr)
    return '\n'.join(vystup)


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    parser.add_argument('--beh', default=BEH_VYCHOZI, help='běh na desce (část názvu CSV), výchozí ' + BEH_VYCHOZI)
    parser.add_argument('--check', action='store_true', help='nic nepřepisovat, jen ověřit aktuálnost')
    parser.add_argument('--kapitola', default=KAPITOLA)
    args = parser.parse_args()

    hls = nacti_ooc(HLS_OOC)
    vhdl = nacti_ooc(VHDL_OOC)
    deska, chyby = nacti_desku(args.beh)
    if chyby:
        print('upozornění: měření na desce bez bitové shody:\n  ' + '\n  '.join(chyby), file=sys.stderr)

    bloky = {
        'tab:overeni': tab_overeni(deska),
        'tab:ooc': tab_ooc(hls, vhdl),
        'tab:hsvdsp': tab_hsv_dsp(hls, vhdl),
        'tab:filtrdsp': tab_filtr_dsp(vhdl),
        'tab:histarch': tab_histogram(hls, vhdl),
        'tab:exportooc': tab_export(hls),
        'tab:propustnost': tab_propustnost(deska),
        'tab:hwsw': tab_hw_sw(deska),
        'tab:prekladac': tab_prekladac(deska),
    }

    with open(args.kapitola, newline='', encoding='utf-8') as soubor:
        puvodni = soubor.read()
    konce = '\r\n' if '\r\n' in puvodni else '\n'
    novy = nahrad_bloky(puvodni.replace('\r\n', '\n'), bloky).replace('\n', konce)

    if novy == puvodni:
        print('tabulky jsou aktuální')
        return 0
    if args.check:
        print('tabulky v {} neodpovídají CSV, spusť skript bez --check'.format(args.kapitola))
        return 1
    with open(args.kapitola, 'w', newline='', encoding='utf-8') as soubor:
        soubor.write(novy)
    print('tabulky přepsány: ' + args.kapitola)
    return 0


if __name__ == '__main__':
    sys.exit(main())
