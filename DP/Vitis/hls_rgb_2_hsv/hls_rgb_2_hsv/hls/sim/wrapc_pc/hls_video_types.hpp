#ifndef HLS_VIDEO_TYPES_HPP
#define HLS_VIDEO_TYPES_HPP

#include <ap_int.h>

// ============================================================================
// DATOVÉ STRUKTURY PRO AXI4-STREAM (Využití Arbitrary Precision)
// ============================================================================

/**
 * @brief Obalová struktura pro AXI4-Stream video data.
 * * Implementuje minimální podmnožinu signálů nutných pro přenos obrazu
 * podle specifikace Xilinx AXI4-Stream Video Protocol (XAPP793).
 * Určuje pouze formát toku dat, nezávisí na konkrétním barevném prostoru.
 * * @tparam PIXEL_TYPE Datový typ reprezentující jeden pixel (např. ap_uint<8> nebo color_pixel)
 */
template <typename PIXEL_TYPE>
struct axi_stream_video {
    PIXEL_TYPE data;  ///< TDATA: Samotná obrazová data (čistá datová složka)
    ap_uint<1> user;  ///< TUSER: Start of Frame (SOF) / VSYNC. Nastaveno na 1 pro první pixel snímku (0,0).
    ap_uint<1> last;  ///< TLAST: End of Line (EOL) / HSYNC. Nastaveno na 1 pro poslední pixel každého řádku.
};


/**
 * @brief Univerzální šablona pro pixel v libovolném barevném prostoru.
 * * Umožňuje bezpečně pracovat s pixely jako s polem kanálů (např. v C++)
 * a zároveň je snadno balit/rozbalovat do jednoho širokého vektoru (ap_uint)
 * pro efektivní přenos přes AXI-Stream.
 * * @tparam NUM_CHANNELS Počet barevných kanálů (např. 1 pro Gray, 3 pro RGB).
 * @tparam PIXEL_WIDTH  Bitová šířka jednoho kanálu (standardně 8 bitů).
 */
template <int NUM_CHANNELS, int PIXEL_WIDTH = 8> 
struct color_pixel {
    /// Pole uchovávající hodnoty jednotlivých kanálů pixelu.
    ap_uint<PIXEL_WIDTH> channel[NUM_CHANNELS];

    /**
     * @brief Výchozí konstruktor (Inicializace nulou).
     * * HLS direktiva UNROLL zajistí, že se inicializace všech kanálů
     * provede paralelně v jednom hodinovém taktu.
     */
    color_pixel() {
        #pragma HLS INLINE
        for (int i = 0; i < NUM_CHANNELS; i++) {
            #pragma HLS UNROLL
            channel[i] = 0;
        }
    }

    /**
     * @brief Konstruktor pro rozbalení z hardwarového formátu (široký ap_uint).
     * * Přijme datové slovo (např. 24bit pro RGB) a pomocí bitového řezu (range selection)
     * ho paralelizovaně rozseká do jednotlivých kanálů.
     * * @param packed_data Zkomprimovaná data pixelu z AXI-Streamu.
     */
    color_pixel(ap_uint<NUM_CHANNELS * PIXEL_WIDTH> packed_data) {
        #pragma HLS INLINE
        for (int i = 0; i < NUM_CHANNELS; i++) {
            #pragma HLS UNROLL
            // Extrakce bitů: např. pro 8bit kanály: i=0 -> bity 7:0, i=1 -> bity 15:8
            channel[i] = packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH);
        }
    }

    /**
     * @brief Konstruktor pro inicializaci ze standardního softwarového typu.
     * * Slouží primárně pro testbench a interakci s CPU (např. zadávání barev v HEX formátu).
     * Převede `unsigned int` na `ap_uint` a následně rozbalí.
     * * @param cpu_data Hodnota pixelu z C++ (např. 0xFFFFFF pro bílou).
     */
    color_pixel(unsigned int cpu_data) {
        #pragma HLS INLINE
        ap_uint<NUM_CHANNELS * PIXEL_WIDTH> packed_data = cpu_data;
        for (int i = 0; i < NUM_CHANNELS; i++) {
            #pragma HLS UNROLL
            channel[i] = packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH);
        }
    }

    /**
     * @brief Konverzní operátor na ap_uint (Zabalení pro AXI-Stream / HW).
     * * Umožňuje přímé přiřazení struktury do AXI-Stream TDATA.
     * Poskládá jednotlivé kanály vedle sebe do širokého vektoru.
     * * @return Zkomprimovaná hodnota pixelu pro HW sběrnici.
     */
    operator ap_uint<NUM_CHANNELS * PIXEL_WIDTH>() const {
        #pragma HLS INLINE
        ap_uint<NUM_CHANNELS * PIXEL_WIDTH> packed_data = 0;
        for (int i = 0; i < NUM_CHANNELS; i++) {
            #pragma HLS UNROLL
            // Uložení kanálu na příslušnou bitovou pozici
            packed_data((i + 1) * PIXEL_WIDTH - 1, i * PIXEL_WIDTH) = channel[i];
        }
        return packed_data;
    }

    /**
     * @brief Konverzní operátor na standardní unsigned int (Pro CPU / Testbench).
     * * @return Klasický C++ celočíselný datový typ reprezentující pixel.
     */
    operator unsigned int() const {
        #pragma HLS INLINE
        ap_uint<NUM_CHANNELS * PIXEL_WIDTH> packed = *this;
        return static_cast<unsigned int>(packed);
    }
};

// ============================================================================
// KONSTANTY PRO KONVERZI BAREVNÝCH PROSTORŮ
// ============================================================================

/**
 * Koeficienty pro Rec.601 - SD Video
 * Y  =  0.299*R + 0.587*G + 0.114*B
 * Cb = -0.169*R - 0.331*G + 0.5*B + 128
 * Cr =  0.5*R - 0.419*G - 0.081*B + 128
 */
const ap_int<16> rec601_coeffs[3][3] = {
    {77, 150, 29},   // Výpočet Y
    {-43, -85, 128}, // Výpočet Cb (U)
    {128, -107, -21} // Výpočet Cr (V)
};
const ap_int<16> rec601_offsets[3] = {0, 128, 128};

/**
 * Koeficienty pro Rec.709 - HD Video
 * Y  =  0.2126*R + 0.7152*G + 0.0722*B
 * Cb = -0.114*R - 0.385*G + 0.5*B + 128
 * Cr =  0.5*R - 0.454*G - 0.046*B + 128
 */
const ap_int<16> rec709_coeffs[3][3] = {
    {54, 183, 19},   // Výpočet Y
    {-43, -85, 128}, // Výpočet Cb (U)
    {128, -107, -21} // Výpočet Cr (V)
};
const ap_int<16> rec709_offsets[3] = {0, 128, 128};

/**
 * Koeficienty pro Rec.2020 - 4K Video
 * Y  =  0.2126*R + 0.7152*G + 0.0722*B
 * Cb = -0.114*R - 0.385*G + 0.5*B + 128
 * Cr =  0.5*R - 0.454*G - 0.046*B + 128
 */
const ap_int<16> rec2020_coeffs[3][3] = {
    {63, 173, 20},   // Výpočet Y
    {-43, -85, 128}, // Výpočet Cb (U)
    {128, -107, -21} // Výpočet Cr (V)
};
const ap_int<16> rec2020_offsets[3] = {0, 128, 128};

// ============================================================================
// KONKRÉTNÍ DATOVÉ TYPY PRO AXI-STREAM (Moderní C++ Using)
// ============================================================================

// Základní definice struktury pixelů
using gray_pixel  = color_pixel<1, 8>;
using rgb_pixel   = color_pixel<3, 8>;
using ycbcr_pixel = color_pixel<3, 8>;
using hsv_pixel   = color_pixel<3, 8>;
using rgba_pixel  = color_pixel<4, 8>;
using cmyk_pixel  = color_pixel<4, 8>;
using rgb10_pixel  = color_pixel<3, 10>;

// Plnohodnotné AXI-Stream struktury obsahující data i řídicí signály (TUSER, TLAST)
using axis_gray  = axi_stream_video<gray_pixel>;
using axis_rgb   = axi_stream_video<rgb_pixel>;
using axis_ycbcr = axi_stream_video<ycbcr_pixel>;
using axis_hsv   = axi_stream_video<hsv_pixel>;

#endif // HLS_VIDEO_TYPES_HPP