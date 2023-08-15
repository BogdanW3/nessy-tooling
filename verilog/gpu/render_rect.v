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
// CREATED		"Tue Aug 15 19:24:50 2023"

module render_rect(
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
wire	END;
wire	[3:0] G;
wire	[15:0] H;
wire	Hi;
wire	[15:0] ITER_X;
wire	[15:0] ITER_Y;
wire	LD_BLUE;
wire	LD_GREEN;
wire	LD_HH;
wire	LD_HL;
wire	LD_RED;
wire	LD_WH;
wire	LD_WL;
wire	LD_XH;
wire	LD_XL;
wire	LD_YH;
wire	LD_YL;
wire	Lo;
reg	nBOOT;
wire	nREADY;
wire	nX_MAX;
wire	nY_MAX;
wire	PRIMED;
wire	[3:0] R;
reg	READY;
wire	[3:0] SEQ;
wire	TRANSFER;
wire	[15:0] W;
wire	[15:0] X;
wire	X_MAX;
wire	[15:0] X_OUT;
wire	[15:0] Y;
wire	Y_MAX;
wire	[15:0] Y_OUT;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

wire	[5:0] GDFX_TEMP_SIGNAL_1;
wire	[5:0] GDFX_TEMP_SIGNAL_2;
wire	[11:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_1 = {Lo,Lo,Lo,Lo,Lo,Lo};
assign	GDFX_TEMP_SIGNAL_2 = {Lo,Lo,Lo,Lo,Lo,Lo};
assign	GDFX_TEMP_SIGNAL_0 = {R[3:0],G[3:0],B[3:0]};


REG4_INC_CL	b2v_inst(
	.CLK(CLK),
	.INC(LD),
	.CL(TRANSFER),
	.DOUT(SEQ));


DC16	b2v_inst1(
	.D3(SEQ[3]),
	.D2(SEQ[2]),
	.D1(SEQ[1]),
	.D0(SEQ[0]),
	.E(LD),
	
	
	
	
	
	.Q10(LD_HH),
	.Q9(LD_HL),
	.Q8(LD_WH),
	.Q7(LD_WL),
	.Q6(LD_YH),
	.Q5(LD_YL),
	.Q4(LD_XH),
	.Q3(LD_XL),
	.Q2(LD_BLUE),
	.Q1(LD_GREEN),
	.Q0(LD_RED));


REG2_LD_CL	b2v_inst10(
	.CLK(CLK),
	.LD(LD_HH),
	
	.DIN(DIN[1:0]),
	.DOUT(H[9:8]));


REG16_INC_CL	b2v_inst11(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_0),
	.CL(SYNTHESIZED_WIRE_1),
	.DOUT(ITER_Y));

assign	PRIMED = LD_HH;






always@(posedge CLK)
begin
	BR_ALTERA_SYNTHESIZED <= ~BR_ALTERA_SYNTHESIZED & PRIMED | BR_ALTERA_SYNTHESIZED & ~END;
end

assign	TRANSFER = BR_ALTERA_SYNTHESIZED & BG;


CMP16	b2v_inst17(
	.A(ITER_X),
	.B(W),
	
	.E(X_MAX)
	);



CMP16	b2v_inst19(
	.A(ITER_Y),
	.B(H),
	
	.E(Y_MAX)
	);


REG8_LD_CL	b2v_inst2(
	.CLK(CLK),
	.LD(LD_XL),
	
	.DIN(DIN),
	.DOUT(X[7:0]));


ADD16	b2v_inst20(
	
	.A(X),
	.B(ITER_X),
	
	.Q(X_OUT));


ADD16	b2v_inst21(
	
	.A(Y),
	.B(ITER_Y),
	
	.Q(Y_OUT));


DC2	b2v_inst22(
	.D0(nX_MAX),
	.E(TRANSFER),
	.Q1(SYNTHESIZED_WIRE_3),
	.Q0(SYNTHESIZED_WIRE_4));


DC2	b2v_inst23(
	.D0(nY_MAX),
	.E(SYNTHESIZED_WIRE_2),
	.Q1(SYNTHESIZED_WIRE_0),
	.Q0(SYNTHESIZED_WIRE_1));

assign	SYNTHESIZED_WIRE_2 = X_MAX & TRANSFER;

assign	nX_MAX =  ~X_MAX;


assign	END = X_MAX & Y_MAX & TRANSFER;



REG8_LD_CL	b2v_inst3(
	.CLK(CLK),
	.LD(LD_WL),
	
	.DIN(DIN),
	.DOUT(W[7:0]));


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


REG8_LD_CL	b2v_inst5(
	.CLK(CLK),
	.LD(LD_HL),
	
	.DIN(DIN),
	.DOUT(H[7:0]));


REG4_LD_CL	b2v_inst51(
	.CLK(CLK),
	.LD(LD_BLUE),
	
	.DIN(DIN[3:0]),
	.DOUT(B));

assign	COLOR = GDFX_TEMP_SIGNAL_0;


assign	W[15:10] = GDFX_TEMP_SIGNAL_1;


assign	H[15:10] = GDFX_TEMP_SIGNAL_2;



REG16_INC_CL	b2v_inst6(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_3),
	.CL(SYNTHESIZED_WIRE_4),
	.DOUT(ITER_X));


REG2_LD_CL	b2v_inst7(
	.CLK(CLK),
	.LD(LD_XH),
	
	.DIN(DIN[1:0]),
	.DOUT(X[9:8]));


REG2_LD_CL	b2v_inst8(
	.CLK(CLK),
	.LD(LD_YH),
	
	.DIN(DIN[1:0]),
	.DOUT(Y[9:8]));


REG2_LD_CL	b2v_inst9(
	.CLK(CLK),
	.LD(LD_WH),
	
	.DIN(DIN[1:0]),
	.DOUT(W[9:8]));

assign	BR = BR_ALTERA_SYNTHESIZED;
assign	DOUT[31:22] = X_OUT[9:0];
assign	DOUT[21:12] = Y_OUT[9:0];
assign	DOUT[11:0] = COLOR;
assign	Hi = 1;
assign	Lo = 0;

endmodule
