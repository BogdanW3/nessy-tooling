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
// CREATED		"Tue Aug 15 19:24:28 2023"

module MX2x32(
	S0,
	D0_,
	D1_,
	Q
);


input wire	S0;
input wire	[31:0] D0_;
input wire	[31:0] D1_;
output wire	[31:0] Q;

wire	[31:0] Q_ALTERA_SYNTHESIZED;





MX2x16	b2v_inst(
	.S0(S0),
	.D0_(D0_[31:16]),
	.D1_(D1_[31:16]),
	.Q(Q_ALTERA_SYNTHESIZED[31:16]));


MX2x16	b2v_inst1(
	.S0(S0),
	.D0_(D0_[15:0]),
	.D1_(D1_[15:0]),
	.Q(Q_ALTERA_SYNTHESIZED[15:0]));

assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
