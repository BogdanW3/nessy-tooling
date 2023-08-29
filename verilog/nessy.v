// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"
// CREATED		"Tue Aug 29 21:47:49 2023"

module nessy(
	CLK,
	PS2_CLK1,
	PS2_DATA1,
	PS2_CLK0,
	PS2_DATA0,
	SDRAM_CKE,
	nSDRAM_CS,
	nSDRAM_RAS,
	nSDRAM_CAS,
	nSDRAM_WE,
	SDRAM_UDQM,
	SDRAM_LDQM,
	VGA_VS,
	VGA_HS,
	SDRAM_CLK,
	LED,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ,
	VGA_B,
	VGA_G,
	VGA_R
);


input wire	CLK;
input wire	PS2_CLK1;
input wire	PS2_DATA1;
input wire	PS2_CLK0;
input wire	PS2_DATA0;
output wire	SDRAM_CKE;
output wire	nSDRAM_CS;
output wire	nSDRAM_RAS;
output wire	nSDRAM_CAS;
output wire	nSDRAM_WE;
output wire	SDRAM_UDQM;
output wire	SDRAM_LDQM;
output wire	VGA_VS;
output wire	VGA_HS;
output wire	SDRAM_CLK;
output wire	[7:0] LED;
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;
output wire	[3:0] VGA_B;
output wire	[3:0] VGA_G;
output wire	[3:0] VGA_R;

wire	[15:0] A;
wire	[7:0] CPU_DOUT;
wire	[7:0] DIN;
wire	FC;
wire	GAMEPAD0_CS;
wire	[7:0] GAMEPAD0_DOUT;
wire	GAMEPAD0_FC;
wire	GAMEPAD1_CS;
wire	[7:0] GAMEPAD1_DOUT;
wire	GAMEPAD1_FC;
wire	GPU_CS;
wire	[7:0] GPU_DOUT;
wire	GPU_FC;
wire	GPU_nCS;
wire	H;
wire	L;
wire	nNMI;
wire	OUT0;
wire	RAM_CS;
wire	[7:0] RAM_DOUT;
wire	RAM_FC;
wire	RAM_nCS;
wire	RD;
wire	WR;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_13;
wire	[7:0] SYNTHESIZED_WIRE_14;

wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_0 = {A[15:1],L};
assign	GDFX_TEMP_SIGNAL_1 = {L,H,L,L,L,L,L,L,L,L,L,H,L,H,H,L};


gpu	b2v_inst(
	.nCS(GPU_nCS),
	.RD(RD),
	.WR(WR),
	.CLK(CLK),
	.A(A[2:0]),
	.DIN(DIN),
	.SDRAM_DQ(SDRAM_DQ),
	.nNMI(nNMI),
	.FC(GPU_FC),
	.SDRAM_CLK(SDRAM_CLK),
	.SDRAM_CKE(SDRAM_CKE),
	.nSDRAM_CS(nSDRAM_CS),
	.nSDRAM_RAS(nSDRAM_RAS),
	.nSDRAM_CAS(nSDRAM_CAS),
	.nSDRAM_WE(nSDRAM_WE),
	.SDRAM_UDQM(SDRAM_UDQM),
	.SDRAM_LDQM(SDRAM_LDQM),
	.VGA_VS(VGA_VS),
	.VGA_HS(VGA_HS),
	.DOUT(GPU_DOUT),
	.SDRAM_A(SDRAM_A),
	.SDRAM_BA(SDRAM_BA),
	
	.VGA_B(VGA_B),
	.VGA_G(VGA_G),
	.VGA_R(VGA_R));


assign	GPU_nCS = A[14] | SYNTHESIZED_WIRE_0 | A[15];

assign	SYNTHESIZED_WIRE_0 =  ~A[13];


mem_controller	b2v_inst13(
	.RD(RD),
	.WR(WR),
	.CS(RAM_CS),
	.CLK(CLK),
	.A(A[12:0]),
	.DIN(DIN),
	.FC(RAM_FC),
	.DOUT(RAM_DOUT));


kb_controller	b2v_inst14(
	.CLK(CLK),
	.INTA(SYNTHESIZED_WIRE_1),
	.PS2_CLK(PS2_CLK0),
	.PS2_DATA(PS2_DATA0),
	.INTR(SYNTHESIZED_WIRE_13),
	.Q(SYNTHESIZED_WIRE_14));


DC2	b2v_inst15(
	.D0(A[0]),
	.E(SYNTHESIZED_WIRE_2),
	.Q1(GAMEPAD1_CS),
	.Q0(GAMEPAD0_CS));


kb_gamepad_bridge	b2v_inst16(
	.KBINTR(SYNTHESIZED_WIRE_3),
	.CS(GAMEPAD1_CS),
	.RD(RD),
	.CLK(CLK),
	.OUT0(OUT0),
	.KEY(SYNTHESIZED_WIRE_4),
	.KBINTA(SYNTHESIZED_WIRE_9),
	.FC(GAMEPAD1_FC),
	.DATA(GAMEPAD1_DOUT));


CMP16	b2v_inst17(
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.E(SYNTHESIZED_WIRE_2)
	);


MX2x8	b2v_inst19(
	.S0(RD),
	.D0_(CPU_DOUT),
	.D1_(SYNTHESIZED_WIRE_5),
	.Q(DIN));



MX8x8	b2v_inst20(
	.S2(SYNTHESIZED_WIRE_15),
	.S1(SYNTHESIZED_WIRE_16),
	.S0(SYNTHESIZED_WIRE_17),
	.D0_(RAM_DOUT),
	.D1_(GPU_DOUT),
	.D2_(GAMEPAD0_DOUT),
	.D3_(GAMEPAD1_DOUT),
	
	
	
	
	.Q(SYNTHESIZED_WIRE_5));


kb_controller	b2v_inst21(
	.CLK(CLK),
	.INTA(SYNTHESIZED_WIRE_9),
	.PS2_CLK(PS2_CLK1),
	.PS2_DATA(PS2_DATA1),
	.INTR(SYNTHESIZED_WIRE_3),
	
	
	.Q(SYNTHESIZED_WIRE_4));


MX8x1	b2v_inst22(
	
	
	
	
	.D3(GAMEPAD1_FC),
	.D2(GAMEPAD0_FC),
	.D1(GPU_FC),
	.D0(RAM_FC),
	.S2(SYNTHESIZED_WIRE_15),
	.S1(SYNTHESIZED_WIRE_16),
	.S0(SYNTHESIZED_WIRE_17),
	.Q(FC));

assign	RAM_CS =  ~RAM_nCS;


CD8	b2v_inst5(
	
	
	
	
	.D3(GAMEPAD1_CS),
	.D2(GAMEPAD0_CS),
	.D1(GPU_CS),
	.D0(RAM_CS),
	.Q2(SYNTHESIZED_WIRE_15),
	.Q1(SYNTHESIZED_WIRE_16),
	.Q0(SYNTHESIZED_WIRE_17)
	);


kb_gamepad_bridge	b2v_inst6(
	.KBINTR(SYNTHESIZED_WIRE_13),
	.CS(GAMEPAD0_CS),
	.RD(RD),
	.CLK(CLK),
	.OUT0(OUT0),
	.KEY(SYNTHESIZED_WIRE_14),
	.KBINTA(SYNTHESIZED_WIRE_1),
	.FC(GAMEPAD0_FC),
	.DATA(GAMEPAD0_DOUT));

assign	GPU_CS =  ~GPU_nCS;

assign	RAM_nCS = A[14] | A[13] | A[15];


cpu	b2v_inst9(
	.CLK(CLK),
	.nNMI(nNMI),
	.FC(FC),
	.DIN(DIN),
	.RD(RD),
	.WR(WR),
	.OUT0(OUT0),
	.A(A),
	.DOUT(CPU_DOUT));

assign	LED = DIN;
assign	H = 1;
assign	L = 0;

initial begin
    if ($test$plusargs("trace") != 0) begin
        $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
        $dumpfile("logs/vlt_dump.vcd");
        $dumpvars();
    end
    $display("[%0t] Model running...\n", $time);
end
endmodule
