#include "platform.h"
#include "sleep.h"
#include "xaxivdma.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "xil_printf.h"

// include vlastních knihoven
#include "image_utils.h"
#include "vdma_utils.h"

#define HLS_CTRL_BASE_ADDR XPAR_HLS_PASSTHROUGH_0_BASEADDR
#define VDMA_BASE_ADDR XPAR_AXI_VDMA_0_BASEADDR

#define TEST_WIDTH 1280   // 1920
#define TEST_HEIGHT 720   // 1080
#define BYTES_PER_PIXEL 4 // 8x8x8x8 - RGBA
#define FRAME_SIZE (TEST_WIDTH * TEST_HEIGHT)
#define FRAME_SIZE_IN_BYTES (FRAME_SIZE * BYTES_PER_PIXEL) // 8x8x8x8 - RGBA
#define STRIDE (TEST_WIDTH * BYTES_PER_PIXEL) //  počet pixelů * počet bajtů na pixel

// počet snímků, které se mají přenést
#define NUM_FRAMES 3

u8 SrcFrames[NUM_FRAMES][FRAME_SIZE_IN_BYTES] __attribute__((aligned(64)));
u8 DstFrames[NUM_FRAMES][FRAME_SIZE_IN_BYTES] __attribute__((aligned(64)));

XAxiVdma VdmaInstance;

static void DumpVdmaStatusDecoded(const char *channelName, u32 sr) {
  xil_printf("[DBG] %s state: %s, %s\r\n", channelName,
             (sr & XAXIVDMA_SR_HALTED_MASK) ? "HALTED" : "RUNNING",
             (sr & XAXIVDMA_SR_IDLE_MASK) ? "IDLE" : "ACTIVE");

  if (sr & XAXIVDMA_SR_ERR_ALL_MASK) {
    xil_printf("[DBG] %s errors:", channelName);
    if (sr & XAXIVDMA_SR_ERR_INTERNAL_MASK)
      xil_printf(" INTERNAL");
    if (sr & XAXIVDMA_SR_ERR_SLAVE_MASK)
      xil_printf(" SLAVE");
    if (sr & XAXIVDMA_SR_ERR_DECODE_MASK)
      xil_printf(" DECODE");
    if (sr & XAXIVDMA_SR_ERR_FSZ_LESS_MASK)
      xil_printf(" FSZ_LESS");
    if (sr & XAXIVDMA_SR_ERR_LSZ_LESS_MASK)
      xil_printf(" LSZ_LESS");
    if (sr & XAXIVDMA_SR_ERR_SG_SLV_MASK)
      xil_printf(" SG_SLV");
    if (sr & XAXIVDMA_SR_ERR_SG_DEC_MASK)
      xil_printf(" SG_DEC");
    if (sr & XAXIVDMA_SR_ERR_FSZ_MORE_MASK)
      xil_printf(" FSZ_MORE");
    xil_printf("\r\n");
  }

  if (sr & XAXIVDMA_IXR_ALL_MASK) {
    xil_printf("[DBG] %s irq:", channelName);
    if (sr & XAXIVDMA_IXR_FRMCNT_MASK)
      xil_printf(" FRMCNT");
    if (sr & XAXIVDMA_IXR_DELAYCNT_MASK)
      xil_printf(" DELAY");
    if (sr & XAXIVDMA_IXR_ERROR_MASK)
      xil_printf(" ERROR");
    xil_printf("\r\n");
  }

  xil_printf("[DBG] %s counters: frame=%u delay=%u\r\n", channelName,
             (unsigned)((sr & XAXIVDMA_FRMCNT_MASK) >> XAXIVDMA_FRMCNT_SHIFT),
             (unsigned)((sr & XAXIVDMA_DELAY_MASK) >> XAXIVDMA_DELAY_SHIFT));
}

static void DumpVdmaRegs(UINTPTR vdmaBaseAddr) {
  u32 mm2sSr =
      XAxiVdma_ReadReg(vdmaBaseAddr, XAXIVDMA_TX_OFFSET + XAXIVDMA_SR_OFFSET);
  u32 s2mmSr =
      XAxiVdma_ReadReg(vdmaBaseAddr, XAXIVDMA_RX_OFFSET + XAXIVDMA_SR_OFFSET);

  xil_printf("[DBG] VDMA MM2S SR: 0x%08X\r\n", mm2sSr);
  DumpVdmaStatusDecoded("MM2S", mm2sSr);

  xil_printf("[DBG] VDMA S2MM SR: 0x%08X\r\n", s2mmSr);
  DumpVdmaStatusDecoded("S2MM", s2mmSr);
}

int main() {
  init_platform();

  xil_printf("\r\n==== ====\r\n");
  xil_printf("START: Multiple picture's pipeline test\r\n");
  xil_printf("20-07-2026\r\n");
  xil_printf("==== ====\r\n");

  int status = 0;

  XAxiVdma_Config *VdmaConfig = XAxiVdma_LookupConfig(VDMA_BASE_ADDR);
  if (!VdmaConfig) {
    xil_printf("[ERR] XAxiVdma_LookupConfig failed for base 0x%08X\r\n",
               VDMA_BASE_ADDR);
    return -1;
  }

  status = XAxiVdma_CfgInitialize(&VdmaInstance, VdmaConfig,
                                  VdmaConfig->BaseAddress);
  if (status != XST_SUCCESS) {
    xil_printf("[ERR] XAxiVdma_CfgInitialize failed, status=%d\r\n", status);
    return -1;
  }
  Xil_Out32(HLS_CTRL_BASE_ADDR + 0x10, TEST_HEIGHT);
  Xil_Out32(HLS_CTRL_BASE_ADDR + 0x18, TEST_WIDTH);

  // =========================================================================
  // KONFIGURACE VDMA
  // =========================================================================

  // konfigurace ZÁPISU, v tomto případě je to S2MM (Stream to Memory)
  XAxiVdma_DmaSetup WriteCfg = {0}; // S2MM (Zápis do DDR)
  WriteCfg.VertSizeInput = TEST_HEIGHT; // Počet řádků (vertikální rozlišení)
  WriteCfg.HoriSizeInput =
      STRIDE; // Počet bajtů na řádek (horizontální rozlišení v bajtech), v mém
              // případě 64 pixelů * 4 bajty/pixel = 256 bajtů
  WriteCfg.Stride = STRIDE; // Počet bajtů mezi začátky dvou po sobě jdoucích
                            // řádků v paměti (v mém případě 256 bajtů)
  WriteCfg.FrameDelay =
      0; // Počet snímků, které VDMA přeskočí před zahájením přenosu (0 = žádný)
  WriteCfg.EnableCircularBuf = 0; // Povoleno pro stream více snímků
  WriteCfg.EnableSync = 0; // Povoleno pro synchronizaci s externím signálem
                           // (např. VSync), nepoužívám
  WriteCfg.PointNum = 0;   //
  WriteCfg.EnableFrameCounter = 1;

  // konfigurace ČTENÍ, v tomto případě je to MM2S (Memory to Stream), a je
  // stejná jako zápis, jen se mění směr toku dat
  XAxiVdma_DmaSetup ReadCfg = {0}; // MM2S (Čtení z DDR)
  ReadCfg.VertSizeInput = TEST_HEIGHT;
  ReadCfg.HoriSizeInput = STRIDE;
  ReadCfg.Stride = STRIDE;
  ReadCfg.FrameDelay = 0;
  ReadCfg.EnableCircularBuf = 0;
  ReadCfg.EnableSync = 0;
  ReadCfg.PointNum = 0;
  ReadCfg.EnableFrameCounter = 1;

  xil_printf("[HW] Nastaveni VDMA zapisu (S2MM)...\r\n");
  status = XAxiVdma_DmaConfig(&VdmaInstance, XAXIVDMA_WRITE, &WriteCfg);
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: Nastaveni VDMA zapisu selhalo (status=%d) !!!\r\n",
               status);
    DumpVdmaRegs(VdmaConfig->BaseAddress);
    cleanup_platform();
    return -1;
  }

  xil_printf("[HW] Nastaveni VDMA cteni (MM2S)...\r\n");
  status = XAxiVdma_DmaConfig(&VdmaInstance, XAXIVDMA_READ, &ReadCfg);
  if (status != XST_SUCCESS) {
    xil_printf("!!! CHYBA: Nastaveni VDMA cteni selhalo (status=%d) !!!\r\n",
               status);
    DumpVdmaRegs(VdmaConfig->BaseAddress);
    cleanup_platform();
    return -1;
  }

  //==========================================================================
  // SEKVENČNÍ ZPRACOVÁNÍ SNÍMKŮ (1 snímek na jeden průchod VDMA/HLS)
  //==========================================================================
  for (int frame = 0; frame < NUM_FRAMES; frame++) {
    int FrameOffset = frame * 32;
    xil_printf("\r\n[FRAME %d/%d] Preparing single-frame transfer...\r\n",
               frame + 1, NUM_FRAMES);
    xil_printf("Generating test pattern for frame %d with offset %d...\r\n",
               frame, FrameOffset);

    IMG_ClearBuffer(DstFrames[frame], TEST_WIDTH, TEST_HEIGHT, BYTES_PER_PIXEL,
                    0xAA);
    IMG_ClearBuffer(SrcFrames[frame], TEST_WIDTH, TEST_HEIGHT, BYTES_PER_PIXEL,
                    0x00);
    IMG_GenerateTestPattern(SrcFrames[frame], TEST_WIDTH, TEST_HEIGHT,
                            BYTES_PER_PIXEL, FrameOffset);

    Xil_DCacheFlushRange((UINTPTR)SrcFrames[frame], FRAME_SIZE_IN_BYTES);
    Xil_DCacheFlushRange((UINTPTR)DstFrames[frame], FRAME_SIZE_IN_BYTES);

    XAxiVdma_FrameCounter FrameCountCfg = {0};
    FrameCountCfg.ReadFrameCount = 1;
    FrameCountCfg.WriteFrameCount = 1;
    FrameCountCfg.ReadDelayTimerCount = 0;
    FrameCountCfg.WriteDelayTimerCount = 0;

    status = XAxiVdma_SetFrameCounter(&VdmaInstance, &FrameCountCfg);
    if (status != XST_SUCCESS) {
      xil_printf("[ERR] XAxiVdma_SetFrameCounter failed for frame %d, status=%d\r\n",
                 frame, status);
      DumpVdmaRegs(VdmaConfig->BaseAddress);
      cleanup_platform();
      return -1;
    }

    UINTPTR ReadAddrList[1] = {(UINTPTR)SrcFrames[frame]};
    UINTPTR WriteAddrList[1] = {(UINTPTR)DstFrames[frame]};

    status =
        XAxiVdma_DmaSetBufferAddr(&VdmaInstance, XAXIVDMA_READ, ReadAddrList);
    if (status != XST_SUCCESS) {
      xil_printf("[ERR] XAxiVdma_DmaSetBufferAddr READ failed for frame %d, status=%d\r\n",
                 frame, status);
      DumpVdmaRegs(VdmaConfig->BaseAddress);
      cleanup_platform();
      return -1;
    }

    status =
        XAxiVdma_DmaSetBufferAddr(&VdmaInstance, XAXIVDMA_WRITE, WriteAddrList);
    if (status != XST_SUCCESS) {
      xil_printf("[ERR] XAxiVdma_DmaSetBufferAddr WRITE failed for frame %d, status=%d\r\n",
                 frame, status);
      DumpVdmaRegs(VdmaConfig->BaseAddress);
      cleanup_platform();
      return -1;
    }

    Xil_Out32(HLS_CTRL_BASE_ADDR + 0x00, 0x01);

    status = XAxiVdma_DmaStart(&VdmaInstance, XAXIVDMA_WRITE);
    if (status != XST_SUCCESS) {
      xil_printf("[ERR] XAxiVdma_DmaStart WRITE failed for frame %d, status=%d\r\n",
                 frame, status);
      DumpVdmaRegs(VdmaConfig->BaseAddress);
      cleanup_platform();
      return -1;
    }

    status = XAxiVdma_DmaStart(&VdmaInstance, XAXIVDMA_READ);
    if (status != XST_SUCCESS) {
      xil_printf("[ERR] XAxiVdma_DmaStart READ failed for frame %d, status=%d\r\n",
                 frame, status);
      DumpVdmaRegs(VdmaConfig->BaseAddress);
      cleanup_platform();
      return -1;
    }

    int timeout = 100000;
    while (timeout > 0) {
      if (XAxiVdma_IsBusy(&VdmaInstance, XAXIVDMA_WRITE) == 0 &&
          XAxiVdma_IsBusy(&VdmaInstance, XAXIVDMA_READ) == 0) {
        break;
      }
      usleep(1);
      timeout--;
    }
    if (timeout <= 0) {
      xil_printf("[ERR] Timeout waiting for frame %d completion\r\n", frame);
      DumpVdmaRegs(VdmaConfig->BaseAddress);
      cleanup_platform();
      return -1;
    }

    Xil_DCacheInvalidateRange((UINTPTR)DstFrames[frame], FRAME_SIZE_IN_BYTES);

    for (int i = 0; i < FRAME_SIZE_IN_BYTES; i++) {
      if (DstFrames[frame][i] != SrcFrames[frame][i]) {
        xil_printf(
            "[ERR] Frame %d mismatch at byte %d (src=0x%02X dst=0x%02X)\r\n",
            frame, i, SrcFrames[frame][i], DstFrames[frame][i]);
        DumpVdmaRegs(VdmaConfig->BaseAddress);
        cleanup_platform();
        return -2;
      }
    }

    xil_printf("[FRAME %d/%d] OK\r\n", frame + 1, NUM_FRAMES);
  }

  xil_printf("\r\n[OK] All %d sequential single-frame transfers passed.\r\n",
             NUM_FRAMES);
  cleanup_platform();
  return 0;
}