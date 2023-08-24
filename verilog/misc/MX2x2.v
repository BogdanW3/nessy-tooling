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
// CREATED		"Thu Aug 24 10:28:54 2023"

module MX2x2(
	S0,
	D0_,
	D1_,
	Q
);


input wire	S0;
input wire	[1:0] D0_;
input wire	[1:0] D1_;
output wire	[1:0] Q;

wire	[1:0] Q_ALTERA_SYNTHESIZED;





MX2x1	b2v_inst(
	.D1(D1_[1]),
	.D0(D0_[1]),
	.S0(S0),
	.Q(Q_ALTERA_SYNTHESIZED[1]));


MX2x1	b2v_inst1(
	.D1(D1_[0]),
	.D0(D0_[0]),
	.S0(S0),
	.Q(Q_ALTERA_SYNTHESIZED[0]));

assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
