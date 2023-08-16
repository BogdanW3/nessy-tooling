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
// CREATED		"Tue Aug 15 19:23:20 2023"

module REG16_LD_INC_CL(
	LD,
	CL,
	INC,
	CLK,
	DIN,
	DOUT
);


input wire	LD;
input wire	CL;
input wire	INC;
input wire	CLK;
input wire	[15:0] DIN;
output wire	[15:0] DOUT;

wire	[15:0] DOUT_ALTERA_SYNTHESIZED;
wire	LOWMAX;
wire	SYNTHESIZED_WIRE_0;





REG8_LD_INC_CL	b2v_inst(
	.CLK(CLK),
	.LD(LD),
	.INC(INC),
	.CL(CL),
	.DIN(DIN[7:0]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_INC_CL	b2v_inst1(
	.CLK(CLK),
	.LD(LD),
	.INC(SYNTHESIZED_WIRE_0),
	.CL(CL),
	.DIN(DIN[15:8]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[15:8]));

assign	SYNTHESIZED_WIRE_0 = INC & LOWMAX;

assign	LOWMAX = DOUT_ALTERA_SYNTHESIZED[7] & DOUT_ALTERA_SYNTHESIZED[5] & DOUT_ALTERA_SYNTHESIZED[6] & DOUT_ALTERA_SYNTHESIZED[4] & DOUT_ALTERA_SYNTHESIZED[1] & DOUT_ALTERA_SYNTHESIZED[2] & DOUT_ALTERA_SYNTHESIZED[0] & DOUT_ALTERA_SYNTHESIZED[3];

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule