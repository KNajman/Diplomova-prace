/******************************************************************************
* Copyright (C) 2002 - 2021 Xilinx, Inc.  All rights reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/*****************************************************************************/
/**
*
* @file AXIS_MACC_g.c
* @addtogroup AXIS_MACC Overview
* @{
*
* The AXIS_MACC_g.c file contains a configuration table that specifies the
* configuration of axis_macc devices in the system.
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

#include "axis_macc.h"
#include "xparameters.h"

/************************** Constant Definitions *****************************/


/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/


/************************** Variable Prototypes ******************************/

/**
 * This table contains configuration information for each axis_macc device
 * in the system.
 */
AXIS_MACC_Config AXIS_MACC_ConfigTable[] = {
	{
#ifdef XPAR_AXIS_MACC_NUM_INSTANCES
	 XPAR_AXIS_MACC_0_DEVICE_ID,
	 XPAR_AXIS_MACC_0_C_S00_AXI_BASEADDR
#endif
	}
};
/** @} */
