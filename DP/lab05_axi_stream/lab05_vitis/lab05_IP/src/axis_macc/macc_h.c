#include "macc_h.h"

extern AXIS_MACC_Config AXIS_MACC_ConfigTable[];

AXIS_MACC_Config* AXIS_MACC_LookupConfig(int DeviceId) {
	AXIS_MACC_Config *CfgPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_AXIS_MACC_NUM_INSTANCES; Index++) {
		if (AXIS_MACC_ConfigTable[Index].DeviceId == DeviceId) {
			CfgPtr = &AXIS_MACC_ConfigTable[Index];
			break;
		}
	}

	return CfgPtr;
}

int AXIS_MACC_Initialize(AXIS_MACC* InstancePtr, int deviceID) {
	AXIS_MACC_Config* cfg = AXIS_MACC_LookupConfig(deviceID);
	if (cfg == NULL) {
		return XST_FAILURE;
	}
	InstancePtr->BaseAddress = cfg->BaseAddress;
	InstancePtr->IsReady = 1;
	return XST_SUCCESS;
}

/*
 * TASK 2 - implement these
 * use AXIS_MACC_mReadReg, AXIS_MACC_mWriteReg, offsets, bits and others defined in axis_macc.h or define them in macc_h.h
 */

void AXIS_MACC_Reset(AXIS_MACC* InstancePtr);
int AXIS_MACC_SetOperation(AXIS_MACC* InstancePtr, int OP);
int AXIS_MACC_GetFIFOCount(AXIS_MACC* InstancePtr, int FIFO);
