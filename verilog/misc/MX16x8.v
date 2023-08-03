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
// CREATED		"Wed Aug  2 20:56:35 2023"

module MX16x8(
	S1,
	S0,
	S2,
	S3,
	D0_,
	D10_,
	D11_,
	D12_,
	D13_,
	D14_,
	D15_,
	D1_,
	D2_,
	D3_,
	D4_,
	D5_,
	D6_,
	D7_,
	D8_,
	D9_,
	Q
);


input wire	S1;
input wire	S0;
input wire	S2;
input wire	S3;
input wire	[7:0] D0_;
input wire	[7:0] D10_;
input wire	[7:0] D11_;
input wire	[7:0] D12_;
input wire	[7:0] D13_;
input wire	[7:0] D14_;
input wire	[7:0] D15_;
input wire	[7:0] D1_;
input wire	[7:0] D2_;
input wire	[7:0] D3_;
input wire	[7:0] D4_;
input wire	[7:0] D5_;
input wire	[7:0] D6_;
input wire	[7:0] D7_;
input wire	[7:0] D8_;
input wire	[7:0] D9_;
output wire	[7:0] Q;

wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;





MX8x8	b2v_inst(
	.S2(S2),
	.S1(S1),
	.S0(S0),
	.D0_(D0_),
	.D1_(D1_),
	.D2_(D2_),
	.D3_(D3_),
	.D4_(D4_),
	.D5_(D5_),
	.D6_(D6_),
	.D7_(D7_),
	.Q(SYNTHESIZED_WIRE_0));


MX8x8	b2v_inst1(
	.S2(S2),
	.S1(S1),
	.S0(S0),
	.D0_(D8_),
	.D1_(D9_),
	.D2_(D10_),
	.D3_(D11_),
	.D4_(D12_),
	.D5_(D13_),
	.D6_(D14_),
	.D7_(D15_),
	.Q(SYNTHESIZED_WIRE_1));


MX2x8	b2v_inst2(
	.S0(S3),
	.D0_(SYNTHESIZED_WIRE_0),
	.D1_(SYNTHESIZED_WIRE_1),
	.Q(Q));


endmodule
