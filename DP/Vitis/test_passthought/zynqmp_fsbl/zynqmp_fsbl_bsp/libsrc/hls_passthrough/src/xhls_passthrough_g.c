#include "xhls_passthrough.h"

XHls_passthrough_Config XHls_passthrough_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,hls-passthrough-1.0", /* compatible */
		0xa0010000 /* reg */
	},
	 {
		 NULL
	}
};