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
// CREATED		"Thu Aug 03 21:15:10 2023"

module DC4(
	E,
	D0,
	D1,
	Q0,
	Q2,
	Q3,
	Q1
);


input wire	E;
input wire	D0;
input wire	D1;
output wire	Q0;
output wire	Q2;
output wire	Q3;
output wire	Q1;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





DC2	b2v_inst(
	.D0(D0),
	.E(SYNTHESIZED_WIRE_0),
	.Q1(Q3),
	.Q0(Q2));

assign	SYNTHESIZED_WIRE_0 = D1 & E;


DC2	b2v_inst5(
	.D0(D0),
	.E(SYNTHESIZED_WIRE_1),
	.Q1(Q1),
	.Q0(Q0));

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_2 & E;

assign	SYNTHESIZED_WIRE_2 =  ~D1;


endmodule
