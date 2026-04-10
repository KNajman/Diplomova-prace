/******************************************************************************
* Copyright (C) 2002 - 2021 Xilinx, Inc.  All rights reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/*****************************************************************************/
/**
*
* @file AXI_VIDEO_g.c
* @addtogroup AXI_VIDEO Overview
* @{
*
* The AXI_VIDEO_g.c file contains a configuration table that specifies the
* configuration of axi_video devices in the system.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -----------------------------------------------
* 1.00a rmm  02/04/02 First release
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "axi_video.h"
#include "xparameters.h"

/************************** Constant Definitions *****************************/


/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/


/************************** Variable Prototypes ******************************/

/**
 * This table contains configuration information for each axi_video device
 * in the system.
 */
AXI_VIDEO_Config AXI_VIDEO_ConfigTable[] = {
	{
#ifdef XPAR_AXI_VIDEO_NUM_INSTANCES
	 XPAR_AXI_VIDEO_0_DEVICE_ID,
	 XPAR_AXI_VIDEO_0_C_S00_AXI_BASEADDR,
	 XPAR_AXI_VIDEO_0_C_MAX_LINE_WIDTH,
	 XPAR_AXI_VIDEO_0_C_M00_AXI_DATA_WIDTH
#endif
	}
};
/** @} */
