// Copyright (C) 2022  Intel Corporation. All rights reserved.
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
// VERSION		"Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"
// CREATED		"Tue Aug 15 19:23:22 2023"

module MX8x32(
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
	Q_
);


input wire	S1;
input wire	S0;
input wire	S2;
input wire	[31:0] D0_;
input wire	[31:0] D1_;
input wire	[31:0] D2_;
input wire	[31:0] D3_;
input wire	[31:0] D4_;
input wire	[31:0] D5_;
input wire	[31:0] D6_;
input wire	[31:0] D7_;
output wire	[31:0] Q_;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;





MX4x32	b2v_inst(
	.S1(S1),
	.S0(S0),
	.D0_(D4_),
	.D1_(D5_),
	.D2_(D6_),
	.D3_(D7_),
	.Q_(SYNTHESIZED_WIRE_1));


MX4x32	b2v_inst1(
	.S1(S1),
	.S0(S0),
	.D0_(D0_),
	.D1_(D1_),
	.D2_(D2_),
	.D3_(D3_),
	.Q_(SYNTHESIZED_WIRE_0));


MX2x32	b2v_inst2(
	.S0(S2),
	.D0_(SYNTHESIZED_WIRE_0),
	.D1_(SYNTHESIZED_WIRE_1),
	.Q(Q_));


endmodule