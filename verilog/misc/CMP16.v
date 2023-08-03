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
// CREATED		"Thu Aug  3 23:56:24 2023"

module CMP16(
	A,
	B,
	G,
	E,
	L
);


input wire	[15:0] A;
input wire	[15:0] B;
output wire	G;
output wire	E;
output wire	L;

wire	E_ALTERA_SYNTHESIZED0;
wire	E_ALTERA_SYNTHESIZED1;
wire	G_ALTERA_SYNTHESIZED0;
wire	G_ALTERA_SYNTHESIZED1;
wire	L_ALTERA_SYNTHESIZED0;
wire	L_ALTERA_SYNTHESIZED1;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;




assign	G = SYNTHESIZED_WIRE_0 | G_ALTERA_SYNTHESIZED1;

assign	SYNTHESIZED_WIRE_0 = E_ALTERA_SYNTHESIZED1 & G_ALTERA_SYNTHESIZED0;

assign	L = SYNTHESIZED_WIRE_1 | L_ALTERA_SYNTHESIZED1;

assign	SYNTHESIZED_WIRE_1 = L_ALTERA_SYNTHESIZED1 & G_ALTERA_SYNTHESIZED0;


CMP8	b2v_inst593(
	.A(A[7:0]),
	.B(B[7:0]),
	.G(G_ALTERA_SYNTHESIZED0),
	.E(E_ALTERA_SYNTHESIZED0)
	);

assign	E = E_ALTERA_SYNTHESIZED1 & E_ALTERA_SYNTHESIZED0;


CMP8	b2v_inst690(
	.A(A[15:8]),
	.B(B[15:8]),
	.G(G_ALTERA_SYNTHESIZED1),
	.E(E_ALTERA_SYNTHESIZED1),
	.L(L_ALTERA_SYNTHESIZED1));


endmodule
