
/******************************************************************************
 * Vitis Bare-Metal testovací aplikace s DIAGNOSTIKOU ZAMRZNUTÍ
 ******************************************************************************/

#include "platform.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_io.h" // Potřebné pro Xil_Out32 a Xil_In32
#include "xil_printf.h"
#include "xparameters.h"
#include "xvidc.h"
//#include "xaxidma.h" v případě návratu k DMA

// Hlavičky pro drivery Video Frame Bufferů
#include "xv_frmbufrd.h"
#include "xv_frmbufwr.h"

// Base address of PASSTROUGH HLS blok
#define HLS_CTRL_BASE_ADDR XPAR_HLS_PASSTHROUGH_0_BASEADDR

// Base address of VFB_READ A VFB_WRITE
#define VFB_RD_DEVICE_ID XPAR_VFB_READ_BASEADDR
#define VFB_WR_DEVICE_ID XPAR_VFB_WRITE_BASEADDR

// Nastavení virtuálního "rozlišení" pro tento test (64 x 16 = 1024 pixelů)
// Pro plný obraz pak stačí změnit na 1920 a 1080.
#define VIDEO_WIDTH 16                           // max 1920
#define VIDEO_HEIGHT 6                          // max 1080
#define TEST_PIXELS (VIDEO_WIDTH * VIDEO_HEIGHT) // 64*36 = 2 304
#define BYTES_PER_PIXEL 3                        // 24 bitů (RGB) = 3 bajty
#define STRIDE (VIDEO_WIDTH * BYTES_PER_PIXEL)
#define FRAME_SIZE_MAX (TEST_PIXELS * BYTES_PER_PIXEL)

// Identifikátor formátu videa: 24 = XVIDC_CSF_MEM_RGBX8 / RGBA8
#define VIDEO_FORMAT XVIDC_CSF_MEM_RGBX8 //u16 RGBX8En;              /**< RGBX8      support */

// Instance driverů
XV_frmbufrd VfbRead;
XV_frmbufwr VfbWrite;

// Paměťové buffery v DDR zarovnané do bloků pro procesor
u8 SrcFrame[FRAME_SIZE_MAX] __attribute__((aligned(64)));
u8 DstFrame[TEST_PIXELS] __attribute__((aligned(64)));

int main() {
  init_platform();
  int Status;
  XV_frmbufrd_Config *RdConfig; //ini read driveru
  XV_frmbufwr_Config *WrConfig; //ini write driveru

  xil_printf("\r\n--- Start VFB -> HLS -> VFB Pipeline Test ---\r\n");
  xil_printf("14:51");
  // Inicializace VFB_READ
  RdConfig = XV_frmbufrd_LookupConfig(VFB_RD_DEVICE_ID);
  if (!RdConfig) {
    xil_printf("[ERR] VFB_READ LookupConfig failed\r\n");
    return XST_FAILURE;
  }
  Status = XV_frmbufrd_CfgInitialize(&VfbRead, RdConfig, RdConfig->BaseAddress);
  if (Status != XST_SUCCESS) {
    xil_printf("[ERR] VFB_READ CfgInitialize failed\r\n");
    return XST_FAILURE;
  }

  // Inicializace VFB_WRITE
  WrConfig = XV_frmbufwr_LookupConfig(VFB_WR_DEVICE_ID);
  if (!WrConfig) {
    xil_printf("[ERR] VFB_WRITE LookupConfig failed\r\n");
    return XST_FAILURE;
  }
  Status =
      XV_frmbufwr_CfgInitialize(&VfbWrite, WrConfig, WrConfig->BaseAddress);
  if (Status != XST_SUCCESS) {
    xil_printf("[ERR] VFB_WRITE CfgInitialize failed\r\n");
    return XST_FAILURE;
  }

  // ========================================================================
  // 2. PŘÍPRAVA TESTOVACÍCH DAT A CACHE
  // ========================================================================
  // Init buffers (Src = unikátní vzor, Dst = nuly)
  for (int i = 0; i < TEST_PIXELS; i++) {
    SrcFrame[i * 3 + 0] = (i % 255);         // R
    SrcFrame[i * 3 + 1] = ((i + 50) % 255);  // G
    SrcFrame[i * 3 + 2] = ((i + 100) % 255); // B

    DstFrame[i * 3 + 0] = 0x00;
    DstFrame[i * 3 + 1] = 0x00;
    DstFrame[i * 3 + 2] = 0x00;
  }

  // Provedeme flush cache, aby VFB četl z fyzické DDR aktuální data z CPU
  Xil_DCacheFlushRange((UINTPTR)SrcFrame, FRAME_SIZE_MAX);
  Xil_DCacheInvalidateRange((UINTPTR)DstFrame, FRAME_SIZE_MAX);

  // ========================================================================
  // 3. KONFIGURACE OBRAZOVÝCH PARAMETRŮ VFB
  // ========================================================================
  xil_printf("Configuring VFB resolution to %dx%d...\r\n", VIDEO_WIDTH,
             VIDEO_HEIGHT);

  // Konfigurace čtecího bloku
  XV_frmbufrd_Set_HwReg_width(&VfbRead, VIDEO_WIDTH);
  XV_frmbufrd_Set_HwReg_height(&VfbRead, VIDEO_HEIGHT);
  XV_frmbufrd_Set_HwReg_stride(&VfbRead, STRIDE);
  XV_frmbufrd_Set_HwReg_video_format(&VfbRead, VIDEO_FORMAT);
  XV_frmbufrd_Set_HwReg_frm_buffer_V(&VfbRead, (UINTPTR)SrcFrame);

  // Konfigurace zápisového bloku

  XV_frmbufwr_Set_HwReg_width(&VfbWrite, VIDEO_WIDTH);
  XV_frmbufwr_Set_HwReg_height(&VfbWrite, VIDEO_HEIGHT);
  XV_frmbufwr_Set_HwReg_stride(&VfbWrite, STRIDE);
  XV_frmbufwr_Set_HwReg_video_format(&VfbWrite, VIDEO_FORMAT);
  XV_frmbufwr_Set_HwReg_frm_buffer_V(&VfbWrite, (UINTPTR)DstFrame);

  // ========================================================================
  // 4. SPUŠTĚNÍ CELÉ PIPELINE (V PŘESNÉM POŘADÍ)
  // ========================================================================

  // A) Spuštění HLS bloku (musí běžet jako první, aby chytal data)
  xil_printf("Start HLS IP (0x81)...\r\n");
  Xil_Out32(HLS_CTRL_BASE_ADDR, 0x81); // auto-restart (0x80) + ap_start (0x01)

  // B) Spuštění VFB_WRITE (musí být připraven přijímat data z HLS)
  xil_printf("Start VFB WRITE...\r\n");
  XV_frmbufwr_Start(&VfbWrite);

  // C) Spuštění VFB_READ (začne sypat data do HLS)
  xil_printf("Starting VFB_READ...\r\n");
  XV_frmbufrd_Start(&VfbRead);

  // ========================================================================
  // 5. ČEKÁNÍ NA DOKONČENÍ SNÍMKU A KONTROLA (Polling Hardware Registrů)
  // ========================================================================
  xil_printf("Waiting for frame transfer to complete...\r\n");

  int timeout = 0;
  // VFB bloky zvednou příznak 'IsDone', jakmile přenesou nastavený počet pixelů
  while (!XV_frmbufwr_IsDone(&VfbWrite)) {
    usleep(10000);
    timeout++;

    if (timeout > 100) {
      xil_printf("\r\n[ERR] VFB STALL! HLS block might be trapped or missing "
                 "TLAST.\r\n");

      xil_printf("\r\n[DEBUG] Čtení stavových registrů po záseku:\r\n");

      // HLS Status (Offset 0x00)
      // Bit 0: ap_start, Bit 1: ap_done, Bit 2: ap_idle, Bit 3: ap_ready
      u32 hls_status = Xil_In32(HLS_CTRL_BASE_ADDR);
      xil_printf("HLS CTRL_REG (0x00):  0x%08X\r\n", hls_status);

      // VFB READ Status
      xil_printf("VFB_READ IsDone: %d\r\n", XV_frmbufrd_IsDone(&VfbRead));
      xil_printf("VFB_READ IsIdle: %d\r\n", XV_frmbufrd_IsIdle(&VfbRead));

      // VFB WRITE Status
      xil_printf("VFB_WRITE IsDone: %d\r\n", XV_frmbufwr_IsDone(&VfbWrite));
      xil_printf("VFB_WRITE IsIdle: %d\r\n", XV_frmbufwr_IsIdle(&VfbWrite));

      // Úklid až jako úplně poslední krok
      cleanup_platform();
      return XST_FAILURE;
    }
  }

  // ========================================================================
  // 6. KONTROLA DAT
  // ========================================================================
  xil_printf("Transfer done! Checking data...\r\n");

  // CPU si musí invalidovat cache, aby vidělo to, co VFB_WRITE zapsal do DDR
  Xil_DCacheInvalidateRange((UINTPTR)DstFrame, FRAME_SIZE_MAX);

  // Kontrola správnosti
  int ErrorCount = 0;
  for (int i = 0; i < FRAME_SIZE_MAX; i++) {
    if (DstFrame[i] != SrcFrame[i]) {
      if (ErrorCount < 10) {
        xil_printf("Error [%d]: Exp 0x%02X, Got 0x%02X\r\n", i, SrcFrame[i],
                   DstFrame[i]);
      }
      ErrorCount++;
    }
  }

  if (ErrorCount == 0)
    xil_printf("SUCCESS! Complete frame passed through HLS correctly!\r\n");
  else
    xil_printf("FAILED with %d errors.\r\n", ErrorCount);

  cleanup_platform();
  return XST_SUCCESS;
}

/*
int main() {
  init_platform();
  int Status;
  XAxiDma_Config *Config;

  xil_printf("\r\n--- Start HLS Passthrough Test ---\r\n");

  Config = XAxiDma_LookupConfig(DMA_BASE_ADDR);
  if (!Config) {
    xil_printf("[ERR] LookupConfig failed\r\n");
    return XST_FAILURE;
  }

  Status = XAxiDma_CfgInitialize(&AxiDma, Config);
  if (Status != XST_SUCCESS) {
    xil_printf("[ERR] CfgInitialize failed\r\n");
    return XST_FAILURE;
  }

  // Zakázání přerušení (používáme Polling)
  XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
  XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

  // Init buffers (Tx = unikátní vzor, Rx = nuly)
  for (int i = 0; i < TEST_PIXELS; i++) {
    TxBuffer[i] = 0xAABBCC00 + i;
    RxBuffer[i] = 0x00000000;
  }

  // Synchronizace Cache před spuštěním DMA
  Xil_DCacheFlushRange((UINTPTR)TxBuffer, MAX_PKT_LEN);
  Xil_DCacheInvalidateRange((UINTPTR)RxBuffer, MAX_PKT_LEN);

  // ========================================================================
  // ZAPNUTÍ HLS BLOKU (PŘES AXI-LITE)
  // ========================================================================
  xil_printf("Wake up HLS on addres 0x%08X...\r\n", HLS_CTRL_BASE_ADDR);

  // Zápis hodnoty 0x81 do Control registru (offset 0x00)
  // Bit 0 (0x01) = ap_start (Spusť se)
  // Bit 7 (0x80) = auto_restart (Až skončíš, běž hned znovu)
  Xil_Out32(HLS_CTRL_BASE_ADDR, 0x81);

  // Volitelně si přečteme stav, jestli to blok přijal (měl by vrátit něco jako
  // 0x81 nebo 0x83)
  u32 hls_status = Xil_In32(HLS_CTRL_BASE_ADDR);
  xil_printf("Status HLS bloku: 0x%02X\r\n", hls_status);

  usleep(50000);

  // ========================================================================
  // SPUŠTENÍ PŘENOSU PŘES DMA
  // ========================================================================
  xil_printf("Send %d to HLS PASSTHROUGH IP...\r\n", MAX_PKT_LEN);

  // 1. NEJPRVE PŘÍJEM (S2MM) - DMA se připraví chytat data z HLS
  Status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)RxBuffer, MAX_PKT_LEN,
                                  XAXIDMA_DEVICE_TO_DMA);
  if (Status != XST_SUCCESS)
    return XST_FAILURE;

  // 2. POTÉ ODESÍLÁNÍ (MM2S) - DMA začne sypat data do HLS
  Status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)TxBuffer, MAX_PKT_LEN,
                                  XAXIDMA_DMA_TO_DEVICE);
  if (Status != XST_SUCCESS)
    return XST_FAILURE;

  // Čekání na dokončení (Polling)
  int timeout = 0;
  while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE) ||
         XAxiDma_Busy(&AxiDma, XAXIDMA_DEVICE_TO_DMA)) {

    usleep(10000);
    timeout++;

    if (timeout > 100) {
      u32 mm2s_status = XAxiDma_ReadReg(AxiDma.RegBase,
                                        XAXIDMA_TX_OFFSET + XAXIDMA_SR_OFFSET);
      u32 s2mm_status = XAxiDma_ReadReg(AxiDma.RegBase,
                                        XAXIDMA_RX_OFFSET + XAXIDMA_SR_OFFSET);
      xil_printf("\r\n[ERR] DMA STALL (Probably missing signal TLAST or HLS
component return null)!\r\n"); xil_printf("MM2S SR: 0x%08X\r\n", mm2s_status);
      xil_printf("S2MM SR: 0x%08X\r\n", s2mm_status);
      cleanup_platform();
      return XST_FAILURE;
    }
  }

  xil_printf("Send done. Checking data...\r\n");

  // Invalidace Cache po příjmu
  Xil_DCacheInvalidateRange((UINTPTR)RxBuffer, MAX_PKT_LEN);

  // Kontrola správnosti
  int ErrorCount = 0;
  for (int i = 0; i < TEST_PIXELS; i++) {
    if (RxBuffer[i] != TxBuffer[i]) {
      xil_printf("Error [%d]: Exp 0x%08X, Got 0x%08X\r\n", i, TxBuffer[i],
                 RxBuffer[i]);
      ErrorCount++;
      if (ErrorCount >= 10)
        break;
    }
  }

  if (ErrorCount == 0)
    xil_printf("SUCCES data passed through!\r\n");
  else
    xil_printf("FAILED with %d errors.\r\n", ErrorCount);

  cleanup_platform();
  return XST_SUCCESS;
}
*/