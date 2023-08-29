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
// CREATED		"Tue Aug 29 21:48:46 2023"

module render_line(
	LD,
	BG,
	CLK,
	DIN,
	READY,
	BR,
	DOUT
);


input wire	LD;
input wire	BG;
input wire	CLK;
input wire	[7:0] DIN;
output reg	READY;
output wire	BR;
output wire	[31:0] DOUT;

wire	[15:0] ABS_DELTAX;
wire	[3:0] B;
reg	BR_ALTERA_SYNTHESIZED;
wire	[11:0] COLOR;
wire	decX_START;
wire	decY_START;
wire	[15:0] DELTA_X;
wire	[15:0] DELTA_Y;
wire	END;
wire	[15:0] ERR_DY;
wire	ERR_GRTE_DY;
wire	ERR_LSSE_DX;
wire	[15:0] ERROR;
wire	[15:0] ERRORx2;
wire	[3:0] G;
wire	H;
wire	incX_START;
wire	incY_START;
wire	L;
wire	LD_BLUE;
wire	LD_GREEN;
wire	LD_RED;
wire	LD_X_ENDH;
wire	LD_X_ENDL;
wire	LD_X_STARTH;
wire	LD_X_STARTL;
wire	LD_Y_ENDH;
wire	LD_Y_ENDL;
wire	LD_Y_STARTH;
wire	LD_Y_STARTL;
wire	[15:0] mABS_DELTAY;
reg	nBOOT;
wire	PRIMED;
wire	[3:0] R;
wire	[3:0] SEQ;
reg	START;
wire	TRANSFER;
wire	[15:0] X_END;
reg	X_SIGN;
wire	[15:0] X_START;
wire	X_STOP;
wire	[15:0] Y_END;
reg	Y_SIGN;
wire	[15:0] Y_START;
wire	Y_STOP;
wire	[15:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[15:0] SYNTHESIZED_WIRE_12;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_19;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	[15:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	[15:0] SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	[15:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;

wire	[15:0] GDFX_TEMP_SIGNAL_9;
wire	[15:0] GDFX_TEMP_SIGNAL_8;
wire	[15:0] GDFX_TEMP_SIGNAL_5;
wire	[15:0] GDFX_TEMP_SIGNAL_3;
wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_4;
wire	[15:0] GDFX_TEMP_SIGNAL_7;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[11:0] GDFX_TEMP_SIGNAL_6;


assign	GDFX_TEMP_SIGNAL_9 = {ERROR[14:0],L};
assign	GDFX_TEMP_SIGNAL_8 = {L,L,L,L,L,L,DIN[1:0],Y_END[7:0]};
assign	GDFX_TEMP_SIGNAL_5 = {L,L,L,L,L,L,DIN[1:0],X_END[7:0]};
assign	GDFX_TEMP_SIGNAL_3 = {L,L,L,L,L,L,DIN[1:0],Y_START[7:0]};
assign	GDFX_TEMP_SIGNAL_0 = {L,L,L,L,L,L,L,L,DIN[7:0]};
assign	GDFX_TEMP_SIGNAL_2 = {L,L,L,L,L,L,L,L,DIN[7:0]};
assign	GDFX_TEMP_SIGNAL_4 = {L,L,L,L,L,L,L,L,DIN[7:0]};
assign	GDFX_TEMP_SIGNAL_7 = {L,L,L,L,L,L,L,L,DIN[7:0]};
assign	GDFX_TEMP_SIGNAL_1 = {L,L,L,L,L,L,DIN[1:0],X_START[7:0]};
assign	GDFX_TEMP_SIGNAL_6 = {R[3:0],G[3:0],B[3:0]};


REG4_INC_CL	b2v_inst(
	.CLK(CLK),
	.INC(LD),
	.CL(END),
	.DOUT(SEQ));


DC16	b2v_inst1(
	.D3(SEQ[3]),
	.D2(SEQ[2]),
	.D1(SEQ[1]),
	.D0(SEQ[0]),
	.E(LD),
	
	
	
	
	
	.Q10(LD_Y_ENDH),
	.Q9(LD_Y_ENDL),
	.Q8(LD_X_ENDH),
	.Q7(LD_X_ENDL),
	.Q6(LD_Y_STARTH),
	.Q5(LD_Y_STARTL),
	.Q4(LD_X_STARTH),
	.Q3(LD_X_STARTL),
	.Q2(LD_BLUE),
	.Q1(LD_GREEN),
	.Q0(LD_RED));


always@(posedge CLK)
begin
	begin
	nBOOT <= H;
	end
end


always@(posedge CLK or negedge nBOOT)
begin
if (!nBOOT)
	begin
	READY <= 1;
	end
else
	begin
	READY <= ~READY & END | READY & ~PRIMED;
	end
end


always@(posedge CLK)
begin
	BR_ALTERA_SYNTHESIZED <= ~BR_ALTERA_SYNTHESIZED & START | BR_ALTERA_SYNTHESIZED & ~END;
end

assign	TRANSFER = BR_ALTERA_SYNTHESIZED & BG;


ADD16	b2v_inst17(
	.Cin(H),
	.A(SYNTHESIZED_WIRE_0),
	.B(SYNTHESIZED_WIRE_1),
	
	.Q(ABS_DELTAX));


ADD16	b2v_inst18(
	.Cin(H),
	.A(SYNTHESIZED_WIRE_2),
	.B(SYNTHESIZED_WIRE_3),
	
	.Q(mABS_DELTAY));


MX2x16	b2v_inst19(
	.S0(SYNTHESIZED_WIRE_42),
	.D0_(X_END),
	.D1_(X_START),
	.Q(SYNTHESIZED_WIRE_0));


MX2x16	b2v_inst20(
	.S0(SYNTHESIZED_WIRE_42),
	.D0_(X_START),
	.D1_(X_END),
	.Q(SYNTHESIZED_WIRE_12));


CMP16	b2v_inst21(
	.A(X_START),
	.B(X_END),
	.G(SYNTHESIZED_WIRE_42),
	
	.L(SYNTHESIZED_WIRE_9));


MX2x16	b2v_inst22(
	.S0(SYNTHESIZED_WIRE_43),
	.D0_(Y_END),
	.D1_(Y_START),
	.Q(SYNTHESIZED_WIRE_2));


MX2x16	b2v_inst23(
	.S0(SYNTHESIZED_WIRE_43),
	.D0_(Y_START),
	.D1_(Y_END),
	.Q(SYNTHESIZED_WIRE_13));


CMP16	b2v_inst24(
	.A(Y_START),
	.B(Y_END),
	
	
	.L(SYNTHESIZED_WIRE_43));




always@(posedge CLK)
begin
if (START)
	begin
	X_SIGN <= SYNTHESIZED_WIRE_8;
	end
end


REG4_LD_CL	b2v_inst32(
	.CLK(CLK),
	.LD(LD_RED),
	
	.DIN(DIN[3:0]),
	.DOUT(R));

assign	SYNTHESIZED_WIRE_8 =  ~SYNTHESIZED_WIRE_9;


always@(posedge CLK)
begin
if (START)
	begin
	Y_SIGN <= SYNTHESIZED_WIRE_10;
	end
end


REG4_LD_CL	b2v_inst35(
	.CLK(CLK),
	.LD(LD_GREEN),
	
	.DIN(DIN[3:0]),
	.DOUT(G));

assign	SYNTHESIZED_WIRE_10 =  ~SYNTHESIZED_WIRE_43;

assign	SYNTHESIZED_WIRE_1 =  ~SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_3 =  ~SYNTHESIZED_WIRE_13;


ADD16	b2v_inst41(
	
	.A(ABS_DELTAX),
	.B(mABS_DELTAY),
	
	.Q(SYNTHESIZED_WIRE_18));


REG16_LD_CL	b2v_inst42(
	.CLK(CLK),
	.LD(SYNTHESIZED_WIRE_14),
	
	.DIN(SYNTHESIZED_WIRE_15),
	.DOUT(ERROR));


MX4x16	b2v_inst43(
	.S1(SYNTHESIZED_WIRE_16),
	.S0(SYNTHESIZED_WIRE_17),
	.D0_(SYNTHESIZED_WIRE_18),
	.D1_(SYNTHESIZED_WIRE_19),
	.D2_(ERR_DY),
	.D3_(SYNTHESIZED_WIRE_20),
	.Q_(SYNTHESIZED_WIRE_15));


CD4	b2v_inst44(
	.D3(SYNTHESIZED_WIRE_21),
	.D2(SYNTHESIZED_WIRE_22),
	.D1(SYNTHESIZED_WIRE_23),
	.D0(START),
	.Q1(SYNTHESIZED_WIRE_16),
	.Q0(SYNTHESIZED_WIRE_17),
	.W(SYNTHESIZED_WIRE_14));


ADD16	b2v_inst46(
	
	.A(ERROR),
	.B(DELTA_X),
	
	.Q(SYNTHESIZED_WIRE_19));


ADD16	b2v_inst47(
	
	.A(ERROR),
	.B(DELTA_Y),
	
	.Q(ERR_DY));


MX2x16	b2v_inst49(
	.S0(LD_X_STARTH),
	.D0_(GDFX_TEMP_SIGNAL_0),
	.D1_(GDFX_TEMP_SIGNAL_1),
	.Q(SYNTHESIZED_WIRE_37));


REG4_LD_CL	b2v_inst51(
	.CLK(CLK),
	.LD(LD_BLUE),
	
	.DIN(DIN[3:0]),
	.DOUT(B));

assign	SYNTHESIZED_WIRE_36 = LD_X_STARTL | LD_X_STARTH;


MX2x16	b2v_inst53(
	.S0(LD_Y_STARTH),
	.D0_(GDFX_TEMP_SIGNAL_2),
	.D1_(GDFX_TEMP_SIGNAL_3),
	.Q(SYNTHESIZED_WIRE_39));

assign	SYNTHESIZED_WIRE_38 = LD_Y_STARTL | LD_Y_STARTH;


REG16_LD_INC_CL	b2v_inst55(
	.CLK(CLK),
	.LD(SYNTHESIZED_WIRE_24),
	
	
	.DIN(SYNTHESIZED_WIRE_25),
	.DOUT(X_END));


MX2x16	b2v_inst56(
	.S0(LD_X_ENDH),
	.D0_(GDFX_TEMP_SIGNAL_4),
	.D1_(GDFX_TEMP_SIGNAL_5),
	.Q(SYNTHESIZED_WIRE_25));

assign	COLOR = GDFX_TEMP_SIGNAL_6;


assign	SYNTHESIZED_WIRE_24 = LD_X_ENDL | LD_X_ENDH;


REG16_LD_INC_CL	b2v_inst59(
	.CLK(CLK),
	.LD(SYNTHESIZED_WIRE_26),
	
	
	.DIN(SYNTHESIZED_WIRE_27),
	.DOUT(Y_END));


MX2x16	b2v_inst60(
	.S0(LD_Y_ENDH),
	.D0_(GDFX_TEMP_SIGNAL_7),
	.D1_(GDFX_TEMP_SIGNAL_8),
	.Q(SYNTHESIZED_WIRE_27));

assign	SYNTHESIZED_WIRE_26 = LD_Y_ENDL | LD_Y_ENDH;


CMP16	b2v_inst62(
	.A(X_START),
	.B(X_END),
	
	.E(X_STOP)
	);


CMP16	b2v_inst63(
	.A(Y_START),
	.B(Y_END),
	
	.E(Y_STOP)
	);

assign	ERRORx2 = GDFX_TEMP_SIGNAL_9;



REG16_LD_CL	b2v_inst66(
	.CLK(CLK),
	.LD(START),
	
	.DIN(ABS_DELTAX),
	.DOUT(DELTA_X));


REG16_LD_CL	b2v_inst67(
	.CLK(CLK),
	.LD(START),
	
	.DIN(mABS_DELTAY),
	.DOUT(DELTA_Y));

assign	ERR_LSSE_DX = SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29;

assign	ERR_GRTE_DY = SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_34 = Y_STOP & X_STOP;

assign	SYNTHESIZED_WIRE_35 = SYNTHESIZED_WIRE_32 | SYNTHESIZED_WIRE_33 | SYNTHESIZED_WIRE_34;

assign	END = SYNTHESIZED_WIRE_35 & TRANSFER;

assign	SYNTHESIZED_WIRE_32 = ERR_GRTE_DY & X_STOP;

assign	SYNTHESIZED_WIRE_33 = ERR_LSSE_DX & Y_STOP;

assign	SYNTHESIZED_WIRE_40 = ERR_GRTE_DY & TRANSFER;


REG16_LD_INC_DEC	b2v_inst77(
	.CLK(CLK),
	.LD(SYNTHESIZED_WIRE_36),
	.INC(incX_START),
	.DEC(decX_START),
	.DIN(SYNTHESIZED_WIRE_37),
	.DOUT(X_START));


REG16_LD_INC_DEC	b2v_inst78(
	.CLK(CLK),
	.LD(SYNTHESIZED_WIRE_38),
	.INC(incY_START),
	.DEC(decY_START),
	.DIN(SYNTHESIZED_WIRE_39),
	.DOUT(Y_START));


DC2	b2v_inst79(
	.D0(X_SIGN),
	.E(SYNTHESIZED_WIRE_40),
	.Q1(decX_START),
	.Q0(incX_START));

assign	SYNTHESIZED_WIRE_41 = ERR_LSSE_DX & TRANSFER;


DC2	b2v_inst81(
	.D0(Y_SIGN),
	.E(SYNTHESIZED_WIRE_41),
	.Q1(decY_START),
	.Q0(incY_START));

assign	SYNTHESIZED_WIRE_22 = ERR_GRTE_DY & TRANSFER;

assign	SYNTHESIZED_WIRE_23 = ERR_LSSE_DX & TRANSFER;


ADD16	b2v_inst87(
	
	.A(ERR_DY),
	.B(DELTA_X),
	
	.Q(SYNTHESIZED_WIRE_20));

assign	SYNTHESIZED_WIRE_21 = ERR_LSSE_DX & ERR_GRTE_DY & TRANSFER;


SCMP16	b2v_inst92(
	.A(ERRORx2),
	.B(DELTA_X),
	
	.E(SYNTHESIZED_WIRE_29),
	.L(SYNTHESIZED_WIRE_28));


SCMP16	b2v_inst93(
	.A(ERRORx2),
	.B(DELTA_Y),
	.G(SYNTHESIZED_WIRE_31),
	.E(SYNTHESIZED_WIRE_30)
	);


always@(posedge CLK)
begin
	begin
	START <= PRIMED;
	end
end

assign	PRIMED = LD_Y_ENDH;


assign	BR = BR_ALTERA_SYNTHESIZED;
assign	DOUT[31:22] = X_START[9:0];
assign	DOUT[21:12] = Y_START[9:0];
assign	DOUT[11:0] = COLOR;
assign	H = 1;
assign	L = 0;

endmodule
