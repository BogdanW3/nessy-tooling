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
// CREATED		"Tue Aug 15 19:24:42 2023"

module REG32_LD_CL(
	LD,
	CL,
	CLK,
	DIN,
	DOUT
);


input wire	LD;
input wire	CL;
input wire	CLK;
input wire	[31:0] DIN;
output wire	[31:0] DOUT;

wire	[31:0] DOUT_ALTERA_SYNTHESIZED;





REG16_LD_CL	b2v_inst(
	.CLK(CLK),
	.LD(LD),
	.CL(CL),
	.DIN(DIN[31:16]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[31:16]));


REG16_LD_CL	b2v_inst1(
	.CLK(CLK),
	.LD(LD),
	.CL(CL),
	.DIN(DIN[15:0]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[15:0]));

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule