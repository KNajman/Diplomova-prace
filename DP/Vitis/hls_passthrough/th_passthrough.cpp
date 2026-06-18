#include "hls_color_space_convert.hpp"
#include <iostream>

int main() {
    int status = 0;
    
    // Definice velikosti testovacího snímku
    const int WIDTH = 16;
    const int HEIGHT = 16;
    const int TOTAL_PIXELS = WIDTH * HEIGHT;

    // 1. Vytvoření HLS streamů
    hls::stream<axis_video_dma> in_stream("input_stream");
    hls::stream<axis_video_dma> out_stream("output_stream");

    std::cout << "--- Start HLS Testbench: Obraz " << WIDTH << "x" << HEIGHT << " ---" << std::endl;

    // 2. Cyklus přes celý snímek (řádky a sloupce)
    for (int row = 0; row < HEIGHT; row++) {
        for (int col = 0; col < WIDTH; col++) {
            
            axis_video_dma in_packet;

            // Vytvoříme unikátní barvu pro každý pixel (např. R=0, G=řádek, B=sloupec)
            // Tím lépe ověříme, že se pixely nezamíchaly
            unsigned int test_color = (row << 8) | col; 

            // in_packet.data = static_cast<ap_uint<32>>(rgb_pixel(test_color)); // Pokud používáš rgb_pixel konverzi
            in_packet.data = test_color; // Přímé přiřazení pro ap_axiu
            
            // Generování řídících signálů pro video
            in_packet.user = (row == 0 && col == 0) ? 1 : 0;         // TUSER = 1 pouze na [0,0]
            in_packet.last = (col == (WIDTH - 1)) ? 1 : 0;           // TLAST = 1 na konci každého řádku
            in_packet.keep = 0xF;
            in_packet.strb = 0xF;

            // 3. Zápis dat do streamu
            in_stream.write(in_packet);

            // 4. Volání testované HLS komponenty
            // Jelikož naše funkce zpracuje vždy jeden pixel a skončí, musíme ji volat v cyklu
            hls_passthrough(in_stream, out_stream);

            // 5. Čtení výsledku ze streamu
            axis_video_dma out_packet = out_stream.read();

            // 6. Verifikace dat a video signálů
            if (out_packet.data != test_color || 
                out_packet.user != in_packet.user || 
                out_packet.last != in_packet.last) {
                
                std::cout << "CHYBA na pozici: [" << row << "][" << col << "]" << std::endl;
                std::cout << "  Ocekavano: Data=" << test_color << ", User=" << in_packet.user << ", Last=" << in_packet.last << std::endl;
                std::cout << "  Prijato:   Data=" << out_packet.data << ", User=" << out_packet.user << ", Last=" << out_packet.last << std::endl;
                
                status = 1; // Označíme selhání
                break;      // Přerušíme vnitřní smyčku při první chybě
            }
        }
        if (status != 0) break; // Přerušíme vnější smyčku při chybě
    }

    if (status == 0) {
        std::cout << "USPECH: Vsech " << TOTAL_PIXELS << " pixelu proslo v poradku (vcetne TUSER a TLAST signálů)." << std::endl;
    } else {
        std::cout << "TEST SELHAL!" << std::endl;
    }

    return status;
}