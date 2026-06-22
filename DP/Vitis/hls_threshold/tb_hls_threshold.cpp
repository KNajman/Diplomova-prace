#include "hls_threshold.hpp"
#include <iostream>
#include <vector>
#include <iomanip>

using namespace std;

// ============================================================================
// SOFTWAROVÝ "ZLATÝ MODEL"
// ============================================================================
void sw_threshold_golden(const vector<uint8_t> &src, vector<uint8_t> &dst,
                         int width, int height, 
                         uint8_t thresh_val, int thresh_type) {
    for (int i = 0; i < width * height; i++) {
        uint8_t pixel_in = src[i];
        if (thresh_type == THRESH_BINARY) {
            dst[i] = (pixel_in > thresh_val) ? 255 : 0;
        } else if (thresh_type == THRESH_TRUNC) {
            dst[i] = (pixel_in > thresh_val) ? thresh_val : pixel_in;
        } else { // THRESH_TOZERO_INV
            dst[i] = (pixel_in > thresh_val) ? 0 : pixel_in;
        }
    }
}

// ============================================================================
// FUNKCE PRO SPUŠTĚNÍ JEDNOHO TESTU
// ============================================================================
int run_threshold_test(const char* test_name, int width, int height, 
                       int thresh_type, uint8_t thresh_val) {
    
    cout << "Spoustim test: " << test_name << " (Prah = " << (int)thresh_val << ")" << endl;

    int total_pixels = width * height;
    vector<uint8_t> sw_src(total_pixels);
    vector<uint8_t> sw_dst(total_pixels);

    hls::stream<axis_gray> s_axis_video("stream_in");
    hls::stream<axis_gray> m_axis_video("stream_out");

    // 1. Generování vstupních dat (Lineární gradient 0-255 opakující se na řádku)
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            uint8_t val = x % 256; 
            sw_src[y * width + x] = val;

            // Zabalení do AXI-Streamu
            axis_gray in_packet;
            in_packet.data.channel[0] = val;
            in_packet.user = (x == 0 && y == 0) ? 1 : 0;          // Start of Frame
            in_packet.last = (x == width - 1) ? 1 : 0;            // End of Line
            s_axis_video.write(in_packet);
        }
    }

    // 2. Výpočet referenčním C++ modelem
    sw_threshold_golden(sw_src, sw_dst, width, height, thresh_val, thresh_type);

    // 3. Spuštění HLS hardwarového modulu
    hls_threshold_gray(s_axis_video, m_axis_video, thresh_val, thresh_type, width, height);

    // 4. Vyčtení a porovnání výsledků
    int errors = 0;
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            if (m_axis_video.empty()) {
                cout << "-> CHYBA: HW stream je predcasne prazdny na pozici [" << x << "," << y << "]" << endl;
                return total_pixels; // Fatální chyba
            }

            axis_gray out_packet = m_axis_video.read();
            uint8_t hw_val = out_packet.data.channel[0];
            uint8_t sw_val = sw_dst[y * width + x];

            // Kontrola synchronizačních signálů
            bool expected_user = (x == 0 && y == 0) ? 1 : 0;
            bool expected_last = (x == width - 1) ? 1 : 0;

            if (out_packet.user != expected_user || out_packet.last != expected_last) {
                if (errors < 5) cout << "-> CHYBA TUSER/TLAST na pozici [" << x << "," << y << "]" << endl;
                errors++;
            }

            // Kontrola obrazových dat
            if (hw_val != sw_val) {
                if (errors < 10) {
                    cout << "-> Mismatch @[" << x << "," << y << "]: "
                         << "HW=" << (int)hw_val << ", SW=" << (int)sw_val << endl;
                }
                errors++;
            }
        }
    }

    if (!m_axis_video.empty()) {
        cout << "-> CHYBA: HW stream obsahuje prebytecna data!" << endl;
        errors++;
    }

    if (errors == 0) cout << "-> VYSLEDEK: OK" << endl << endl;
    else cout << "-> VYSLEDEK: SELHALO s " << errors << " chybami!" << endl << endl;

    return errors;
}

// ============================================================================
// HLAVNÍ FUNKCE (MAIN)
// ============================================================================
int main() {
    cout << "=========================================" << endl;
    cout << " SPUSTENI TB PRO HLS_THRESHOLD_GRAY" << endl;
    cout << "=========================================" << endl << endl;

    int fails = 0;
    
    // Použiji šířku přesně 256, aby náš gradient šel plynule od 0 do 255
    const int W = 256; 
    const int H = 4;   // Výška může být malá
    const uint8_t THRESH = 127; // Práh přesně uprostřed

    fails += run_threshold_test("THRESH_BINARY", W, H, THRESH_BINARY, THRESH);
    fails += run_threshold_test("THRESH_TRUNC", W, H, THRESH_TRUNC, THRESH);
    fails += run_threshold_test("THRESH_TOZERO_INV", W, H, THRESH_TOZERO_INV, THRESH);

    cout << "=========================================" << endl;
    if (fails == 0) {
        cout << " VSECHNY TESTY PROSOU USPESNE!" << endl;
    } else {
        cout << " TESTY SELHALY! Celkovy pocet chybnych testu: " << fails << endl;
    }
    cout << "=========================================" << endl;

    // Návratová hodnota 0 znamená pro Vitis HLS úspěch
    return fails;
}
