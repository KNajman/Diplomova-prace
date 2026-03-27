#include "xparameters.h"
#include "axis_macc.h"

AXIS_MACC_Config* AXIS_MACC_LookupConfig(int DeviceId);
int AXIS_MACC_Initialize(AXIS_MACC* InstancePtr, int DeviceId);
void AXIS_MACC_Reset(AXIS_MACC* InstancePtr);
int AXIS_MACC_SetOperation(AXIS_MACC* InstancePtr, int OP);
int AXIS_MACC_GetFIFOCount(AXIS_MACC* InstancePtr, int FIFO);
