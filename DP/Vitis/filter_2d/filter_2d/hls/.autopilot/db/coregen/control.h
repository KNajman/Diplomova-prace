// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (Read/TOW)
//         bit 1 - ap_ready (Read/TOW)
//         others - reserved
// 0x010 : Data signal of width
//         bit 12~0 - width[12:0] (Read/Write)
//         others   - reserved
// 0x014 : reserved
// 0x018 : Data signal of height
//         bit 12~0 - height[12:0] (Read/Write)
//         others   - reserved
// 0x01c : reserved
// 0x020 : Data signal of kernel_0_0
//         bit 7~0 - kernel_0_0[7:0] (Read/Write)
//         others  - reserved
// 0x024 : reserved
// 0x028 : Data signal of kernel_0_1
//         bit 7~0 - kernel_0_1[7:0] (Read/Write)
//         others  - reserved
// 0x02c : reserved
// 0x030 : Data signal of kernel_0_2
//         bit 7~0 - kernel_0_2[7:0] (Read/Write)
//         others  - reserved
// 0x034 : reserved
// 0x038 : Data signal of kernel_0_3
//         bit 7~0 - kernel_0_3[7:0] (Read/Write)
//         others  - reserved
// 0x03c : reserved
// 0x040 : Data signal of kernel_0_4
//         bit 7~0 - kernel_0_4[7:0] (Read/Write)
//         others  - reserved
// 0x044 : reserved
// 0x048 : Data signal of kernel_1_0
//         bit 7~0 - kernel_1_0[7:0] (Read/Write)
//         others  - reserved
// 0x04c : reserved
// 0x050 : Data signal of kernel_1_1
//         bit 7~0 - kernel_1_1[7:0] (Read/Write)
//         others  - reserved
// 0x054 : reserved
// 0x058 : Data signal of kernel_1_2
//         bit 7~0 - kernel_1_2[7:0] (Read/Write)
//         others  - reserved
// 0x05c : reserved
// 0x060 : Data signal of kernel_1_3
//         bit 7~0 - kernel_1_3[7:0] (Read/Write)
//         others  - reserved
// 0x064 : reserved
// 0x068 : Data signal of kernel_1_4
//         bit 7~0 - kernel_1_4[7:0] (Read/Write)
//         others  - reserved
// 0x06c : reserved
// 0x070 : Data signal of kernel_2_0
//         bit 7~0 - kernel_2_0[7:0] (Read/Write)
//         others  - reserved
// 0x074 : reserved
// 0x078 : Data signal of kernel_2_1
//         bit 7~0 - kernel_2_1[7:0] (Read/Write)
//         others  - reserved
// 0x07c : reserved
// 0x080 : Data signal of kernel_2_2
//         bit 7~0 - kernel_2_2[7:0] (Read/Write)
//         others  - reserved
// 0x084 : reserved
// 0x088 : Data signal of kernel_2_3
//         bit 7~0 - kernel_2_3[7:0] (Read/Write)
//         others  - reserved
// 0x08c : reserved
// 0x090 : Data signal of kernel_2_4
//         bit 7~0 - kernel_2_4[7:0] (Read/Write)
//         others  - reserved
// 0x094 : reserved
// 0x098 : Data signal of kernel_3_0
//         bit 7~0 - kernel_3_0[7:0] (Read/Write)
//         others  - reserved
// 0x09c : reserved
// 0x0a0 : Data signal of kernel_3_1
//         bit 7~0 - kernel_3_1[7:0] (Read/Write)
//         others  - reserved
// 0x0a4 : reserved
// 0x0a8 : Data signal of kernel_3_2
//         bit 7~0 - kernel_3_2[7:0] (Read/Write)
//         others  - reserved
// 0x0ac : reserved
// 0x0b0 : Data signal of kernel_3_3
//         bit 7~0 - kernel_3_3[7:0] (Read/Write)
//         others  - reserved
// 0x0b4 : reserved
// 0x0b8 : Data signal of kernel_3_4
//         bit 7~0 - kernel_3_4[7:0] (Read/Write)
//         others  - reserved
// 0x0bc : reserved
// 0x0c0 : Data signal of kernel_4_0
//         bit 7~0 - kernel_4_0[7:0] (Read/Write)
//         others  - reserved
// 0x0c4 : reserved
// 0x0c8 : Data signal of kernel_4_1
//         bit 7~0 - kernel_4_1[7:0] (Read/Write)
//         others  - reserved
// 0x0cc : reserved
// 0x0d0 : Data signal of kernel_4_2
//         bit 7~0 - kernel_4_2[7:0] (Read/Write)
//         others  - reserved
// 0x0d4 : reserved
// 0x0d8 : Data signal of kernel_4_3
//         bit 7~0 - kernel_4_3[7:0] (Read/Write)
//         others  - reserved
// 0x0dc : reserved
// 0x0e0 : Data signal of kernel_4_4
//         bit 7~0 - kernel_4_4[7:0] (Read/Write)
//         others  - reserved
// 0x0e4 : reserved
// 0x0e8 : Data signal of inv_divisor
//         bit 31~0 - inv_divisor[31:0] (Read/Write)
// 0x0ec : reserved
// 0x0f0 : Data signal of fraction_bits
//         bit 4~0 - fraction_bits[4:0] (Read/Write)
//         others  - reserved
// 0x0f4 : reserved
// 0x0f8 : Data signal of delta
//         bit 31~0 - delta[31:0] (Read/Write)
// 0x0fc : reserved
// 0x100 : Data signal of borderType
//         bit 0  - borderType[0] (Read/Write)
//         others - reserved
// 0x104 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL            0x000
#define CONTROL_ADDR_GIE                0x004
#define CONTROL_ADDR_IER                0x008
#define CONTROL_ADDR_ISR                0x00c
#define CONTROL_ADDR_WIDTH_DATA         0x010
#define CONTROL_BITS_WIDTH_DATA         13
#define CONTROL_ADDR_HEIGHT_DATA        0x018
#define CONTROL_BITS_HEIGHT_DATA        13
#define CONTROL_ADDR_KERNEL_0_0_DATA    0x020
#define CONTROL_BITS_KERNEL_0_0_DATA    8
#define CONTROL_ADDR_KERNEL_0_1_DATA    0x028
#define CONTROL_BITS_KERNEL_0_1_DATA    8
#define CONTROL_ADDR_KERNEL_0_2_DATA    0x030
#define CONTROL_BITS_KERNEL_0_2_DATA    8
#define CONTROL_ADDR_KERNEL_0_3_DATA    0x038
#define CONTROL_BITS_KERNEL_0_3_DATA    8
#define CONTROL_ADDR_KERNEL_0_4_DATA    0x040
#define CONTROL_BITS_KERNEL_0_4_DATA    8
#define CONTROL_ADDR_KERNEL_1_0_DATA    0x048
#define CONTROL_BITS_KERNEL_1_0_DATA    8
#define CONTROL_ADDR_KERNEL_1_1_DATA    0x050
#define CONTROL_BITS_KERNEL_1_1_DATA    8
#define CONTROL_ADDR_KERNEL_1_2_DATA    0x058
#define CONTROL_BITS_KERNEL_1_2_DATA    8
#define CONTROL_ADDR_KERNEL_1_3_DATA    0x060
#define CONTROL_BITS_KERNEL_1_3_DATA    8
#define CONTROL_ADDR_KERNEL_1_4_DATA    0x068
#define CONTROL_BITS_KERNEL_1_4_DATA    8
#define CONTROL_ADDR_KERNEL_2_0_DATA    0x070
#define CONTROL_BITS_KERNEL_2_0_DATA    8
#define CONTROL_ADDR_KERNEL_2_1_DATA    0x078
#define CONTROL_BITS_KERNEL_2_1_DATA    8
#define CONTROL_ADDR_KERNEL_2_2_DATA    0x080
#define CONTROL_BITS_KERNEL_2_2_DATA    8
#define CONTROL_ADDR_KERNEL_2_3_DATA    0x088
#define CONTROL_BITS_KERNEL_2_3_DATA    8
#define CONTROL_ADDR_KERNEL_2_4_DATA    0x090
#define CONTROL_BITS_KERNEL_2_4_DATA    8
#define CONTROL_ADDR_KERNEL_3_0_DATA    0x098
#define CONTROL_BITS_KERNEL_3_0_DATA    8
#define CONTROL_ADDR_KERNEL_3_1_DATA    0x0a0
#define CONTROL_BITS_KERNEL_3_1_DATA    8
#define CONTROL_ADDR_KERNEL_3_2_DATA    0x0a8
#define CONTROL_BITS_KERNEL_3_2_DATA    8
#define CONTROL_ADDR_KERNEL_3_3_DATA    0x0b0
#define CONTROL_BITS_KERNEL_3_3_DATA    8
#define CONTROL_ADDR_KERNEL_3_4_DATA    0x0b8
#define CONTROL_BITS_KERNEL_3_4_DATA    8
#define CONTROL_ADDR_KERNEL_4_0_DATA    0x0c0
#define CONTROL_BITS_KERNEL_4_0_DATA    8
#define CONTROL_ADDR_KERNEL_4_1_DATA    0x0c8
#define CONTROL_BITS_KERNEL_4_1_DATA    8
#define CONTROL_ADDR_KERNEL_4_2_DATA    0x0d0
#define CONTROL_BITS_KERNEL_4_2_DATA    8
#define CONTROL_ADDR_KERNEL_4_3_DATA    0x0d8
#define CONTROL_BITS_KERNEL_4_3_DATA    8
#define CONTROL_ADDR_KERNEL_4_4_DATA    0x0e0
#define CONTROL_BITS_KERNEL_4_4_DATA    8
#define CONTROL_ADDR_INV_DIVISOR_DATA   0x0e8
#define CONTROL_BITS_INV_DIVISOR_DATA   32
#define CONTROL_ADDR_FRACTION_BITS_DATA 0x0f0
#define CONTROL_BITS_FRACTION_BITS_DATA 5
#define CONTROL_ADDR_DELTA_DATA         0x0f8
#define CONTROL_BITS_DELTA_DATA         32
#define CONTROL_ADDR_BORDERTYPE_DATA    0x100
#define CONTROL_BITS_BORDERTYPE_DATA    1
