/******************************************************************************
 * Vitis Bare-Metal testovací aplikace s DIAGNOSTIKOU ZAMRZNUTÍ
 ******************************************************************************/

#include "platform.h"
#include "sleep.h"
#include "xaxivdma.h"
#include "xil_cache.h"
#include "xil_io.h" // Potřebné pro Xil_Out32 a Xil_In32
#include "xil_printf.h"
#include "xparameters.h"
#include "xvidc.h"

// Base address of PASSTROUGH HLS blok
#define HLS_CTRL_BASE_ADDR XPAR_HLS_PASSTHROUGH_0_BASEADDR

// Base address of VDMA
#define VDMA_BASE_ADDR XPAR_AXI_VDMA_0_BASEADDR

/*
Definice pro video stream
*/
#define VIDEO_FORMAT XVIDC_CSF_MEM_RGBX8
#define TEST_WIDTH 64
#define TEST_HEIGHT 64
#define BYTES_PER_PIXEL 4
#define STRIDE_IN_BYTES (TEST_WIDTH * BYTES_PER_PIXEL)
#define FRAME_SIZE_MAX (STRIDE_IN_BYTES * TEST_HEIGHT)

// Zarovnání bufferů na 64 bajtů kvůli Cache pamětí na Zynq UltraScale+
u8 SrcFrame[FRAME_SIZE_MAX] __attribute__((aligned(64)));
u8 DstFrame[FRAME_SIZE_MAX] __attribute__((aligned(64)));

// Instance VDMA ovladače
XAxiVdma VdmaInstance;

int main() {
  init_platform();

  xil_printf("\r\n==================================================\r\n");
  xil_printf(" START: Zynq UltraScale+ Video Pipeline Test\r\n");
  xil_printf(" Konfigurace s 32-bit Stream a 1. Frame Bufferem\r\n");
  xil_printf("==================================================\r\n");

  xil_printf("[INFO] Inicializuji pamet a generuji testovaci obraz...\r\n");

  // Vyčistíme cílové paměťi
  for (int i = 0; i < FRAME_SIZE_MAX; i++) {
    DstFrame[i] = 0xAA; // jiná hodnota než nula
  }

  // Generování barevného vstupního obrazu (stejný vzor jako v testbenchi, s
  // ochranou proti přetečení)
  // u32 seed = 0xDEADBEEF;
  for (int r = 0; r < TEST_HEIGHT; r++) {
    for (int c = 0; c < TEST_WIDTH; c++) {
      int offset = (r * TEST_WIDTH + c) * BYTES_PER_PIXEL;
      // seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
      SrcFrame[offset + 0] = ((r * 10) + c + 5) & 0xFF;  // R
      SrcFrame[offset + 1] = ((r * 20) + c + 10) & 0xFF; // G
      SrcFrame[offset + 2] = ((r * 30) + c + 15) & 0xFF; // B
      SrcFrame[offset + 3] = 0x00; // X (Dummy bajt - vyplň do 32 bit)
    }
  }

  // Flush Cache
  Xil_DCacheFlushRange((UINTPTR)SrcFrame, FRAME_SIZE_MAX);
  Xil_DCacheFlushRange((UINTPTR)DstFrame, FRAME_SIZE_MAX);

  // Init VDMA
  xil_printf("[INFO] Inicializace VDMA architektury...\r\n");
  XAxiVdma_Config *VdmaConfig = XAxiVdma_LookupConfig(VDMA_BASE_ADDR);
  if (!VdmaConfig) {
    xil_printf("ERROR: VDMA config not found in xparameters.h!\r\n");
    cleanup_platform();
    return -1;
  }

  int status = XAxiVdma_CfgInitialize(&VdmaInstance, VdmaConfig,
                                      VdmaConfig->BaseAddress);
  if (status != XST_SUCCESS) {
    xil_printf("ERROR: VDMA init failed!\r\n");
    cleanup_platform();
    return -1;
  }

  // Config HLS passthrough
  xil_printf("[HW] Konfigurace HLS Passthrough IP...\r\n");
  Xil_Out32(HLS_CTRL_BASE_ADDR + 0x10, TEST_HEIGHT);
  Xil_Out32(HLS_CTRL_BASE_ADDR + 0x18, TEST_WIDTH);
  Xil_Out32(HLS_CTRL_BASE_ADDR + 0x00,
            0x81); // Bit 0 = Start, Bit 7 = Auto-Restart

  // Confing VDMA (Struktura XAxiVdma_DmaSetup)
  XAxiVdma_DmaSetup VdmaCfg;
  VdmaCfg.VertSizeInput = TEST_HEIGHT;
  VdmaCfg.HoriSizeInput = STRIDE_IN_BYTES; // POZOR na Šířku řádků, ta musí být
                                           // v BAJTECH (64 * 4 = 256)
  VdmaCfg.Stride = STRIDE_IN_BYTES; // Krok na další řádek v BAJTECH
  VdmaCfg.FrameDelay = 0;
  VdmaCfg.EnableCircularBuf = 1; // Povoleno pro plynulý nepřetržitý běh
  VdmaCfg.EnableSync =
      0; // V režimu 1 bufferu vypnuto (u 3 bufferů se zapíná Genlock)
  VdmaCfg.PointNum = 0;
  VdmaCfg.EnableFrameCounter =
      0; // 0 = Běží trvale bez zastavení (ideální pro test)
  //VdmaCfg.FrameStoreCnt = 1; // Odpovídá nastavení 1 ve Vivadu

  // Konfigurace zápisového kanálu (S2MM - z HLS do DDR)
  status = XAxiVdma_DmaConfig(&VdmaInstance, XAXIVDMA_WRITE, &VdmaCfg);
  // Konfigurace čtecího kanálu (MM2S - z DDR do HLS)
  status |= XAxiVdma_DmaConfig(&VdmaInstance, XAXIVDMA_READ, &VdmaCfg);
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: Nastaveni parametru VDMA selhalo !!!\r\n");
    cleanup_platform();
    return -1;
  }

  // 7. KROK: Práce s adresami (Pole ukazatelů na buffery)
  UINTPTR ReadAddrList[1] = {(UINTPTR)SrcFrame};
  UINTPTR WriteAddrList[1] = {(UINTPTR)DstFrame};

  status =
      XAxiVdma_DmaSetBufferAddr(&VdmaInstance, XAXIVDMA_READ, ReadAddrList);
  status |=
      XAxiVdma_DmaSetBufferAddr(&VdmaInstance, XAXIVDMA_WRITE, WriteAddrList);
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: Prirazeni adres do VDMA selhalo !!!\r\n");
    cleanup_platform();
    return -1;
  }

  // 8. KROK: Korektní spuštění (Vždy nejdříve zapnout KONZUMENTA, až pak
  // PRODUCENTA)
  xil_printf("[HW] Spoustim VDMA prenosy...\r\n");
  status = XAxiVdma_DmaStart(&VdmaInstance,
                             XAXIVDMA_WRITE); // S2MM nejdřív (čeká na stream)
  status |= XAxiVdma_DmaStart(&VdmaInstance,
                              XAXIVDMA_READ); // MM2S potom (začne tlačit data)
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: VDMA se nerozběhlo !!!\r\n");
    cleanup_platform();
    return -1;
  }

  // 9. KROK: Časová prodleva na přenesení snímků
  // Jelikož běžíme v continuous módu, VDMA ihned po zapnutí začne cyklit.
  // Snímek 64x64 proletí pipeline za zlomky milisekundy. Počkáme 10ms pro
  // absolutní jistotu.
  xil_printf("[WAIT] Pipeline bezi. Cekam na usazeni streamu dat...\r\n");
  usleep(10000);

  // 10. KROK: Invalidace cache paměti
  // Přinutíme procesor zapomenout starý obsah cache (kde bylo 0xAA) a načíst
  // čerstvá data, která tam VDMA zapsalo z DDR
  Xil_DCacheInvalidateRange((UINTPTR)DstFrame, FRAME_SIZE_MAX);

  // Vizuální verifikace prvních 16 pixelů šumu
  xil_printf("\r\n--- VIZUÁLNÍ DEBUG: Kontrola dat v DstFrame ---\r\n");
  for (int p = 0; p < 16; p++) {
    int offset = p * BYTES_PER_PIXEL;
    xil_printf("Pixel %02d | Vstup: %02X %02X %02X | Vystup: %02X %02X %02X", p,
               SrcFrame[offset], SrcFrame[offset + 1], SrcFrame[offset + 2],
               DstFrame[offset], DstFrame[offset + 1], DstFrame[offset + 2]);

    if (SrcFrame[offset] != DstFrame[offset] ||
        SrcFrame[offset + 1] != DstFrame[offset + 1] ||
        SrcFrame[offset + 2] != DstFrame[offset + 2]) {
      xil_printf("  <-- CHYBA (Zatím neprošlo)\r\n");
    } else {
      xil_printf("  -> OK\r\n");
    }
  }

  // Celková kontrola celého pole
  int ErrorCount = 0;
  for (int i = 0; i < TEST_WIDTH * TEST_HEIGHT; i++) {
    int offset = i * BYTES_PER_PIXEL;
    if (DstFrame[offset + 0] != SrcFrame[offset + 0] ||
        DstFrame[offset + 1] != SrcFrame[offset + 1] ||
        DstFrame[offset + 2] != SrcFrame[offset + 2]) {
      ErrorCount++;
    }
  }

  if (ErrorCount == 0) {
    xil_printf("\r\n>>> FINALNI VYSLEDEK: VSECHNY PIXELY OK (0 CHYB) <<<\r\n");
    xil_printf(">>> VDMA pipeline s tvym HLS jadrem plne funguje! <<<\r\n");
  } else {
    xil_printf("\r\n>>> FINALNI VYSLEDEK: Selshalo %d pixelu. <<<\r\n",
               ErrorCount);
  }
  xil_printf("==================================================\r\n");

  cleanup_platform();
  return 0; // Za tohle se modlím
}