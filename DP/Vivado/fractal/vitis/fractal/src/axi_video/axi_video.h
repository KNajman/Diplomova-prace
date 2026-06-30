#ifndef AXI_VIDEO_H
#define AXI_VIDEO_H

#include "xil_types.h"
#include "xil_io.h"

#define AXI_VIDEO_OFFSET_REG_CONTROL				0
#define AXI_VIDEO_OFFSET_REG_STREAM_BASEADDR_HIGH	4
#define AXI_VIDEO_OFFSET_REG_STREAM_BASEADDR_LOW	8
#define AXI_VIDEO_OFFSET_REG_FRAMESIZE				12
#define AXI_VIDEO_OFFSET_REG_VIDEO_H_COUNT			16
#define AXI_VIDEO_OFFSET_REG_VIDEO_H_ACTIVE			20
#define AXI_VIDEO_OFFSET_REG_VIDEO_H_FPORCH			24
#define AXI_VIDEO_OFFSET_REG_VIDEO_H_SYNC			28
#define AXI_VIDEO_OFFSET_REG_VIDEO_H_BPORCH			32
#define AXI_VIDEO_OFFSET_REG_VIDEO_V_COUNT			36
#define AXI_VIDEO_OFFSET_REG_VIDEO_V_ACTIVE			40
#define AXI_VIDEO_OFFSET_REG_VIDEO_V_FPORCH			44
#define AXI_VIDEO_OFFSET_REG_VIDEO_V_SYNC			48
#define AXI_VIDEO_OFFSET_REG_VIDEO_V_BPORCH			52
#define AXI_VIDEO_OFFSET_REG_FIFO_STATUS			56

#define AXI_VIDEO_BIT_REG_CONTROL_RESET           	0x00000001
#define AXI_VIDEO_BIT_REG_CONTROL_POLARITY_H_SYNC	0x00000002
#define AXI_VIDEO_BIT_REG_CONTROL_POLARITY_V_SYNC	0x00000004
#define AXI_VIDEO_BIT_REG_CONTROL_RUN				0x00000008
#define AXI_VIDEO_BIT_REG_CONTROL_VFSM_RESET		0x00000010
#define AXI_VIDEO_BIT_REG_CONTROL_VFSM_BGRA			0x00000020
#define AXI_VIDEO_BIT_REG_CONTROL_VFSM_ERROR		0x00010000
#define AXI_VIDEO_MASK_REG_CONTROL_VFSM_STATUS		0x00060000
#define AXI_VIDEO_SHIFT_REG_CONTROL_VFSM_STATUS		17

#define AXI_VIDEO_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

#define AXI_VIDEO_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

typedef struct {
	int HActive;
	int HFrontPorch;
	int HSync;
	int HBackPorch;
	int HPolarity;
	int VActive;
	int VFrontPorch;
	int VSync;
	int VBackPorch;
	int VPolarity;
} VideoTiming_t;

typedef struct {
	u16 DeviceId;		/**< Unique ID  of device */
	UINTPTR BaseAddress;	/**< Device base address */
	int MaxLineWidth;
	int AXIDataWidth;
} AXI_VIDEO_Config;

/**
 * The driver instance data. The user is required to allocate a
 * variable of this type for every AXI_PWM device in the system. A pointer
 * to a variable of this type is then passed to the driver API functions.
 */
typedef struct {
	UINTPTR BaseAddress;	/**< Device base address */
	u32 IsReady;		/**< Device is initialized and ready */
	int MaxLineWidth;
	int AXIDataWidth;
	int IsRunning;
} AXI_VIDEO;

int AXI_VIDEO_Initialize(AXI_VIDEO* InstancePtr, int DeviceId);

void AXI_VIDEO_Reset(AXI_VIDEO* InstancePtr);

void AXI_VIDEO_SetPolarityHSync(AXI_VIDEO* InstancePtr, int Polarity);
int AXI_VIDEO_GetPolarityHSync(AXI_VIDEO* InstancePtr);

void AXI_VIDEO_SetPolarityVSync(AXI_VIDEO* InstancePtr, int Polarity);
int AXI_VIDEO_GetPolarityVSync(AXI_VIDEO* InstancePtr);

void AXI_VIDEO_Start(AXI_VIDEO* InstancePtr);
void AXI_VIDEO_Stop(AXI_VIDEO* InstancePtr);

void AXI_VIDEO_SetVFSMReset(AXI_VIDEO* InstancePtr);
void AXI_VIDEO_ClearVFSMReset(AXI_VIDEO* InstancePtr);

void AXI_VIDEO_SetBGRAMode(AXI_VIDEO* InstancePtr, int BGRA);
int AXI_VIDEO_GetBGRAMode(AXI_VIDEO* InstancePtr);

int AXI_VIDEO_GetVFSMError(AXI_VIDEO* InstancePtr, u32* Status);

/* Timing & Streaming */
void AXI_VIDEO_SetFrameStartAddress(AXI_VIDEO* InstancePtr, u64 FrameAddress);
void AXI_VIDEO_SetFrameSize(AXI_VIDEO* InstancePtr, int ByteSize);
void AXI_VIDEO_SetTiming(AXI_VIDEO* InstancePtr, VideoTiming_t* Timing);
int AXI_VIDEO_GetFIFOStatus(AXI_VIDEO* InstancePtr);

extern VideoTiming_t VGA480p;
extern VideoTiming_t XGA768p;
extern VideoTiming_t VESA1024p;
extern VideoTiming_t FullHD60;
extern AXI_VIDEO_Config AXI_VIDEO_ConfigTable[];

#endif
