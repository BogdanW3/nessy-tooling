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
// CREATED		"Thu Aug 03 15:46:58 2023"

module MX2x8(
	S0,
	D0_,
	D1_,
	Q
);


input wire	S0;
input wire	[7:0] D0_;
input wire	[7:0] D1_;
output wire	[7:0] Q;

wire	[7:0] Q_ALTERA_SYNTHESIZED;





MX2x4	b2v_inst(
	.S0(S0),
	.D0_(D0_[7:4]),
	.D1_(D1_[7:4]),
	.Q(Q_ALTERA_SYNTHESIZED[7:4]));


MX2x4	b2v_inst2(
	.S0(S0),
	.D0_(D0_[3:0]),
	.D1_(D1_[3:0]),
	.Q(Q_ALTERA_SYNTHESIZED[3:0]));

assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
