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
// CREATED		"Thu Aug 24 10:28:36 2023"

module CD16(
	D15,
	D14,
	D13,
	D12,
	D11,
	D10,
	D9,
	D8,
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
	Q0,
	Q3
);


input wire	D15;
input wire	D14;
input wire	D13;
input wire	D12;
input wire	D11;
input wire	D10;
input wire	D9;
input wire	D8;
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
output wire	Q3;

wire	[5:0] T;
wire	[1:1] W_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_4;

assign	Q2 = SYNTHESIZED_WIRE_4[2];
assign	Q1 = SYNTHESIZED_WIRE_4[1];
assign	Q0 = SYNTHESIZED_WIRE_4[0];
assign	Q3 = SYNTHESIZED_WIRE_4[3];
wire	[3:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_0 = {W_ALTERA_SYNTHESIZED[1],T[2:0]};
assign	GDFX_TEMP_SIGNAL_1 = {W_ALTERA_SYNTHESIZED[1],T[5:3]};


CD8	b2v_inst(
	.D7(D7),
	.D6(D6),
	.D5(D5),
	.D4(D4),
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.Q2(T[2]),
	.Q1(T[1]),
	.Q0(T[0]),
	.W(SYNTHESIZED_WIRE_0));


MX2x4	b2v_inst1(
	.S0(W_ALTERA_SYNTHESIZED),
	.D0_(GDFX_TEMP_SIGNAL_0),
	.D1_(GDFX_TEMP_SIGNAL_1),
	.Q(SYNTHESIZED_WIRE_4));

assign	W = SYNTHESIZED_WIRE_0 | W_ALTERA_SYNTHESIZED;


CD8	b2v_inst8(
	.D7(D15),
	.D6(D14),
	.D5(D13),
	.D4(D12),
	.D3(D11),
	.D2(D10),
	.D1(D9),
	.D0(D8),
	.Q2(T[5]),
	.Q1(T[4]),
	.Q0(T[3]),
	.W(W_ALTERA_SYNTHESIZED));


endmodule
