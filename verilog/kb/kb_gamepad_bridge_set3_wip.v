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
// CREATED		"Thu Aug 24 10:28:35 2023"

module kb_gamepad_bridge_set3_wip(
	KBINTR,
	RD,
	CLK,
	OUT0,
	CS,
	ADDR,
	KEY,
	KBINTA,
	DATA
);


input wire	KBINTR;
input wire	RD;
input wire	CLK;
input wire	OUT0;
input wire	CS;
input wire	[0:0] ADDR;
input wire	[7:0] KEY;
output wire	KBINTA;
output wire	[7:0] DATA;

reg	A;
reg	BRK;
reg	D;
reg	DOWN;
reg	E;
reg	F;
reg	I;
reg	J;
reg	K;
wire	KEYA;
wire	KEYBREAK;
wire	KEYD;
wire	KEYDOWN;
wire	KEYE;
wire	KEYF;
wire	KEYI;
wire	KEYJ;
wire	KEYK;
wire	KEYKP4;
wire	KEYKP5;
wire	KEYKP6;
wire	KEYKP7;
wire	KEYKP8;
wire	KEYKP9;
wire	KEYL;
wire	KEYLEFT;
wire	KEYO;
wire	KEYQ;
wire	KEYR;
wire	KEYRCTRL;
wire	KEYRIGHT;
wire	KEYRSHIFT;
wire	KEYS;
wire	KEYU;
wire	KEYUP;
wire	KEYW;
reg	KP4;
reg	KP5;
reg	KP6;
reg	KP7;
reg	KP8;
reg	KP9;
wire	L;
reg	LEFT;
reg	LL;
wire	nBRK;
wire	[7:0] nKEY;
reg	O;
wire	P0;
wire	P1;
wire	P2;
wire	P3;
wire	[7:0] PDAT;
reg	Q;
reg	R;
reg	RCTRL;
wire	READ;
reg	RIGHT;
reg	RSHIFT;
reg	S;
reg	U;
reg	UP;
reg	W;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
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
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;

assign	KBINTA = KBINTR;
wire	[7:0] GDFX_TEMP_SIGNAL_0;
wire	[5:0] GDFX_TEMP_SIGNAL_6;
wire	[1:0] GDFX_TEMP_SIGNAL_4;
wire	[1:0] GDFX_TEMP_SIGNAL_5;
wire	[7:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_2;
wire	[7:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_0 = {D,A,S,W,F,R,E,Q};
assign	GDFX_TEMP_SIGNAL_6 = {L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_4 = {P2,P0};
assign	GDFX_TEMP_SIGNAL_5 = {P3,P1};
assign	GDFX_TEMP_SIGNAL_3 = {LL,J,K,I,L,L,O,U};
assign	GDFX_TEMP_SIGNAL_2 = {RIGHT,LEFT,DOWN,UP,L,L,RSHIFT,RCTRL};
assign	GDFX_TEMP_SIGNAL_1 = {KP6,KP4,KP5,KP8,L,L,KP9,KP7};

assign	KEYBREAK = KEY[7] & KEY[5] & KEY[6] & KEY[4] & nKEY[1] & nKEY[2] & nKEY[0] & nKEY[3];

assign	KEYS = nKEY[7] & nKEY[5] & nKEY[6] & KEY[4] & KEY[1] & nKEY[2] & KEY[0] & KEY[3];

assign	KEYA = nKEY[7] & nKEY[5] & nKEY[6] & KEY[4] & nKEY[1] & KEY[2] & nKEY[0] & KEY[3];

assign	KEYD = nKEY[7] & KEY[5] & nKEY[6] & nKEY[4] & KEY[1] & nKEY[2] & KEY[0] & nKEY[3];

assign	KEYRCTRL = nKEY[7] & nKEY[5] & KEY[6] & KEY[4] & nKEY[1] & nKEY[2] & nKEY[0] & KEY[3];

assign	KEYRSHIFT = nKEY[7] & nKEY[5] & KEY[6] & KEY[4] & nKEY[1] & nKEY[2] & KEY[0] & KEY[3];

assign	KEYUP = nKEY[7] & KEY[5] & KEY[6] & nKEY[4] & KEY[1] & nKEY[2] & KEY[0] & nKEY[3];

assign	KEYDOWN = nKEY[7] & KEY[5] & KEY[6] & nKEY[4] & nKEY[1] & nKEY[2] & nKEY[0] & nKEY[3];

assign	KEYLEFT = nKEY[7] & KEY[5] & KEY[6] & nKEY[4] & nKEY[1] & nKEY[2] & KEY[0] & nKEY[3];

assign	KEYRIGHT = nKEY[7] & KEY[5] & KEY[6] & nKEY[4] & KEY[1] & nKEY[2] & nKEY[0] & KEY[3];

assign	KEYO = nKEY[7] & nKEY[5] & KEY[6] & nKEY[4] & nKEY[1] & KEY[2] & nKEY[0] & nKEY[3];


always@(posedge CLK)
begin
if (KBINTR)
	begin
	BRK <= KEYBREAK;
	end
end

assign	KEYU = nKEY[7] & KEY[5] & nKEY[6] & KEY[4] & nKEY[1] & KEY[2] & nKEY[0] & KEY[3];

assign	KEYI = nKEY[7] & nKEY[5] & KEY[6] & nKEY[4] & KEY[1] & nKEY[2] & KEY[0] & nKEY[3];

assign	KEYK = nKEY[7] & nKEY[5] & KEY[6] & nKEY[4] & KEY[1] & nKEY[2] & nKEY[0] & nKEY[3];

assign	KEYJ = nKEY[7] & KEY[5] & nKEY[6] & KEY[4] & KEY[1] & nKEY[2] & KEY[0] & KEY[3];

assign	KEYL = nKEY[7] & nKEY[5] & KEY[6] & nKEY[4] & KEY[1] & nKEY[2] & KEY[0] & KEY[3];

assign	KEYKP7 = nKEY[7] & KEY[5] & KEY[6] & nKEY[4] & nKEY[1] & KEY[2] & nKEY[0] & KEY[3];

assign	KEYKP9 = nKEY[7] & KEY[5] & KEY[6] & KEY[4] & nKEY[1] & KEY[2] & KEY[0] & KEY[3];

assign	KEYKP8 = nKEY[7] & KEY[5] & KEY[6] & KEY[4] & nKEY[1] & KEY[2] & KEY[0] & nKEY[3];

assign	KEYKP5 = nKEY[7] & KEY[5] & KEY[6] & KEY[4] & KEY[1] & nKEY[2] & KEY[0] & nKEY[3];

assign	KEYKP4 = nKEY[7] & KEY[5] & KEY[6] & nKEY[4] & KEY[1] & nKEY[2] & KEY[0] & KEY[3];


assign	KEYKP6 = nKEY[7] & KEY[5] & KEY[6] & KEY[4] & nKEY[1] & KEY[2] & nKEY[0] & nKEY[3];

assign	READ = RD & CS;

assign	nBRK =  ~BRK;


always@(posedge CLK)
begin
if (KBINTR)
	begin
	W <= ~W & SYNTHESIZED_WIRE_0 | W & ~SYNTHESIZED_WIRE_1;
	end
end


DC2	b2v_inst35(
	.D0(nBRK),
	.E(KEYW),
	.Q1(SYNTHESIZED_WIRE_0),
	.Q0(SYNTHESIZED_WIRE_1));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	R <= ~R & SYNTHESIZED_WIRE_2 | R & ~SYNTHESIZED_WIRE_3;
	end
end


DC2	b2v_inst37(
	.D0(nBRK),
	.E(KEYR),
	.Q1(SYNTHESIZED_WIRE_2),
	.Q0(SYNTHESIZED_WIRE_3));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	Q <= ~Q & SYNTHESIZED_WIRE_4 | Q & ~SYNTHESIZED_WIRE_5;
	end
end


DC2	b2v_inst39(
	.D0(nBRK),
	.E(KEYQ),
	.Q1(SYNTHESIZED_WIRE_4),
	.Q0(SYNTHESIZED_WIRE_5));

assign	nKEY =  ~KEY;


always@(posedge CLK)
begin
if (KBINTR)
	begin
	E <= ~E & SYNTHESIZED_WIRE_6 | E & ~SYNTHESIZED_WIRE_7;
	end
end


DC2	b2v_inst41(
	.D0(nBRK),
	.E(KEYE),
	.Q1(SYNTHESIZED_WIRE_6),
	.Q0(SYNTHESIZED_WIRE_7));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	S <= ~S & SYNTHESIZED_WIRE_8 | S & ~SYNTHESIZED_WIRE_9;
	end
end


DC2	b2v_inst43(
	.D0(nBRK),
	.E(KEYS),
	.Q1(SYNTHESIZED_WIRE_8),
	.Q0(SYNTHESIZED_WIRE_9));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	A <= ~A & SYNTHESIZED_WIRE_10 | A & ~SYNTHESIZED_WIRE_11;
	end
end


DC2	b2v_inst45(
	.D0(nBRK),
	.E(KEYA),
	.Q1(SYNTHESIZED_WIRE_10),
	.Q0(SYNTHESIZED_WIRE_11));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	F <= ~F & SYNTHESIZED_WIRE_12 | F & ~SYNTHESIZED_WIRE_13;
	end
end


DC2	b2v_inst47(
	.D0(nBRK),
	.E(KEYF),
	.Q1(SYNTHESIZED_WIRE_12),
	.Q0(SYNTHESIZED_WIRE_13));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	D <= ~D & SYNTHESIZED_WIRE_14 | D & ~SYNTHESIZED_WIRE_15;
	end
end


DC2	b2v_inst49(
	.D0(nBRK),
	.E(KEYD),
	.Q1(SYNTHESIZED_WIRE_14),
	.Q0(SYNTHESIZED_WIRE_15));

assign	KEYQ = nKEY[7] & nKEY[5] & nKEY[6] & KEY[4] & nKEY[1] & KEY[2] & KEY[0] & nKEY[3];


always@(posedge CLK)
begin
if (KBINTR)
	begin
	KP8 <= ~KP8 & SYNTHESIZED_WIRE_16 | KP8 & ~SYNTHESIZED_WIRE_17;
	end
end


DC2	b2v_inst51(
	.D0(nBRK),
	.E(KEYKP8),
	.Q1(SYNTHESIZED_WIRE_16),
	.Q0(SYNTHESIZED_WIRE_17));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	KP7 <= ~KP7 & SYNTHESIZED_WIRE_18 | KP7 & ~SYNTHESIZED_WIRE_19;
	end
end


DC2	b2v_inst53(
	.D0(nBRK),
	.E(KEYKP7),
	.Q1(SYNTHESIZED_WIRE_18),
	.Q0(SYNTHESIZED_WIRE_19));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	KP4 <= ~KP4 & SYNTHESIZED_WIRE_20 | KP4 & ~SYNTHESIZED_WIRE_21;
	end
end


DC2	b2v_inst55(
	.D0(nBRK),
	.E(KEYKP4),
	.Q1(SYNTHESIZED_WIRE_20),
	.Q0(SYNTHESIZED_WIRE_21));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	KP9 <= ~KP9 & SYNTHESIZED_WIRE_22 | KP9 & ~SYNTHESIZED_WIRE_23;
	end
end


DC2	b2v_inst57(
	.D0(nBRK),
	.E(KEYKP9),
	.Q1(SYNTHESIZED_WIRE_22),
	.Q0(SYNTHESIZED_WIRE_23));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	KP6 <= ~KP6 & SYNTHESIZED_WIRE_24 | KP6 & ~SYNTHESIZED_WIRE_25;
	end
end


DC2	b2v_inst59(
	.D0(nBRK),
	.E(KEYKP6),
	.Q1(SYNTHESIZED_WIRE_24),
	.Q0(SYNTHESIZED_WIRE_25));

assign	KEYE = nKEY[7] & KEY[5] & nKEY[6] & nKEY[4] & nKEY[1] & KEY[2] & nKEY[0] & nKEY[3];


always@(posedge CLK)
begin
if (KBINTR)
	begin
	KP5 <= ~KP5 & SYNTHESIZED_WIRE_26 | KP5 & ~SYNTHESIZED_WIRE_27;
	end
end


DC2	b2v_inst61(
	.D0(nBRK),
	.E(KEYKP5),
	.Q1(SYNTHESIZED_WIRE_26),
	.Q0(SYNTHESIZED_WIRE_27));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	RSHIFT <= ~RSHIFT & SYNTHESIZED_WIRE_28 | RSHIFT & ~SYNTHESIZED_WIRE_29;
	end
end


DC2	b2v_inst63(
	.D0(nBRK),
	.E(KEYRSHIFT),
	.Q1(SYNTHESIZED_WIRE_28),
	.Q0(SYNTHESIZED_WIRE_29));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	RCTRL <= ~RCTRL & SYNTHESIZED_WIRE_30 | RCTRL & ~SYNTHESIZED_WIRE_31;
	end
end


DC2	b2v_inst65(
	.D0(nBRK),
	.E(KEYRCTRL),
	.Q1(SYNTHESIZED_WIRE_30),
	.Q0(SYNTHESIZED_WIRE_31));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	DOWN <= ~DOWN & SYNTHESIZED_WIRE_32 | DOWN & ~SYNTHESIZED_WIRE_33;
	end
end


DC2	b2v_inst67(
	.D0(nBRK),
	.E(KEYDOWN),
	.Q1(SYNTHESIZED_WIRE_32),
	.Q0(SYNTHESIZED_WIRE_33));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	UP <= ~UP & SYNTHESIZED_WIRE_34 | UP & ~SYNTHESIZED_WIRE_35;
	end
end


DC2	b2v_inst69(
	.D0(nBRK),
	.E(KEYUP),
	.Q1(SYNTHESIZED_WIRE_34),
	.Q0(SYNTHESIZED_WIRE_35));

assign	KEYR = nKEY[7] & KEY[5] & nKEY[6] & nKEY[4] & nKEY[1] & KEY[2] & KEY[0] & KEY[3];


always@(posedge CLK)
begin
if (KBINTR)
	begin
	RIGHT <= ~RIGHT & SYNTHESIZED_WIRE_36 | RIGHT & ~SYNTHESIZED_WIRE_37;
	end
end


DC2	b2v_inst71(
	.D0(nBRK),
	.E(KEYRIGHT),
	.Q1(SYNTHESIZED_WIRE_36),
	.Q0(SYNTHESIZED_WIRE_37));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	LEFT <= ~LEFT & SYNTHESIZED_WIRE_38 | LEFT & ~SYNTHESIZED_WIRE_39;
	end
end


DC2	b2v_inst73(
	.D0(nBRK),
	.E(KEYLEFT),
	.Q1(SYNTHESIZED_WIRE_38),
	.Q0(SYNTHESIZED_WIRE_39));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	I <= ~I & SYNTHESIZED_WIRE_40 | I & ~SYNTHESIZED_WIRE_41;
	end
end


DC2	b2v_inst75(
	.D0(nBRK),
	.E(KEYI),
	.Q1(SYNTHESIZED_WIRE_40),
	.Q0(SYNTHESIZED_WIRE_41));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	U <= ~U & SYNTHESIZED_WIRE_42 | U & ~SYNTHESIZED_WIRE_43;
	end
end


DC2	b2v_inst77(
	.D0(nBRK),
	.E(KEYU),
	.Q1(SYNTHESIZED_WIRE_42),
	.Q0(SYNTHESIZED_WIRE_43));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	J <= ~J & SYNTHESIZED_WIRE_44 | J & ~SYNTHESIZED_WIRE_45;
	end
end


DC2	b2v_inst79(
	.D0(nBRK),
	.E(KEYJ),
	.Q1(SYNTHESIZED_WIRE_44),
	.Q0(SYNTHESIZED_WIRE_45));

assign	KEYF = nKEY[7] & KEY[5] & nKEY[6] & nKEY[4] & KEY[1] & nKEY[2] & KEY[0] & KEY[3];


always@(posedge CLK)
begin
if (KBINTR)
	begin
	O <= ~O & SYNTHESIZED_WIRE_46 | O & ~SYNTHESIZED_WIRE_47;
	end
end


DC2	b2v_inst81(
	.D0(nBRK),
	.E(KEYO),
	.Q1(SYNTHESIZED_WIRE_46),
	.Q0(SYNTHESIZED_WIRE_47));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	LL <= ~LL & SYNTHESIZED_WIRE_48 | LL & ~SYNTHESIZED_WIRE_49;
	end
end


DC2	b2v_inst83(
	.D0(nBRK),
	.E(KEYL),
	.Q1(SYNTHESIZED_WIRE_48),
	.Q0(SYNTHESIZED_WIRE_49));


always@(posedge CLK)
begin
if (KBINTR)
	begin
	K <= ~K & SYNTHESIZED_WIRE_50 | K & ~SYNTHESIZED_WIRE_51;
	end
end


DC2	b2v_inst85(
	.D0(nBRK),
	.E(KEYK),
	.Q1(SYNTHESIZED_WIRE_50),
	.Q0(SYNTHESIZED_WIRE_51));


REG8_LD_SR	b2v_inst86(
	.CLK(CLK),
	.LD(OUT0),
	.SR(READ),
	.IR(L),
	.DIN(GDFX_TEMP_SIGNAL_0),
	.S(P0)
	);


REG8_LD_SR	b2v_inst87(
	.CLK(CLK),
	.LD(OUT0),
	.SR(READ),
	.IR(L),
	.DIN(GDFX_TEMP_SIGNAL_1),
	.S(P1)
	);


REG8_LD_SR	b2v_inst88(
	.CLK(CLK),
	.LD(OUT0),
	.SR(READ),
	.IR(L),
	.DIN(GDFX_TEMP_SIGNAL_2),
	.S(P2)
	);


REG8_LD_SR	b2v_inst89(
	.CLK(CLK),
	.LD(OUT0),
	.SR(READ),
	.IR(L),
	.DIN(GDFX_TEMP_SIGNAL_3),
	.S(P3)
	);

assign	KEYW = nKEY[7] & nKEY[5] & nKEY[6] & KEY[4] & nKEY[1] & KEY[2] & KEY[0] & KEY[3];


MX2x2	b2v_inst91(
	.S0(ADDR[0]),
	.D0_(GDFX_TEMP_SIGNAL_4),
	.D1_(GDFX_TEMP_SIGNAL_5),
	.Q(PDAT[1:0]));

assign	DATA[7] = READ ? PDAT[7] : 1'bz;
assign	DATA[6] = READ ? PDAT[6] : 1'bz;
assign	DATA[5] = READ ? PDAT[5] : 1'bz;
assign	DATA[4] = READ ? PDAT[4] : 1'bz;
assign	DATA[3] = READ ? PDAT[3] : 1'bz;
assign	DATA[2] = READ ? PDAT[2] : 1'bz;
assign	DATA[1] = READ ? PDAT[1] : 1'bz;
assign	DATA[0] = READ ? PDAT[0] : 1'bz;

assign	PDAT[7:2] = GDFX_TEMP_SIGNAL_6;


assign	L = 0;

endmodule
