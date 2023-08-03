// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Thu Aug 03 15:47:38 2023"

module nessy(
	CLK,
	PS2_CLK,
	PS2_DATA,
	SDRAM_CLK,
	SDRAM_CKE,
	nSDRAM_CS,
	nSDRAM_RAS,
	nSDRAM_CAS,
	nSDRAM_WE,
	SDRAM_UDQM,
	SDRAM_LDQM,
	VGA_VS,
	VGA_HS,
	LED,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ,
	VGA_B,
	VGA_G,
	VGA_R
);


input wire	CLK;
input wire	PS2_CLK;
input wire	PS2_DATA;
output wire	SDRAM_CLK;
output wire	SDRAM_CKE;
output wire	nSDRAM_CS;
output wire	nSDRAM_RAS;
output wire	nSDRAM_CAS;
output wire	nSDRAM_WE;
output wire	SDRAM_UDQM;
output wire	SDRAM_LDQM;
output wire	VGA_VS;
output wire	VGA_HS;
output wire	[7:0] LED;
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;
output wire	[3:0] VGA_B;
output wire	[3:0] VGA_G;
output wire	[3:0] VGA_R;

wire	[15:0] A;
wire	[7:0] D;
wire	H;
wire	L;
wire	OUT0;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;





gpu	b2v_inst(
	.CLK(CLK),
	.SDRAM_DQ(SDRAM_DQ),
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
	.SDRAM_A(SDRAM_A),
	.SDRAM_BA(SDRAM_BA),
	
	.VGA_B(VGA_B),
	.VGA_G(VGA_G),
	.VGA_R(VGA_R));




REG8_INC_CL	b2v_inst3(
	.CLK(CLK),
	.INC(H),
	.CL(L),
	.DOUT(LED));


kb_controller	b2v_inst4(
	.PS2_CLK(PS2_CLK),
	.PS2_DATA(PS2_DATA),
	.CLK(CLK),
	.INTA(SYNTHESIZED_WIRE_0),
	.INTR(SYNTHESIZED_WIRE_1),
	.Q(SYNTHESIZED_WIRE_2));


kb_gamepad_bridge	b2v_inst5(
	.CPU_OUT0(OUT0),
	.KBINTR(SYNTHESIZED_WIRE_1),
	.CLK(CLK),
	.A(A),
	.KEY(SYNTHESIZED_WIRE_2),
	.KBINTA(SYNTHESIZED_WIRE_0)
	);

assign	H = 1;
assign	L = 0;

endmodule
