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
// CREATED		"Thu Aug  3 23:56:21 2023"

module CD8(
	D7,
	D6,
	D5,
	D4,
	D3,
	D2,
	D1,
	D0,
	W,
	Q2,
	Q1,
	Q0
);


input wire	D7;
input wire	D6;
input wire	D5;
input wire	D4;
input wire	D3;
input wire	D2;
input wire	D1;
input wire	D0;
output wire	W;
output wire	Q2;
output wire	Q1;
output wire	Q0;

wire	[3:0] T;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_4;
wire	[1:0] SYNTHESIZED_WIRE_3;

assign	Q2 = SYNTHESIZED_WIRE_4;
assign	Q1 = SYNTHESIZED_WIRE_3[1];
assign	Q0 = SYNTHESIZED_WIRE_3[0];




CD4	b2v_inst(
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.Q1(T[1]),
	.Q0(T[0]),
	.W(SYNTHESIZED_WIRE_0));


CD4	b2v_inst1(
	.D3(D7),
	.D2(D6),
	.D1(D5),
	.D0(D4),
	.Q1(T[3]),
	.Q0(T[2]),
	.W(SYNTHESIZED_WIRE_4));

assign	W = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_4;


MX2x2	b2v_inst3(
	.S0(SYNTHESIZED_WIRE_4),
	.D0_(T[1:0]),
	.D1_(T[3:2]),
	.Q(SYNTHESIZED_WIRE_3));


endmodule
