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
// CREATED		"Tue Aug 15 19:24:47 2023"

module render_pixel(
	LD,
	BG,
	CLK,
	DIN,
	BR,
	DOUT
);


input wire	LD;
input wire	BG;
input wire	CLK;
input wire	[7:0] DIN;
output wire	BR;
output wire	[31:0] DOUT;

wire	[3:0] B;
reg	BR_ALTERA_SYNTHESIZED;
wire	[11:0] COLOR;
wire	[3:0] G;
wire	H;
wire	L;
wire	LD_BLUE;
wire	LD_GREEN;
wire	LD_RED;
wire	LD_XH;
wire	LD_XL;
wire	LD_YH;
wire	LD_YL;
reg	nBOOT;
wire	nREADY;
wire	PRIMED;
wire	[3:0] R;
reg	READY;
wire	[3:0] SEQ;
wire	TRANSFER;
wire	[9:0] X;
wire	[9:0] Y;

wire	[11:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {R[3:0],G[3:0],B[3:0]};


REG4_INC_CL	b2v_inst(
	.CLK(CLK),
	.INC(LD),
	.CL(TRANSFER),
	.DOUT(SEQ));


assign	PRIMED = LD_YH;






REG8_LD_CL	b2v_inst2(
	.CLK(CLK),
	.LD(LD_XL),
	
	.DIN(DIN),
	.DOUT(X[7:0]));



REG4_LD_CL	b2v_inst32(
	.CLK(CLK),
	.LD(LD_RED),
	
	.DIN(DIN[3:0]),
	.DOUT(R));


REG4_LD_CL	b2v_inst35(
	.CLK(CLK),
	.LD(LD_GREEN),
	
	.DIN(DIN[3:0]),
	.DOUT(G));


REG8_LD_CL	b2v_inst4(
	.CLK(CLK),
	.LD(LD_YL),
	
	.DIN(DIN),
	.DOUT(Y[7:0]));


REG2_LD_CL	b2v_inst40(
	.CLK(CLK),
	.LD(LD_YH),
	
	.DIN(DIN[1:0]),
	.DOUT(Y[9:8]));

assign	TRANSFER = BR_ALTERA_SYNTHESIZED & BG;


REG4_LD_CL	b2v_inst51(
	.CLK(CLK),
	.LD(LD_BLUE),
	
	.DIN(DIN[3:0]),
	.DOUT(B));

assign	COLOR = GDFX_TEMP_SIGNAL_0;



DC8	b2v_inst59(
	.D2(SEQ[2]),
	.D1(SEQ[1]),
	.D0(SEQ[0]),
	.E(LD),
	
	.Q6(LD_YH),
	.Q5(LD_YL),
	.Q4(LD_XH),
	.Q3(LD_XL),
	.Q2(LD_BLUE),
	.Q1(LD_GREEN),
	.Q0(LD_RED));


REG2_LD_CL	b2v_inst7(
	.CLK(CLK),
	.LD(LD_XH),
	
	.DIN(DIN[1:0]),
	.DOUT(X[9:8]));


always@(posedge CLK)
begin
	BR_ALTERA_SYNTHESIZED <= ~BR_ALTERA_SYNTHESIZED & PRIMED | BR_ALTERA_SYNTHESIZED & ~TRANSFER;
end

assign	BR = BR_ALTERA_SYNTHESIZED;
assign	DOUT[31:22] = X;
assign	DOUT[21:12] = Y;
assign	DOUT[11:0] = COLOR;
assign	H = 1;
assign	L = 0;

endmodule
