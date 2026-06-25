#include "hls_histogram.hpp"
#include <iostream>
#include <vector>

using namespace std;

// ============================================================================
// SOFTWAROVÝ "ZLATÝ MODEL"
// ============================================================================
void sw_histogram_golden(const vector<uint8_t> &src, uint32_t hist_out[HIST_BINS_8BIT], int width, int height) {
    // Vynulování referenčního histogramu
    for (int i = 0; i < HIST_BINS_8BIT; i++) {
        hist_out[i] = 0;
    }

    // Výpočet
    for (int i = 0; i < width * height; i++) {
        uint8_t pixel_val = src[i];
        hist_out[pixel_val]++;
    }
}

// ============================================================================
// FUNKCE PRO SPUŠTĚNÍ JEDNOHO TESTU
// ============================================================================
int run_histogram_test(const char* test_name, int width, int height, const vector<uint8_t> &sw_src) {
    cout << "Spoustim test: " << test_name << " (" << width << "x" << height << ")" << endl;

    int total_pixels = width * height;
    uint32_t sw_hist[HIST_BINS_8BIT];
    ap_uint<32> hw_hist[HIST_BINS_8BIT];

    hls::stream<axis_gray> s_axis_video("stream_in");

    // 1. Zabalení předpřipravených dat do AXI-Streamu
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            uint8_t val = sw_src[y * width + x];

            axis_gray in_packet;
            in_packet.data.channel[0] = val;
            in_packet.user = (x == 0 && y == 0) ? 1 : 0; // SOF
            in_packet.last = (x == width - 1) ? 1 : 0;   // EOL
            
            s_axis_video.write(in_packet);
        }
    }

    // 2. Výpočet referenčním C++ modelem
    sw_histogram_golden(sw_src, sw_hist, width, height);

    // 3. Spuštění HLS hardwarového modulu
    hls_histogram_gray(s_axis_video, hw_hist, width, height);

    // 4. Porovnání výsledků
    int errors = 0;
    for (int i = 0; i < HIST_BINS_8BIT; i++) {
        if (hw_hist[i] != sw_hist[i]) {
            if (errors < 10) {
                cout << "-> CHYBA v kosi [" << i << "]: "
                     << "HW=" << hw_hist[i] << ", SW=" << sw_hist[i] << endl;
            }
            errors++;
        }
    }

    if (!s_axis_video.empty()) {
        cout << "-> CHYBA: Ve vstupnim streamu zustala nezpracovana data!" << endl;
        errors++;
    }

    if (errors == 0) cout << "-> VYSLEDEK: OK" << endl << endl;
    else cout << "-> VYSLEDEK: SELHALO s " << errors << " chybami!" << endl << endl;

    return errors;
}

#include <cstdlib> // pro rand()

// ============================================================================
// HLAVNÍ FUNKCE (MAIN)
// ============================================================================
int main() {
    cout << "=========================================" << endl;
    cout << " SPUSTENI TB PRO HLS_HISTOGRAM_GRAY" << endl;
    cout << "=========================================" << endl << endl;

    int fails = 0;
    const int W = 64;
    const int H = 64;
    int total_pixels = W * H;

    // ---------------------------------------------------------
    // TEST 1: Konstantní obraz (Maximální RAW Hazard stres test)
    // ---------------------------------------------------------
    vector<uint8_t> src_constant(total_pixels);
    for (int i = 0; i < total_pixels; i++) {
        src_constant[i] = 128; // Celý obraz je jednolité šedi (vše spadne do koše 128)
    }
    fails += run_histogram_test("Konstantni obraz (Test RAW hazardu)", W, H, src_constant);

    // ---------------------------------------------------------
    // TEST 2: Náhodné hodnoty
    // ---------------------------------------------------------
    vector<uint8_t> src_random(total_pixels);
    for (int i = 0; i < total_pixels; i++) {
        src_random[i] = rand() % 256; // BRAM musí v každém taktu adresovat jiný koš
    }
    fails += run_histogram_test("Nahodny sum (Random Memory Access)", W, H, src_random);

    // ---------------------------------------------------------
    // TEST 3: Vodorovné pruhy
    // ---------------------------------------------------------
    vector<uint8_t> src_stripes(total_pixels);
    for (int y = 0; y < H; y++) {
        for (int x = 0; x < W; x++) {
            src_stripes[y * W + x] = (y * 10) % 256;
        }
    }
    fails += run_histogram_test("Vodorovne pruhy", W, H, src_stripes);


    cout << "=========================================" << endl;
    if (fails == 0) {
        cout << " VSECHNY TESTY PROSOU USPESNE!" << endl;
    } else {
        cout << " TESTY SELHALY! Celkovy pocet chybnych testu: " << fails << endl;
    }
    cout << "=========================================" << endl;

    return (fails == 0) ? 0 : 1; 
}