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
// CREATED		"Wed Aug  2 20:56:30 2023"

module MX4x2(
	S1,
	S0,
	D0_,
	D1_,
	D2_,
	D3_,
	Q_
);


input wire	S1;
input wire	S0;
input wire	[1:0] D0_;
input wire	[1:0] D1_;
input wire	[1:0] D2_;
input wire	[1:0] D3_;
output wire	[1:0] Q_;

wire	[1:0] SYNTHESIZED_WIRE_0;
wire	[1:0] SYNTHESIZED_WIRE_1;





MX2x2	b2v_inst(
	.S0(S0),
	.D0_(D2_),
	.D1_(D3_),
	.Q(SYNTHESIZED_WIRE_1));


MX2x2	b2v_inst1(
	.S0(S0),
	.D0_(D0_),
	.D1_(D1_),
	.Q(SYNTHESIZED_WIRE_0));


MX2x2	b2v_inst3(
	.S0(S1),
	.D0_(SYNTHESIZED_WIRE_0),
	.D1_(SYNTHESIZED_WIRE_1),
	.Q(Q_));


endmodule
