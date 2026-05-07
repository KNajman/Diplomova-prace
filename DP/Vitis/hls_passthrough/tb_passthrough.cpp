#include "hls_color_space_convert.hpp"
#include <iostream>

int main() {
  int status = 0;

  // 1. Vytvoření HLS streamů
  hls::stream<axis_video_dma> in_stream("input_stream");
  hls::stream<axis_video_dma> out_stream("output_stream");

  // 2. Příprava vstupního packetu
  axis_video_dma in_packet;

  // Zabalení RGB (255, 128, 0) do jednoho unsigned int[cite: 1]
  // Předpoklad: channel[0]=R (spodních 8 bitů), channel[1]=G, channel[2]=B
  unsigned int test_color = 0x0080FF;

  in_packet.data = static_cast<ap_uint<32>>(rgb_pixel(test_color)); // Využití konstruktoru pro unsigned int[cite: 1]
  in_packet.user = 1;        // TUSER (SOF - Start of Frame)
  in_packet.last = 1;        // TLAST (EOL - End of Line)
  in_packet.keep = 0xF;
  in_packet.strb = 0xF;

  // 3. Zápis dat do streamu
  in_stream.write(in_packet);

  // 4. Volání testované HLS komponenty[cite: 2]
  hls_passthrough(in_stream, out_stream);

  // 5. Čtení výsledku ze streamu
  axis_video_dma out_packet = out_stream.read();

  // 6. Verifikace dat
  unsigned int out_data_cpu =
      out_packet.data; // Využití operatoru pro přetypování zpět na unsigned
                       // int[cite: 1]

  if (out_data_cpu != test_color || out_packet.user != 1 ||
      out_packet.last != 1) {
    std::cout << "CHYBA: Vystupni data neodpovidaji vstupu!" << std::endl;
    status = 1; // Návratová hodnota 1 znamená selhání testbenche
  } else {
    std::cout << "USPECH: Data prosla v poradku vcetne signalu TUSER a TLAST."
              << std::endl;
  }

  return status;
}