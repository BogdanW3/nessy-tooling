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
// CREATED		"Thu Aug 03 15:47:26 2023"

module REG4_LD_CL(
	CLK,
	LD,
	CL,
	DIN,
	DOUT
);


input wire	CLK;
input wire	LD;
input wire	CL;
input wire	[3:0] DIN;
output wire	[3:0] DOUT;

wire	[3:0] DOUT_ALTERA_SYNTHESIZED;





REG2_LD_CL	b2v_inst(
	.CLK(CLK),
	.LD(LD),
	.CL(CL),
	.DIN(DIN[3:2]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[3:2]));


REG2_LD_CL	b2v_inst1(
	.CLK(CLK),
	.LD(LD),
	.CL(CL),
	.DIN(DIN[1:0]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[1:0]));

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
