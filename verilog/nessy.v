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
// CREATED		"Thu Aug 24 10:29:31 2023"

module nessy(
	CLK,
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
	PS2_DATA,
	PS2_CLK,
	LED,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ,
	VGA_B,
	VGA_G,
	VGA_R
);


input wire	CLK;
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
inout wire	PS2_DATA;
inout wire	PS2_CLK;
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
wire	GAMEPAD_CS;
wire	[7:0] GAMEPAD_DOUT;
wire	GPU_CS;
wire	[7:0] GPU_DOUT;
wire	GPU_nCS;
wire	H;
wire	L;
wire	nNMI;
wire	OUT0;
wire	RAM_CS;
wire	RAM_nCS;
wire	RD;
wire	WR;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[0:7] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_3 = 0;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_1 = {L,H,L,L,L,L,L,L,L,L,L,H,L,H,H,L};
assign	GDFX_TEMP_SIGNAL_0 = {A[15:1],L};


gpu	b2v_inst(
	.nCS(GPU_nCS),
	.RD(RD),
	.WR(WR),
	.CLK(CLK),
	.A(A[2:0]),
	.DIN(DIN),
	.SDRAM_DQ(SDRAM_DQ),
	.nNMI(nNMI),
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


CMP16	b2v_inst17(
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.E(GAMEPAD_CS)
	);


MX4x8	b2v_inst18(
	.S1(SYNTHESIZED_WIRE_1),
	.S0(SYNTHESIZED_WIRE_2),
	.D0_(SYNTHESIZED_WIRE_3),
	.D1_(GPU_DOUT),
	.D2_(GAMEPAD_DOUT),
	
	.Q_(SYNTHESIZED_WIRE_4));


MX2x8	b2v_inst19(
	.S0(RD),
	.D0_(CPU_DOUT),
	.D1_(SYNTHESIZED_WIRE_4),
	.Q(DIN));




CD4	b2v_inst3(
	
	.D2(GAMEPAD_CS),
	.D1(GPU_CS),
	.D0(RAM_CS),
	.Q1(SYNTHESIZED_WIRE_1),
	.Q0(SYNTHESIZED_WIRE_2)
	);

assign	RAM_CS =  ~RAM_nCS;


kb_controller_set3_wip	b2v_inst5(
	.CLK(CLK),
	.INTA(SYNTHESIZED_WIRE_5),
	.PS2_CLK(PS2_CLK),
	.PS2_DATA(PS2_DATA),
	.INTR(SYNTHESIZED_WIRE_6),
	
	
	.Q(SYNTHESIZED_WIRE_7));


kb_gamepad_bridge_set3_wip	b2v_inst6(
	.KBINTR(SYNTHESIZED_WIRE_6),
	.CS(GAMEPAD_CS),
	.RD(RD),
	.CLK(CLK),
	.OUT0(OUT0),
	.ADDR(A[0]),
	.KEY(SYNTHESIZED_WIRE_7),
	.KBINTA(SYNTHESIZED_WIRE_5),
	.DATA(GAMEPAD_DOUT));

assign	GPU_CS =  ~GPU_nCS;

assign	RAM_nCS = A[14] | A[13] | A[15];


cpu	b2v_inst9(
	.CLK(CLK),
	.nNMI(nNMI),
	.DIN(DIN),
	.RD(RD),
	.WR(WR),
	.OUT0(OUT0),
	.A(A),
	.DOUT(CPU_DOUT));

assign	LED = DIN;
assign	H = 1;
assign	L = 0;

endmodule
