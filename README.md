# Implementace vybraných algoritmů zpracování obrazu v hradlovém poli

Diplomová práce, Technická univerzita v Liberci (FM, ITE)

Autor: Bc. Karel Najman @KNajman
Vedoucí práce: Ing. Martin Rozkovec, Ph.D. @czajos

## Zadání práce

1. Seznamte se s vývojovými nástroji AMD Vitis, Vitis HLS, Vivado a s platformou AMD KV260.
2. Proveďte rešerši základních operací počítačového zpracování obrazu a analýzu jejich realizace v HW.
3. Vybrané algoritmy implementujte v SW a HW, a to pomocí jazyka VHDL a vysokoúrovňové syntézy.
4. Výsledky HW implementací porovnejte se SW řešením.

## Doporučená literatura

- ŠONKA, Milan a HLAVÁČ, Václav. *Počítačové vidění.* Praha: Grada, 1992. ISBN 80-85424-67-3.
- HARRIS, David and HARRIS, Sarah. *Digital Design and Computer Architecture.* 2nd ed. San Francisco: Morgan Kaufmann, 2012. ISBN 9789382291527.
- AMD, Inc. *Vitis High-Level Synthesis User Guide (UG1399).* 2025. Dostupné z: <https://docs.amd.com/r/en-US/ug1399-vitis-hls/>

---

## Přehled

Každý algoritmus existuje ve **třech implementacích se stejnou aritmetikou**:

| | jazyk | role | umístění |
| --- | --- | --- | --- |
| **C** | C11 (Jablotron C standard) | golden model = reference pro verifikaci + SW řešení na Cortex-A53 | `DP/model/lib_imgproc` |
| **HLS** | C++ (Vitis HLS 2025.2) | HW z vysokoúrovňové syntézy | `DP/hls/<jádro>` |
| **VHDL** | VHDL-2008 | ručně psaný HW (RTL) | `DP/vhdl/<jádro>` |

HLS i VHDL jádra se s golden modelem shodují **bitově** (ověřuje to C-sim/cosim u HLS, xsim/GHDL u VHDL a měřicí
aplikace přímo na desce). Obě HW verze mají **stejné rozhraní a stejnou mapu registrů**, takže je ovládá jeden C driver
a v testovacím řetězci jsou zaměnitelné.

| algoritmus | C | HLS | VHDL |
| --- | :-: | :-: | :-: |
| Lineární převod barev (matice 3×3: RGB ↔ YCbCr, RGB ↔ šedá) | ✔ | ✔ | ✔ |
| RGB → HSV, HSV → RGB | ✔ | ✔ | ✔ |
| Prahování (5 typů OpenCV) | ✔ | ✔ | ✔ |
| 2D konvoluce K×K (průměr, Sobel, zostření, vlastní jádro; K = 3, 5, 7) | ✔ | ✔ | ✔ |
| Mediánový filtr 3×3 | ✔ | ✔ | ✔ |
| Histogram jasu (+ Otsuův práh v SW) | ✔ | ✔ | ✔ (2 architektury) |

### Struktura repozitáře

```
DP/model/lib_imgproc     golden model v C (+ tools/imgproc_cli: PPM/PGM -> HEX vektory pro testbenche)
DP/model/generated       konstanty generované z definic (matice CSC, tabulky HSV) pro C, HLS i VHDL
DP/hls/                  HLS jádra, common/ (typy UG934, šablona okénkových jader), scripts/ (csim/syn/cosim/impl)
DP/vhdl/                 VHDL jádra, common/ (skid buffer, generátor okna, registrová banka AXI4-Lite), tb/ (generický TB)
DP/hw/harness            testovací řetězec pro KV260 (skriptovaný block design: VDMA, AXIS přepínače, všechna jádra)
DP/sw/harness_app        měřicí aplikace (bare-metal A53): HW HLS × HW VHDL × SW, kontrola bitové shody na desce
DP/results/vysledky.md   všechny srovnávací tabulky (prostředky, Fmax, poznatky) + CSV
DP/scripts/queues        fronty buildů pro server (Vivado/Vitis 2025.2)
doc/                     text práce (LaTeX)
```

---

## Společné konvence

### Formát pixelu a rozhraní

- **AXI4-Stream Video (UG934):** `TUSER` = začátek snímku (SOF), `TLAST` = konec řádku (EOL), plný backpressure.
- **Pořadí složek v paměti i v `TDATA`:** RGB = bajty **G, B, R** (`TDATA[7:0] = G`), YCbCr = Y, Cb, Cr, HSV = H, S, V, šedá = 1 bajt.
- **Řízení:** AXI4-Lite s mapou generovanou Vitis HLS (`0x00` ap_ctrl, `0x10 + 8·i` argument *i*, `+4` = ap_vld u výstupu).
  VHDL jádra mají stejnou mapu díky `axil_regbank` (včetně paměťových oken pro pole, např. `hist[256]` na `0x400`).
- **Bodová jádra** (převod barev, HSV, prahování): čistá pipeline, `TUSER/TLAST` putují s daty, žádné čítače.
- **Okénková jádra** (konvoluce, medián): řádkové buffery v BRAM, okraj *constant* (nuly) nebo *replicate*, výstup stejně
  velký jako vstup (SAME), resynchronizace na `TUSER`, stavový registr (pixely před SOF, předčasný/chybějící `TLAST`).

### Aritmetika s pevnou řádovou čárkou

Formát $Q_{m.n}$ = celé číslo se znaménkem s $n$ zlomkovými bity, hodnota $$x = \frac{X}{2^n}$$.

**Zaokrouhlení half-up** (k $+\infty$) a **saturace** jsou ve všech třech implementacích stejné:

$$
\mathrm{round\_shift}(X, n) = \left\lfloor \frac{X + 2^{n-1}}{2^n} \right\rfloor ,
\qquad
\mathrm{sat}_{u8}(v) = \min\bigl(\max(v, 0), 255\bigr)
$$

V HW je $\lfloor \cdot / 2^n \rfloor$ pouhý aritmetický posun, takže zaokrouhlení stojí jednu sčítačku (u DSP48E2 zdarma
v post-adderu).

<table><tr><td>

**C**

```c
int64_t imgproc_round_shift(int64_t value, uint8_t shift)
{
    const int64_t half = ((int64_t)1) << (shift - 1u);
    const int64_t biased = value + half;
    /* floor i pro záporná čísla (v C je >> záporných
       čísel implementačně definovaný) */
    return (biased >= 0) ? (biased >> shift)
         : -((-biased + ((1LL << shift) - 1)) >> shift);
}
```

</td><td>

**HLS**

```cpp
template <int SHIFT, int W>
inline ap_int<W - SHIFT + 1>
round_shift(const ap_int<W>& value)
{
#pragma HLS INLINE
    // ap_int: >> je aritmetický posun = floor
    const ap_int<W + 1> biased = ap_int<W + 1>(value)
        + (ap_int<W + 1>(1) << (SHIFT - 1));
    return biased >> SHIFT;
}
```

</td><td>

**VHDL**

```vhdl
-- signed: shift_right je aritmetický = floor
rounded <= shift_right(sum + C_ROUND_HALF,
                       C_FRAC_W);
out_pixel <= sat_u8(rounded);
```

</td></tr></table>

### Šířky vzorcem

Šířky mezivýsledků se nikde nepíšou jako konstanty, ale odvozují se: součin $W_a \cdot W_b \Rightarrow W_a + W_b$ bitů,
součet $N$ čísel šířky $W \Rightarrow W + \lceil \log_2 N \rceil$ bitů (VHDL `sum_w`, `clog2`; HLS `constexpr`).
Jádra jsou díky tomu generická (např. konvoluce pro libovolné K bez ručních úprav).

---

## 1. Lineární převod barevných prostorů

Každá výstupní složka je lineární kombinace vstupních složek plus offset:

$$
\begin{pmatrix} o_0 \\ o_1 \\ o_2 \end{pmatrix}
= \mathrm{sat}_{u8}\!\left( \mathrm{round\_shift}\!\left( \mathbf{C} \begin{pmatrix} i_0 \\ i_1 \\ i_2 \end{pmatrix} + 2^{15} \begin{pmatrix} b_0 \\ b_1 \\ b_2 \end{pmatrix},\ 15 \right) \right)
$$

Koeficienty $\mathbf{C}$ jsou v **Q2.15** (18 b = šířka portu B násobičky DSP48E2, rozsah ±4), offsety $b$ celá čísla.
Matice se počítají z definic normy ($K_r$, $K_b$), například BT.601:

$$
Y = K_r R + (1 - K_r - K_b) G + K_b B ,\qquad
C_b = 128 + \frac{B - Y}{2(1 - K_b)} ,\qquad
C_r = 128 + \frac{R - Y}{2(1 - K_r)}
$$

s $K_r = 0{,}299$, $K_b = 0{,}114$ (BT.709: $0{,}2126$; $0{,}0722$). Zaokrouhlení koeficientů na Q2.15 metodou největšího
zbytku zachová součet řádku (šedá zůstane šedá). RGB → šedá (BT.601) je s Q2.15 bitově shodná s `cv::cvtColor` pro všech
$2^{24}$ barev. Předvolby: RGB → šedá, YCbCr 601/709 plný rozsah, YCbCr 601/709 studio rozsah, šedá → RGB.

**Zpětný převod YCbCr → RGB** (předvolby BT.601 plný rozsah, BT.601 a BT.709 studio rozsah) běží na stejných jádrech,
jen s jinou maticí. Je to inverze dopředné matice $\mathbf{M}$ téhož standardu:

$$
\begin{pmatrix} R \\ G \\ B \end{pmatrix}
= \mathbf{M}^{-1} \left( \begin{pmatrix} Y \\ C_b \\ C_r \end{pmatrix} - \begin{pmatrix} y_0 \\ 128 \\ 128 \end{pmatrix} \right)
= \mathbf{M}^{-1} \begin{pmatrix} Y \\ C_b \\ C_r \end{pmatrix} + \mathbf{b} ,
\qquad y_0 = 0 \text{ (plný rozsah)},\ 16 \text{ (studio)}
$$

Koeficienty inverze jsou až 2,11 (BT.709 studio, $C_b \to B$), do Q2.15 se vejdou. Konstantní člen $\mathbf{b}$ ale není
celé číslo (u R v BT.601 je −179,4) a jádra mají jen celočíselný offset (10 b), proto se zaokrouhlí. Výsledek se od
`cv::cvtColor(COLOR_YCrCb2RGB)` liší nejvýš o 1 (zhruba čtvrtina složek na všech $2^{24}$ vstupech), návrat
RGB → YCbCr → RGB nejvýš o 2. Bitovou shodu s OpenCV by umožnil offset s 15 zlomkovými bity (registr 26 b místo 10 b);
zvolil jsem zachovat jádro beze změny.

<table><tr><td>

**C** (`csc.c`)

```c
for (o = 0u; o < matrix->ch_out; o++)
{
    /* offset v akumulátoru PŘED zaokrouhlením
       -> zaokrouhluje se jen jednou */
    int64_t acc = (int64_t)matrix->offset[o] * CSC_ONE;
    for (i = 0u; i < matrix->ch_in; i++)
    {
        acc += (int64_t)matrix->coeff[o][i] * in[i];
    }
    out[o] = imgproc_saturate_u8(
        imgproc_round_shift(acc, 15u));
}
```

</td><td>

**HLS** (`hls_csc.cpp`)

```cpp
for (int o = 0; o < CH_OUT; o++)
{
#pragma HLS UNROLL
    csc_acc_t acc =               // ap_int<30>
        csc_acc_t(p.offset[o]) << CSC_FRAC_BITS;
    for (int i = 0; i < CH_IN; i++)
    {
#pragma HLS UNROLL
        acc += csc_acc_t(p.coeff[o][i])
             * csc_acc_t(in.ch[i]);
    }
    out.ch[o] = saturate_u8(
        round_shift<CSC_FRAC_BITS>(acc));
}
// volání = řádek, PIPELINE II=1
```

</td></tr></table>

**VHDL** (`csc_core.vhd`) – sekvenčí zpracování: v každém taktu jedno násobení a jedno sčítání, bias a zaokrouhlení
($b \cdot 2^{15} + 2^{14}$) se předpočítá mimo pipeline, takže celý výraz padne do řetězce DSP48E2 (PCIN):

```vhdl
product0(out_ch)  <= coeff(out_ch, 0) * in_pixel(0);                       -- krok 2
sum0(out_ch)      <= resize(product0(out_ch), C_SUM_W) + bias(out_ch);     -- krok 3
product1(out_ch)  <= coeff(out_ch, 1) * in_pixel1_dly1;                    -- krok 3
sum01(out_ch)     <= sum0(out_ch) + resize(product1(out_ch), C_SUM_W);     -- krok 4
product2(out_ch)  <= coeff(out_ch, 2) * in_pixel2_dly2;                    -- krok 4
sum012(out_ch)    <= sum01(out_ch) + resize(product2(out_ch), C_SUM_W);    -- krok 5
out_pixel(out_ch) <= sat_u8(shift_right(sum012(out_ch), C_CSC_FRAC_W));    -- krok 6
```

---

## 2. RGB → HSV a HSV → RGB

Převod **RGB → HSV** podle celočíselný algoritmus v OpenCV (kde je H v rozsahu 0–179, aby se vešel do bajtu). Dělení nahrazují 2 tabulky převrácených hodnot o 256 položkách (`shift` = 12):

$$
V = \max(R,G,B),\quad \Delta = V - \min(R,G,B),\quad
S = \mathrm{round\_shift}\bigl(\Delta \cdot \mathrm{sdiv}[V],\ 12\bigr),\quad
\mathrm{sdiv}[i] = \mathrm{round}\!\left(\frac{255 \cdot 2^{12}}{i}\right)
$$

$$
H = \mathrm{round\_shift}\bigl(h \cdot \mathrm{hdiv}[\Delta],\ 12\bigr),\quad
h = \begin{cases} G - B & V = R \\ B - R + 2\Delta & V = G \\ R - G + 4\Delta & V = B \end{cases},\quad
\mathrm{hdiv}[i] = \mathrm{round}\!\left(\frac{180 \cdot 2^{12}}{6i}\right)
$$

a $H < 0 \Rightarrow H + 180$. Výsledek je bitově shodný s `cv::cvtColor(…, COLOR_RGB2HSV)` pro všech $2^{24}$ barev.

**HSV → RGB** bez dělení: sektor $r = \lfloor H/30 \rfloor$ násobením převrácenou hodnotou, $f = \mathrm{rem}\cdot 255/30$,
$x/255$ přibližným vzorcem $\mathrm{div255}(x) = (x + 1 + (x \gg 8)) \gg 8$:

$$
p = \mathrm{div255}\bigl(V(255 - S)\bigr),\quad
q = \mathrm{div255}\bigl(V(255 - \mathrm{div255}(Sf))\bigr),\quad
t = \mathrm{div255}\bigl(V(255 - \mathrm{div255}(S(255 - f)))\bigr)
$$

$(R,G,B)$ podle sektoru 0–5: $(V,t,p), (q,V,p), (p,V,t), (p,q,V), (t,p,V), (V,p,q)$; pro $S = 0$ šedá $(V,V,V)$.

<table><tr><td>
s
**C** (`hsv.c`, RGB → HSV, zkráceno)
```c
const int32_t v_max = max3(r, g, b);
const int32_t diff  = v_max - min3(r, g, b);
s = round_shift(diff * imgproc_hsv_sdiv(v_max), 12);
if (v_max == r)      h = g - b;
else if (v_max == g) h = (b - r) + 2 * diff;
else                 h = (r - g) + 4 * diff;
h = round_shift(h * imgproc_hsv_hdiv180(diff), 12);
if (h < 0) h += 180;
```
</td><td>

**VHDL** (`rgb2hsv_core.vhd`, 8 taktů)

```vhdl
-- takt 5: čitatel H a tabulky (ROM z generátoru)
case max_channel_dly4 is
  when MAX_IS_RED   => hue_numerator <= hue_term;
  when MAX_IS_GREEN => hue_numerator <= hue_term
                       + (diff sll 1);
  when MAX_IS_BLUE  => hue_numerator <= hue_term
                       + (diff sll 2);
end case;
sdiv_value <= C_HSV_SDIV(to_integer(value_max_dly4));
hdiv_value <= C_HSV_HDIV180(to_integer(diff));
-- takt 6: 2 násobení v DSP (registr M)
sat_product <= diff_dly5 * sdiv_value;
hue_product <= hue_numerator * signed('0' & hdiv_value);
-- takt 7: + 2^11 a >> 12 (registr P)
```

</td></tr></table>

HLS verze (`DP/hls/rgb2hsv`, `DP/hls/hsv2rgb`) se převádí podle postupu v `DP/hls/README.md` – tělo pixelu je volání
stejné funkce jako v C (`imgproc_rgb_to_hsv_pixel` / `imgproc_hsv_to_rgb_pixel`), tabulky z `generated/imgproc_coeffs.h`.

---

## 3. Prahování

V OpenCV je 5 typů prahování, modelované jako

$$
\mathrm{above} = (x > T),\qquad
y = \begin{cases}
\mathrm{above}\ ?\ M : 0 & \text{BINARY} \\
\mathrm{above}\ ?\ 0 : M & \text{BINARY\_INV} \\
\mathrm{above}\ ?\ T : x & \text{TRUNC} \\
\mathrm{above}\ ?\ x : 0 & \text{TOZERO} \\
\mathrm{above}\ ?\ 0 : x & \text{TOZERO\_INV}
\end{cases}
$$

($T$ = práh, $M$ = maxval; bitově shodné s `cv::threshold`). Práh lze určit automaticky Otsuovou metodou z histogramu
(maximalizace mezitřídního rozptylu $\sigma_B^2(T) = \omega_0(T)\,\omega_1(T)\,[\mu_0(T) - \mu_1(T)]^2$), počítá ARM.

Typ se v HW nedekóduje v datové cestě: z registru `type` (mění se jen zápisem z ARM) se předem určí, **odkud** vzít
výsledek nad a pod prahem. Datová cesta je pak jen komparátor a multiplexor 4 : 1.

<table><tr><td>

**C** (`threshold.c`, zkráceno)

```c
const bool above = (value > thresh);
switch (type)
{
case IMGPROC_THRESH_BINARY:
    result = above ? maxval : 0u;     break;
case IMGPROC_THRESH_BINARY_INV:
    result = above ? 0u : maxval;     break;
case IMGPROC_THRESH_TRUNC:
    result = above ? thresh : value;  break;
case IMGPROC_THRESH_TOZERO:
    result = above ? value : 0u;      break;
case IMGPROC_THRESH_TOZERO_INV:
    result = above ? 0u : value;      break;
}
```

</td><td>

**HLS** (`hls_threshold.cpp`)

```cpp
const ThresholdSources sources = decode_type(type);
bool last = false;
do
{
#pragma HLS PIPELINE II=1
    const axis_gray_t in = s_axis_video.read();
    const pixel_t value = in.data;
    const bool above = (value > thresh);
    out.ch[0] = select_source(
        above ? sources.above : sources.below,
        value, thresh, maxval);
    m_axis_video.write(make_packet(out, in));
    last = (in.last == 1);
} while (!last);        // volání = řádek
```

</td></tr></table>

**VHDL** (`threshold_core.vhd`, 3 takty)

```vhdl
case to_integer(thresh_type) is                       -- mimo pipeline (registr)
    when C_THRESH_BINARY => source_above <= SOURCE_MAXVAL; source_below <= SOURCE_ZERO;
    when C_THRESH_TRUNC  => source_above <= SOURCE_THRESH; source_below <= SOURCE_VALUE;
    -- ... další typy, neplatný typ -> nula
end case;
if pipe_enable = '1' then
    in_value      <= unsigned(s_axis_tdata);                      -- krok 1
    is_above      <= to_sl(in_value > thresh);                    -- krok 2
    compare_value <= in_value;
    if is_above = '1' then                                        -- krok 3
        out_value <= select_source(source_above, compare_value, thresh, maxval);
    else
        out_value <= select_source(source_below, compare_value, thresh, maxval);
    end if;
end if;
```

---

## 4. 2D konvoluce K×K

Sémantika `cv::filter2D` (korelace), okno $K \times K$ se středem v $(x, y)$, $r = \lfloor K/2 \rfloor$:

$$
\mathrm{acc}(x,y) = \sum_{i=0}^{K-1}\sum_{j=0}^{K-1} c_{ij}\; I\bigl(x + j - r,\ y + i - r\bigr),\qquad
O(x,y) = \mathrm{sat}_{u8}\bigl(\mathrm{round\_shift}(\mathrm{acc}\cdot s,\ 14) + \delta\bigr)
$$

Koeficienty $c_{ij}$ int8, normalizace $s$ v **Q.14** (18 b), $\delta$ int16. Pixely mimo obraz: 0 (*constant*) nebo
nejbližší pixel na okraji (*replicate*). Šířky: součin $8 + 9 = 17$ b, součet $17 + \lceil\log_2 K^2\rceil$ b.

| jádro | $c$ | $s$ |
| --- | --- | --- |
| průměr 3×3 | samé 1 | $\mathrm{round}(2^{14}/9) = 1820$ |
| Sobel $x$ | $\begin{pmatrix}-1&0&1\\-2&0&2\\-1&0&1\end{pmatrix}$ | $2^{14}$ |
| zostření | $\begin{pmatrix}0&-1&0\\-1&5&-1\\0&-1&0\end{pmatrix}$ | $2^{14}$ |

<table><tr><td>

**C** (`filter.c`)

```c
for (r = 0u; r < kernel->size; r++)
{
    for (c = 0u; c < kernel->size; c++)
    {
        acc += (int64_t)kernel->coeff[r][c]
             * imgproc_image_fetch(src, x + c - radius,
                                   y + r - radius, 0u, border);
    }
}
value = imgproc_round_shift(acc * kernel->scale_q14, 14u)
      + kernel->delta;
*dst_pixel = imgproc_saturate_u8(value);
```

</td><td>

**HLS** (`hls_filter2d.cpp`, funktor pro `window_frame<K>`)

```cpp
ap_int<SUM_BITS> sum = 0;
for (int row = 0; row < K; row++)
{
#pragma HLS UNROLL
    for (int col = 0; col < K; col++)
    {
#pragma HLS UNROLL
        sum += ap_int<PRODUCT_BITS>(coeff[row][col]
             * ap_int<PIXEL_SIGNED_BITS>(win[row][col]));
    }
}
const ap_int<SCALED_BITS> scaled = sum * scale;
return saturate_u8(round_shift<14>(scaled) + delta);
```

</td></tr></table>

**VHDL** (`filter2d_core.vhd`) – explicitní pipeline: součiny → sčítací strom po dvojicích s registrem v každé úrovni
($\lceil\log_2 K^2\rceil$ úrovní) → škálování → zaokrouhlení → delta a saturace. Okno, řádkové buffery a okraje dodává
společný `window_gen`:

```vhdl
for row in 0 to G_K - 1 loop                                      -- P: součiny
    for col in 0 to G_K - 1 loop
        products(row * G_K + col) <= coeff(row * G_K + col) * signed('0' & window(row, col));
    end loop;
end loop;
for level in 1 to C_TREE_LEVELS loop                              -- T1..TL: strom
    for idx in 0 to tree_count(level) - 1 loop
        adder_tree(level)(idx) <= adder_tree(level - 1)(2 * idx) + adder_tree(level - 1)(2 * idx + 1);
    end loop;
end loop;
scaled_sum    <= adder_tree(C_TREE_LEVELS)(0) * scale;                                  -- S1
rounded_value <= resize(shift_right(scaled_sum + C_ROUND_HALF, C_FILTER_FRAC_W), C_ROUNDED_W);  -- S2
out_pixel     <= sat_u8(resize(rounded_value, C_OFFSET_W) + resize(delta, C_OFFSET_W));   -- S3
```

**Okénkový rámec** (sdílí ho konvoluce i medián): $K-1$ řádkových bufferů v BRAM, okno $K \times K$ v registrech,
zpoždění výstupu o $r$ řádků a $r$ sloupců. Za posledním pixelem se okno „dojede“ (flush) bez vstupu, takže jádro
vydá přesně $W \times H$ pixelů. Režie flush: $(W + r)(H + r) - WH$ taktů (u 1080p a $K=3$ 0,15 %).

---

## 5. Mediánový filtr 3×3 pomocí třídicí sítě (sorting network)

$$
O(x, y) = \mathrm{med}\bigl\{ I(x + j, y + i) : i, j \in \{-1, 0, 1\} \bigr\}
$$

Místo řazení devíti hodnot lze použit **třídicí síť 7 × sort3** (21 komparací): seřadit řádky, pak sloupce minim, mediánů a maxim, medián pak bude jedna hodnota z (maximum minim, mediánu mediánů, minimum maxim). Struktura je pravidelná a každá
vrstva je jeden stupeň pipeline. S okraji které se replikují *replicate* bitově shodné s `cv::medianBlur`.

<table><tr><td>

**C** (`median.c`)

```c
const sorted3_t row0 = sort3(w[0], w[1], w[2]);
const sorted3_t row1 = sort3(w[3], w[4], w[5]);
const sorted3_t row2 = sort3(w[6], w[7], w[8]);
const sorted3_t lows  = sort3(row0.lo,  row1.lo,  row2.lo);
const sorted3_t mids  = sort3(row0.mid, row1.mid, row2.mid);
const sorted3_t highs = sort3(row0.hi,  row1.hi,  row2.hi);
return sort3(lows.hi, mids.mid, highs.lo).mid;
```

</td><td>

**HLS** (`hls_median.cpp`)

```cpp
pixel_t operator()(const pixel_t win[3][3]) const
{
#pragma HLS INLINE
    const Sorted3 row0 = sort3(win[0][0], win[0][1], win[0][2]);
    const Sorted3 row1 = sort3(win[1][0], win[1][1], win[1][2]);
    const Sorted3 row2 = sort3(win[2][0], win[2][1], win[2][2]);
    const Sorted3 lows  = sort3(row0.lo,  row1.lo,  row2.lo);
    const Sorted3 mids  = sort3(row0.mid, row1.mid, row2.mid);
    const Sorted3 highs = sort3(row0.hi,  row1.hi,  row2.hi);
    return sort3(lows.hi, mids.mid, highs.lo).mid;
}
```

</td></tr></table>

**VHDL** (`median_core.vhd`, každá vrstva sítě = 1 takt)

```vhdl
for row in 0 to 2 loop                                                        -- takt E1
    rows_sorted(row) <= sort3(window(row, 0), window(row, 1), window(row, 2));
end loop;
lows_sorted    <= sort3(rows_sorted(0).low, rows_sorted(1).low, rows_sorted(2).low);          -- takt E2
middles_sorted <= sort3(rows_sorted(0).middle, rows_sorted(1).middle, rows_sorted(2).middle);
highs_sorted   <= sort3(rows_sorted(0).high, rows_sorted(1).high, rows_sorted(2).high);
median_value   <= sort3(lows_sorted.high, middles_sorted.middle, highs_sorted.low).middle;   -- takt E3
```

`sort3` je ve všech třech jazycích stejná funkce: $lo_{ab} = \min(a,b)$, $hi_{ab} = \max(a,b)$, $lo = \min(lo_{ab}, c)$,
$hi = \max(hi_{ab}, c)$, $mid = hi_{ab} < c\ ?\ hi_{ab} : \max(lo_{ab}, c)$.

---

## 6. Histogram jasu

$$
h[k] = \bigl|\{ (x, y) : I(x, y) = k \}\bigr| ,\qquad k = 0, \dots, 255
$$

Video prochází jádrem beze změny (bypass), histogram snímku je po jeho konci k dispozici v poli `hist[256]` (AXI4-Lite,
`0x400–0x7FF`) až do konce dalšího snímku. Čítač koše má $\lceil \log_2 (W_{max} H_{max} + 1) \rceil = 23$ b (4K).

**Problém HW realizace:** `h[k]++` je read-modify-write do paměti. Při pixelu za takt (II = 1) je mezi čtením a zápisem
téhož koše několik taktů pipeline, takže dva blízké pixely stejné hodnoty by četly ještě nezapsanou hodnotu.
Řešení: **forwarding** – posledních několik zápisů se drží v registrech a při shodě koše se hodnota vezme z nich.

<table><tr><td>

**C** (`histogram.c`)

```c
for (i = 0u; i < 256u; i++)
{
    hist[i] = 0u;
}
for (y = 0u; y < src->height; y++)
{
    for (x = 0u; x < src->width; x++)
    {
        hist[*imgproc_image_pixel(src, x, y)]++;
    }
}
```

</td><td>

**HLS** (`hls_histogram.cpp`, koše v BRAM, forwarding 3 zápisů)

```cpp
#pragma HLS DEPENDENCE variable=bins type=inter dependent=false
// ...
hist_count_t cnt = bins[val];
for (int k = FWD_DEPTH - 1; k >= 0; k--)      // nejnovější vyhrává
{
#pragma HLS UNROLL
    if (fwd_bin[k] == val) cnt = fwd_cnt[k];
}
cnt++;
bins[val] = cnt;
// posun historie zápisů: fwd[k] = fwd[k-1], fwd[0] = (val, cnt)
```

</td></tr></table>

**VHDL** (`histogram_core.vhd`, `G_USE_BRAM = true`) – forwarding plyne přímo z pipeline A → B → C → D: hodnotu,
kterou BRAM ještě nevrací, má buď operace ve stupni C (právě se zapisuje), nebo D (zapsáno v témže taktu, kdy se čte –
read-first). Příznaky shody se registrují už při přechodu A → B, takže v jednom taktu je jen multiplexor a +1:

```vhdl
-- A -> B: čtení BRAM a příznaky shody (operace v B a C se právě posunují do C a D)
b_read_count <= bin_memory(to_integer(op_bin));
b_hit_c      <= b_write and to_sl(op_bin = b_bin);
b_hit_d      <= c_write and to_sl(op_bin = c_bin);
-- B -> C: základ s forwardingem, nová hodnota (count +1, výsyp/nulování 0)
if b_hit_c = '1' then    base_count := c_count_value;
elsif b_hit_d = '1' then base_count := d_count_value;
else                     base_count := b_read_count;
end if;
if b_count = '1' then
    c_count_value <= base_count + 1;
else
    c_count_value <= (others => '0');
end if;
-- C -> D: zápis do BRAM
if c_write = '1' then
    bin_memory(to_integer(c_bin)) <= c_count_value;
end if;
```

Druhá VHDL architektura (`G_USE_BRAM = false`) je přímá realizace „256 čítačů“: bez read-modify-write i forwardingu,
ale 35× víc logiky – názorná ukázka, že volba architektury rozhoduje víc než jazyk.

---

## Ověření a měření

### Tři úrovně ověření

1. **Referenční model proti OpenCV** (`DP/model/lib_imgproc/test/verify_opencv.py`). Golden model v C je měřítkem pro
   obě HW verze, proto se nejdřív ověřuje sám:
   - bitově shodné s OpenCV: RGB → šedá a RGB → HSV na všech 2^24 barvách, prahování (5 typů × 6 prahů),
     medián 3×3 s opakováním krajního pixelu, konvoluce identity, zostření a Sobel;
   - s odchylkou nejvýš 1–2 (OpenCV počítá v plovoucí řádové čárce nebo s jinak zaokrouhlenými koeficienty): HSV → RGB,
     RGB → YCbCr a zpětný převod YCbCr → RGB;
   - konvoluce průměrem vychází na testovacím obraze shodně, bitová shoda ale zaručená není (1/9 nejde v pevné řádové
     čárce vyjádřit přesně);
   - unit testy `test_imgproc.c` (aritmetika, převod barev, HSV, medián, filtry) bez OpenCV, běží i na ARM.
2. **HW jádra proti referenčnímu modelu.** Vstupní a očekávané vektory generuje `imgproc_cli` z modelu (soubory HEX),
   nic se neopisuje ručně.
   - **HLS:** C-simulace ověří C++ kód jádra, kosimulace (C/RTL co-simulation) pustí stejný testbench nad RTL, které
     z kódu vygeneroval Vitis HLS. Testbench vrací 0 jen při bitové shodě dat i `TUSER`/`TLAST`.
   - **VHDL:** simulace v xsim (Vivado) a GHDL přes generický testbench `DP/vhdl/tb` (zdroj ze souboru → jádro →
     příjemce s porovnáním). Zdroj vkládá náhodné mezery (`TVALID`), příjemce náhodně brzdí (`TREADY`, zpětné řízení
     toku), aby se ověřilo, že se žádný pixel neztratí ani nezdvojí.
   - **Obálky s AXI4-Lite** (`*_axil`) se testují stejně, jako je bude ovládat ovladač v C: před `ap_start` nesmí jádro
     přijmout pixel, zápis a zpětné čtení registrů, spuštění `0x81` (start + auto-restart), přerušení a `ISR`, odpovědi
     `BRESP`/`RRESP` = OKAY.
3. **Deska KV260** (`DP/sw/harness_app`): měřicí aplikace pošle snímek přes VDMA každým jádrem a výsledek porovná
   s referenčním modelem přeloženým pro ARM. Aplikace je přeložená, na desce zatím neproběhla.

### Syntéza mimo kontext (OOC)

**Co to je:** syntéza, rozmístění a propojení **jednoho jádra samostatně**, bez zbytku návrhu (VDMA, propojení AXI,
procesor). Porty jádra se nepřipojují na piny a jediným omezením jsou hodiny s periodou 5 ns (200 MHz). Výsledkem
jsou prostředky (LUT, FF, DSP, BRAM) a časování jen tohoto jádra.

**Proč:** čísla z celého testovacího řetězce závisí na tom, co leží vedle. Například `hls_hsv2rgb` mělo samostatně
časovou rezervu 1,0 ns, v plném řetězci se 14 jádry jen 0,10 ns a tvořilo jeho kritickou cestu (`vysledky.md` sekce 11
a 12). Jádro se nezměnilo, změnilo se jen rozmístění a propojení. Pro srovnání HLS a VHDL jsou proto potřeba podmínky,
které na okolí nezávisí:

- **stejný postup pro obě verze:** RTL vygenerované z HLS prochází stejným Tcl skriptem jako VHDL
  (`DP/hls/scripts/ooc_impl_hls.tcl`, `DP/vhdl/scripts/ooc_impl.tcl`), se stejným obvodem (xck26-sfvc784-2LV-c)
  a stejným cílem 5 ns;
- **perioda = max(5 − WNS, 5 − WPWS):** WNS je časová rezerva nejhorší logické cesty, WPWS rezerva minimální šířky
  pulzu hodin. Bloky BRAM a DSP mají minimální periodu danou výrobcem (3,077 ns a 3,262 ns), kterou žádná úprava logiky
  nezkrátí. Vlastní export Vitis HLS počítá jen s WNS, a proto u jader s BRAM nebo DSP hlásí kratší periodu, než obvod
  skutečně zvládne (podrobně `vysledky.md` sekce 9).

Všechny konfigurace VHDL z tabulek jsou v `DP/vhdl/scripts/ooc_all.txt`, výsledky sbírá `collect_vhdl.py`
do `DP/vhdl/results/vhdl_results.csv` a `DP/hls/results/hls_ooc_results.csv`.

### Testy jednotlivých jader

Všechny testy kontrolují data i `TUSER`/`TLAST` a běží aspoň na dvou snímcích za sebou (jádro nesmí držet stav
z předchozího snímku).

| jádro | VHDL (xsim, GHDL) | HLS (C-simulace + kosimulace) |
| --- | --- | --- |
| převod barev | `tb_csc`: 9 předvoleb (šedá BT.601, YCbCr BT.601/709 v plném i omezeném rozsahu, šedá → RGB, zpětný převod YCbCr → RGB BT.601 plný, BT.601 a BT.709 studio), náhodné mezery a brzdění; `tb_csc_axil`: zápis koeficientů podle mapy registrů, zpětné čtení | `tb_csc`: všechny předvolby, všechny tři top funkce (3 → 3, 3 → 1, 1 → 3) |
| RGB ↔ HSV | `tb_rgb2hsv`, `tb_hsv2rgb`: obraz 64×48 (hraniční hodnoty, gradient, šum), rampa 256×256 se shodami kanálů, **úplný test všech 2^24 vstupů** ve 4 částech; `tb_hsv_axil`: oba směry, `G_USE_DSP` | `tb_hsv`: vzor 64×48 a rozmítání 256×256; C-simulace **úplný test 2^24** v obou směrech (`TB_HSV_FULL=1`), kosimulace zkrácený test |
| prahování | `tb_threshold`: rampa 256×4 pro 5 typů × prahy {0, 1, 127, 254, 255} × maxval {255, 77}, neplatné typy 5–7 (výstup 0), parametry měněné mezi snímky; `tb_threshold_axil`: Otsuův práh 108, registr `type` má 3 platné bity | `tb_threshold`: stejné kombinace (80) včetně neplatných typů |
| konvoluce K×K | `tb_filter2d`: identity, průměr, zostření, Sobel x/y (3×3), jádra 5×5 a 7×7, rozměry 64×48, 9×3 a 8×1 (výška menší než jádro); `tb_filter2d_axil`: koeficienty z modelu přes AXI4-Lite (u K ≥ 5 paměťové okno), přerušení, status; `tb_filter2d_reset`: reset uprostřed snímku a změna rozměrů | `tb_filter2d`: 3×3 předvolby a pseudonáhodná jádra 5×5 a 7×7, oba okraje, tři rozměry |
| medián 3×3 | `tb_median`: 6 rozměrů včetně výšky 1 a 2, oba okraje, pixely před `TUSER` (status SKIPPED), předčasný `TLAST` (EARLY/LATE_EOL); `tb_median_axil` | `tb_median`: stejné scénáře (ověří i šablonu okénkových jader `hls_window.hpp`) |
| histogram | `tb_histogram`: obě architektury (`G_USE_BRAM`), vzory s opakováním hodnoty (forwarding), rozměry 9×3 a 8×1, pixely před `TUSER`, video musí projít beze změny; `tb_histogram_axil`: čtení okna `hist` (0x400–0x7FF), zápis do okna se ignoruje | `tb_histogram`: opakování koše po 1–4 pixelech (forwarding), porucha a resynchronizace (status EARLY_SOF, SKIPPED) |
| společné bloky | `tb_axis_skid_buffer`: propustnost 1 pixel za takt bez brzdění, náhodné mezery 50/50 a 90/30 | – |

U jader, která čtou a zapisují stejnou paměť v každém taktu (histogram), je kosimulace povinná: C-simulace chybu
v předávání mezivýsledku neodhalí, protože C kód žádnou pipeline nemá (`DP/hls/README.md`).

## Testovací řetězec a test na desce KV260

### Testovací řetězec

Všechna jádra (HLS i VHDL, celkem 14) jsou v jednom bitstreamu, který sestavuje skript
`DP/hw/harness/build_harness.tcl` (blokový návrh ve Vivadu bez ručního klikání):

```
DDR -> VDMA (čtení) -> přepínač RGB -> [průchod | jádra RGB | šedá větev] -> přepínač RGB -> VDMA (zápis) -> DDR
šedá větev: převod RGB -> šedá -> přepínač šedé -> [průchod | šedotónová jádra] -> přepínač šedé -> převod šedá -> RGB
```

- **VDMA** přenáší snímek 1080p (24 b na pixel) z paměti do jádra a zpět, procesor jen nastaví registry.
- **Přepínače AXI4-Stream** volí jádro (port) registrem mezi snímky. Port 0 je průchod bez jádra – měří režii řetězce,
  tedy strop propustnosti (200 MHz a 1 pixel za takt dávají při 1080p 96 snímků za sekundu).
- Šedotónová jádra (prahování, medián, konvoluce, histogram) jsou za převodníky RGB → šedá a šedá → RGB, aby celý
  řetězec pracoval s jedním formátem VDMA.
- Jedny hodiny 200 MHz pro video, AXI4-Lite i paměťový port (stejný cíl jako syntéza mimo kontext).
- Skript vygeneruje `harness_map.h` s adresami a čísly portů všech jader, měřicí aplikace se podle něj přeloží.

### Měřicí aplikace

`DP/sw/harness_app` je bare-metal aplikace pro jedno jádro Cortex-A53 (bez operačního systému). Pro každé jádro:

1. nastaví jeho registry (stejný ovladač pro HLS i VHDL díky stejné mapě registrů),
2. pošle testovací snímek 1080p přes VDMA a změří čas (medián z 5 měření po 10 snímcích),
3. porovná výstup bajt po bajtu s referenčním modelem `lib_imgproc` spočítaným na ARM,
4. změří stejný algoritmus v softwaru na A53 (medián z 10 běhů),
5. vypíše na UART řádek CSV.

| sloupec | význam |
| --- | --- |
| `hw_us_snimek`, `hw_fps` | doba jednoho snímku přes jádro (paměť → jádro → paměť) a odpovídající snímková frekvence |
| `sw_us`, `sw_opt` | doba stejného algoritmu v SW a úroveň optimalizace překladače (-O0, -O2, -O3) |
| `chybne_bajty`, `chybne_kose` | rozdíl proti referenčnímu modelu – musí být 0 |
| `status` | stavový registr okénkových jader (0 = bez poruchy synchronizace) |
| `vysledek` | PASS jen při nulových rozdílech a nulovém statusu |

### Připojení desky a spuštění

Deska se připojuje k počítači s Vitis 2025.2 (Windows) jedním kabelem micro-USB, který nese JTAG (nahrání bitstreamu
a programu) i UART (výpis aplikace), a napájí se zdrojem 12 V. Bootovací přepínače se nenastavují – skript přepne
desku na boot přes JTAG sám.

**Potřebné soubory** (sestavují je fronty `hw_harness` a `sw_app` na serveru, do repozitáře se neukládají):
`DP/sw/build/workspace/harness_platform/export/` (bitstream, `psu_init.tcl`) a
`DP/sw/build/workspace/harness_app_O0|O2|O3/build/*.elf`.

**Skripty:**

| skript | co dělá |
| --- | --- |
| `DP/sw/harness_app/run_board.tcl` | jedno spuštění přes xsdb: připojení k JTAG, přepnutí bootu na JTAG (`BOOT_MODE_USER = 0x0100`) a reset systému (jinak by desku držel firmware z QSPI), nahrání bitstreamu, inicializace procesorového systému (`psu_init`), odstranění izolace PS–PL, nahrání ELF do A53 a spuštění |
| `DP/sw/harness_app/board_test.ps1` | **automatizovaný test**: pro úrovně O2, O0 a O3 otevře sériové porty desky, spustí `run_board.tcl`, čte UART až do `== HOTOVO ==` a uloží celý výpis i CSV do `DP/results/deska/`; port s výstupem aplikace najde sám; při první chybě skončí a nic neopakuje |
| `DP/sw/harness_app/board_test.bat` | spuštění `board_test.ps1` bez změny politiky PowerShellu, parametry předá dál |

Automatizovaný test (z *Vitis 2025.2 Command Prompt*, aby byl `xsdb` v cestě; terminál na COM portech desky musí
být zavřený):

```
cd D:\Repos\_DP\DP\sw\harness_app
board_test.bat                         # O2, O0, O3
board_test.bat -Levels O2 -Port COM7   # jedna úroveň, pevný port
```

Ruční spuštění jedné úrovně: terminál (115200 Bd, 8N1) na COM portu desky a `xsdb run_board.tcl O2`.

Výstupy v `DP/results/deska/`: `uart_<datum>_<úroveň>.txt` (celý výpis), `deska_<datum>_<úroveň>.csv` (tabulka
měření), `xsdb_<datum>_<úroveň>.txt` (log nahrávání).

**Řešení problémů:**

- xsdb nevidí desku (`targets` je prázdné): chybí ovladače kabelu – `install_drivers.bat` ze složky
  `Vivado\data\xicom\cable_drivers\nt64` spustit jako správce.
- `board_test` nenajde port nebo ho nemůže otevřít: deska je vypnutá, nebo port drží jiný terminál (PuTTY).
- Řádek s FAIL: v `uart_*.txt` jsou vypsané první rozdílné pixely (pozice, kanál, hodnota HW a referenčního modelu).

## Výsledky (OOC, KV260, cíl 5 ns = 200 MHz)

Plné tabulky, konfigurace a poznatky: [`DP/results/vysledky.md`](DP/results/vysledky.md). Výběr (celá IP včetně AXI4-Lite):

| jádro | HLS LUT / FF / DSP / BRAM36 | VHDL LUT / FF / DSP / BRAM36 | perioda HLS / VHDL |
| --- | --- | --- | --- |
| převod barev 3→3 | 408 / 493 / 9 / 0 | 210 / 389 / 9 / 0 | 3,92 / 3,26 ns¹ |
| medián 3×3 | 740 / 472 / 0 / 2 | 692 / 532 / 0 / 2 | 3,90 / 3,86 ns |
| konvoluce 3×3 | 640 / 621 / 10 / 2 | 508 / 558 / 14 / 2 | 4,05 / 3,57 ns |
| konvoluce 7×7 | 1341 / 1247 / 50 / 7 | 1232 / 1489 / 72 / 6 | 4,35 / 4,00 ns |
| histogram (BRAM) | 300 / 422 / 0 / 1 | 183 / 288 / 0 / 1 | 3,08 / 3,08 ns¹ |
| prahování | 122 / 118 / 0 / 0 | 81 / 141 / 0 / 0 | 2,78 / 2,78 ns¹ |

¹ omezeno minimální šířkou pulzu hodin BRAM/DSP, ne logikou. Oba sloupce jsou ze stejného OOC skriptu (RTL z HLS
prohnané stejným postupem jako VHDL, `vysledky.md` sekce 9); perioda = max(5 − WNS, 5 − WPWS). Měření propustnosti na desce (1080p, HW × SW) dodá `DP/sw/harness_app`.

## Sestavení

- **Golden model:** `DP/model` (CMake/Makefile), testy `lib_imgproc/test`, ověření proti OpenCV `test/verify_opencv.py`.
- **HLS:** `DP/hls/scripts/run_hls.sh <jádro>/hls_config*.cfg csim|syn|cosim|impl` (Vitis 2025.2), viz `DP/hls/README.md`.
- **VHDL:** vektory `DP/vhdl/tb/gen_vectors.sh`, simulace `DP/vhdl/scripts/run_ghdl.sh` / `run_xsim.sh <tb> [GENERIC=…]`,
  OOC `vivado -mode batch -source DP/vhdl/scripts/ooc_impl.tcl -tclargs <top> [GENERIC=…]`.
- **Deska:** fronty `hw_ip` → `hw_harness` → `sw_app` (`DP/scripts/queues`), test `DP/sw/harness_app/board_test.bat` (kapitola Testovací řetězec a test na desce).
