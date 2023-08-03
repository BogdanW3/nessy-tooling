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
// CREATED		"Thu Aug 03 18:17:39 2023"

module CD4(
	D3,
	D2,
	D1,
	D0,
	Q0,
	Q1,
	W
);


input wire	D3;
input wire	D2;
input wire	D1;
input wire	D0;
output wire	Q0;
output wire	Q1;
output wire	W;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_5;
wire	[0:0] SYNTHESIZED_WIRE_2;
wire	[0:0] SYNTHESIZED_WIRE_3;

assign	Q1 = SYNTHESIZED_WIRE_5;




CD2	b2v_inst(
	.D1(D3),
	.D0(D2),
	.W(SYNTHESIZED_WIRE_5),
	.Q(SYNTHESIZED_WIRE_2));


CD2	b2v_inst1(
	.D1(D1),
	.D0(D0),
	.W(SYNTHESIZED_WIRE_0),
	.Q(SYNTHESIZED_WIRE_3));

assign	W = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_5;


MX2x1	b2v_inst3(
	.D1(SYNTHESIZED_WIRE_2),
	.D0(SYNTHESIZED_WIRE_3),
	.S0(SYNTHESIZED_WIRE_5),
	.Q(Q0));


endmodule
