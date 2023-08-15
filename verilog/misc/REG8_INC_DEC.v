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
// CREATED		"Tue Aug 15 19:23:50 2023"

module REG8_INC_DEC(
	CLK,
	INC,
	DEC,
	DOUT
);


input wire	CLK;
input wire	INC;
input wire	DEC;
output wire	[7:0] DOUT;

wire	[7:0] DOUT_ALTERA_SYNTHESIZED;
wire	LOWMAX;
wire	LOWMIN;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





REG4_INC_DEC	b2v_inst(
	.CLK(CLK),
	.INC(INC),
	.DEC(DEC),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[3:0]));


REG4_INC_DEC	b2v_inst1(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_0),
	.DEC(SYNTHESIZED_WIRE_1),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[7:4]));

assign	SYNTHESIZED_WIRE_0 = INC & LOWMAX;

assign	SYNTHESIZED_WIRE_1 = DEC & LOWMIN;

assign	LOWMAX = DOUT_ALTERA_SYNTHESIZED[3] & DOUT_ALTERA_SYNTHESIZED[2] & DOUT_ALTERA_SYNTHESIZED[1] & DOUT_ALTERA_SYNTHESIZED[0];

assign	LOWMIN = ~(DOUT_ALTERA_SYNTHESIZED[3] | DOUT_ALTERA_SYNTHESIZED[1] | DOUT_ALTERA_SYNTHESIZED[2] | DOUT_ALTERA_SYNTHESIZED[0]);

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
