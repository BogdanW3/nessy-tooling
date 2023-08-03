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
// CREATED		"Thu Aug 03 15:47:11 2023"

module MX8x8(
	S1,
	S0,
	S2,
	D0_,
	D1_,
	D2_,
	D3_,
	D4_,
	D5_,
	D6_,
	D7_,
	Q
);


input wire	S1;
input wire	S0;
input wire	S2;
input wire	[7:0] D0_;
input wire	[7:0] D1_;
input wire	[7:0] D2_;
input wire	[7:0] D3_;
input wire	[7:0] D4_;
input wire	[7:0] D5_;
input wire	[7:0] D6_;
input wire	[7:0] D7_;
output wire	[7:0] Q;

wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;





MX2x8	b2v_inst2(
	.S0(S2),
	.D0_(SYNTHESIZED_WIRE_0),
	.D1_(SYNTHESIZED_WIRE_1),
	.Q(Q));


MX4x8	b2v_inst3(
	.S1(S1),
	.S0(S0),
	.D0_(D0_),
	.D1_(D1_),
	.D2_(D2_),
	.D3_(D3_),
	.Q_(SYNTHESIZED_WIRE_0));


MX4x8	b2v_inst4(
	.S1(S1),
	.S0(S0),
	.D0_(D4_),
	.D1_(D5_),
	.D2_(D6_),
	.D3_(D7_),
	.Q_(SYNTHESIZED_WIRE_1));


endmodule
