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
// CREATED		"Sat Aug 12 22:54:10 2023"

module CMP1(
	A,
	B,
	G,
	E,
	L
);


input wire	A;
input wire	B;
output wire	G;
output wire	E;
output wire	L;

wire	G_ALTERA_SYNTHESIZED;
wire	L_ALTERA_SYNTHESIZED;
wire	nA;
wire	nB;




assign	G_ALTERA_SYNTHESIZED = A & nB;

assign	nB =  ~B;

assign	nA =  ~A;

assign	E = ~(L_ALTERA_SYNTHESIZED | G_ALTERA_SYNTHESIZED);

assign	L_ALTERA_SYNTHESIZED = nA & B;

assign	G = G_ALTERA_SYNTHESIZED;
assign	L = L_ALTERA_SYNTHESIZED;

endmodule
