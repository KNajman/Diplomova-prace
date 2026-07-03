#include "hls_passthrough.hpp"
#include <iomanip>
#include <iostream>

int main() {
  const int WIDTH = 64;
  const int HEIGHT = 64;
  const int TOTAL_PIXELS = WIDTH * HEIGHT;

  // Vytvoření instancí hls::stream pro simulaci hardwarových rozhraní
  hls::stream<axis_video> in_stream("tb_in_stream");
  hls::stream<axis_video> out_stream("tb_out_stream");

  std::cout << "=================================================="
            << std::endl;
  std::cout << "START HLS PASSTHROUGH TESTBENCH" << std::endl;
  std::cout << "=================================================="
            << std::endl;

  /*
  GENEROVÁNÍ VSTUPNÍCH DAT
  ve formátu XVIDC_CSF_MEM_RGBX8 = 10,   // [31:0] x:B:G:R 8:8:8:8
  */
  std::cout << "-> Generuji vstupní obraz a plním in_stream..." << std::endl;

  for (int r = 0; r < HEIGHT; r++) {
    for (int c = 0; c < WIDTH; c++) {
      axis_video packet;

      // Testovací RGB pixel s unikátními hodnotami pro každou pozici, maskování
      // do rozsahu 0-255
      rgb_pixel pixel;
      pixel.channel[0] = ((r * 10) + c + 5) & 0xFF;  // R složka
      pixel.channel[1] = ((r * 20) + c + 10) & 0xFF; // G složka
      pixel.channel[2] = ((r * 30) + c + 15) & 0xFF; // B složka
      // pixel.channel[3] = 0;  X channel (nepoužívá se)

      // Využití přetypování operátoru z tvé struktury color_pixel pro zabalení
      // do ap_uint<32>
      packet.data =
          (static_cast<ap_uint<32>>(0x00) << 24) | // X bajt (vycpávka)
          (static_cast<ap_uint<32>>(pixel.channel[2]) << 16) | // R
          (static_cast<ap_uint<32>>(pixel.channel[1]) << 8) |  // G
          (static_cast<ap_uint<32>>(pixel.channel[0]));

      // Nastavení platnosti bajtů 24 platných z 32 (3 bajty = 0b111 = 0x7)
      packet.keep = 0xF;
      packet.strb = 0xF;

      // Protokol AXI4-Stream Video (XAPP793):
      // USER = 1 na prvním pixelu celého snímku (Start of Frame)
      packet.user = (r == 0 && c == 0) ? 1 : 0;
      // LAST = 1 na posledním pixelu každého řádku (End of Line / HSYNC)
      packet.last = (c == WIDTH - 1) ? 1 : 0;

      // Zápis paketu do vstupního streamu
      in_stream.write(packet);
    }
  }

  // ------------------------------------------------------------------------
  // DUT
  // ------------------------------------------------------------------------
  std::cout << "-> Spouštím HLS modul pro " << HEIGHT << " řádků a "
            << TOTAL_PIXELS << "pixelů." << std::endl;

  hls_passthrough(in_stream, out_stream, HEIGHT, WIDTH);

  int error_count = 0;

  for (int r = 0; r < HEIGHT; r++) {
    for (int c = 0; c < WIDTH; c++) {
      // Kontrola, zda v streamu vůbec jsou data
      if (out_stream.empty()) {
        std::cerr << "CHYBA: Výstupní stream je prázdný předčasně! Pozice: ["
                  << r << ", " << c << "]" << std::endl;
        error_count++;
        break;
      }

      // Přečtení paketu z výstupního streamu
      axis_video out_packet = out_stream.read();

      // Rekonstrukce pixelu pomocí konstruktoru z tvé struktury color_pixel
      rgb_pixel out_pixel(static_cast<unsigned int>(out_packet.data));

      // Výpočet očekávaných hodnot (jelikož je to passthrough, shodují se se
      // vstupem)
      uint8_t exp_r = ((r * 10) + c + 5) & 0xFF;
      uint8_t exp_g = ((r * 20) + c + 10) & 0xFF;
      uint8_t exp_b = ((r * 30) + c + 15) & 0xFF;
      ap_uint<1> exp_user = (r == 0 && c == 0) ? 1 : 0;
      ap_uint<1> exp_last = (c == WIDTH - 1) ? 1 : 0;

      // Kontrola shody dat i řídicích signálů
      bool match =
          (out_pixel.channel[0] == exp_r) && (out_pixel.channel[1] == exp_g) &&
          (out_pixel.channel[2] == exp_b) && (out_packet.user == exp_user) &&
          (out_packet.last == exp_last);

      if (!match) {
        error_count++;
        std::cout << "NESHODA na pozici [" << r << ", " << c
                  << "]:" << std::endl;
        std::cout << "  Očekáváno: RGB(" << (int)exp_r << ", " << (int)exp_g
                  << ", " << (int)exp_b << ") | USER=" << exp_user
                  << " LAST=" << exp_last << std::endl;
        std::cout << "  Získáno:   RGB(" << (int)out_pixel.channel[0] << ", "
                  << (int)out_pixel.channel[1] << ", "
                  << (int)out_pixel.channel[2] << ") | USER=" << out_packet.user
                  << " LAST=" << out_packet.last << std::endl;
      }
    }
  }

  // Kontrola, zda ve streamu nezůstala nějaká data navíc
  if (!out_stream.empty()) {
    std::cerr << "CHYBA: Výstupní stream obsahuje neočekávaná data navíc!"
              << std::endl;
    error_count++;
  }

  /*
  VYHODNOCENÍ
  */

  std::cout << "=================================================="
            << std::endl;
  if (error_count == 0) {
    std::cout << ">>> VÝSLEDEK: TEST ÚSPĚŠNĚ PROŠEL (PASSED) <<<" << std::endl;
    std::cout << "=================================================="
              << std::endl;
    return 0; // HLS C-Simulace bere 0 jako úspěch
  } else {
    std::cout << ">>> VÝSLEDEK: TEST SELHAL (FAILED). Počet chyb: "
              << error_count << " <<<" << std::endl;
    std::cout << "=================================================="
              << std::endl;
    return 1; // Nenulová hodnota indikuje chybu simulace
  }
}