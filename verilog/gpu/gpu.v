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
// CREATED		"Sun Aug 20 16:56:15 2023"

module gpu(
	CLK,
	nCS,
	RD,
	WR,
	A,
	SDRAM_CLK,
	SDRAM_CKE,
	nSDRAM_CS,
	nSDRAM_RAS,
	nSDRAM_CAS,
	nSDRAM_WE,
	SDRAM_UDQM,
	SDRAM_LDQM,
	VGA_VS,
	VGA_HS,
	nNMI,
	D,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ,
	VGA_B,
	VGA_G,
	VGA_R
);


input wire	CLK;
input wire	nCS;
input wire	RD;
input wire	WR;
input wire	[2:0] A;
output wire	SDRAM_CLK;
output wire	SDRAM_CKE;
output wire	nSDRAM_CS;
output wire	nSDRAM_RAS;
output wire	nSDRAM_CAS;
output wire	nSDRAM_WE;
output wire	SDRAM_UDQM;
output wire	SDRAM_LDQM;
output wire	VGA_VS;
output wire	VGA_HS;
output wire	nNMI;
inout wire	[7:0] D;
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;
output wire	[3:0] VGA_B;
output wire	[3:0] VGA_G;
output wire	[3:0] VGA_R;

wire	[3:0] B;
wire	BG0;
wire	BG1;
wire	BG2;
wire	BG3;
wire	BG4;
wire	BG5;
wire	BG6;
wire	BG7;
wire	[7:0] BR;
wire	[31:0] BUFF_DATA1_;
wire	[31:0] BUFF_DATA2_;
wire	[31:0] BUFF_DATA5_;
wire	[31:0] BUFF_DATA6_;
wire	[15:0] COLOUR;
wire	CS;
wire	DRAW;
wire	[3:0] G;
wire	GPU_REQ;
wire	H;
wire	L;
wire	nBUFF_EMPTY;
wire	nBUFF_FULL;
wire	noX;
wire	[31:0] PIXEL_IN;
wire	[31:0] PIXEL_OUT;
wire	POP;
wire	PUSH;
wire	[3:0] R;
wire	RD0;
wire	RD1;
wire	RD2;
wire	RD3;
wire	RD4;
wire	RD5;
wire	RD6;
wire	RD7;
wire	[11:0] TMPADDR;
wire	VBLANK_START;
wire	[15:0] VRAM_D;
wire	VRAM_READ;
wire	VRAM_READY;
wire	VRAM_WRITE;
wire	[9:0] VRAM_X;
wire	[9:0] VRAM_Y;
wire	WR0;
wire	WR1;
wire	WR2;
wire	WR3;
wire	WR4;
wire	WR5;
wire	WR6;
wire	WR7;
wire	WRITE;
wire	[15:0] X;
wire	[15:0] X_BP;
wire	X_DRAW;
wire	X_END;
wire	[15:0] X_FP;
wire	[15:0] X_NEXTLINE;
wire	[15:0] X_SP;
wire	[15:0] X_VIS;
wire	[15:0] X_WR;
wire	[15:0] X_WRITE;
wire	X_WRITESAFE;
wire	[15:0] Y;
wire	[15:0] Y_BP;
wire	Y_DRAW;
wire	Y_END;
wire	[15:0] Y_FP;
wire	[15:0] Y_NEXTTMP;
wire	[15:0] Y_PREDRAW;
wire	[15:0] Y_SP;
wire	[15:0] Y_VIS;
wire	[15:0] Y_WR;
wire	SYNTHESIZED_WIRE_0;
wire	[0:11] SYNTHESIZED_WIRE_1;
reg	SRFF_NMI_occured;
reg	DFFE_NMI_output;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[0:15] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	[0:15] SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	[11:0] SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;

assign	SYNTHESIZED_WIRE_1 = 0;
assign	SYNTHESIZED_WIRE_10 = 0;
assign	SYNTHESIZED_WIRE_26 = 0;
assign	SYNTHESIZED_WIRE_52 = 0;
assign	SYNTHESIZED_WIRE_42 = 0;
wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_13;
wire	[15:0] GDFX_TEMP_SIGNAL_11;
wire	[15:0] GDFX_TEMP_SIGNAL_12;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_14;
wire	[15:0] GDFX_TEMP_SIGNAL_7;
wire	[15:0] GDFX_TEMP_SIGNAL_6;
wire	[15:0] GDFX_TEMP_SIGNAL_5;
wire	[15:0] GDFX_TEMP_SIGNAL_4;
wire	[15:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_10;
wire	[15:0] GDFX_TEMP_SIGNAL_9;
wire	[15:0] GDFX_TEMP_SIGNAL_8;


assign	GDFX_TEMP_SIGNAL_0 = {L,L,L,L,L,H,L,L,L,L,L,L,L,L,H,H};
assign	GDFX_TEMP_SIGNAL_13 = {L,L,L,L,PIXEL_OUT[11:0]};
assign	GDFX_TEMP_SIGNAL_11 = {L,L,L,L,L,L,PIXEL_OUT[31:22]};
assign	GDFX_TEMP_SIGNAL_12 = {L,L,L,L,L,L,PIXEL_OUT[21:12]};
assign	GDFX_TEMP_SIGNAL_1 = {L,L,L,L,L,H,L,L,L,L,L,L,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_3 = {L,L,L,L,L,L,H,L,L,H,L,H,L,H,H,H};
assign	GDFX_TEMP_SIGNAL_14 = {L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_7 = {L,L,L,L,L,L,H,L,H,L,L,H,H,L,L,H};
assign	GDFX_TEMP_SIGNAL_6 = {L,L,L,L,L,L,H,L,H,L,L,L,L,L,H,H};
assign	GDFX_TEMP_SIGNAL_5 = {L,L,L,L,L,L,H,L,L,H,H,H,H,H,L,H};
assign	GDFX_TEMP_SIGNAL_4 = {L,L,L,L,L,L,H,L,L,H,L,H,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_2 = {L,L,L,L,L,H,L,L,L,L,L,L,H,H,H,H};
assign	GDFX_TEMP_SIGNAL_10 = {L,L,L,L,L,L,H,H,H,H,L,H,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_9 = {L,L,L,L,L,L,H,H,L,H,L,H,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_8 = {L,L,L,L,L,L,H,H,L,L,H,L,L,L,L,L};

assign	X_WRITE = GDFX_TEMP_SIGNAL_0;


assign	X_NEXTLINE = GDFX_TEMP_SIGNAL_1;


assign	X_BP = GDFX_TEMP_SIGNAL_2;


assign	Y_PREDRAW = GDFX_TEMP_SIGNAL_3;


assign	Y_VIS = GDFX_TEMP_SIGNAL_4;


assign	Y_FP = GDFX_TEMP_SIGNAL_5;


assign	Y_SP = GDFX_TEMP_SIGNAL_6;


assign	Y_BP = GDFX_TEMP_SIGNAL_7;


assign	X_VIS = GDFX_TEMP_SIGNAL_8;


assign	X_FP = GDFX_TEMP_SIGNAL_9;


assign	X_SP = GDFX_TEMP_SIGNAL_10;



vram_controller	b2v_inst(
	.CLK(CLK),
	.read_scanline(VRAM_READ),
	.write_pixel(VRAM_WRITE),
	.D(VRAM_D),
	.SDRAM_DQ(SDRAM_DQ),
	.X(VRAM_X),
	.Y(VRAM_Y),
	.SDRAM_CLK(SDRAM_CLK),
	.SDRAM_CKE(SDRAM_CKE),
	.nSDRAM_CS(nSDRAM_CS),
	.nSDRAM_RAS(nSDRAM_RAS),
	.nSDRAM_CAS(nSDRAM_CAS),
	.nSDRAM_WE(nSDRAM_WE),
	.SDRAM_UDQM(SDRAM_UDQM),
	.SDRAM_LDQM(SDRAM_LDQM),
	.READY(VRAM_READY),
	
	.SDRAM_A(SDRAM_A),
	.SDRAM_BA(SDRAM_BA)
	);


MX2x12	b2v_inst1(
	.S0(SYNTHESIZED_WIRE_0),
	.D0_(SYNTHESIZED_WIRE_1),
	.D1_(Y_NEXTTMP[11:0]),
	.Q(SYNTHESIZED_WIRE_45));




assign	nNMI = SRFF_NMI_occured & DFFE_NMI_output;


CMP16	b2v_inst14(
	.A(X),
	.B(X_BP),
	
	.E(X_END)
	);


CMP16	b2v_inst15(
	.A(Y),
	.B(Y_BP),
	
	.E(Y_END)
	);


CMP16	b2v_inst16(
	.A(X),
	.B(X_VIS),
	
	
	.L(X_DRAW));

assign	SYNTHESIZED_WIRE_46 = noX & VBLANK_START;

assign	SYNTHESIZED_WIRE_47 = noX & Y_END;

assign	GPU_REQ = WRITE & VRAM_READY;


CMP16	b2v_inst2(
	.A(X),
	.B(X_NEXTLINE),
	
	.E(SYNTHESIZED_WIRE_15)
	);


CMP16	b2v_inst20(
	.A(X),
	.B(X_WRITE),
	
	.E(SYNTHESIZED_WIRE_44),
	.L(SYNTHESIZED_WIRE_43));

assign	D[7] = RD0 ? SYNTHESIZED_WIRE_2[7] : 1'bz;
assign	D[6] = RD0 ? SYNTHESIZED_WIRE_2[6] : 1'bz;
assign	D[5] = RD0 ? SYNTHESIZED_WIRE_2[5] : 1'bz;
assign	D[4] = RD0 ? SYNTHESIZED_WIRE_2[4] : 1'bz;
assign	D[3] = RD0 ? SYNTHESIZED_WIRE_2[3] : 1'bz;
assign	D[2] = RD0 ? SYNTHESIZED_WIRE_2[2] : 1'bz;
assign	D[1] = RD0 ? SYNTHESIZED_WIRE_2[1] : 1'bz;
assign	D[0] = RD0 ? SYNTHESIZED_WIRE_2[0] : 1'bz;


CMP16	b2v_inst22(
	.A(Y),
	.B(Y_VIS),
	
	.E(VBLANK_START),
	.L(Y_DRAW));


CMP16	b2v_inst23(
	.A(X),
	.B(X_FP),
	.G(SYNTHESIZED_WIRE_19),
	.E(SYNTHESIZED_WIRE_18)
	);


CMP16	b2v_inst24(
	.A(Y),
	.B(Y_FP),
	.G(SYNTHESIZED_WIRE_23),
	.E(SYNTHESIZED_WIRE_22)
	);


CMP16	b2v_inst25(
	.A(X),
	.B(X_SP),
	
	
	.L(SYNTHESIZED_WIRE_20));


CMP16	b2v_inst26(
	.A(Y),
	.B(Y_SP),
	
	
	.L(SYNTHESIZED_WIRE_24));

assign	VRAM_Y = TMPADDR[9:0];


assign	VRAM_X = X_WR[9:0];


assign	VRAM_WRITE = POP;



CMP16	b2v_inst3(
	.A(Y),
	.B(Y_PREDRAW),
	
	
	.L(SYNTHESIZED_WIRE_17));


pixel_buffer	b2v_inst30(
	.PUSH(PUSH),
	.POP(POP),
	.CLK(CLK),
	.DIN(PIXEL_IN),
	.nBUFF_FULL(nBUFF_FULL),
	.nBUFF_EMPTY(nBUFF_EMPTY),
	.DOUT(PIXEL_OUT));


CD8	b2v_inst31(
	.D7(SYNTHESIZED_WIRE_3),
	.D6(SYNTHESIZED_WIRE_4),
	.D5(SYNTHESIZED_WIRE_5),
	.D4(SYNTHESIZED_WIRE_6),
	.D3(SYNTHESIZED_WIRE_7),
	.D2(SYNTHESIZED_WIRE_8),
	.D1(SYNTHESIZED_WIRE_9),
	.D0(SYNTHESIZED_WIRE_10),
	.Q2(SYNTHESIZED_WIRE_49),
	.Q1(SYNTHESIZED_WIRE_50),
	.Q0(SYNTHESIZED_WIRE_51),
	.W(SYNTHESIZED_WIRE_14));


DC8	b2v_inst32(
	.D2(SYNTHESIZED_WIRE_49),
	.D1(SYNTHESIZED_WIRE_50),
	.D0(SYNTHESIZED_WIRE_51),
	.E(SYNTHESIZED_WIRE_14),
	.Q7(BG7),
	.Q6(BG6),
	.Q5(BG5),
	.Q4(BG4),
	.Q3(BG3),
	.Q2(BG2),
	.Q1(BG1)
	);

assign	VRAM_READ = SYNTHESIZED_WIRE_15 & VRAM_READY & SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_0 =  ~Y_END;


assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_17 | Y_END;

assign	R = VRAM_D[11:8];


assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_19;

assign	G = VRAM_D[7:4];


assign	X_WR = GDFX_TEMP_SIGNAL_11;


assign	VGA_HS = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23;

assign	B = VRAM_D[3:0];


assign	VGA_B[3] = DRAW ? B[3] : 1'bz;
assign	VGA_B[2] = DRAW ? B[2] : 1'bz;
assign	VGA_B[1] = DRAW ? B[1] : 1'bz;
assign	VGA_B[0] = DRAW ? B[0] : 1'bz;

assign	VGA_G[3] = DRAW ? G[3] : 1'bz;
assign	VGA_G[2] = DRAW ? G[2] : 1'bz;
assign	VGA_G[1] = DRAW ? G[1] : 1'bz;
assign	VGA_G[0] = DRAW ? G[0] : 1'bz;

assign	VGA_R[3] = DRAW ? R[3] : 1'bz;
assign	VGA_R[2] = DRAW ? R[2] : 1'bz;
assign	VGA_R[1] = DRAW ? R[1] : 1'bz;
assign	VGA_R[0] = DRAW ? R[0] : 1'bz;

assign	VGA_VS = SYNTHESIZED_WIRE_24 & SYNTHESIZED_WIRE_25;

assign	VRAM_D[15] = VRAM_WRITE ? COLOUR[15] : 1'bz;
assign	VRAM_D[14] = VRAM_WRITE ? COLOUR[14] : 1'bz;
assign	VRAM_D[13] = VRAM_WRITE ? COLOUR[13] : 1'bz;
assign	VRAM_D[12] = VRAM_WRITE ? COLOUR[12] : 1'bz;
assign	VRAM_D[11] = VRAM_WRITE ? COLOUR[11] : 1'bz;
assign	VRAM_D[10] = VRAM_WRITE ? COLOUR[10] : 1'bz;
assign	VRAM_D[9] = VRAM_WRITE ? COLOUR[9] : 1'bz;
assign	VRAM_D[8] = VRAM_WRITE ? COLOUR[8] : 1'bz;
assign	VRAM_D[7] = VRAM_WRITE ? COLOUR[7] : 1'bz;
assign	VRAM_D[6] = VRAM_WRITE ? COLOUR[6] : 1'bz;
assign	VRAM_D[5] = VRAM_WRITE ? COLOUR[5] : 1'bz;
assign	VRAM_D[4] = VRAM_WRITE ? COLOUR[4] : 1'bz;
assign	VRAM_D[3] = VRAM_WRITE ? COLOUR[3] : 1'bz;
assign	VRAM_D[2] = VRAM_WRITE ? COLOUR[2] : 1'bz;
assign	VRAM_D[1] = VRAM_WRITE ? COLOUR[1] : 1'bz;
assign	VRAM_D[0] = VRAM_WRITE ? COLOUR[0] : 1'bz;

assign	Y_WR = GDFX_TEMP_SIGNAL_12;


assign	DRAW = X_DRAW & Y_DRAW;



CMP16	b2v_inst51(
	.A(X),
	.B(SYNTHESIZED_WIRE_26),
	
	.E(noX)
	);

assign	SYNTHESIZED_WIRE_27 =  ~X_DRAW;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_27 & X_WRITESAFE;

assign	SYNTHESIZED_WIRE_38 = X_END & Y_END;

assign	WRITE = SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29;

assign	SYNTHESIZED_WIRE_28 = ~(Y_DRAW | SYNTHESIZED_WIRE_30);


assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_52 & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_52 & SYNTHESIZED_WIRE_52;


REG16_INC_CL	b2v_inst6(
	.CLK(CLK),
	.INC(H),
	.CL(X_END),
	.DOUT(X));

assign	SYNTHESIZED_WIRE_5 = nBUFF_FULL & BR[5];

assign	SYNTHESIZED_WIRE_8 = nBUFF_FULL & BR[2];

assign	SYNTHESIZED_WIRE_9 = nBUFF_FULL & BR[1];


assign	SYNTHESIZED_WIRE_4 = nBUFF_FULL & BR[6];

assign	SYNTHESIZED_WIRE_3 = nBUFF_EMPTY & GPU_REQ;

assign	PUSH = BG6 | BG4 | BG5 | BG3 | BG2 | BG1;


MX8x32	b2v_inst67(
	.S2(SYNTHESIZED_WIRE_49),
	.S1(SYNTHESIZED_WIRE_50),
	.S0(SYNTHESIZED_WIRE_51),
	
	.D1_(BUFF_DATA1_),
	.D2_(BUFF_DATA2_),
	
	
	.D5_(BUFF_DATA5_),
	.D6_(BUFF_DATA6_),
	
	.Q_(PIXEL_IN));

assign	COLOUR = GDFX_TEMP_SIGNAL_13;



render_pixel	b2v_inst69(
	.LD(WR1),
	.BG(BG1),
	.CLK(CLK),
	.DIN(D),
	.BR(BR[1]),
	.DOUT(BUFF_DATA1_));


REG16_INC_CL	b2v_inst7(
	.CLK(CLK),
	.INC(X_END),
	.CL(SYNTHESIZED_WIRE_38),
	.DOUT(Y));


render_pixel	b2v_inst70(
	.LD(WR2),
	.BG(BG2),
	.CLK(CLK),
	.DIN(D),
	.BR(BR[2]),
	.DOUT(BUFF_DATA2_));


DC8	b2v_inst71(
	.D2(A[2]),
	.D1(A[1]),
	.D0(A[0]),
	.E(SYNTHESIZED_WIRE_39),
	
	.Q6(WR6),
	.Q5(WR5),
	
	
	.Q2(WR2),
	.Q1(WR1)
	);

assign	CS =  ~nCS;

assign	SYNTHESIZED_WIRE_39 = CS & WR;


DC8	b2v_inst74(
	.D2(A[2]),
	.D1(A[1]),
	.D0(A[0]),
	.E(SYNTHESIZED_WIRE_40),
	
	
	
	
	
	
	
	.Q0(RD0));

assign	SYNTHESIZED_WIRE_40 = CS & RD;


render_rect	b2v_inst76(
	.LD(WR5),
	.BG(BG5),
	.CLK(CLK),
	.DIN(D),
	.BR(BR[5]),
	.DOUT(BUFF_DATA5_));


render_rect	b2v_inst77(
	.LD(WR6),
	.BG(BG6),
	.CLK(CLK),
	.DIN(D),
	.BR(BR[6]),
	.DOUT(BUFF_DATA6_));

assign	POP = BG7;


assign	SYNTHESIZED_WIRE_30 = ~(SYNTHESIZED_WIRE_41 & Y_END);


ADD16	b2v_inst8(
	.Cin(H),
	.A(Y),
	.B(SYNTHESIZED_WIRE_42),
	
	.Q(Y_NEXTTMP));

assign	SYNTHESIZED_WIRE_48 = CS & RD0;

assign	SYNTHESIZED_WIRE_41 =  ~X_WRITESAFE;

assign	SYNTHESIZED_WIRE_2 =  ~BR;

assign	X_WRITESAFE = SYNTHESIZED_WIRE_43 | SYNTHESIZED_WIRE_44;


MX2x12	b2v_inst9(
	.S0(VRAM_READ),
	.D0_(Y_WR[11:0]),
	.D1_(SYNTHESIZED_WIRE_45),
	.Q(TMPADDR));

assign	D[7] = L ? GDFX_TEMP_SIGNAL_14[7] : 1'bz;
assign	D[6] = L ? GDFX_TEMP_SIGNAL_14[6] : 1'bz;
assign	D[5] = L ? GDFX_TEMP_SIGNAL_14[5] : 1'bz;
assign	D[4] = L ? GDFX_TEMP_SIGNAL_14[4] : 1'bz;
assign	D[3] = L ? GDFX_TEMP_SIGNAL_14[3] : 1'bz;
assign	D[2] = L ? GDFX_TEMP_SIGNAL_14[2] : 1'bz;
assign	D[1] = L ? GDFX_TEMP_SIGNAL_14[1] : 1'bz;
assign	D[0] = L ? GDFX_TEMP_SIGNAL_14[0] : 1'bz;


always@(posedge CLK)
begin
	SRFF_NMI_occured <= ~SRFF_NMI_occured & SYNTHESIZED_WIRE_46 | SRFF_NMI_occured & ~SYNTHESIZED_WIRE_47;
end


always@(posedge CLK)
begin
if (SYNTHESIZED_WIRE_48)
	begin
	DFFE_NMI_output <= D[7];
	end
end

assign	H = 1;
assign	L = 0;

endmodule
