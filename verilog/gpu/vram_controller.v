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
// CREATED		"Tue Aug  8 16:28:31 2023"

module vram_controller(
	read_scanline,
	write_pixel,
	start,
	CLK,
	X,
	Y,
	SDRAM_CLK,
	SDRAM_CKE,
	nSDRAM_CS,
	nSDRAM_RAS,
	nSDRAM_CAS,
	nSDRAM_WE,
	SDRAM_UDQM,
	SDRAM_LDQM,
	READY,
	D,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ
);


input wire	read_scanline;
input wire	write_pixel;
input wire	start;
input wire	CLK;
input wire	[9:0] X;
input wire	[9:0] Y;
output wire	SDRAM_CLK;
output wire	SDRAM_CKE;
output wire	nSDRAM_CS;
output wire	nSDRAM_RAS;
output wire	nSDRAM_CAS;
output wire	nSDRAM_WE;
output wire	SDRAM_UDQM;
output wire	SDRAM_LDQM;
output wire	READY;
inout wire	[15:0] D;
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;

wire	[11:0] A;
wire	[3:0] ACTIVE_CMD;
wire	[1:0] BA;
wire	[1:0] BA_PREV;
wire	[3:0] CMD_ACT;
wire	[3:0] CMD_BST;
wire	CMD_CNT;
wire	CMD_CURR_ACT;
wire	CMD_CURR_BST;
wire	CMD_CURR_DESL;
wire	CMD_CURR_MRS;
wire	CMD_CURR_NOP;
wire	CMD_CURR_PRE;
wire	CMD_CURR_PREA;
wire	CMD_CURR_READ;
wire	CMD_CURR_READA;
wire	CMD_CURR_REF;
wire	CMD_CURR_SELF;
wire	CMD_CURR_WRITE;
wire	CMD_CURR_WRITEA;
wire	[3:0] CMD_CURRENT;
wire	[3:0] CMD_DESL;
wire	CMD_DONE;
wire	CMD_LD;
wire	[3:0] CMD_MRS;
wire	[1:0] CMD_MRS_CNT;
wire	[3:0] CMD_NEXT;
wire	[3:0] CMD_NOP;
wire	[3:0] CMD_PRE;
wire	[3:0] CMD_PREA;
wire	[3:0] CMD_READ;
wire	[3:0] CMD_READ_SCAN;
wire	[3:0] CMD_READA;
wire	[3:0] CMD_REF;
wire	[1:0] CMD_REF_CNT;
wire	[3:0] CMD_SELF;
wire	[3:0] CMD_WRITE;
wire	[3:0] CMD_WRITE_PIXEL;
wire	[3:0] CMD_WRITEA;
reg	CURR_MODE;
wire	H;
wire	L;
wire	nCMD_MRS_LAST;
wire	nCMD_REF_LAST;
wire	NEW_MODE;
wire	nPOWERON_FINISHED;
wire	nPOWERON_REF_EXIT;
wire	OUT_ACT;
wire	OUT_BST;
wire	OUT_DESL;
wire	OUT_MRS;
wire	OUT_NOP;
wire	OUT_PRE;
wire	OUT_PREA;
wire	OUT_READ;
wire	OUT_READA;
wire	OUT_REF;
wire	[3:0] OUT_SDRAM;
wire	OUT_SELF;
wire	OUT_WRITE;
wire	OUT_WRITEA;
wire	[3:0] POWERON_CMD;
wire	[1:0] POWERON_CNT;
wire	POWERON_FINISHED;
wire	POWERON_PREA_EXIT;
wire	[3:0] POWERON_REF_CNT;
wire	POWERON_REF_DONE_TRIG;
wire	POWERON_REF_EXIT;
wire	[15:0] POWERON_STABLE_CNT;
wire	POWERON_STABLE_EXIT;
wire	POWERON_STATE_MRS;
wire	POWERON_STATE_PREA;
wire	POWERON_STATE_REF_LOOP;
wire	POWERON_STATE_STABLE;
wire	POWERON_STATE_UPDATE;
wire	READ_SCAN_ACT_EXIT;
wire	[1:0] READ_SCAN_CNT;
wire	READ_SCAN_PRE_EXIT;
wire	[7:0] READ_SCAN_READ_CNT;
wire	READ_SCAN_READ_EXIT;
wire	READ_SCAN_STATE_ACT;
wire	READ_SCAN_STATE_IDLE;
wire	READ_SCAN_STATE_PRE;
wire	READ_SCAN_STATE_READ;
wire	READY_ALTERA_SYNTHESIZED;
wire	RESET_READY;
wire	SET_READY;
wire	START_MODE;
reg	DFF_inst98;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[0:3] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
reg	SRFF_inst124;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
reg	SRFF_inst131;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_12;
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
wire	SYNTHESIZED_WIRE_60;
reg	SRFF_inst24;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_64;
reg	SRFF_inst17;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_47;
reg	SRFF_inst20;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_50;
reg	DFF_inst30;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_52;
reg	SRFF_inst106;
reg	SRFF_inst86;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;

assign	SDRAM_CLK = CLK;
assign	SYNTHESIZED_WIRE_4 = 0;
wire	[7:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_17;
wire	[3:0] GDFX_TEMP_SIGNAL_5;
wire	[3:0] GDFX_TEMP_SIGNAL_6;
wire	[3:0] GDFX_TEMP_SIGNAL_7;
wire	[3:0] GDFX_TEMP_SIGNAL_9;
wire	[3:0] GDFX_TEMP_SIGNAL_18;
wire	[3:0] GDFX_TEMP_SIGNAL_3;
wire	[3:0] GDFX_TEMP_SIGNAL_4;
wire	[3:0] GDFX_TEMP_SIGNAL_24;
wire	[3:0] GDFX_TEMP_SIGNAL_23;
wire	[3:0] GDFX_TEMP_SIGNAL_8;
wire	[3:0] GDFX_TEMP_SIGNAL_22;
wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_2;
wire	[3:0] GDFX_TEMP_SIGNAL_11;
wire	[3:0] GDFX_TEMP_SIGNAL_12;
wire	[3:0] GDFX_TEMP_SIGNAL_13;
wire	[3:0] GDFX_TEMP_SIGNAL_14;
wire	[3:0] GDFX_TEMP_SIGNAL_21;
wire	[3:0] GDFX_TEMP_SIGNAL_10;
wire	[3:0] GDFX_TEMP_SIGNAL_20;
wire	[3:0] GDFX_TEMP_SIGNAL_15;
wire	[3:0] GDFX_TEMP_SIGNAL_16;
wire	[3:0] GDFX_TEMP_SIGNAL_19;


assign	GDFX_TEMP_SIGNAL_0 = {H,H,L,L,H,L,L,H};
assign	GDFX_TEMP_SIGNAL_17 = {L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_5 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_6 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_7 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_9 = {L,L,L,L};
assign	GDFX_TEMP_SIGNAL_18 = {L,L,L,L};
assign	GDFX_TEMP_SIGNAL_3 = {L,L,L,H};
assign	GDFX_TEMP_SIGNAL_4 = {L,L,L,H};
assign	GDFX_TEMP_SIGNAL_24 = {H,L,H,H};
assign	GDFX_TEMP_SIGNAL_23 = {H,L,L,H};
assign	GDFX_TEMP_SIGNAL_8 = {H,L,L,L};
assign	GDFX_TEMP_SIGNAL_22 = {H,L,L,L};
assign	GDFX_TEMP_SIGNAL_1 = {L,H,H,H};
assign	GDFX_TEMP_SIGNAL_2 = {L,H,H,L};
assign	GDFX_TEMP_SIGNAL_11 = {L,H,L,H};
assign	GDFX_TEMP_SIGNAL_12 = {L,H,L,H};
assign	GDFX_TEMP_SIGNAL_13 = {L,H,L,L};
assign	GDFX_TEMP_SIGNAL_14 = {L,H,L,L};
assign	GDFX_TEMP_SIGNAL_21 = {L,H,L,L};
assign	GDFX_TEMP_SIGNAL_10 = {L,L,H,H};
assign	GDFX_TEMP_SIGNAL_20 = {L,L,H,H};
assign	GDFX_TEMP_SIGNAL_15 = {L,L,H,L};
assign	GDFX_TEMP_SIGNAL_16 = {L,L,H,L};
assign	GDFX_TEMP_SIGNAL_19 = {L,L,H,L};


CMP8	b2v_CMP201(
	.A(READ_SCAN_READ_CNT),
	.B(GDFX_TEMP_SIGNAL_0),
	
	.E(READ_SCAN_READ_EXIT)
	);

assign	POWERON_REF_EXIT = POWERON_REF_CNT[3] & CMD_DONE;


REG4_INC_CL	b2v_inst1(
	.CLK(CLK),
	.INC(POWERON_REF_DONE_TRIG),
	.CL(L),
	.DOUT(POWERON_REF_CNT));


DC4	b2v_inst10(
	.D1(POWERON_CNT[1]),
	.D0(POWERON_CNT[0]),
	.E(H),
	.Q3(POWERON_STATE_MRS),
	.Q2(POWERON_STATE_REF_LOOP),
	
	.Q0(POWERON_STATE_STABLE));

assign	CMD_LD = DFF_inst98 ? H : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_57 ? H : 1'bz;


MX4x1	b2v_inst102(
	.D3(L),
	.D2(READ_SCAN_READ_EXIT),
	.D1(READ_SCAN_ACT_EXIT),
	.D0(READ_SCAN_PRE_EXIT),
	.S1(READ_SCAN_CNT[1]),
	.S0(READ_SCAN_CNT[0]),
	.Q(SYNTHESIZED_WIRE_1));


REG2_INC_CL	b2v_inst103(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_1),
	.CL(START_MODE),
	.DOUT(READ_SCAN_CNT));

assign	SYNTHESIZED_WIRE_3 = CMD_CURR_ACT & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_2 =  ~CMD_LD;


always@(posedge CLK)
begin
	SRFF_inst106 <= ~SRFF_inst106 & SYNTHESIZED_WIRE_3 | SRFF_inst106 & ~CMD_LD;
end

assign	RESET_READY = L;



assign	CMD_WRITE_PIXEL = SYNTHESIZED_WIRE_4;


assign	SYNTHESIZED_WIRE_17 = CMD_CURR_PREA & SYNTHESIZED_WIRE_5;

assign	D = SDRAM_DQ;



DC2	b2v_inst113(
	.D0(SRFF_inst124),
	.E(CMD_CURR_READ),
	.Q1(SYNTHESIZED_WIRE_7),
	.Q0(SYNTHESIZED_WIRE_58));


REG8_INC_CL	b2v_inst115(
	.CLK(CLK),
	.INC(READ_SCAN_STATE_READ),
	.CL(CMD_LD),
	.DOUT(READ_SCAN_READ_CNT));

assign	OUT_READ = SYNTHESIZED_WIRE_58 ? H : 1'bz;

assign	OUT_NOP = SYNTHESIZED_WIRE_7 ? H : 1'bz;


assign	CMD_DONE = SYNTHESIZED_WIRE_58 ? H : 1'bz;

assign	SYNTHESIZED_WIRE_10 = CMD_CURR_READ & SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_9 =  ~CMD_LD;


always@(posedge CLK)
begin
	SRFF_inst124 <= ~SRFF_inst124 & SYNTHESIZED_WIRE_10 | SRFF_inst124 & ~CMD_LD;
end


DC2	b2v_inst125(
	.D0(SRFF_inst131),
	.E(CMD_CURR_WRITE),
	.Q1(SYNTHESIZED_WIRE_12),
	.Q0(SYNTHESIZED_WIRE_59));

assign	OUT_WRITE = SYNTHESIZED_WIRE_59 ? H : 1'bz;

assign	OUT_NOP = SYNTHESIZED_WIRE_12 ? H : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_59 ? H : 1'bz;

assign	SYNTHESIZED_WIRE_15 = CMD_CURR_WRITE & SYNTHESIZED_WIRE_14;


assign	SYNTHESIZED_WIRE_14 =  ~CMD_LD;


always@(posedge CLK)
begin
	SRFF_inst131 <= ~SRFF_inst131 & SYNTHESIZED_WIRE_15 | SRFF_inst131 & ~CMD_LD;
end

assign	READ_SCAN_ACT_EXIT = READ_SCAN_STATE_ACT & CMD_DONE;

assign	SYNTHESIZED_WIRE_5 =  ~CMD_LD;

assign	SYNTHESIZED_WIRE_19 = CMD_CURR_PRE & SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_16 =  ~CMD_LD;


always@(posedge CLK)
begin
	SRFF_inst17 <= ~SRFF_inst17 & SYNTHESIZED_WIRE_17 | SRFF_inst17 & ~CMD_LD;
end

assign	POWERON_STABLE_EXIT = POWERON_STABLE_CNT[13] & SYNTHESIZED_WIRE_18 & POWERON_STABLE_CNT[11];

assign	SYNTHESIZED_WIRE_18 =  ~POWERON_STABLE_CNT[12];


MX4x4	b2v_inst2(
	.S1(POWERON_CNT[1]),
	.S0(POWERON_CNT[0]),
	.D0_(CMD_NOP),
	.D1_(CMD_PREA),
	.D2_(CMD_REF),
	.D3_(CMD_MRS),
	.Q_(POWERON_CMD));


always@(posedge CLK)
begin
	SRFF_inst20 <= ~SRFF_inst20 & SYNTHESIZED_WIRE_19 | SRFF_inst20 & ~CMD_LD;
end

assign	POWERON_REF_DONE_TRIG = POWERON_STATE_REF_LOOP & CMD_DONE;


CD16	b2v_inst22(
	.D15(L),
	.D14(L),
	.D13(L),
	.D12(OUT_SELF),
	.D11(OUT_REF),
	.D10(OUT_BST),
	.D9(OUT_PREA),
	.D8(OUT_PRE),
	.D7(OUT_WRITEA),
	.D6(OUT_WRITE),
	.D5(OUT_READA),
	.D4(OUT_READ),
	.D3(OUT_ACT),
	.D2(OUT_MRS),
	.D1(OUT_DESL),
	.D0(OUT_NOP),
	.Q3(SYNTHESIZED_WIRE_20),
	.Q2(SYNTHESIZED_WIRE_21),
	.Q1(SYNTHESIZED_WIRE_22),
	.Q0(SYNTHESIZED_WIRE_23)
	);


MX16x4	b2v_inst23(
	.S3(SYNTHESIZED_WIRE_20),
	.S2(SYNTHESIZED_WIRE_21),
	.S1(SYNTHESIZED_WIRE_22),
	.S0(SYNTHESIZED_WIRE_23),
	.D0_(GDFX_TEMP_SIGNAL_1),
	.D10_(GDFX_TEMP_SIGNAL_2),
	.D11_(GDFX_TEMP_SIGNAL_3),
	.D12_(GDFX_TEMP_SIGNAL_4),
	.D13_(GDFX_TEMP_SIGNAL_5),
	.D14_(GDFX_TEMP_SIGNAL_6),
	.D15_(GDFX_TEMP_SIGNAL_7),
	.D1_(GDFX_TEMP_SIGNAL_8),
	.D2_(GDFX_TEMP_SIGNAL_9),
	.D3_(GDFX_TEMP_SIGNAL_10),
	.D4_(GDFX_TEMP_SIGNAL_11),
	.D5_(GDFX_TEMP_SIGNAL_12),
	.D6_(GDFX_TEMP_SIGNAL_13),
	.D7_(GDFX_TEMP_SIGNAL_14),
	.D8_(GDFX_TEMP_SIGNAL_15),
	.D9_(GDFX_TEMP_SIGNAL_16),
	.Q_(OUT_SDRAM));


always@(posedge CLK)
begin
	SRFF_inst24 <= ~SRFF_inst24 & SYNTHESIZED_WIRE_60 | SRFF_inst24 & ~L;
end

assign	SYNTHESIZED_WIRE_60 = POWERON_STATE_MRS & CMD_DONE;

assign	POWERON_FINISHED = SRFF_inst24 | SYNTHESIZED_WIRE_60;


MX2x4	b2v_inst27(
	.S0(POWERON_FINISHED),
	.D0_(POWERON_CMD),
	.D1_(ACTIVE_CMD),
	.Q(CMD_NEXT));


CMP16	b2v_inst28(
	.A(POWERON_STABLE_CNT),
	.B(GDFX_TEMP_SIGNAL_17),
	
	.E(SYNTHESIZED_WIRE_47)
	);

assign	nPOWERON_REF_EXIT =  ~POWERON_REF_EXIT;


REG2_INC_CL	b2v_inst3(
	.CLK(CLK),
	.INC(POWERON_STATE_UPDATE),
	.CL(L),
	.DOUT(POWERON_CNT));


always@(posedge CLK)
begin
	begin
	DFF_inst30 <= SYNTHESIZED_WIRE_26;
	end
end

assign	SYNTHESIZED_WIRE_26 = POWERON_STATE_UPDATE | POWERON_STATE_UPDATE;

assign	POWERON_PREA_EXIT = H;


assign	SYNTHESIZED_WIRE_50 = POWERON_REF_DONE_TRIG & nPOWERON_REF_EXIT;

assign	nPOWERON_FINISHED =  ~POWERON_FINISHED;

assign	OUT_SELF = L;



assign	CMD_NOP = GDFX_TEMP_SIGNAL_18;


assign	CMD_MRS = GDFX_TEMP_SIGNAL_19;


assign	CMD_ACT = GDFX_TEMP_SIGNAL_20;


assign	SDRAM_DQ[15] = L ? D[15] : 1'bz;
assign	SDRAM_DQ[14] = L ? D[14] : 1'bz;
assign	SDRAM_DQ[13] = L ? D[13] : 1'bz;
assign	SDRAM_DQ[12] = L ? D[12] : 1'bz;
assign	SDRAM_DQ[11] = L ? D[11] : 1'bz;
assign	SDRAM_DQ[10] = L ? D[10] : 1'bz;
assign	SDRAM_DQ[9] = L ? D[9] : 1'bz;
assign	SDRAM_DQ[8] = L ? D[8] : 1'bz;
assign	SDRAM_DQ[7] = L ? D[7] : 1'bz;
assign	SDRAM_DQ[6] = L ? D[6] : 1'bz;
assign	SDRAM_DQ[5] = L ? D[5] : 1'bz;
assign	SDRAM_DQ[4] = L ? D[4] : 1'bz;
assign	SDRAM_DQ[3] = L ? D[3] : 1'bz;
assign	SDRAM_DQ[2] = L ? D[2] : 1'bz;
assign	SDRAM_DQ[1] = L ? D[1] : 1'bz;
assign	SDRAM_DQ[0] = L ? D[0] : 1'bz;

assign	CMD_READ = GDFX_TEMP_SIGNAL_21;




assign	CMD_PRE = GDFX_TEMP_SIGNAL_22;


assign	CMD_PREA = GDFX_TEMP_SIGNAL_23;



assign	CMD_REF = GDFX_TEMP_SIGNAL_24;




REG2_INC_CL	b2v_inst48(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_27),
	.CL(CMD_LD),
	.DOUT(CMD_REF_CNT));


DC4	b2v_inst49(
	.D1(CMD_REF_CNT[1]),
	.D0(CMD_REF_CNT[0]),
	.E(CMD_CURR_REF),
	.Q3(SYNTHESIZED_WIRE_62),
	.Q2(SYNTHESIZED_WIRE_61),
	.Q1(SYNTHESIZED_WIRE_30),
	.Q0(SYNTHESIZED_WIRE_33));


MX4x1	b2v_inst5(
	
	.D2(POWERON_REF_EXIT),
	.D1(POWERON_PREA_EXIT),
	.D0(POWERON_STABLE_EXIT),
	.S1(POWERON_CNT[1]),
	.S0(POWERON_CNT[0]),
	.Q(POWERON_STATE_UPDATE));


REG2_INC_CL	b2v_inst50(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_28),
	.CL(CMD_LD),
	.DOUT(CMD_MRS_CNT));

assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_61 | SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_62;

assign	OUT_NOP = SYNTHESIZED_WIRE_32 ? H : 1'bz;

assign	OUT_REF = SYNTHESIZED_WIRE_33 ? H : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_61 ? H : 1'bz;

assign	OUT_PREA = SYNTHESIZED_WIRE_63 ? H : 1'bz;

assign	OUT_NOP = SYNTHESIZED_WIRE_36 ? H : 1'bz;

assign	OUT_PRE = SYNTHESIZED_WIRE_64 ? H : 1'bz;


DC2	b2v_inst58(
	.D0(SRFF_inst17),
	.E(CMD_CURR_PREA),
	.Q1(SYNTHESIZED_WIRE_36),
	.Q0(SYNTHESIZED_WIRE_63));

assign	CMD_DONE = SYNTHESIZED_WIRE_63 ? H : 1'bz;


REG4_LD_CL	b2v_inst6(
	.CLK(CLK),
	.LD(CMD_LD),
	
	.DIN(CMD_NEXT),
	.DOUT(CMD_CURRENT));


DC4	b2v_inst60(
	.D1(CMD_MRS_CNT[1]),
	.D0(CMD_MRS_CNT[0]),
	.E(CMD_CURR_MRS),
	.Q3(SYNTHESIZED_WIRE_66),
	.Q2(SYNTHESIZED_WIRE_40),
	.Q1(SYNTHESIZED_WIRE_65),
	.Q0(SYNTHESIZED_WIRE_44));

assign	nCMD_REF_LAST =  ~SYNTHESIZED_WIRE_62;

assign	SYNTHESIZED_WIRE_27 = CMD_CURR_REF & nCMD_REF_LAST;

assign	SYNTHESIZED_WIRE_43 = SYNTHESIZED_WIRE_40 | SYNTHESIZED_WIRE_65 | SYNTHESIZED_WIRE_66;

assign	OUT_NOP = SYNTHESIZED_WIRE_43 ? H : 1'bz;

assign	OUT_MRS = SYNTHESIZED_WIRE_44 ? H : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_65 ? H : 1'bz;

assign	SYNTHESIZED_WIRE_28 = CMD_CURR_MRS & nCMD_MRS_LAST;

assign	nCMD_MRS_LAST =  ~SYNTHESIZED_WIRE_66;

assign	CMD_LD = SYNTHESIZED_WIRE_47 ? H : 1'bz;


REG16_INC_CL	b2v_inst7(
	.CLK(CLK),
	.INC(POWERON_STATE_STABLE),
	.CL(L),
	.DOUT(POWERON_STABLE_CNT));

assign	OUT_NOP = CMD_CURR_NOP ? H : 1'bz;


DC2	b2v_inst71(
	.D0(SRFF_inst20),
	.E(CMD_CURR_PRE),
	.Q1(SYNTHESIZED_WIRE_48),
	.Q0(SYNTHESIZED_WIRE_64));

assign	OUT_NOP = SYNTHESIZED_WIRE_48 ? H : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_64 ? H : 1'bz;


assign	OUT_BST = L;


assign	OUT_WRITEA = L;



MX4x4	b2v_inst77(
	.S1(READ_SCAN_CNT[1]),
	.S0(READ_SCAN_CNT[0]),
	.D0_(CMD_PRE),
	.D1_(CMD_ACT),
	.D2_(CMD_READ),
	.D3_(CMD_NOP),
	.Q_(CMD_READ_SCAN));

assign	OUT_READA = L;



DC4	b2v_inst79(
	.D1(READ_SCAN_CNT[1]),
	.D0(READ_SCAN_CNT[0]),
	.E(H),
	
	.Q2(READ_SCAN_STATE_READ),
	.Q1(READ_SCAN_STATE_ACT)
	);


REG8_INC_CL	b2v_inst8(
	.CLK(CLK),
	.INC(H),
	.CL(CMD_LD)
	);

assign	READ_SCAN_PRE_EXIT = H;



REG2_LD_CL	b2v_inst81(
	.CLK(CLK),
	
	
	
	.DOUT(BA));


REG12_LD_CL	b2v_inst82(
	.CLK(CLK),
	
	
	
	.DOUT(A));

assign	SET_READY = H;


assign	CMD_LD = SYNTHESIZED_WIRE_50 ? H : 1'bz;

assign	CMD_LD = DFF_inst30 ? H : 1'bz;


always@(posedge CLK)
begin
	SRFF_inst86 <= ~SRFF_inst86 & SYNTHESIZED_WIRE_67 | SRFF_inst86 & ~RESET_READY;
end


REG2_LD_CL	b2v_inst87(
	.CLK(CLK),
	
	
	.DIN(BA)
	);

assign	OUT_DESL = CMD_CURR_DESL ? H : 1'bz;

assign	SYNTHESIZED_WIRE_67 = SET_READY & SYNTHESIZED_WIRE_52;


DC16	b2v_inst9(
	.D3(CMD_CURRENT[3]),
	.D2(CMD_CURRENT[2]),
	.D1(CMD_CURRENT[1]),
	.D0(CMD_CURRENT[0]),
	.E(H),
	
	
	
	
	.Q11(CMD_CURR_REF),
	
	.Q9(CMD_CURR_PREA),
	.Q8(CMD_CURR_PRE),
	
	.Q6(CMD_CURR_WRITE),
	
	.Q4(CMD_CURR_READ),
	.Q3(CMD_CURR_ACT),
	.Q2(CMD_CURR_MRS),
	.Q1(CMD_CURR_DESL),
	.Q0(CMD_CURR_NOP));

assign	SYNTHESIZED_WIRE_52 =  ~RESET_READY;


DC2	b2v_inst91(
	.D0(SRFF_inst106),
	.E(CMD_CURR_ACT),
	.Q1(SYNTHESIZED_WIRE_56),
	.Q0(SYNTHESIZED_WIRE_57));

assign	READY_ALTERA_SYNTHESIZED = SRFF_inst86 | SYNTHESIZED_WIRE_67;


CD2	b2v_inst93(
	.D1(write_pixel),
	.D0(read_scanline),
	.W(SYNTHESIZED_WIRE_55),
	.Q(NEW_MODE));

assign	OUT_ACT = SYNTHESIZED_WIRE_57 ? H : 1'bz;


always@(posedge CLK)
begin
if (START_MODE)
	begin
	CURR_MODE <= NEW_MODE;
	end
end

assign	START_MODE = SYNTHESIZED_WIRE_55 & READY_ALTERA_SYNTHESIZED;


MX2x4	b2v_inst97(
	.S0(CURR_MODE),
	.D0_(CMD_WRITE_PIXEL),
	.D1_(CMD_READ_SCAN),
	.Q(ACTIVE_CMD));


always@(posedge CLK)
begin
	begin
	DFF_inst98 <= START_MODE;
	end
end

assign	OUT_NOP = SYNTHESIZED_WIRE_56 ? H : 1'bz;

assign	SDRAM_CKE = H;
assign	nSDRAM_CS = OUT_SDRAM[3];
assign	nSDRAM_RAS = OUT_SDRAM[2];
assign	nSDRAM_CAS = OUT_SDRAM[1];
assign	nSDRAM_WE = OUT_SDRAM[0];
assign	SDRAM_UDQM = nPOWERON_FINISHED;
assign	SDRAM_LDQM = nPOWERON_FINISHED;
assign	READY = READY_ALTERA_SYNTHESIZED;
assign	SDRAM_A = A;
assign	SDRAM_BA = BA;
assign	H = 1;
assign	L = 0;

endmodule
