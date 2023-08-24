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
// CREATED		"Thu Aug 24 10:28:34 2023"

module vram_controller(
	read_scanline,
	write_pixel,
	CLK,
	DIN,
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
	DOUT,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ
);


input wire	read_scanline;
input wire	write_pixel;
input wire	CLK;
input wire	[15:0] DIN;
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
output wire	[15:0] DOUT;
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;

wire	[3:0] ACTIVE_CMD;
wire	[1:0] BA_OUT;
wire	BANK_INTERLEAVE_TRIG;
wire	BANK_LAST;
wire	BANK_NEXT;
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
wire	CMD_DONE;
wire	CMD_DONE_ACT;
wire	CMD_DONE_BST;
wire	CMD_DONE_MRS;
wire	CMD_DONE_PRE;
wire	CMD_DONE_READ;
wire	CMD_DONE_REF;
wire	CMD_LD;
wire	CMD_LD_POWERON_REF;
wire	CMD_LD_POWERON_STABLE;
reg	CMD_LD_STATE_UPDATES;
wire	[3:0] CMD_MRS;
wire	[1:0] CMD_MRS_CNT;
wire	[3:0] CMD_NEXT;
wire	[3:0] CMD_NOP;
wire	[3:0] CMD_PRE;
wire	[3:0] CMD_PREA;
wire	[3:0] CMD_READ;
wire	[3:0] CMD_READ_SCAN;
wire	[3:0] CMD_REF;
wire	[1:0] CMD_REF_CNT;
wire	[3:0] CMD_WRITE;
wire	[3:0] CMD_WRITE_PIX;
reg	CURR_MODE;
wire	[15:0] D_OUT;
wire	H;
wire	L;
wire	MODE_READ_FINISH;
wire	MODE_READ_SCAN;
wire	MODE_WRITE_FINISH;
wire	MODE_WRITE_PIX;
wire	nBANK_LAST;
wire	nCMD_MRS_LAST;
wire	nCMD_REF_LAST;
wire	NEW_MODE;
wire	nPOWERON_FINISHED;
wire	nPOWERON_REF_EXIT;
wire	nREADY;
reg	nSTART;
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
wire	READ_SCAN_STATE_BST;
wire	READ_SCAN_STATE_PRE;
wire	READ_SCAN_STATE_READ;
wire	READ_SCAN_STATE_UPDATE;
wire	READY_ALTERA_SYNTHESIZED;
wire	RESET_READY;
wire	[1:0] SDRAM_BA_ALTERA_SYNTHESIZED;
wire	SET_READY;
wire	START_MODE;
wire	WRITE_PIX_ACT_EXIT;
wire	[1:0] WRITE_PIX_BA;
wire	[1:0] WRITE_PIX_CNT;
wire	WRITE_PIX_PRE_EXIT;
wire	WRITE_PIX_STATE_ACT;
wire	WRITE_PIX_STATE_IDLE;
wire	WRITE_PIX_STATE_PRE;
wire	WRITE_PIX_STATE_UPDATE;
wire	WRITE_PIX_STATE_WRITE;
wire	WRITE_PIX_WRITE_EXIT;
wire	X10;
wire	X11;
wire	X12;
wire	X13;
wire	X14;
wire	X15;
wire	[11:0] X_OUT;
wire	[15:0] X_REL;
wire	[11:0] Y_OUT;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
reg	SRFF_inst86;
wire	SYNTHESIZED_WIRE_4;
reg	SRFF_inst55;
wire	SYNTHESIZED_WIRE_5;
reg	SRFF_inst84;
wire	SYNTHESIZED_WIRE_6;
reg	SRFF_inst88;
wire	[1:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_70;
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
wire	[15:0] SYNTHESIZED_WIRE_30;
wire	[15:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_71;
reg	SRFF_inst24;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
reg	SRFF_inst17;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_58;
reg	SRFF_inst20;
wire	SYNTHESIZED_WIRE_60;
reg	SRFF_inst45;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_68;

assign	SDRAM_CLK = CLK;
assign	SYNTHESIZED_WIRE_69 = 0;
assign	SYNTHESIZED_WIRE_70 = 0;
assign	SYNTHESIZED_WIRE_43 = 0;
wire	[3:0] GDFX_TEMP_SIGNAL_43;
wire	[1:0] GDFX_TEMP_SIGNAL_8;
wire	[7:0] GDFX_TEMP_SIGNAL_0;
wire	[7:0] GDFX_TEMP_SIGNAL_3;
wire	[15:0] GDFX_TEMP_SIGNAL_7;
wire	[15:0] GDFX_TEMP_SIGNAL_16;
wire	[15:0] GDFX_TEMP_SIGNAL_5;
wire	[15:0] GDFX_TEMP_SIGNAL_15;
wire	[15:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_14;
wire	[11:0] GDFX_TEMP_SIGNAL_12;
wire	[11:0] GDFX_TEMP_SIGNAL_11;
wire	[11:0] GDFX_TEMP_SIGNAL_10;
wire	[1:0] GDFX_TEMP_SIGNAL_17;
wire	[1:0] GDFX_TEMP_SIGNAL_44;
wire	[11:0] GDFX_TEMP_SIGNAL_47;
wire	[11:0] GDFX_TEMP_SIGNAL_46;
wire	[3:0] GDFX_TEMP_SIGNAL_19;
wire	[3:0] GDFX_TEMP_SIGNAL_23;
wire	[3:0] GDFX_TEMP_SIGNAL_24;
wire	[3:0] GDFX_TEMP_SIGNAL_25;
wire	[3:0] GDFX_TEMP_SIGNAL_29;
wire	[3:0] GDFX_TEMP_SIGNAL_30;
wire	[3:0] GDFX_TEMP_SIGNAL_21;
wire	[3:0] GDFX_TEMP_SIGNAL_22;
wire	[5:0] GDFX_TEMP_SIGNAL_9;
wire	[15:0] GDFX_TEMP_SIGNAL_13;
wire	[15:0] GDFX_TEMP_SIGNAL_35;
wire	[3:0] GDFX_TEMP_SIGNAL_27;
wire	[3:0] GDFX_TEMP_SIGNAL_36;
wire	[3:0] GDFX_TEMP_SIGNAL_42;
wire	[3:0] GDFX_TEMP_SIGNAL_41;
wire	[3:0] GDFX_TEMP_SIGNAL_26;
wire	[3:0] GDFX_TEMP_SIGNAL_40;
wire	[3:0] GDFX_TEMP_SIGNAL_20;
wire	[3:0] GDFX_TEMP_SIGNAL_45;
wire	[3:0] GDFX_TEMP_SIGNAL_31;
wire	[3:0] GDFX_TEMP_SIGNAL_32;
wire	[3:0] GDFX_TEMP_SIGNAL_39;
wire	[3:0] GDFX_TEMP_SIGNAL_28;
wire	[3:0] GDFX_TEMP_SIGNAL_38;
wire	[3:0] GDFX_TEMP_SIGNAL_33;
wire	[3:0] GDFX_TEMP_SIGNAL_34;
wire	[3:0] GDFX_TEMP_SIGNAL_37;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_4;
wire	[15:0] GDFX_TEMP_SIGNAL_6;
wire	[15:0] GDFX_TEMP_SIGNAL_18;


assign	GDFX_TEMP_SIGNAL_43 = {H,L,H,L};
assign	GDFX_TEMP_SIGNAL_8 = {H,H};
assign	GDFX_TEMP_SIGNAL_0 = {H,H,L,L,L,L,H,H};
assign	GDFX_TEMP_SIGNAL_3 = {H,H,L,L,H,L,L,H};
assign	GDFX_TEMP_SIGNAL_7 = {L,L,L,L,L,L,H,L,L,H,L,H,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_16 = {L,L,L,L,L,L,H,L,L,H,L,H,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_5 = {L,L,L,L,L,L,L,H,H,L,L,H,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_15 = {L,L,L,L,L,L,L,H,H,L,L,H,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_2 = {L,L,L,L,L,L,L,L,H,H,L,L,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_14 = {L,L,L,L,L,L,L,L,H,H,L,L,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_12 = {L,H,L,L,L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_11 = {L,L,L,L,L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_10 = {L,L,H,L,L,L,H,L,L,H,H,H};
assign	GDFX_TEMP_SIGNAL_17 = {L,L};
assign	GDFX_TEMP_SIGNAL_44 = {L,L};
assign	GDFX_TEMP_SIGNAL_47 = {L,L,X_REL[9:0]};
assign	GDFX_TEMP_SIGNAL_46 = {L,L,Y[9:0]};
assign	GDFX_TEMP_SIGNAL_19 = {L,H,H,H};
assign	GDFX_TEMP_SIGNAL_23 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_24 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_25 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_29 = {L,H,L,H};
assign	GDFX_TEMP_SIGNAL_30 = {L,H,L,H};
assign	GDFX_TEMP_SIGNAL_21 = {L,L,L,H};
assign	GDFX_TEMP_SIGNAL_22 = {L,L,L,H};
assign	GDFX_TEMP_SIGNAL_9 = {L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_13 = {L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_35 = {L,L,L,L,L,L,L,L,L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_27 = {L,L,L,L};
assign	GDFX_TEMP_SIGNAL_36 = {L,L,L,L};
assign	GDFX_TEMP_SIGNAL_42 = {H,L,H,H};
assign	GDFX_TEMP_SIGNAL_41 = {H,L,L,H};
assign	GDFX_TEMP_SIGNAL_26 = {H,L,L,L};
assign	GDFX_TEMP_SIGNAL_40 = {H,L,L,L};
assign	GDFX_TEMP_SIGNAL_20 = {L,H,H,L};
assign	GDFX_TEMP_SIGNAL_45 = {L,H,H,L};
assign	GDFX_TEMP_SIGNAL_31 = {L,H,L,L};
assign	GDFX_TEMP_SIGNAL_32 = {L,H,L,L};
assign	GDFX_TEMP_SIGNAL_39 = {L,H,L,L};
assign	GDFX_TEMP_SIGNAL_28 = {L,L,H,H};
assign	GDFX_TEMP_SIGNAL_38 = {L,L,H,H};
assign	GDFX_TEMP_SIGNAL_33 = {L,L,H,L};
assign	GDFX_TEMP_SIGNAL_34 = {L,L,H,L};
assign	GDFX_TEMP_SIGNAL_37 = {L,L,H,L};
assign	GDFX_TEMP_SIGNAL_1 = {X15,X14,X13,X12,X11,X10,X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0]};
assign	GDFX_TEMP_SIGNAL_4 = {X15,X14,X13,X12,X11,X10,X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0]};
assign	GDFX_TEMP_SIGNAL_6 = {X15,X14,X13,X12,X11,X10,X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0]};
assign	GDFX_TEMP_SIGNAL_18 = {X15,X14,X13,X12,X11,X10,X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0]};


CMP8	b2v_CMP195(
	.A(READ_SCAN_READ_CNT),
	.B(GDFX_TEMP_SIGNAL_0),
	
	.E(BANK_INTERLEAVE_TRIG)
	);


CMP16	b2v_CMP200(
	.A(GDFX_TEMP_SIGNAL_1),
	.B(GDFX_TEMP_SIGNAL_2),
	.G(SYNTHESIZED_WIRE_23),
	.E(SYNTHESIZED_WIRE_22),
	.L(SYNTHESIZED_WIRE_29));


CMP8	b2v_CMP201(
	.A(READ_SCAN_READ_CNT),
	.B(GDFX_TEMP_SIGNAL_3),
	.G(SYNTHESIZED_WIRE_63),
	.E(SYNTHESIZED_WIRE_62)
	);


CMP16	b2v_CMP400(
	.A(GDFX_TEMP_SIGNAL_4),
	.B(GDFX_TEMP_SIGNAL_5),
	.G(SYNTHESIZED_WIRE_18),
	.E(SYNTHESIZED_WIRE_17),
	.L(SYNTHESIZED_WIRE_24));


CMP16	b2v_CMP600(
	.A(GDFX_TEMP_SIGNAL_6),
	.B(GDFX_TEMP_SIGNAL_7),
	.G(SYNTHESIZED_WIRE_16),
	.E(SYNTHESIZED_WIRE_15),
	.L(SYNTHESIZED_WIRE_19));

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

assign	nREADY =  ~READY_ALTERA_SYNTHESIZED;

assign	CMD_DONE_PRE = OUT_PRE;



MX4x1	b2v_inst102(
	
	.D2(READ_SCAN_READ_EXIT),
	.D1(READ_SCAN_ACT_EXIT),
	.D0(READ_SCAN_PRE_EXIT),
	.S1(READ_SCAN_CNT[1]),
	.S0(READ_SCAN_CNT[0]),
	.Q(READ_SCAN_STATE_UPDATE));


REG2_INC_CL	b2v_inst103(
	.CLK(CLK),
	.INC(READ_SCAN_STATE_UPDATE),
	.CL(SYNTHESIZED_WIRE_0),
	.DOUT(READ_SCAN_CNT));


CMP2	b2v_inst104(
	.A(SDRAM_BA_ALTERA_SYNTHESIZED),
	.B(GDFX_TEMP_SIGNAL_8),
	
	.E(BANK_LAST)
	);

assign	WRITE_PIX_PRE_EXIT = WRITE_PIX_STATE_PRE & CMD_DONE;

assign	CMD_DONE_BST = OUT_BST;



MX4x1	b2v_inst107(
	.D3(L),
	.D2(WRITE_PIX_WRITE_EXIT),
	.D1(WRITE_PIX_ACT_EXIT),
	.D0(WRITE_PIX_PRE_EXIT),
	.S1(WRITE_PIX_CNT[1]),
	.S0(WRITE_PIX_CNT[0]),
	.Q(WRITE_PIX_STATE_UPDATE));

assign	WRITE_PIX_WRITE_EXIT = WRITE_PIX_STATE_WRITE;


assign	MODE_WRITE_FINISH = WRITE_PIX_STATE_WRITE;


assign	SYNTHESIZED_WIRE_32 = CMD_CURR_PREA & SYNTHESIZED_WIRE_1;

assign	nBANK_LAST =  ~BANK_LAST;

assign	X15 = GDFX_TEMP_SIGNAL_9[5];
assign	X14 = GDFX_TEMP_SIGNAL_9[4];
assign	X13 = GDFX_TEMP_SIGNAL_9[3];
assign	X12 = GDFX_TEMP_SIGNAL_9[2];
assign	X11 = GDFX_TEMP_SIGNAL_9[1];
assign	X10 = GDFX_TEMP_SIGNAL_9[0];


DC2	b2v_inst113(
	.D0(CURR_MODE),
	.E(SYNTHESIZED_WIRE_2),
	.Q1(MODE_WRITE_PIX),
	.Q0(MODE_READ_SCAN));


REG2_INC_CL	b2v_inst114(
	.CLK(CLK),
	.INC(WRITE_PIX_STATE_UPDATE),
	.CL(START_MODE),
	.DOUT(WRITE_PIX_CNT));


REG8_INC_CL	b2v_inst115(
	.CLK(CLK),
	.INC(READ_SCAN_STATE_READ),
	.CL(SYNTHESIZED_WIRE_3),
	.DOUT(READ_SCAN_READ_CNT));

assign	READY_ALTERA_SYNTHESIZED = SRFF_inst86 & POWERON_FINISHED;

assign	SDRAM_A[11] = OUT_ACT ? Y_OUT[11] : 1'bz;
assign	SDRAM_A[10] = OUT_ACT ? Y_OUT[10] : 1'bz;
assign	SDRAM_A[9] = OUT_ACT ? Y_OUT[9] : 1'bz;
assign	SDRAM_A[8] = OUT_ACT ? Y_OUT[8] : 1'bz;
assign	SDRAM_A[7] = OUT_ACT ? Y_OUT[7] : 1'bz;
assign	SDRAM_A[6] = OUT_ACT ? Y_OUT[6] : 1'bz;
assign	SDRAM_A[5] = OUT_ACT ? Y_OUT[5] : 1'bz;
assign	SDRAM_A[4] = OUT_ACT ? Y_OUT[4] : 1'bz;
assign	SDRAM_A[3] = OUT_ACT ? Y_OUT[3] : 1'bz;
assign	SDRAM_A[2] = OUT_ACT ? Y_OUT[2] : 1'bz;
assign	SDRAM_A[1] = OUT_ACT ? Y_OUT[1] : 1'bz;
assign	SDRAM_A[0] = OUT_ACT ? Y_OUT[0] : 1'bz;


MX4x4	b2v_inst118(
	.S1(WRITE_PIX_CNT[1]),
	.S0(WRITE_PIX_CNT[0]),
	.D0_(CMD_PRE),
	.D1_(CMD_ACT),
	.D2_(CMD_WRITE),
	.D3_(CMD_NOP),
	.Q_(CMD_WRITE_PIX));

assign	OUT_NOP = SYNTHESIZED_WIRE_4 ? H : 1'bz;



always@(posedge CLK)
begin
	begin
	nSTART <= H;
	end
end


DC4	b2v_inst121(
	.D1(WRITE_PIX_CNT[1]),
	.D0(WRITE_PIX_CNT[0]),
	.E(MODE_WRITE_PIX),
	
	.Q2(WRITE_PIX_STATE_WRITE),
	.Q1(WRITE_PIX_STATE_ACT),
	.Q0(WRITE_PIX_STATE_PRE));

assign	SDRAM_A[11] = OUT_WRITE ? X_OUT[11] : 1'bz;
assign	SDRAM_A[10] = OUT_WRITE ? X_OUT[10] : 1'bz;
assign	SDRAM_A[9] = OUT_WRITE ? X_OUT[9] : 1'bz;
assign	SDRAM_A[8] = OUT_WRITE ? X_OUT[8] : 1'bz;
assign	SDRAM_A[7] = OUT_WRITE ? X_OUT[7] : 1'bz;
assign	SDRAM_A[6] = OUT_WRITE ? X_OUT[6] : 1'bz;
assign	SDRAM_A[5] = OUT_WRITE ? X_OUT[5] : 1'bz;
assign	SDRAM_A[4] = OUT_WRITE ? X_OUT[4] : 1'bz;
assign	SDRAM_A[3] = OUT_WRITE ? X_OUT[3] : 1'bz;
assign	SDRAM_A[2] = OUT_WRITE ? X_OUT[2] : 1'bz;
assign	SDRAM_A[1] = OUT_WRITE ? X_OUT[1] : 1'bz;
assign	SDRAM_A[0] = OUT_WRITE ? X_OUT[0] : 1'bz;

assign	SDRAM_DQ[15] = OUT_WRITE ? D_OUT[15] : 1'bz;
assign	SDRAM_DQ[14] = OUT_WRITE ? D_OUT[14] : 1'bz;
assign	SDRAM_DQ[13] = OUT_WRITE ? D_OUT[13] : 1'bz;
assign	SDRAM_DQ[12] = OUT_WRITE ? D_OUT[12] : 1'bz;
assign	SDRAM_DQ[11] = OUT_WRITE ? D_OUT[11] : 1'bz;
assign	SDRAM_DQ[10] = OUT_WRITE ? D_OUT[10] : 1'bz;
assign	SDRAM_DQ[9] = OUT_WRITE ? D_OUT[9] : 1'bz;
assign	SDRAM_DQ[8] = OUT_WRITE ? D_OUT[8] : 1'bz;
assign	SDRAM_DQ[7] = OUT_WRITE ? D_OUT[7] : 1'bz;
assign	SDRAM_DQ[6] = OUT_WRITE ? D_OUT[6] : 1'bz;
assign	SDRAM_DQ[5] = OUT_WRITE ? D_OUT[5] : 1'bz;
assign	SDRAM_DQ[4] = OUT_WRITE ? D_OUT[4] : 1'bz;
assign	SDRAM_DQ[3] = OUT_WRITE ? D_OUT[3] : 1'bz;
assign	SDRAM_DQ[2] = OUT_WRITE ? D_OUT[2] : 1'bz;
assign	SDRAM_DQ[1] = OUT_WRITE ? D_OUT[1] : 1'bz;
assign	SDRAM_DQ[0] = OUT_WRITE ? D_OUT[0] : 1'bz;


DC2	b2v_inst125(
	.D0(SRFF_inst55),
	.E(CMD_CURR_WRITE),
	.Q1(SYNTHESIZED_WIRE_5),
	.Q0(OUT_WRITE));

assign	OUT_DESL = CMD_CURR_DESL;


assign	OUT_NOP = SYNTHESIZED_WIRE_5 ? H : 1'bz;


DC2	b2v_inst128(
	.D0(SRFF_inst84),
	.E(CMD_CURR_ACT),
	.Q1(SYNTHESIZED_WIRE_6),
	.Q0(OUT_ACT));

assign	OUT_NOP = SYNTHESIZED_WIRE_6 ? H : 1'bz;


assign	SDRAM_A[11] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[11] : 1'bz;
assign	SDRAM_A[10] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[10] : 1'bz;
assign	SDRAM_A[9] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[9] : 1'bz;
assign	SDRAM_A[8] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[8] : 1'bz;
assign	SDRAM_A[7] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[7] : 1'bz;
assign	SDRAM_A[6] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[6] : 1'bz;
assign	SDRAM_A[5] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[5] : 1'bz;
assign	SDRAM_A[4] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[4] : 1'bz;
assign	SDRAM_A[3] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[3] : 1'bz;
assign	SDRAM_A[2] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[2] : 1'bz;
assign	SDRAM_A[1] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[1] : 1'bz;
assign	SDRAM_A[0] = OUT_MRS ? GDFX_TEMP_SIGNAL_10[0] : 1'bz;

assign	READ_SCAN_ACT_EXIT = READ_SCAN_STATE_ACT & CMD_DONE;


DC2	b2v_inst133(
	.D0(SRFF_inst88),
	.E(CMD_CURR_READ),
	.Q1(SYNTHESIZED_WIRE_4),
	.Q0(OUT_READ));

assign	WRITE_PIX_ACT_EXIT = WRITE_PIX_STATE_ACT & CMD_DONE;

assign	SDRAM_A[11] = OUT_READ ? GDFX_TEMP_SIGNAL_11[11] : 1'bz;
assign	SDRAM_A[10] = OUT_READ ? GDFX_TEMP_SIGNAL_11[10] : 1'bz;
assign	SDRAM_A[9] = OUT_READ ? GDFX_TEMP_SIGNAL_11[9] : 1'bz;
assign	SDRAM_A[8] = OUT_READ ? GDFX_TEMP_SIGNAL_11[8] : 1'bz;
assign	SDRAM_A[7] = OUT_READ ? GDFX_TEMP_SIGNAL_11[7] : 1'bz;
assign	SDRAM_A[6] = OUT_READ ? GDFX_TEMP_SIGNAL_11[6] : 1'bz;
assign	SDRAM_A[5] = OUT_READ ? GDFX_TEMP_SIGNAL_11[5] : 1'bz;
assign	SDRAM_A[4] = OUT_READ ? GDFX_TEMP_SIGNAL_11[4] : 1'bz;
assign	SDRAM_A[3] = OUT_READ ? GDFX_TEMP_SIGNAL_11[3] : 1'bz;
assign	SDRAM_A[2] = OUT_READ ? GDFX_TEMP_SIGNAL_11[2] : 1'bz;
assign	SDRAM_A[1] = OUT_READ ? GDFX_TEMP_SIGNAL_11[1] : 1'bz;
assign	SDRAM_A[0] = OUT_READ ? GDFX_TEMP_SIGNAL_11[0] : 1'bz;

assign	SDRAM_A[11] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[11] : 1'bz;
assign	SDRAM_A[10] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[10] : 1'bz;
assign	SDRAM_A[9] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[9] : 1'bz;
assign	SDRAM_A[8] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[8] : 1'bz;
assign	SDRAM_A[7] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[7] : 1'bz;
assign	SDRAM_A[6] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[6] : 1'bz;
assign	SDRAM_A[5] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[5] : 1'bz;
assign	SDRAM_A[4] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[4] : 1'bz;
assign	SDRAM_A[3] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[3] : 1'bz;
assign	SDRAM_A[2] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[2] : 1'bz;
assign	SDRAM_A[1] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[1] : 1'bz;
assign	SDRAM_A[0] = OUT_PREA ? GDFX_TEMP_SIGNAL_12[0] : 1'bz;


MX4x16	b2v_inst137(
	.S1(WRITE_PIX_BA[1]),
	.S0(WRITE_PIX_BA[0]),
	.D0_(GDFX_TEMP_SIGNAL_13),
	.D1_(GDFX_TEMP_SIGNAL_14),
	.D2_(GDFX_TEMP_SIGNAL_15),
	.D3_(GDFX_TEMP_SIGNAL_16),
	.Q_(SYNTHESIZED_WIRE_31));


REG2_LD_INC_CL	b2v_inst138(
	.CLK(CLK),
	.LD(START_MODE),
	.INC(BANK_NEXT),
	
	.DIN(SYNTHESIZED_WIRE_7),
	.DOUT(BA_OUT));

assign	SYNTHESIZED_WIRE_1 =  ~CMD_LD;


MX2x2	b2v_inst140(
	.S0(NEW_MODE),
	.D0_(GDFX_TEMP_SIGNAL_17),
	.D1_(WRITE_PIX_BA),
	.Q(SYNTHESIZED_WIRE_7));

assign	CMD_LD = CMD_LD_POWERON_STABLE | CMD_LD_POWERON_REF | CMD_LD_STATE_UPDATES | SYNTHESIZED_WIRE_69 | SYNTHESIZED_WIRE_69 | SYNTHESIZED_WIRE_69 | SYNTHESIZED_WIRE_69 | SYNTHESIZED_WIRE_69;


assign	CMD_DONE = CMD_DONE_ACT | CMD_DONE_MRS | CMD_DONE_READ | CMD_DONE_REF | CMD_DONE_BST | CMD_DONE_PRE | SYNTHESIZED_WIRE_70 | SYNTHESIZED_WIRE_70;

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_15 | SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_17 | SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_20;

assign	CMD_DONE_READ = OUT_READ;



assign	SYNTHESIZED_WIRE_34 = CMD_CURR_PRE & SYNTHESIZED_WIRE_21;

assign	CMD_DONE_ACT = OUT_ACT;


assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_24 & SYNTHESIZED_WIRE_25;


CD4	b2v_inst153(
	.D3(SYNTHESIZED_WIRE_26),
	.D2(SYNTHESIZED_WIRE_27),
	.D1(SYNTHESIZED_WIRE_28),
	.D0(SYNTHESIZED_WIRE_29),
	.Q1(WRITE_PIX_BA[1]),
	.Q0(WRITE_PIX_BA[0])
	);


ADD16	b2v_inst154(
	.Cin(H),
	.A(GDFX_TEMP_SIGNAL_18),
	.B(SYNTHESIZED_WIRE_30),
	
	.Q(X_REL));

assign	SYNTHESIZED_WIRE_30 =  ~SYNTHESIZED_WIRE_31;


REG16_LD_INC_CL	b2v_inst157(
	.CLK(CLK),
	.LD(START_MODE),
	
	
	.DIN(DIN),
	.DOUT(D_OUT));

assign	SYNTHESIZED_WIRE_21 =  ~CMD_LD;


always@(posedge CLK)
begin
	SRFF_inst17 <= ~SRFF_inst17 & SYNTHESIZED_WIRE_32 | SRFF_inst17 & ~CMD_LD;
end

assign	POWERON_STABLE_EXIT = POWERON_STABLE_CNT[13] & POWERON_STABLE_CNT[12] & POWERON_STABLE_CNT[11];

assign	SYNTHESIZED_WIRE_52 = CMD_CURR_WRITE & SYNTHESIZED_WIRE_33;


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
	SRFF_inst20 <= ~SRFF_inst20 & SYNTHESIZED_WIRE_34 | SRFF_inst20 & ~CMD_LD;
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
	.Q3(SYNTHESIZED_WIRE_35),
	.Q2(SYNTHESIZED_WIRE_36),
	.Q1(SYNTHESIZED_WIRE_37),
	.Q0(SYNTHESIZED_WIRE_38)
	);


MX16x4	b2v_inst23(
	.S3(SYNTHESIZED_WIRE_35),
	.S2(SYNTHESIZED_WIRE_36),
	.S1(SYNTHESIZED_WIRE_37),
	.S0(SYNTHESIZED_WIRE_38),
	.D0_(GDFX_TEMP_SIGNAL_19),
	.D10_(GDFX_TEMP_SIGNAL_20),
	.D11_(GDFX_TEMP_SIGNAL_21),
	.D12_(GDFX_TEMP_SIGNAL_22),
	.D13_(GDFX_TEMP_SIGNAL_23),
	.D14_(GDFX_TEMP_SIGNAL_24),
	.D15_(GDFX_TEMP_SIGNAL_25),
	.D1_(GDFX_TEMP_SIGNAL_26),
	.D2_(GDFX_TEMP_SIGNAL_27),
	.D3_(GDFX_TEMP_SIGNAL_28),
	.D4_(GDFX_TEMP_SIGNAL_29),
	.D5_(GDFX_TEMP_SIGNAL_30),
	.D6_(GDFX_TEMP_SIGNAL_31),
	.D7_(GDFX_TEMP_SIGNAL_32),
	.D8_(GDFX_TEMP_SIGNAL_33),
	.D9_(GDFX_TEMP_SIGNAL_34),
	.Q_(OUT_SDRAM));


always@(posedge CLK)
begin
	SRFF_inst24 <= ~SRFF_inst24 & SYNTHESIZED_WIRE_71 | SRFF_inst24 & ~L;
end

assign	SYNTHESIZED_WIRE_71 = POWERON_STATE_MRS & CMD_DONE;

assign	POWERON_FINISHED = SRFF_inst24 | SYNTHESIZED_WIRE_71;


MX2x4	b2v_inst27(
	.S0(POWERON_FINISHED),
	.D0_(POWERON_CMD),
	.D1_(ACTIVE_CMD),
	.Q(CMD_NEXT));


CMP16	b2v_inst28(
	.A(POWERON_STABLE_CNT),
	.B(GDFX_TEMP_SIGNAL_35),
	
	.E(CMD_LD_POWERON_STABLE)
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
	CMD_LD_STATE_UPDATES <= SYNTHESIZED_WIRE_41;
	end
end

assign	SYNTHESIZED_WIRE_0 = BANK_NEXT | START_MODE;

assign	POWERON_PREA_EXIT = H;


assign	CMD_LD_POWERON_REF = POWERON_REF_DONE_TRIG & nPOWERON_REF_EXIT;

assign	nPOWERON_FINISHED =  ~POWERON_FINISHED;

assign	OUT_SELF = L;


assign	READ_SCAN_READ_EXIT = SYNTHESIZED_WIRE_42 & BANK_LAST;

assign	CMD_NOP = GDFX_TEMP_SIGNAL_36;


assign	CMD_MRS = GDFX_TEMP_SIGNAL_37;


assign	CMD_ACT = GDFX_TEMP_SIGNAL_38;


assign	SYNTHESIZED_WIRE_41 = POWERON_STATE_UPDATE | WRITE_PIX_STATE_UPDATE | READ_SCAN_STATE_UPDATE | START_MODE | BANK_NEXT | SYNTHESIZED_WIRE_43;

assign	CMD_READ = GDFX_TEMP_SIGNAL_39;


assign	SYNTHESIZED_WIRE_45 = CMD_CURR_BST & SYNTHESIZED_WIRE_44;

assign	SYNTHESIZED_WIRE_44 =  ~CMD_LD;

assign	CMD_PRE = GDFX_TEMP_SIGNAL_40;


assign	CMD_PREA = GDFX_TEMP_SIGNAL_41;



always@(posedge CLK)
begin
	SRFF_inst45 <= ~SRFF_inst45 & SYNTHESIZED_WIRE_45 | SRFF_inst45 & ~CMD_LD;
end

assign	CMD_REF = GDFX_TEMP_SIGNAL_42;


assign	CMD_BST = GDFX_TEMP_SIGNAL_43;



REG2_INC_CL	b2v_inst48(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_46),
	.CL(CMD_LD),
	.DOUT(CMD_REF_CNT));


DC4	b2v_inst49(
	.D1(CMD_REF_CNT[1]),
	.D0(CMD_REF_CNT[0]),
	.E(CMD_CURR_REF),
	.Q3(SYNTHESIZED_WIRE_72),
	.Q2(CMD_DONE_REF),
	.Q1(SYNTHESIZED_WIRE_48),
	.Q0(OUT_REF));


MX4x1	b2v_inst5(
	.D3(L),
	.D2(POWERON_REF_EXIT),
	.D1(POWERON_PREA_EXIT),
	.D0(POWERON_STABLE_EXIT),
	.S1(POWERON_CNT[1]),
	.S0(POWERON_CNT[0]),
	.Q(POWERON_STATE_UPDATE));


REG2_INC_CL	b2v_inst50(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_47),
	.CL(CMD_LD),
	.DOUT(CMD_MRS_CNT));

assign	SYNTHESIZED_WIRE_50 = CMD_DONE_REF | SYNTHESIZED_WIRE_48 | SYNTHESIZED_WIRE_72;

assign	OUT_NOP = SYNTHESIZED_WIRE_50 ? H : 1'bz;

assign	SYNTHESIZED_WIRE_33 =  ~CMD_LD;

assign	SYNTHESIZED_WIRE_64 = CMD_CURR_ACT & SYNTHESIZED_WIRE_51;


always@(posedge CLK)
begin
	SRFF_inst55 <= ~SRFF_inst55 & SYNTHESIZED_WIRE_52 | SRFF_inst55 & ~CMD_LD;
end

assign	OUT_NOP = SYNTHESIZED_WIRE_53 ? H : 1'bz;

assign	SYNTHESIZED_WIRE_66 = CMD_CURR_READ & SYNTHESIZED_WIRE_54;


DC2	b2v_inst58(
	.D0(SRFF_inst17),
	.E(CMD_CURR_PREA),
	.Q1(SYNTHESIZED_WIRE_53),
	.Q0(OUT_PREA));


MX2x2	b2v_inst59(
	.S0(OUT_MRS),
	.D0_(BA_OUT),
	.D1_(GDFX_TEMP_SIGNAL_44),
	.Q(SDRAM_BA_ALTERA_SYNTHESIZED));


REG4_LD_CL	b2v_inst6(
	.CLK(CLK),
	.LD(CMD_LD),
	.CL(L),
	.DIN(CMD_NEXT),
	.DOUT(CMD_CURRENT));


DC4	b2v_inst60(
	.D1(CMD_MRS_CNT[1]),
	.D0(CMD_MRS_CNT[0]),
	.E(CMD_CURR_MRS),
	.Q3(SYNTHESIZED_WIRE_73),
	.Q2(SYNTHESIZED_WIRE_56),
	.Q1(CMD_DONE_MRS),
	.Q0(OUT_MRS));

assign	nCMD_REF_LAST =  ~SYNTHESIZED_WIRE_72;

assign	SYNTHESIZED_WIRE_46 = CMD_CURR_REF & nCMD_REF_LAST;

assign	SYNTHESIZED_WIRE_58 = SYNTHESIZED_WIRE_56 | CMD_DONE_MRS | SYNTHESIZED_WIRE_73;

assign	OUT_NOP = SYNTHESIZED_WIRE_58 ? H : 1'bz;

assign	SYNTHESIZED_WIRE_54 =  ~CMD_LD;

assign	BANK_NEXT = BANK_INTERLEAVE_TRIG & nBANK_LAST;

assign	SYNTHESIZED_WIRE_47 = CMD_CURR_MRS & nCMD_MRS_LAST;

assign	nCMD_MRS_LAST =  ~SYNTHESIZED_WIRE_73;

assign	SYNTHESIZED_WIRE_51 =  ~CMD_LD;


REG16_INC_CL	b2v_inst7(
	.CLK(CLK),
	.INC(POWERON_STATE_STABLE),
	.CL(L),
	.DOUT(POWERON_STABLE_CNT));

assign	OUT_NOP = CMD_CURR_NOP ? H : 1'bz;


DC2	b2v_inst71(
	.D0(SRFF_inst20),
	.E(CMD_CURR_PRE),
	.Q1(SYNTHESIZED_WIRE_60),
	.Q0(OUT_PRE));

assign	OUT_NOP = SYNTHESIZED_WIRE_60 ? H : 1'bz;

assign	SYNTHESIZED_WIRE_3 = BANK_NEXT | START_MODE;

assign	CMD_WRITE = GDFX_TEMP_SIGNAL_45;



DC2	b2v_inst75(
	.D0(SRFF_inst45),
	.E(CMD_CURR_BST),
	.Q1(SYNTHESIZED_WIRE_61),
	.Q0(OUT_BST));

assign	OUT_WRITEA = L;



MX4x4	b2v_inst77(
	.S1(READ_SCAN_CNT[1]),
	.S0(READ_SCAN_CNT[0]),
	.D0_(CMD_PRE),
	.D1_(CMD_ACT),
	.D2_(CMD_READ),
	.D3_(CMD_BST),
	.Q_(CMD_READ_SCAN));

assign	OUT_READA = L;



DC4	b2v_inst79(
	.D1(READ_SCAN_CNT[1]),
	.D0(READ_SCAN_CNT[0]),
	.E(MODE_READ_SCAN),
	.Q3(READ_SCAN_STATE_BST),
	.Q2(READ_SCAN_STATE_READ),
	.Q1(READ_SCAN_STATE_ACT),
	.Q0(READ_SCAN_STATE_PRE));


REG8_INC_CL	b2v_inst8(
	.CLK(CLK),
	.INC(H),
	.CL(CMD_LD)
	);

assign	OUT_NOP = SYNTHESIZED_WIRE_61 ? H : 1'bz;

assign	DOUT = SDRAM_DQ;




REG12_LD_CL	b2v_inst82(
	.CLK(CLK),
	.LD(START_MODE),
	
	.DIN(GDFX_TEMP_SIGNAL_46),
	.DOUT(Y_OUT));

assign	SYNTHESIZED_WIRE_42 = SYNTHESIZED_WIRE_62 | SYNTHESIZED_WIRE_63;


always@(posedge CLK)
begin
	SRFF_inst84 <= ~SRFF_inst84 & SYNTHESIZED_WIRE_64 | SRFF_inst84 & ~CMD_LD;
end


always@(posedge CLK or negedge nSTART)
begin
if (!nSTART)
	begin
	SRFF_inst86 <= 1;
	end
else
	begin
	SRFF_inst86 <= ~SRFF_inst86 & SYNTHESIZED_WIRE_65 | SRFF_inst86 & ~RESET_READY;
	end
end

assign	READ_SCAN_PRE_EXIT = READ_SCAN_STATE_PRE & CMD_DONE;


always@(posedge CLK)
begin
	SRFF_inst88 <= ~SRFF_inst88 & SYNTHESIZED_WIRE_66 | SRFF_inst88 & ~CMD_LD;
end

assign	SYNTHESIZED_WIRE_65 = SET_READY & SYNTHESIZED_WIRE_67;


DC16	b2v_inst9(
	.D3(CMD_CURRENT[3]),
	.D2(CMD_CURRENT[2]),
	.D1(CMD_CURRENT[1]),
	.D0(CMD_CURRENT[0]),
	.E(H),
	
	
	
	
	.Q11(CMD_CURR_REF),
	.Q10(CMD_CURR_BST),
	.Q9(CMD_CURR_PREA),
	.Q8(CMD_CURR_PRE),
	
	.Q6(CMD_CURR_WRITE),
	
	.Q4(CMD_CURR_READ),
	.Q3(CMD_CURR_ACT),
	.Q2(CMD_CURR_MRS),
	.Q1(CMD_CURR_DESL),
	.Q0(CMD_CURR_NOP));

assign	SYNTHESIZED_WIRE_67 =  ~RESET_READY;

assign	SET_READY = MODE_WRITE_FINISH | MODE_READ_FINISH;

assign	MODE_READ_FINISH = READ_SCAN_STATE_BST & CMD_DONE;


CD2	b2v_inst93(
	.D1(write_pixel),
	.D0(read_scanline),
	.W(SYNTHESIZED_WIRE_68),
	.Q(NEW_MODE));


REG12_LD_CL	b2v_inst94(
	.CLK(CLK),
	.LD(START_MODE),
	
	.DIN(GDFX_TEMP_SIGNAL_47),
	.DOUT(X_OUT));


always@(posedge CLK)
begin
if (START_MODE)
	begin
	CURR_MODE <= NEW_MODE;
	end
end

assign	START_MODE = SYNTHESIZED_WIRE_68 & READY_ALTERA_SYNTHESIZED;


MX2x4	b2v_inst97(
	.S0(CURR_MODE),
	.D0_(CMD_READ_SCAN),
	.D1_(CMD_WRITE_PIX),
	.Q(ACTIVE_CMD));

assign	RESET_READY = write_pixel | read_scanline;

assign	SYNTHESIZED_WIRE_2 = POWERON_FINISHED & nREADY;

assign	SDRAM_CKE = H;
assign	nSDRAM_CS = OUT_SDRAM[3];
assign	nSDRAM_RAS = OUT_SDRAM[2];
assign	nSDRAM_CAS = OUT_SDRAM[1];
assign	nSDRAM_WE = OUT_SDRAM[0];
assign	SDRAM_UDQM = nPOWERON_FINISHED;
assign	SDRAM_LDQM = nPOWERON_FINISHED;
assign	READY = READY_ALTERA_SYNTHESIZED;
assign	SDRAM_BA = SDRAM_BA_ALTERA_SYNTHESIZED;
assign	H = 1;
assign	L = 0;

endmodule
