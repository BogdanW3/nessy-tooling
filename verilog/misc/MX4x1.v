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
// CREATED		"Thu Aug 03 15:47:00 2023"

module MX4x1(
	S1,
	S0,
	D3,
	D2,
	D1,
	D0,
	Q
);


input wire	S1;
input wire	S0;
input wire	D3;
input wire	D2;
input wire	D1;
input wire	D0;
output wire	Q;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





MX2x1	b2v_inst(
	.D1(D3),
	.D0(D2),
	.S0(S0),
	.Q(SYNTHESIZED_WIRE_0));


MX2x1	b2v_inst1(
	.D1(D1),
	.D0(D0),
	.S0(S0),
	.Q(SYNTHESIZED_WIRE_1));


MX2x1	b2v_inst2(
	.D1(SYNTHESIZED_WIRE_0),
	.D0(SYNTHESIZED_WIRE_1),
	.S0(S1),
	.Q(Q));


endmodule
