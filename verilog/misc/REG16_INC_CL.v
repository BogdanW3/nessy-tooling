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
// CREATED		"Thu Aug 03 19:39:54 2023"

module REG16_INC_CL(
	CLK,
	INC,
	CL,
	DOUT
);


input wire	CLK;
input wire	INC;
input wire	CL;
output wire	[15:0] DOUT;

wire	[15:0] DOUT_ALTERA_SYNTHESIZED;
wire	LOWMAX;
wire	SYNTHESIZED_WIRE_0;





REG8_INC_CL	b2v_inst(
	.CLK(CLK),
	.INC(INC),
	.CL(CL),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[7:0]));

assign	LOWMAX = DOUT_ALTERA_SYNTHESIZED[7] & DOUT_ALTERA_SYNTHESIZED[5] & DOUT_ALTERA_SYNTHESIZED[6] & DOUT_ALTERA_SYNTHESIZED[4] & DOUT_ALTERA_SYNTHESIZED[1] & DOUT_ALTERA_SYNTHESIZED[2] & DOUT_ALTERA_SYNTHESIZED[0] & DOUT_ALTERA_SYNTHESIZED[3];

assign	SYNTHESIZED_WIRE_0 = INC & LOWMAX;


REG8_INC_CL	b2v_inst3(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_0),
	.CL(CL),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[15:8]));

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
