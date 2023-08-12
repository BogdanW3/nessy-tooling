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
// CREATED		"Sat Aug 12 22:54:29 2023"

module MX2x16(
	S0,
	D0_,
	D1_,
	Q
);


input wire	S0;
input wire	[15:0] D0_;
input wire	[15:0] D1_;
output wire	[15:0] Q;

wire	[15:0] Q_ALTERA_SYNTHESIZED;





MX2x8	b2v_inst(
	.S0(S0),
	.D0_(D0_[15:8]),
	.D1_(D1_[15:8]),
	.Q(Q_ALTERA_SYNTHESIZED[15:8]));


MX2x8	b2v_inst1(
	.S0(S0),
	.D0_(D0_[7:0]),
	.D1_(D1_[7:0]),
	.Q(Q_ALTERA_SYNTHESIZED[7:0]));

assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
