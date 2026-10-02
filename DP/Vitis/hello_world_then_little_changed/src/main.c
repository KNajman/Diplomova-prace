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
#define STRIDE_IN_BYTES (TEST_WIDTH * BYTES_PER_PIXEL) // 64 * 4 = 256 bajtů
#define FRAME_SIZE_MAX (STRIDE_IN_BYTES * TEST_HEIGHT) // 64 * 64 * 4 = 16384 bajtů

// Zarovnání bufferů na 64 bajtů kvůli Cache pamětí na Zynq UltraScale+
u8 SrcFrame[FRAME_SIZE_MAX] __attribute__((aligned(64)));
u8 DstFrame[FRAME_SIZE_MAX] __attribute__((aligned(64)));

// Instance VDMA ovladače
XAxiVdma VdmaInstance;

int main() {
  init_platform();

  xil_printf("\r\n==== ====\r\n");
  xil_printf(" START: Zynq UltraScale+ Video Pipeline Test\r\n");
  xil_printf(" Konfigurace s 32-bit Stream a 1. Frame Bufferem\r\n");
  xil_printf("==== ====\r\n");

  xil_printf("[INFO] Inicializuji pamet a generuji testovaci obraz...\r\n");

  // xil_printf("[DEBUG] Fyzicka adresa SrcFrame: 0x%08X%08X\r\n",
  // (u32)((UINTPTR)SrcFrame >> 32), (u32)(UINTPTR)SrcFrame);
  // xil_printf("[DEBUG] Fyzicka adresa DstFrame: 0x%08X%08X\r\n",
  // (u32)((UINTPTR)DstFrame >> 32), (u32)(UINTPTR)DstFrame);

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


  // =========================================================================
  // KONFIGURACE VDMA
  // =========================================================================

  // konfigurace ZÁPISU, v tomto případě je to S2MM (Stream to Memory)
  XAxiVdma_DmaSetup WriteCfg = {0}; // S2MM (Zápis do DDR)
  WriteCfg.VertSizeInput = TEST_HEIGHT; // Počet řádků (vertikální rozlišení)
  WriteCfg.HoriSizeInput = STRIDE_IN_BYTES; // Počet bajtů na řádek (horizontální rozlišení v bajtech), v mém případě 64 pixelů * 4 bajty/pixel = 256 bajtů
  WriteCfg.Stride = STRIDE_IN_BYTES; // Počet bajtů mezi začátky dvou po sobě jdoucích řádků v paměti (v mém případě 256 bajtů)
  WriteCfg.FrameDelay = 0; // Počet snímků, které VDMA přeskočí před zahájením přenosu (0 = žádný)
  WriteCfg.EnableCircularBuf = 0; // Povoleno pro plynulý nepřetržitý běh
  // V režimu 1 bufferu vypnuto (u 3 bufferů se zapíná Genlock)
  WriteCfg.EnableSync = 0; // Povoleno pro synchronizaci s externím signálem (např. VSync), nepoužívám
  WriteCfg.PointNum = 0; //
  WriteCfg.EnableFrameCounter = 1;

  //konfigurace ČTENÍ, v tomto případě je to MM2S (Memory to Stream), a je stejná jako zápis, jen se mění směr toku dat 
  XAxiVdma_DmaSetup ReadCfg = {0};  // MM2S (Čtení z DDR)
  ReadCfg.VertSizeInput = TEST_HEIGHT;
  ReadCfg.HoriSizeInput = STRIDE_IN_BYTES;
  ReadCfg.Stride = STRIDE_IN_BYTES;
  ReadCfg.FrameDelay = 0;
  ReadCfg.EnableCircularBuf = 0;
  ReadCfg.EnableSync = 0;
  ReadCfg.PointNum = 0;
  ReadCfg.EnableFrameCounter = 1;

  xil_printf("[HW] Nastaveni VDMA zapisu (S2MM)...\r\n");
  status = XAxiVdma_DmaConfig(&VdmaInstance, XAXIVDMA_WRITE, &WriteCfg);
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: Nastaveni VDMA zapisu selhalo !!!\r\n");
    cleanup_platform();
    return -1;
  }

  xil_printf("[HW] Nastaveni VDMA cteni (MM2S)...\r\n");
  status = XAxiVdma_DmaConfig(&VdmaInstance, XAXIVDMA_READ, &ReadCfg);
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: Nastaveni VDMA cteni selhalo !!!\r\n");
    cleanup_platform();
    return -1;
  }


  //==========================================================================
  // KONFIGURACE POČÍTADLA SNÍMKŮ
  //==========================================================================

  XAxiVdma_FrameCounter FrameCountCfg;
  FrameCountCfg.ReadFrameCount = 1; // Čtecí kanál se zastaví po 1 snímku
  FrameCountCfg.WriteFrameCount = 1; // Zápisový kanál se zastaví po 1 snímku
  FrameCountCfg.ReadDelayTimerCount = 0; // Nepoužívám, protože EnableFrameCounter = 1
  FrameCountCfg.WriteDelayTimerCount = 0; // Nepoužívám, protože EnableFrameCounter = 1

  status = XAxiVdma_SetFrameCounter(&VdmaInstance, &FrameCountCfg);
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: Nastavení počítadla snímků selhalo !!!\r\n");
    cleanup_platform();
    return -1;
  }

  // PRÁCE S ADRESAMI (Přiřazení paměťových bufferů)
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

  // SPUŠTĚNÍ PŘENOSŮ
  xil_printf("[HW] Spoustim VDMA prenosy...\r\n");
  status = XAxiVdma_DmaStart(&VdmaInstance,
                             XAXIVDMA_WRITE); // S2MM nejdřív (čeká na stream)
  status |= XAxiVdma_DmaStart(&VdmaInstance,
                              XAXIVDMA_READ); // MM2S potom (začne tlačit data)
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: Start VDMA selhal!\r\n");
    cleanup_platform();
    return -1;
  }

  usleep(10000); // 10ms je na 64x64 absolutně dostatečný luxus

  // =========================================================================
  // AKTIVNÍ ČEKÁNÍ (POLLING SYSTÉM)
  // =========================================================================
  // Protože je EnableFrameCounter = 1, VDMA po odpracování jednoho snímku
  // automaticky shodí interní status "Busy".
  xil_printf("[WAIT] Cekam na dokonceni jednoho snimku...\r\n");

  // A TEĎ MÁ KONEČNĚ POLLING SMYSL
  // VDMA po přijetí Stop příkazu dokončí aktuálně kreslený snímek, zahlásí HALT
  // a IsBusy bude 0.
  xil_printf("[WAIT] Cekam na potvrzeni HALT stavu...\r\n");
  int timeout = 1000000;
  while (timeout > 0) {
    if (XAxiVdma_IsBusy(&VdmaInstance, XAXIVDMA_WRITE) == 0 &&
        XAxiVdma_IsBusy(&VdmaInstance, XAXIVDMA_READ) == 0) {
      break;
    }
    timeout--;
  }
  if (timeout <= 0) {
    // Pokud to skončí chybou nyní, znamená to, že se potrubí někde ucpalo,
    // např. HLS zničilo TLAST na AXI Streamu.
    xil_printf("\r\n!!! CHYBA: PIPELINE JE UCPANA (TIMEOUT) !!!\r\n");
    xil_printf("--- DIAGNOSTIKA VDMA STAVU ---\r\n");
    xil_printf("HLS CTRL_REG (0x00): 0x%08X\r\n",
               Xil_In32(HLS_CTRL_BASE_ADDR + 0x00));
    // Oprava: MM2S je TX (Transmit), S2MM je RX (Receive) dle specifikace
    // Xilinx
    xil_printf("VDMA MM2S SR (Status) : 0x%08X\r\n",
               XAxiVdma_ReadReg(VdmaConfig->BaseAddress,
                                XAXIVDMA_TX_OFFSET + XAXIVDMA_SR_OFFSET));
    xil_printf("VDMA S2MM SR (Status) : 0x%08X\r\n",
               XAxiVdma_ReadReg(VdmaConfig->BaseAddress,
                                XAXIVDMA_RX_OFFSET + XAXIVDMA_SR_OFFSET));
    cleanup_platform();
    return -1;
  }

  xil_printf("[OK] Hardware dokoncil prenos obrazu.\r\n");

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