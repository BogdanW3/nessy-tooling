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
// CREATED		"Thu Aug 24 10:28:28 2023"

module gpu(
	CLK,
	nCS,
	RD,
	WR,
	A,
	DIN,
	nNMI,
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
	DOUT,
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
input wire	[7:0] DIN;
output wire	nNMI;
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
output wire	[7:0] DOUT;
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
wire	BR1;
wire	BR2;
wire	BR3;
wire	BR4;
wire	BR5;
wire	BR6;
wire	[31:0] BUFF_DATA1_;
wire	[31:0] BUFF_DATA2_;
wire	[31:0] BUFF_DATA3_;
wire	[31:0] BUFF_DATA4_;
wire	[31:0] BUFF_DATA5_;
wire	[31:0] BUFF_DATA6_;
wire	[15:0] COLOUR;
wire	CS;
wire	DRAW;
wire	[3:0] G;
wire	H;
wire	L;
wire	nBUFF_EMPTY;
wire	nBUFF_FULL;
reg	NMI_OCCUR;
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
wire	READ_BUFF;
wire	[6:0] READY;
wire	[11:0] TMPADDR;
wire	VBLANK_START;
wire	[15:0] VRAM_DOUT;
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
reg	DFFE_NMI_output;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	[0:15] SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	[0:15] SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	[11:0] SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;

assign	SYNTHESIZED_WIRE_1 = 0;
assign	SYNTHESIZED_WIRE_13 = 0;
assign	SYNTHESIZED_WIRE_28 = 0;
assign	SYNTHESIZED_WIRE_41 = 0;
wire	[7:0] GDFX_TEMP_SIGNAL_13;
wire	[15:0] GDFX_TEMP_SIGNAL_14;
wire	[15:0] GDFX_TEMP_SIGNAL_11;
wire	[15:0] GDFX_TEMP_SIGNAL_12;
wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_3;
wire	[15:0] GDFX_TEMP_SIGNAL_7;
wire	[15:0] GDFX_TEMP_SIGNAL_6;
wire	[15:0] GDFX_TEMP_SIGNAL_5;
wire	[15:0] GDFX_TEMP_SIGNAL_4;
wire	[15:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_10;
wire	[15:0] GDFX_TEMP_SIGNAL_9;
wire	[15:0] GDFX_TEMP_SIGNAL_8;


assign	GDFX_TEMP_SIGNAL_13 = {NMI_OCCUR,READY[6:0]};
assign	GDFX_TEMP_SIGNAL_14 = {L,L,L,L,PIXEL_OUT[11:0]};
assign	GDFX_TEMP_SIGNAL_11 = {L,L,L,L,L,L,PIXEL_OUT[31:22]};
assign	GDFX_TEMP_SIGNAL_12 = {L,L,L,L,L,L,PIXEL_OUT[21:12]};
assign	GDFX_TEMP_SIGNAL_0 = {L,L,L,L,L,H,L,L,L,L,L,L,L,L,H,H};
assign	GDFX_TEMP_SIGNAL_1 = {L,L,L,L,L,H,L,L,L,L,L,L,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_3 = {L,L,L,L,L,L,H,L,L,H,L,H,L,H,H,H};
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
	.DIN(COLOUR),
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
	.DOUT(VRAM_DOUT),
	.SDRAM_A(SDRAM_A),
	.SDRAM_BA(SDRAM_BA)
	);


MX2x12	b2v_inst1(
	.S0(SYNTHESIZED_WIRE_0),
	.D0_(SYNTHESIZED_WIRE_1),
	.D1_(Y_NEXTTMP[11:0]),
	.Q(SYNTHESIZED_WIRE_47));




assign	nNMI = NMI_OCCUR & DFFE_NMI_output;


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

assign	SYNTHESIZED_WIRE_48 = SYNTHESIZED_WIRE_50 & VBLANK_START;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_50 & Y_END;

assign	READ_BUFF = VRAM_READY & SYNTHESIZED_WIRE_4;


CMP16	b2v_inst2(
	.A(X),
	.B(X_NEXTLINE),
	
	.E(SYNTHESIZED_WIRE_44)
	);


CMP16	b2v_inst20(
	.A(X),
	.B(X_WRITE),
	
	.E(SYNTHESIZED_WIRE_43),
	.L(SYNTHESIZED_WIRE_42));

assign	SYNTHESIZED_WIRE_49 = RD0 | SYNTHESIZED_WIRE_5;


CMP16	b2v_inst22(
	.A(Y),
	.B(Y_VIS),
	
	.E(VBLANK_START),
	.L(Y_DRAW));


CMP16	b2v_inst23(
	.A(X),
	.B(X_FP),
	.G(SYNTHESIZED_WIRE_21),
	.E(SYNTHESIZED_WIRE_20)
	);


CMP16	b2v_inst24(
	.A(Y),
	.B(Y_FP),
	.G(SYNTHESIZED_WIRE_25),
	.E(SYNTHESIZED_WIRE_24)
	);


CMP16	b2v_inst25(
	.A(X),
	.B(X_SP),
	
	
	.L(SYNTHESIZED_WIRE_22));


CMP16	b2v_inst26(
	.A(Y),
	.B(Y_SP),
	
	
	.L(SYNTHESIZED_WIRE_26));

assign	VRAM_Y = TMPADDR[9:0];


assign	VRAM_X = X_WR[9:0];


assign	VRAM_WRITE = POP;



CMP16	b2v_inst3(
	.A(Y),
	.B(Y_PREDRAW),
	
	
	.L(SYNTHESIZED_WIRE_19));


pixel_buffer	b2v_inst30(
	.PUSH(PUSH),
	.POP(POP),
	.CLK(CLK),
	.DIN(PIXEL_IN),
	.nBUFF_FULL(nBUFF_FULL),
	.nBUFF_EMPTY(nBUFF_EMPTY),
	.DOUT(PIXEL_OUT));


CD8	b2v_inst31(
	.D7(SYNTHESIZED_WIRE_6),
	.D6(SYNTHESIZED_WIRE_7),
	.D5(SYNTHESIZED_WIRE_8),
	.D4(SYNTHESIZED_WIRE_9),
	.D3(SYNTHESIZED_WIRE_10),
	.D2(SYNTHESIZED_WIRE_11),
	.D1(SYNTHESIZED_WIRE_12),
	.D0(SYNTHESIZED_WIRE_13),
	.Q2(SYNTHESIZED_WIRE_51),
	.Q1(SYNTHESIZED_WIRE_52),
	.Q0(SYNTHESIZED_WIRE_53),
	.W(SYNTHESIZED_WIRE_17));


DC8	b2v_inst32(
	.D2(SYNTHESIZED_WIRE_51),
	.D1(SYNTHESIZED_WIRE_52),
	.D0(SYNTHESIZED_WIRE_53),
	.E(SYNTHESIZED_WIRE_17),
	.Q7(BG7),
	.Q6(BG6),
	.Q5(BG5),
	.Q4(BG4),
	.Q3(BG3),
	.Q2(BG2),
	.Q1(BG1)
	);

assign	SYNTHESIZED_WIRE_0 =  ~Y_END;

assign	SYNTHESIZED_WIRE_36 = X_END & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_45 = Y_END | SYNTHESIZED_WIRE_19;

assign	R = VRAM_DOUT[11:8];


assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21;

assign	G = VRAM_DOUT[7:4];


assign	X_WR = GDFX_TEMP_SIGNAL_11;


assign	VGA_HS = SYNTHESIZED_WIRE_22 & SYNTHESIZED_WIRE_23;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25;

assign	B = VRAM_DOUT[3:0];


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

assign	VGA_VS = SYNTHESIZED_WIRE_26 & SYNTHESIZED_WIRE_27;


render_line	b2v_inst47(
	.LD(WR3),
	.BG(BG3),
	.CLK(CLK),
	.DIN(DIN),
	.READY(READY[3]),
	.BR(BR3),
	.DOUT(BUFF_DATA3_));

assign	Y_WR = GDFX_TEMP_SIGNAL_12;


assign	DRAW = X_DRAW & Y_DRAW;



MX8x8	b2v_inst50(
	.S2(A[2]),
	.S1(A[1]),
	.S0(A[0]),
	.D0_(GDFX_TEMP_SIGNAL_13),
	
	
	
	
	
	
	
	.Q(DOUT));


CMP16	b2v_inst51(
	.A(X),
	.B(SYNTHESIZED_WIRE_28),
	
	.E(SYNTHESIZED_WIRE_50)
	);

assign	SYNTHESIZED_WIRE_29 =  ~X_DRAW;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_29 & X_WRITESAFE;

assign	SYNTHESIZED_WIRE_37 = X_END & Y_END;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_30 = ~(SYNTHESIZED_WIRE_32 | Y_DRAW);


assign	SYNTHESIZED_WIRE_9 = nBUFF_FULL & BR4;

assign	SYNTHESIZED_WIRE_10 = nBUFF_FULL & BR3;


REG16_INC_CL	b2v_inst6(
	.CLK(CLK),
	.INC(H),
	.CL(X_END),
	.DOUT(X));

assign	SYNTHESIZED_WIRE_8 = nBUFF_FULL & BR5;

assign	SYNTHESIZED_WIRE_11 = nBUFF_FULL & BR2;

assign	SYNTHESIZED_WIRE_12 = nBUFF_FULL & BR1;


assign	SYNTHESIZED_WIRE_7 = nBUFF_FULL & BR6;

assign	SYNTHESIZED_WIRE_6 = nBUFF_EMPTY & READ_BUFF;

assign	PUSH = BG6 | BG4 | BG5 | BG3 | BG2 | BG1;


MX8x32	b2v_inst67(
	.S2(SYNTHESIZED_WIRE_51),
	.S1(SYNTHESIZED_WIRE_52),
	.S0(SYNTHESIZED_WIRE_53),
	
	.D1_(BUFF_DATA1_),
	.D2_(BUFF_DATA2_),
	.D3_(BUFF_DATA3_),
	.D4_(BUFF_DATA4_),
	.D5_(BUFF_DATA5_),
	.D6_(BUFF_DATA6_),
	
	.Q_(PIXEL_IN));

assign	COLOUR = GDFX_TEMP_SIGNAL_14;



render_pixel	b2v_inst69(
	.LD(WR1),
	.BG(BG1),
	.CLK(CLK),
	.DIN(DIN),
	.READY(READY[1]),
	.BR(BR1),
	.DOUT(BUFF_DATA1_));


REG16_INC_CL	b2v_inst7(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_36),
	.CL(SYNTHESIZED_WIRE_37),
	.DOUT(Y));


render_pixel	b2v_inst70(
	.LD(WR2),
	.BG(BG2),
	.CLK(CLK),
	.DIN(DIN),
	.READY(READY[2]),
	.BR(BR2),
	.DOUT(BUFF_DATA2_));


DC8	b2v_inst71(
	.D2(A[2]),
	.D1(A[1]),
	.D0(A[0]),
	.E(SYNTHESIZED_WIRE_38),
	
	.Q6(WR6),
	.Q5(WR5),
	.Q4(WR4),
	.Q3(WR3),
	.Q2(WR2),
	.Q1(WR1),
	.Q0(WR0));

assign	CS =  ~nCS;

assign	SYNTHESIZED_WIRE_38 = CS & WR;


DC8	b2v_inst74(
	.D2(A[2]),
	.D1(A[1]),
	.D0(A[0]),
	.E(SYNTHESIZED_WIRE_39),
	
	
	
	
	
	
	
	.Q0(RD0));

assign	SYNTHESIZED_WIRE_39 = CS & RD;


render_rect	b2v_inst76(
	.LD(WR5),
	.BG(BG5),
	.CLK(CLK),
	.DIN(DIN),
	.READY(READY[5]),
	.BR(BR5),
	.DOUT(BUFF_DATA5_));


render_rect	b2v_inst77(
	.LD(WR6),
	.BG(BG6),
	.CLK(CLK),
	.DIN(DIN),
	.READY(READY[6]),
	.BR(BR6),
	.DOUT(BUFF_DATA6_));

assign	POP = BG7;


assign	SYNTHESIZED_WIRE_32 = ~(SYNTHESIZED_WIRE_40 & Y_END);


ADD16	b2v_inst8(
	.Cin(H),
	.A(Y),
	.B(SYNTHESIZED_WIRE_41),
	
	.Q(Y_NEXTTMP));


render_line	b2v_inst80(
	.LD(WR4),
	.BG(BG4),
	.CLK(CLK),
	.DIN(DIN),
	.READY(READY[4]),
	.BR(BR4),
	.DOUT(BUFF_DATA4_));

assign	SYNTHESIZED_WIRE_40 =  ~X_WRITESAFE;

assign	SYNTHESIZED_WIRE_18 =  ~Y_END;

assign	X_WRITESAFE = SYNTHESIZED_WIRE_42 | SYNTHESIZED_WIRE_43;

assign	SYNTHESIZED_WIRE_46 = SYNTHESIZED_WIRE_44 & SYNTHESIZED_WIRE_45;

assign	VRAM_READ = VRAM_READY & SYNTHESIZED_WIRE_46;


MX2x12	b2v_inst9(
	.S0(VRAM_READ),
	.D0_(Y_WR[11:0]),
	.D1_(SYNTHESIZED_WIRE_47),
	.Q(TMPADDR));


always@(posedge CLK)
begin
	NMI_OCCUR <= ~NMI_OCCUR & SYNTHESIZED_WIRE_48 | NMI_OCCUR & ~SYNTHESIZED_WIRE_49;
end


always@(posedge CLK)
begin
if (WR0)
	begin
	DFFE_NMI_output <= DIN[7];
	end
end

assign	H = 1;
assign	L = 0;

endmodule
