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
// CREATED		"Tue Aug 29 21:48:41 2023"

module cpu_fetch(
	FC,
	CLK,
	START,
	MDR,
	START_ADDR,
	START_EXEC,
	START_INTR,
	IR0_,
	IRADDR,
	IRDATA
);


input wire	FC;
input wire	CLK;
input wire	START;
input wire	[7:0] MDR;
output wire	START_ADDR;
output wire	START_EXEC;
output wire	START_INTR;
output wire	[7:0] IR0_;
output wire	[15:0] IRADDR;
output wire	[7:0] IRDATA;

wire	[7:0] IR1;
wire	[7:0] IR1_;
wire	[7:0] IR2;
wire	[7:0] IR_2;
wire	ldIR0;
wire	ldIR1;
wire	ldIR2;





REG8_LD_CL	b2v_inst28(
	.CLK(CLK),
	.LD(ldIR0),
	
	.DIN(MDR),
	.DOUT(IR0_));


REG8_LD_CL	b2v_inst52(
	.CLK(CLK),
	.LD(ldIR1),
	
	.DIN(MDR)
	);


REG8_LD_CL	b2v_inst55(
	.CLK(CLK),
	.LD(ldIR2),
	
	.DIN(MDR)
	);

assign	IRADDR[15:8] = IR_2;
assign	IRADDR[7:0] = IR1_;
assign	IRDATA = IR1_;

endmodule
