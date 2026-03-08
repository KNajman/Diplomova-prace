#include "xvtc.h"

XVtc_Config XVtc_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,v-tc-6.2", /* compatible */
		0xa0000000, /* reg */
		0x405a, /* interrupts */
		0xffff /* interrupt-parent */
	},
	 {
		 NULL
	}
};