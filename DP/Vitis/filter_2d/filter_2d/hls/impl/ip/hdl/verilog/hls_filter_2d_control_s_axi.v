// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
(* DowngradeIPIdentifiedWarnings="yes" *) module hls_filter_2d_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 9,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [12:0]                   width,
    output wire [12:0]                   height,
    output wire [7:0]                    kernel_0_0,
    output wire [7:0]                    kernel_0_1,
    output wire [7:0]                    kernel_0_2,
    output wire [7:0]                    kernel_0_3,
    output wire [7:0]                    kernel_0_4,
    output wire [7:0]                    kernel_1_0,
    output wire [7:0]                    kernel_1_1,
    output wire [7:0]                    kernel_1_2,
    output wire [7:0]                    kernel_1_3,
    output wire [7:0]                    kernel_1_4,
    output wire [7:0]                    kernel_2_0,
    output wire [7:0]                    kernel_2_1,
    output wire [7:0]                    kernel_2_2,
    output wire [7:0]                    kernel_2_3,
    output wire [7:0]                    kernel_2_4,
    output wire [7:0]                    kernel_3_0,
    output wire [7:0]                    kernel_3_1,
    output wire [7:0]                    kernel_3_2,
    output wire [7:0]                    kernel_3_3,
    output wire [7:0]                    kernel_3_4,
    output wire [7:0]                    kernel_4_0,
    output wire [7:0]                    kernel_4_1,
    output wire [7:0]                    kernel_4_2,
    output wire [7:0]                    kernel_4_3,
    output wire [7:0]                    kernel_4_4,
    output wire [31:0]                   inv_divisor,
    output wire [4:0]                    fraction_bits,
    output wire [31:0]                   delta,
    output wire [0:0]                    borderType,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_hs
//
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL              = 9'h000,
    ADDR_GIE                  = 9'h004,
    ADDR_IER                  = 9'h008,
    ADDR_ISR                  = 9'h00c,
    ADDR_WIDTH_DATA_0         = 9'h010,
    ADDR_WIDTH_CTRL           = 9'h014,
    ADDR_HEIGHT_DATA_0        = 9'h018,
    ADDR_HEIGHT_CTRL          = 9'h01c,
    ADDR_KERNEL_0_0_DATA_0    = 9'h020,
    ADDR_KERNEL_0_0_CTRL      = 9'h024,
    ADDR_KERNEL_0_1_DATA_0    = 9'h028,
    ADDR_KERNEL_0_1_CTRL      = 9'h02c,
    ADDR_KERNEL_0_2_DATA_0    = 9'h030,
    ADDR_KERNEL_0_2_CTRL      = 9'h034,
    ADDR_KERNEL_0_3_DATA_0    = 9'h038,
    ADDR_KERNEL_0_3_CTRL      = 9'h03c,
    ADDR_KERNEL_0_4_DATA_0    = 9'h040,
    ADDR_KERNEL_0_4_CTRL      = 9'h044,
    ADDR_KERNEL_1_0_DATA_0    = 9'h048,
    ADDR_KERNEL_1_0_CTRL      = 9'h04c,
    ADDR_KERNEL_1_1_DATA_0    = 9'h050,
    ADDR_KERNEL_1_1_CTRL      = 9'h054,
    ADDR_KERNEL_1_2_DATA_0    = 9'h058,
    ADDR_KERNEL_1_2_CTRL      = 9'h05c,
    ADDR_KERNEL_1_3_DATA_0    = 9'h060,
    ADDR_KERNEL_1_3_CTRL      = 9'h064,
    ADDR_KERNEL_1_4_DATA_0    = 9'h068,
    ADDR_KERNEL_1_4_CTRL      = 9'h06c,
    ADDR_KERNEL_2_0_DATA_0    = 9'h070,
    ADDR_KERNEL_2_0_CTRL      = 9'h074,
    ADDR_KERNEL_2_1_DATA_0    = 9'h078,
    ADDR_KERNEL_2_1_CTRL      = 9'h07c,
    ADDR_KERNEL_2_2_DATA_0    = 9'h080,
    ADDR_KERNEL_2_2_CTRL      = 9'h084,
    ADDR_KERNEL_2_3_DATA_0    = 9'h088,
    ADDR_KERNEL_2_3_CTRL      = 9'h08c,
    ADDR_KERNEL_2_4_DATA_0    = 9'h090,
    ADDR_KERNEL_2_4_CTRL      = 9'h094,
    ADDR_KERNEL_3_0_DATA_0    = 9'h098,
    ADDR_KERNEL_3_0_CTRL      = 9'h09c,
    ADDR_KERNEL_3_1_DATA_0    = 9'h0a0,
    ADDR_KERNEL_3_1_CTRL      = 9'h0a4,
    ADDR_KERNEL_3_2_DATA_0    = 9'h0a8,
    ADDR_KERNEL_3_2_CTRL      = 9'h0ac,
    ADDR_KERNEL_3_3_DATA_0    = 9'h0b0,
    ADDR_KERNEL_3_3_CTRL      = 9'h0b4,
    ADDR_KERNEL_3_4_DATA_0    = 9'h0b8,
    ADDR_KERNEL_3_4_CTRL      = 9'h0bc,
    ADDR_KERNEL_4_0_DATA_0    = 9'h0c0,
    ADDR_KERNEL_4_0_CTRL      = 9'h0c4,
    ADDR_KERNEL_4_1_DATA_0    = 9'h0c8,
    ADDR_KERNEL_4_1_CTRL      = 9'h0cc,
    ADDR_KERNEL_4_2_DATA_0    = 9'h0d0,
    ADDR_KERNEL_4_2_CTRL      = 9'h0d4,
    ADDR_KERNEL_4_3_DATA_0    = 9'h0d8,
    ADDR_KERNEL_4_3_CTRL      = 9'h0dc,
    ADDR_KERNEL_4_4_DATA_0    = 9'h0e0,
    ADDR_KERNEL_4_4_CTRL      = 9'h0e4,
    ADDR_INV_DIVISOR_DATA_0   = 9'h0e8,
    ADDR_INV_DIVISOR_CTRL     = 9'h0ec,
    ADDR_FRACTION_BITS_DATA_0 = 9'h0f0,
    ADDR_FRACTION_BITS_CTRL   = 9'h0f4,
    ADDR_DELTA_DATA_0         = 9'h0f8,
    ADDR_DELTA_CTRL           = 9'h0fc,
    ADDR_BORDERTYPE_DATA_0    = 9'h100,
    ADDR_BORDERTYPE_CTRL      = 9'h104,
    WRIDLE                    = 2'd0,
    WRDATA                    = 2'd1,
    WRRESP                    = 2'd2,
    WRRESET                   = 2'd3,
    RDIDLE                    = 2'd0,
    RDDATA                    = 2'd1,
    RDRESET                   = 2'd2,
    ADDR_BITS                = 9;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle = 1'b0;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [12:0]                   int_width = 'b0;
    reg  [12:0]                   int_height = 'b0;
    reg  [7:0]                    int_kernel_0_0 = 'b0;
    reg  [7:0]                    int_kernel_0_1 = 'b0;
    reg  [7:0]                    int_kernel_0_2 = 'b0;
    reg  [7:0]                    int_kernel_0_3 = 'b0;
    reg  [7:0]                    int_kernel_0_4 = 'b0;
    reg  [7:0]                    int_kernel_1_0 = 'b0;
    reg  [7:0]                    int_kernel_1_1 = 'b0;
    reg  [7:0]                    int_kernel_1_2 = 'b0;
    reg  [7:0]                    int_kernel_1_3 = 'b0;
    reg  [7:0]                    int_kernel_1_4 = 'b0;
    reg  [7:0]                    int_kernel_2_0 = 'b0;
    reg  [7:0]                    int_kernel_2_1 = 'b0;
    reg  [7:0]                    int_kernel_2_2 = 'b0;
    reg  [7:0]                    int_kernel_2_3 = 'b0;
    reg  [7:0]                    int_kernel_2_4 = 'b0;
    reg  [7:0]                    int_kernel_3_0 = 'b0;
    reg  [7:0]                    int_kernel_3_1 = 'b0;
    reg  [7:0]                    int_kernel_3_2 = 'b0;
    reg  [7:0]                    int_kernel_3_3 = 'b0;
    reg  [7:0]                    int_kernel_3_4 = 'b0;
    reg  [7:0]                    int_kernel_4_0 = 'b0;
    reg  [7:0]                    int_kernel_4_1 = 'b0;
    reg  [7:0]                    int_kernel_4_2 = 'b0;
    reg  [7:0]                    int_kernel_4_3 = 'b0;
    reg  [7:0]                    int_kernel_4_4 = 'b0;
    reg  [31:0]                   int_inv_divisor = 'b0;
    reg  [4:0]                    int_fraction_bits = 'b0;
    reg  [31:0]                   int_delta = 'b0;
    reg  [0:0]                    int_borderType = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BVALID  = (wstate == WRRESP);
assign BRESP   = 2'b00;  // OKAY
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY & BVALID)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= {AWADDR[ADDR_BITS-1:2], {2{1'b0}}};
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_WIDTH_DATA_0: begin
                    rdata <= int_width[12:0];
                end
                ADDR_HEIGHT_DATA_0: begin
                    rdata <= int_height[12:0];
                end
                ADDR_KERNEL_0_0_DATA_0: begin
                    rdata <= int_kernel_0_0[7:0];
                end
                ADDR_KERNEL_0_1_DATA_0: begin
                    rdata <= int_kernel_0_1[7:0];
                end
                ADDR_KERNEL_0_2_DATA_0: begin
                    rdata <= int_kernel_0_2[7:0];
                end
                ADDR_KERNEL_0_3_DATA_0: begin
                    rdata <= int_kernel_0_3[7:0];
                end
                ADDR_KERNEL_0_4_DATA_0: begin
                    rdata <= int_kernel_0_4[7:0];
                end
                ADDR_KERNEL_1_0_DATA_0: begin
                    rdata <= int_kernel_1_0[7:0];
                end
                ADDR_KERNEL_1_1_DATA_0: begin
                    rdata <= int_kernel_1_1[7:0];
                end
                ADDR_KERNEL_1_2_DATA_0: begin
                    rdata <= int_kernel_1_2[7:0];
                end
                ADDR_KERNEL_1_3_DATA_0: begin
                    rdata <= int_kernel_1_3[7:0];
                end
                ADDR_KERNEL_1_4_DATA_0: begin
                    rdata <= int_kernel_1_4[7:0];
                end
                ADDR_KERNEL_2_0_DATA_0: begin
                    rdata <= int_kernel_2_0[7:0];
                end
                ADDR_KERNEL_2_1_DATA_0: begin
                    rdata <= int_kernel_2_1[7:0];
                end
                ADDR_KERNEL_2_2_DATA_0: begin
                    rdata <= int_kernel_2_2[7:0];
                end
                ADDR_KERNEL_2_3_DATA_0: begin
                    rdata <= int_kernel_2_3[7:0];
                end
                ADDR_KERNEL_2_4_DATA_0: begin
                    rdata <= int_kernel_2_4[7:0];
                end
                ADDR_KERNEL_3_0_DATA_0: begin
                    rdata <= int_kernel_3_0[7:0];
                end
                ADDR_KERNEL_3_1_DATA_0: begin
                    rdata <= int_kernel_3_1[7:0];
                end
                ADDR_KERNEL_3_2_DATA_0: begin
                    rdata <= int_kernel_3_2[7:0];
                end
                ADDR_KERNEL_3_3_DATA_0: begin
                    rdata <= int_kernel_3_3[7:0];
                end
                ADDR_KERNEL_3_4_DATA_0: begin
                    rdata <= int_kernel_3_4[7:0];
                end
                ADDR_KERNEL_4_0_DATA_0: begin
                    rdata <= int_kernel_4_0[7:0];
                end
                ADDR_KERNEL_4_1_DATA_0: begin
                    rdata <= int_kernel_4_1[7:0];
                end
                ADDR_KERNEL_4_2_DATA_0: begin
                    rdata <= int_kernel_4_2[7:0];
                end
                ADDR_KERNEL_4_3_DATA_0: begin
                    rdata <= int_kernel_4_3[7:0];
                end
                ADDR_KERNEL_4_4_DATA_0: begin
                    rdata <= int_kernel_4_4[7:0];
                end
                ADDR_INV_DIVISOR_DATA_0: begin
                    rdata <= int_inv_divisor[31:0];
                end
                ADDR_FRACTION_BITS_DATA_0: begin
                    rdata <= int_fraction_bits[4:0];
                end
                ADDR_DELTA_DATA_0: begin
                    rdata <= int_delta[31:0];
                end
                ADDR_BORDERTYPE_DATA_0: begin
                    rdata <= int_borderType[0:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign width             = int_width;
assign height            = int_height;
assign kernel_0_0        = int_kernel_0_0;
assign kernel_0_1        = int_kernel_0_1;
assign kernel_0_2        = int_kernel_0_2;
assign kernel_0_3        = int_kernel_0_3;
assign kernel_0_4        = int_kernel_0_4;
assign kernel_1_0        = int_kernel_1_0;
assign kernel_1_1        = int_kernel_1_1;
assign kernel_1_2        = int_kernel_1_2;
assign kernel_1_3        = int_kernel_1_3;
assign kernel_1_4        = int_kernel_1_4;
assign kernel_2_0        = int_kernel_2_0;
assign kernel_2_1        = int_kernel_2_1;
assign kernel_2_2        = int_kernel_2_2;
assign kernel_2_3        = int_kernel_2_3;
assign kernel_2_4        = int_kernel_2_4;
assign kernel_3_0        = int_kernel_3_0;
assign kernel_3_1        = int_kernel_3_1;
assign kernel_3_2        = int_kernel_3_2;
assign kernel_3_3        = int_kernel_3_3;
assign kernel_3_4        = int_kernel_3_4;
assign kernel_4_0        = int_kernel_4_0;
assign kernel_4_1        = int_kernel_4_1;
assign kernel_4_2        = int_kernel_4_2;
assign kernel_4_3        = int_kernel_4_3;
assign kernel_4_4        = int_kernel_4_4;
assign inv_divisor       = int_inv_divisor;
assign fraction_bits     = int_fraction_bits;
assign delta             = int_delta;
assign borderType        = int_borderType;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <= WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_width[12:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_width[12:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WIDTH_DATA_0)
            int_width[12:0] <= (WDATA[31:0] & wmask) | (int_width[12:0] & ~wmask);
    end
end

// int_height[12:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_height[12:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_HEIGHT_DATA_0)
            int_height[12:0] <= (WDATA[31:0] & wmask) | (int_height[12:0] & ~wmask);
    end
end

// int_kernel_0_0[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_0_0[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_0_0_DATA_0)
            int_kernel_0_0[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_0_0[7:0] & ~wmask);
    end
end

// int_kernel_0_1[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_0_1[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_0_1_DATA_0)
            int_kernel_0_1[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_0_1[7:0] & ~wmask);
    end
end

// int_kernel_0_2[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_0_2[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_0_2_DATA_0)
            int_kernel_0_2[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_0_2[7:0] & ~wmask);
    end
end

// int_kernel_0_3[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_0_3[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_0_3_DATA_0)
            int_kernel_0_3[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_0_3[7:0] & ~wmask);
    end
end

// int_kernel_0_4[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_0_4[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_0_4_DATA_0)
            int_kernel_0_4[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_0_4[7:0] & ~wmask);
    end
end

// int_kernel_1_0[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_1_0[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_1_0_DATA_0)
            int_kernel_1_0[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_1_0[7:0] & ~wmask);
    end
end

// int_kernel_1_1[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_1_1[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_1_1_DATA_0)
            int_kernel_1_1[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_1_1[7:0] & ~wmask);
    end
end

// int_kernel_1_2[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_1_2[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_1_2_DATA_0)
            int_kernel_1_2[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_1_2[7:0] & ~wmask);
    end
end

// int_kernel_1_3[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_1_3[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_1_3_DATA_0)
            int_kernel_1_3[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_1_3[7:0] & ~wmask);
    end
end

// int_kernel_1_4[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_1_4[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_1_4_DATA_0)
            int_kernel_1_4[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_1_4[7:0] & ~wmask);
    end
end

// int_kernel_2_0[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_2_0[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_2_0_DATA_0)
            int_kernel_2_0[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_2_0[7:0] & ~wmask);
    end
end

// int_kernel_2_1[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_2_1[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_2_1_DATA_0)
            int_kernel_2_1[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_2_1[7:0] & ~wmask);
    end
end

// int_kernel_2_2[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_2_2[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_2_2_DATA_0)
            int_kernel_2_2[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_2_2[7:0] & ~wmask);
    end
end

// int_kernel_2_3[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_2_3[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_2_3_DATA_0)
            int_kernel_2_3[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_2_3[7:0] & ~wmask);
    end
end

// int_kernel_2_4[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_2_4[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_2_4_DATA_0)
            int_kernel_2_4[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_2_4[7:0] & ~wmask);
    end
end

// int_kernel_3_0[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_3_0[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_3_0_DATA_0)
            int_kernel_3_0[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_3_0[7:0] & ~wmask);
    end
end

// int_kernel_3_1[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_3_1[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_3_1_DATA_0)
            int_kernel_3_1[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_3_1[7:0] & ~wmask);
    end
end

// int_kernel_3_2[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_3_2[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_3_2_DATA_0)
            int_kernel_3_2[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_3_2[7:0] & ~wmask);
    end
end

// int_kernel_3_3[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_3_3[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_3_3_DATA_0)
            int_kernel_3_3[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_3_3[7:0] & ~wmask);
    end
end

// int_kernel_3_4[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_3_4[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_3_4_DATA_0)
            int_kernel_3_4[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_3_4[7:0] & ~wmask);
    end
end

// int_kernel_4_0[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_4_0[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_4_0_DATA_0)
            int_kernel_4_0[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_4_0[7:0] & ~wmask);
    end
end

// int_kernel_4_1[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_4_1[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_4_1_DATA_0)
            int_kernel_4_1[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_4_1[7:0] & ~wmask);
    end
end

// int_kernel_4_2[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_4_2[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_4_2_DATA_0)
            int_kernel_4_2[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_4_2[7:0] & ~wmask);
    end
end

// int_kernel_4_3[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_4_3[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_4_3_DATA_0)
            int_kernel_4_3[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_4_3[7:0] & ~wmask);
    end
end

// int_kernel_4_4[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_4_4[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KERNEL_4_4_DATA_0)
            int_kernel_4_4[7:0] <= (WDATA[31:0] & wmask) | (int_kernel_4_4[7:0] & ~wmask);
    end
end

// int_inv_divisor[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_inv_divisor[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_INV_DIVISOR_DATA_0)
            int_inv_divisor[31:0] <= (WDATA[31:0] & wmask) | (int_inv_divisor[31:0] & ~wmask);
    end
end

// int_fraction_bits[4:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_fraction_bits[4:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_FRACTION_BITS_DATA_0)
            int_fraction_bits[4:0] <= (WDATA[31:0] & wmask) | (int_fraction_bits[4:0] & ~wmask);
    end
end

// int_delta[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_delta[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DELTA_DATA_0)
            int_delta[31:0] <= (WDATA[31:0] & wmask) | (int_delta[31:0] & ~wmask);
    end
end

// int_borderType[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_borderType[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BORDERTYPE_DATA_0)
            int_borderType[0:0] <= (WDATA[31:0] & wmask) | (int_borderType[0:0] & ~wmask);
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr[0] & int_ier[0] & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
        if (int_gie & ~int_isr[1] & int_ier[1] & ap_ready)
            $display ("// Interrupt Monitor : interrupt for ap_ready detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule
