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
// CREATED		"Wed Aug  2 20:56:24 2023"

module REG12_LD_CL(
	CLK,
	LD,
	CL,
	DIN,
	DOUT
);


input wire	CLK;
input wire	LD;
input wire	CL;
input wire	[11:0] DIN;
output wire	[11:0] DOUT;

wire	[11:0] DOUT_ALTERA_SYNTHESIZED;





REG4_LD_CL	b2v_inst1(
	.CLK(CLK),
	.LD(LD),
	.CL(CL),
	.DIN(DIN[3:0]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[3:0]));


REG8_LD_CL	b2v_inst3(
	.CLK(CLK),
	.LD(LD),
	.CL(CL),
	.DIN(DIN[11:4]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[11:4]));

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
