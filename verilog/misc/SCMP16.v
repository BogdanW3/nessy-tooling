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
// CREATED		"Thu Aug 24 10:29:30 2023"

module SCMP16(
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

wire	E_ALTERA_SYNTHESIZED;
wire	L_ALTERA_SYNTHESIZED;
wire	[15:0] Q;
wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_0 = 1;




ADD16	b2v_inst(
	.Cin(SYNTHESIZED_WIRE_0),
	.A(A),
	.B(SYNTHESIZED_WIRE_1),
	
	.Q(Q));


assign	SYNTHESIZED_WIRE_6 =  ~B[15];

assign	SYNTHESIZED_WIRE_7 =  ~Q[15];


CMP16	b2v_inst14(
	.A(A),
	.B(B),
	
	.E(E_ALTERA_SYNTHESIZED)
	);

assign	G = ~(E_ALTERA_SYNTHESIZED | L_ALTERA_SYNTHESIZED);

assign	L_ALTERA_SYNTHESIZED = Q[15] ^ SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_1 =  ~B;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_5 & B[15] & Q[15];

assign	SYNTHESIZED_WIRE_3 = A[15] & SYNTHESIZED_WIRE_6 & SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_5 =  ~A[15];

assign	E = E_ALTERA_SYNTHESIZED;
assign	L = L_ALTERA_SYNTHESIZED;

endmodule
