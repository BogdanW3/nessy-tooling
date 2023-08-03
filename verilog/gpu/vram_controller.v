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
// CREATED		"Wed Aug  2 20:56:17 2023"

module vram_controller(
	read_scanline,
	write_pixel,
	start,
	CLK,
	A,
	D,
	SDRAM_CLK,
	SDRAM_CKE,
	nSDRAM_CS,
	nSDRAM_RAS,
	nSDRAM_CAS,
	nSDRAM_WE,
	SDRAM_UDQM,
	SDRAM_LDQM,
	ready,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ
);


input wire	read_scanline;
input wire	write_pixel;
input wire	start;
input wire	CLK;
input wire	[19:0] A;
input wire	[15:0] D;
output wire	SDRAM_CLK;
output wire	SDRAM_CKE;
output wire	nSDRAM_CS;
output wire	nSDRAM_RAS;
output wire	nSDRAM_CAS;
output wire	nSDRAM_WE;
output wire	SDRAM_UDQM;
output wire	SDRAM_LDQM;
output wire	ready;
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;

wire	[3:0] ACTIVE_CMD;
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
wire	[3:0] CMD_READA;
wire	[3:0] CMD_REF;
wire	[1:0] CMD_REF_CNT;
wire	[3:0] CMD_SELF;
wire	[3:0] CMD_WRITE;
wire	[3:0] CMD_WRITEA;
wire	nCMD_MRS_LAST;
wire	nCMD_REF_LAST;
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
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_35;
reg	SRFF_inst24;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_39;
reg	SRFF_inst17;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
reg	DFF_inst30;
reg	SRFF_inst20;
wire	SYNTHESIZED_WIRE_33;

assign	SDRAM_CLK = CLK;
wire	[3:0] GDFX_TEMP_SIGNAL_16;
wire	[3:0] GDFX_TEMP_SIGNAL_15;
wire	[3:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_4;
wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_7;
wire	[3:0] GDFX_TEMP_SIGNAL_8;
wire	[3:0] GDFX_TEMP_SIGNAL_9;
wire	[3:0] GDFX_TEMP_SIGNAL_10;
wire	[3:0] GDFX_TEMP_SIGNAL_6;
wire	[3:0] GDFX_TEMP_SIGNAL_11;
wire	[3:0] GDFX_TEMP_SIGNAL_12;
wire	[3:0] GDFX_TEMP_SIGNAL_14;
wire	[3:0] GDFX_TEMP_SIGNAL_2;
wire	[3:0] GDFX_TEMP_SIGNAL_3;
wire	[3:0] GDFX_TEMP_SIGNAL_13;
wire	[3:0] GDFX_TEMP_SIGNAL_5;


assign	GDFX_TEMP_SIGNAL_16 = {1'b1,1'b0,1'b1,1'b1};
assign	GDFX_TEMP_SIGNAL_15 = {1'b1,1'b0,1'b0,1'b1};
assign	GDFX_TEMP_SIGNAL_0  = {1'b1,1'b0,1'b0,1'b0};
assign	GDFX_TEMP_SIGNAL_4  = {1'b0,1'b1,1'b1,1'b1};
assign	GDFX_TEMP_SIGNAL_1  = {1'b0,1'b1,1'b1,1'b0};
assign	GDFX_TEMP_SIGNAL_7  = {1'b0,1'b1,1'b0,1'b1};
assign	GDFX_TEMP_SIGNAL_8  = {1'b0,1'b1,1'b0,1'b1};
assign	GDFX_TEMP_SIGNAL_9  = {1'b0,1'b1,1'b0,1'b0};
assign	GDFX_TEMP_SIGNAL_10 = {1'b0,1'b1,1'b0,1'b0};
assign	GDFX_TEMP_SIGNAL_6  = {1'b0,1'b0,1'b1,1'b1};
assign	GDFX_TEMP_SIGNAL_11 = {1'b0,1'b0,1'b1,1'b0};
assign	GDFX_TEMP_SIGNAL_12 = {1'b0,1'b0,1'b1,1'b0};
assign	GDFX_TEMP_SIGNAL_14 = {1'b0,1'b0,1'b1,1'b0};
assign	GDFX_TEMP_SIGNAL_2  = {1'b0,1'b0,1'b0,1'b1};
assign	GDFX_TEMP_SIGNAL_3  = {1'b0,1'b0,1'b0,1'b1};
assign	GDFX_TEMP_SIGNAL_13 = {1'b0,1'b0,1'b0,1'b1};
assign	GDFX_TEMP_SIGNAL_5  = {1'b0,1'b0,1'b0,1'b0};

assign	POWERON_REF_EXIT = POWERON_REF_CNT[3] & CMD_DONE;


REG4_INC_CL	b2v_inst1(
	.CLK(CLK),
	.INC(POWERON_REF_DONE_TRIG),
	
	.DOUT(POWERON_REF_CNT));


DC4	b2v_inst10(
	.D1(POWERON_CNT[1]),
	.D0(POWERON_CNT[0]),
	
	.Q3(POWERON_STATE_MRS),
	
	.Q1(POWERON_STATE_REF_LOOP),
	.Q0(POWERON_STATE_STABLE));

assign	SYNTHESIZED_WIRE_2 = CMD_CURR_PREA & SYNTHESIZED_WIRE_0;



assign	SYNTHESIZED_WIRE_0 =  ~CMD_LD;

assign	SYNTHESIZED_WIRE_4 = CMD_CURR_PRE & SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_1 =  ~CMD_LD;


always@(posedge CLK)
begin
	SRFF_inst17 <= ~SRFF_inst17 & SYNTHESIZED_WIRE_2 | SRFF_inst17 & ~CMD_LD;
end

assign	POWERON_STABLE_EXIT = POWERON_STABLE_CNT[13] & SYNTHESIZED_WIRE_3 & POWERON_STABLE_CNT[11];

assign	SYNTHESIZED_WIRE_3 =  ~POWERON_STABLE_CNT[12];


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
	SRFF_inst20 <= ~SRFF_inst20 & SYNTHESIZED_WIRE_4 | SRFF_inst20 & ~CMD_LD;
end

assign	POWERON_REF_DONE_TRIG = POWERON_STATE_REF_LOOP & CMD_DONE;


CD16	b2v_inst22(
	
	
	
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
	.D1(OUT_NOP),
	.D0(OUT_DESL),
	.Q3(SYNTHESIZED_WIRE_5),
	.Q2(SYNTHESIZED_WIRE_6),
	.Q1(SYNTHESIZED_WIRE_7),
	.Q0(SYNTHESIZED_WIRE_8)
	);


MX16x4	b2v_inst23(
	.S3(SYNTHESIZED_WIRE_5),
	.S2(SYNTHESIZED_WIRE_6),
	.S1(SYNTHESIZED_WIRE_7),
	.S0(SYNTHESIZED_WIRE_8),
	.D0_(GDFX_TEMP_SIGNAL_0),
	.D10_(GDFX_TEMP_SIGNAL_1),
	.D11_(GDFX_TEMP_SIGNAL_2),
	.D12_(GDFX_TEMP_SIGNAL_3),
	
	
	
	.D1_(GDFX_TEMP_SIGNAL_4),
	.D2_(GDFX_TEMP_SIGNAL_5),
	.D3_(GDFX_TEMP_SIGNAL_6),
	.D4_(GDFX_TEMP_SIGNAL_7),
	.D5_(GDFX_TEMP_SIGNAL_8),
	.D6_(GDFX_TEMP_SIGNAL_9),
	.D7_(GDFX_TEMP_SIGNAL_10),
	.D8_(GDFX_TEMP_SIGNAL_11),
	.D9_(GDFX_TEMP_SIGNAL_12),
	.Q_(OUT_SDRAM));


always@(posedge CLK)
begin
	SRFF_inst24 <= ~SRFF_inst24 & SYNTHESIZED_WIRE_35 | SRFF_inst24;
end

assign	SYNTHESIZED_WIRE_35 = POWERON_STATE_MRS & CMD_DONE;

assign	POWERON_FINISHED = SRFF_inst24 | SYNTHESIZED_WIRE_35;


MX2x4	b2v_inst27(
	.S0(POWERON_FINISHED),
	.D0_(POWERON_CMD),
	.D1_(ACTIVE_CMD),
	.Q(CMD_NEXT));

assign	CMD_LD = SYNTHESIZED_WIRE_11 ? 1'b1 : 1'bz;

assign	nPOWERON_REF_EXIT =  ~POWERON_REF_EXIT;


REG2_INC_CL	b2v_inst3(
	.CLK(CLK),
	.INC(POWERON_STATE_UPDATE),
	
	.DOUT(POWERON_CNT));


always@(posedge CLK)
begin
	begin
	DFF_inst30 <= SYNTHESIZED_WIRE_12;
	end
end

assign	SYNTHESIZED_WIRE_12 = POWERON_STATE_UPDATE | POWERON_STATE_UPDATE;

assign	POWERON_PREA_EXIT = 1;


assign	SYNTHESIZED_WIRE_11 = POWERON_REF_DONE_TRIG & nPOWERON_REF_EXIT;

assign	nPOWERON_FINISHED =  ~POWERON_FINISHED;

assign	OUT_SELF = 0;



assign	CMD_NOP = GDFX_TEMP_SIGNAL_13;


assign	CMD_MRS = GDFX_TEMP_SIGNAL_14;



assign	ACTIVE_CMD = CMD_NOP;






assign	CMD_PREA = GDFX_TEMP_SIGNAL_15;



assign	CMD_REF = GDFX_TEMP_SIGNAL_16;




REG2_INC_CL	b2v_inst48(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_13),
	.CL(CMD_LD),
	.DOUT(CMD_REF_CNT));


DC4	b2v_inst49(
	.D1(CMD_REF_CNT[1]),
	.D0(CMD_REF_CNT[0]),
	.E(CMD_CURR_REF),
	.Q3(SYNTHESIZED_WIRE_37),
	.Q2(SYNTHESIZED_WIRE_36),
	.Q1(SYNTHESIZED_WIRE_16),
	.Q0(SYNTHESIZED_WIRE_19));


MX4x1	b2v_inst5(
	
	.D2(POWERON_REF_EXIT),
	.D1(POWERON_PREA_EXIT),
	.D0(POWERON_STABLE_EXIT),
	.S1(POWERON_CNT[1]),
	.S0(POWERON_CNT[0]),
	.Q(POWERON_STATE_UPDATE));


REG2_INC_CL	b2v_inst50(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_14),
	.CL(CMD_LD),
	.DOUT(CMD_MRS_CNT));

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_36 | SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_37;

assign	OUT_NOP = SYNTHESIZED_WIRE_18 ? 1'b1 : 1'bz;

assign	OUT_REF = SYNTHESIZED_WIRE_19 ? 1'b1 : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_36 ? 1'b1 : 1'bz;

assign	OUT_PREA = SYNTHESIZED_WIRE_38 ? 1'b1 : 1'bz;

assign	OUT_NOP = SYNTHESIZED_WIRE_22 ? 1'b1 : 1'bz;

assign	OUT_PRE = SYNTHESIZED_WIRE_39 ? 1'b1 : 1'bz;


DC2	b2v_inst58(
	.D0(SRFF_inst17),
	.E(CMD_CURR_PREA),
	.Q1(SYNTHESIZED_WIRE_22),
	.Q0(SYNTHESIZED_WIRE_38));

assign	CMD_DONE = SYNTHESIZED_WIRE_38 ? 1'b1 : 1'bz;


REG4_LD_CL	b2v_inst6(
	.CLK(CLK),
	.LD(CMD_LD),
	
	.DIN(CMD_NEXT),
	.DOUT(CMD_CURRENT));


DC4	b2v_inst60(
	.D1(CMD_MRS_CNT[1]),
	.D0(CMD_MRS_CNT[0]),
	.E(CMD_CURR_MRS),
	.Q3(SYNTHESIZED_WIRE_41),
	.Q2(SYNTHESIZED_WIRE_26),
	.Q1(SYNTHESIZED_WIRE_40),
	.Q0(SYNTHESIZED_WIRE_30));

assign	nCMD_REF_LAST =  ~SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_13 = CMD_CURR_REF & nCMD_REF_LAST;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_26 | SYNTHESIZED_WIRE_40 | SYNTHESIZED_WIRE_41;

assign	OUT_NOP = SYNTHESIZED_WIRE_29 ? 1'b1 : 1'bz;

assign	OUT_MRS = SYNTHESIZED_WIRE_30 ? 1'b1 : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_40 ? 1'b1 : 1'bz;

assign	SYNTHESIZED_WIRE_14 = CMD_CURR_MRS & nCMD_MRS_LAST;

assign	nCMD_MRS_LAST =  ~SYNTHESIZED_WIRE_41;

assign	CMD_LD = DFF_inst30 ? 1'b1 : 1'bz;


REG16_INC_CL	b2v_inst7(
	.CLK(CLK),
	.INC(POWERON_STATE_STABLE),
	
	.DOUT(POWERON_STABLE_CNT));

assign	OUT_NOP = CMD_CURR_NOP ? 1'b1 : 1'bz;


DC2	b2v_inst71(
	.D0(SRFF_inst20),
	.E(CMD_CURR_PRE),
	.Q1(SYNTHESIZED_WIRE_33),
	.Q0(SYNTHESIZED_WIRE_39));

assign	OUT_NOP = SYNTHESIZED_WIRE_33 ? 1'b1 : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_39 ? 1'b1 : 1'bz;


assign	OUT_BST = 1'b0;


assign	OUT_WRITEA = 1'b0;


assign	OUT_WRITE = 1'b0;


assign	OUT_READA = 1'b0;


assign	OUT_READ = 1'b0;



REG8_INC_CL	b2v_inst8(
	.CLK(CLK),
	.INC(1),
	.CL(CMD_LD)
	);

assign	OUT_ACT = 1'b0;



DC16	b2v_inst9(
	.D3(CMD_CURRENT[3]),
	.D2(CMD_CURRENT[2]),
	.D1(CMD_CURRENT[1]),
	.D0(CMD_CURRENT[0]),
	
	
	
	
	
	.Q11(CMD_CURR_REF),
	
	.Q9(CMD_CURR_PREA),
	.Q8(CMD_CURR_PRE),
	
	
	
	
	
	.Q2(CMD_CURR_MRS),
	.Q1(CMD_CURR_NOP)
	);

assign	SDRAM_CKE = 1'b1;
assign	nSDRAM_CS = OUT_SDRAM[3];
assign	nSDRAM_RAS = OUT_SDRAM[2];
assign	nSDRAM_CAS = OUT_SDRAM[1];
assign	nSDRAM_WE = OUT_SDRAM[0];
assign	SDRAM_UDQM = nPOWERON_FINISHED;
assign	SDRAM_LDQM = nPOWERON_FINISHED;

endmodule
