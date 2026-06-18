
/******************************************************************************
 * Vitis Bare-Metal testovací aplikace s DIAGNOSTIKOU ZAMRZNUTÍ
 ******************************************************************************/

#include "platform.h"
#include "sleep.h"
#include "xaxidma.h"
#include "xil_cache.h"
#include "xil_io.h" // Potřebné pro Xil_Out32 a Xil_In32
#include "xil_printf.h"
#include "xparameters.h"

#define DMA_BASE_ADDR XPAR_AXI_DMA_0_BASEADDR
// POZOR: Zkontroluj v Address Editoru ve Vivadu, že HLS blok dostal tuto
// adresu:
#define HLS_CTRL_BASE_ADDR XPAR_HLS_PASSTHROUGH_0_BASEADDR

#define TEST_PIXELS 1024
#define MAX_PKT_LEN (TEST_PIXELS * 4) // 4 bajty na pixel (32 bitů)

XAxiDma AxiDma;

u32 TxBuffer[TEST_PIXELS] __attribute__((aligned(64)));
u32 RxBuffer[TEST_PIXELS] __attribute__((aligned(64)));

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
      xil_printf("\r\n[ERR] DMA STALL (Probably missing signal TLAST or HLS component return null)!\r\n");
      xil_printf("MM2S SR: 0x%08X\r\n", mm2s_status);
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