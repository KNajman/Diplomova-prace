#include "hls_filter_median.hpp"

void hls_filter_median_3x3(
    hls::stream<axis_gray> &s_axis_video, 
    hls::stream<axis_gray> &m_axis_video,
    ap_uint<COORD_BITS> width, 
    ap_uint<COORD_BITS> height
) {
    // Rozhraní je namapováno na standardní AXI sběrnice.
    #pragma HLS INTERFACE axis port = s_axis_video
    #pragma HLS INTERFACE axis port = m_axis_video
    #pragma HLS INTERFACE s_axilite port = width bundle = control
    #pragma HLS INTERFACE s_axilite port = height bundle = control
    #pragma HLS INTERFACE s_axilite port = return bundle = control

    // Je vytvořen vlastní kruhový buffer pro uchování předchozích řádků (Inferováno jako BRAM).
    ap_uint<PIXEL_WIDTH> line_buffer[KERNEL_SIZE - 1][MAX_IMG_WIDTH];
    #pragma HLS ARRAY_PARTITION variable = line_buffer complete dim = 1

    // Je vytvořen vlastní posuvný registr pro výpočetní okno (Inferováno jako klopné obvody).
    ap_uint<PIXEL_WIDTH> window[KERNEL_SIZE][KERNEL_SIZE];
    #pragma HLS ARRAY_PARTITION variable = window complete dim = 0

    ap_uint<COORD_BITS> x = 0;
    ap_uint<COORD_BITS> y = 0;
    bool sof_flag = true; // Je indikováno odeslání prvního pixelu (Start Of Frame).

    // Je iterováno přesně přes počet pixelů na vstupu.
    ap_uint<TOTAL_PIXELS_BITS> total_pixels = width * height;

    for (ap_uint<TOTAL_PIXELS_BITS> i = 0; i < total_pixels; i++) {
        #pragma HLS PIPELINE II=1

        // ---------------------------------------------------------------------
        // 1. ČTENÍ A AKTUALIZACE VLASTNÍCH PAMĚTÍ
        // ---------------------------------------------------------------------
        
        // Je přečten nový pixel ze vstupního streamu.
        ap_uint<PIXEL_WIDTH> new_pixel = s_axis_video.read().data;

        // V okně jsou posunuty všechny dosavadní pixely doleva.
        for (int r = 0; r < KERNEL_SIZE; r++) {
            #pragma HLS UNROLL
            for (int c = 0; c < KERNEL_SIZE - 1; c++) {
                #pragma HLS UNROLL
                window[r][c] = window[r][c + 1];
            }
        }

        // Do pravého sloupce okna jsou překopírována data z řádkového bufferu.
        for (int r = 0; r < KERNEL_SIZE - 1; r++) {
            #pragma HLS UNROLL
            window[r][KERNEL_SIZE - 1] = line_buffer[r][x];
        }
        // Na úplný spodek sloupce je vložen aktuální nový pixel.
        window[KERNEL_SIZE - 1][KERNEL_SIZE - 1] = new_pixel;

        // Řádkový buffer je posunut nahoru (staré řádky jsou zahozeny).
        for (int r = 0; r < KERNEL_SIZE - 2; r++) {
            #pragma HLS UNROLL
            line_buffer[r][x] = line_buffer[r + 1][x];
        }
        // Nový pixel je uložen na dno řádkového bufferu.
        line_buffer[KERNEL_SIZE - 2][x] = new_pixel;

        // ---------------------------------------------------------------------
        // 2. VÝPOČET MEDIÁNU (3x3 Sorting Network)
        // ---------------------------------------------------------------------
        
        ap_uint<PIXEL_WIDTH> min[3], med[3], max[3];
        ap_uint<PIXEL_WIDTH> final_min, final_med, final_max, median_out;

        // Krok 1: Jsou setříděny jednotlivé řádky okna.
        for (int row = 0; row < 3; row++) {
            #pragma HLS UNROLL
            sort_three(window[row][0], window[row][1], window[row][2], 
                       min[row], med[row], max[row]);
        }

        // Krok 2: Je vybráno maximum z minim, medián z mediánů a minimum z maxim.
        sort_three(min[0], min[1], min[2], final_min, final_med, final_max); 
        ap_uint<PIXEL_WIDTH> max_of_mins = final_max;

        sort_three(med[0], med[1], med[2], final_min, final_med, final_max); 
        ap_uint<PIXEL_WIDTH> med_of_meds = final_med;

        sort_three(max[0], max[1], max[2], final_min, final_med, final_max); 
        ap_uint<PIXEL_WIDTH> min_of_maxs = final_min;

        // Krok 3: Z těchto tří mezivýsledků je určen finální medián.
        sort_three(max_of_mins, med_of_meds, min_of_maxs, final_min, final_med, final_max);
        median_out = final_med;

        // ---------------------------------------------------------------------
        // 3. ŘÍZENÍ VÝSTUPU (Režim HW_VALID)
        // ---------------------------------------------------------------------
        
        // Výstupní pixel je validní pouze pokud je okno plně naplněno daty (okraje ignorovány).
        if (x >= KERNEL_SIZE - 1 && y >= KERNEL_SIZE - 1) {
            axis_gray out_packet;
            out_packet.data = median_out;

            // Nastavení SOF jen pro první pixel výstupního obrazu.
            bool is_first_output = (out_y == 0 && out_x == RADIUS);  // For VALID mode
            out_packet.user = is_first_output ? 1 : 0;

            // Nastavení příznaku posledního pixelu v řádku.
            out_packet.last = (x == width - 1) ? 1 : 0;

            // Odeslání paketu do výstupního streamu.
            m_axis_video.write(out_packet);
            
            sof_flag = false; // Příznak Start Of Frame je vynulován.
        }

        // ---------------------------------------------------------------------
        // 4. INKREMENTACE SOUŘADNIC
        // ---------------------------------------------------------------------
        
        if (x == width - 1) {
            x = 0;
            y++;
        } else {
            x++;
        }
    }
}