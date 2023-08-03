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
// CREATED		"Thu Aug 03 15:47:28 2023"

module REG4_LD_SR(
	CLK,
	LD,
	SR,
	IR,
	D,
	S,
	Q
);


input wire	CLK;
input wire	LD;
input wire	SR;
input wire	IR;
input wire	[3:0] D;
output wire	S;
output wire	[3:0] Q;

wire	[3:0] Q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;





REG2_LD_SR	b2v_inst1(
	.CLK(CLK),
	.LD(LD),
	.SR(SR),
	.IR(IR),
	.D(D[3:2]),
	.S(SYNTHESIZED_WIRE_0),
	.Q(Q_ALTERA_SYNTHESIZED[3:2]));


REG2_LD_SR	b2v_inst2(
	.CLK(CLK),
	.LD(LD),
	.SR(SR),
	.IR(SYNTHESIZED_WIRE_0),
	.D(D[1:0]),
	
	.Q(Q_ALTERA_SYNTHESIZED[1:0]));

assign	S = Q_ALTERA_SYNTHESIZED[0];
assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
