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
// CREATED		"Tue Aug 29 21:47:10 2023"

module MX8x1(
	S1,
	S0,
	D3,
	D2,
	D1,
	D0,
	D4,
	D5,
	D6,
	D7,
	S2,
	Q
);


input wire	S1;
input wire	S0;
input wire	D3;
input wire	D2;
input wire	D1;
input wire	D0;
input wire	D4;
input wire	D5;
input wire	D6;
input wire	D7;
input wire	S2;
output wire	Q;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





MX4x1	b2v_inst(
	.D3(D7),
	.D2(D6),
	.D1(D5),
	.D0(D4),
	.S1(S1),
	.S0(S0),
	.Q(SYNTHESIZED_WIRE_0));


MX4x1	b2v_inst1(
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.S1(S1),
	.S0(S0),
	.Q(SYNTHESIZED_WIRE_1));


MX2x1	b2v_inst2(
	.D1(SYNTHESIZED_WIRE_0),
	.D0(SYNTHESIZED_WIRE_1),
	.S0(S2),
	.Q(Q));


endmodule
