// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Thu Aug 03 20:37:30 2023"

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
wire	CMD_LD_INIT;
wire	CMD_LD_POWERON1;
reg	CMD_LD_STATE_UPDATE;
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
wire	H;
wire	L;
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
wire	SYNTHESIZED_WIRE_36;
reg	SRFF_inst24;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_40;
reg	SRFF_inst17;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
reg	SRFF_inst20;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;

assign	SDRAM_CLK = CLK;
wire	[3:0] GDFX_TEMP_SIGNAL_4;
wire	[3:0] GDFX_TEMP_SIGNAL_5;
wire	[3:0] GDFX_TEMP_SIGNAL_6;
wire	[3:0] GDFX_TEMP_SIGNAL_8;
wire	[3:0] GDFX_TEMP_SIGNAL_16;
wire	[3:0] GDFX_TEMP_SIGNAL_2;
wire	[3:0] GDFX_TEMP_SIGNAL_3;
wire	[3:0] GDFX_TEMP_SIGNAL_19;
wire	[3:0] GDFX_TEMP_SIGNAL_18;
wire	[3:0] GDFX_TEMP_SIGNAL_7;
wire	[3:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_10;
wire	[3:0] GDFX_TEMP_SIGNAL_11;
wire	[3:0] GDFX_TEMP_SIGNAL_12;
wire	[3:0] GDFX_TEMP_SIGNAL_13;
wire	[3:0] GDFX_TEMP_SIGNAL_9;
wire	[3:0] GDFX_TEMP_SIGNAL_14;
wire	[3:0] GDFX_TEMP_SIGNAL_15;
wire	[3:0] GDFX_TEMP_SIGNAL_17;


assign	GDFX_TEMP_SIGNAL_4 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_5 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_6 = {H,H,H,H};
assign	GDFX_TEMP_SIGNAL_8 = {L,L,L,L};
assign	GDFX_TEMP_SIGNAL_16 = {L,L,L,L};
assign	GDFX_TEMP_SIGNAL_2 = {L,L,L,H};
assign	GDFX_TEMP_SIGNAL_3 = {L,L,L,H};
assign	GDFX_TEMP_SIGNAL_19 = {H,L,H,H};
assign	GDFX_TEMP_SIGNAL_18 = {H,L,L,H};
assign	GDFX_TEMP_SIGNAL_7 = {H,L,L,L};
assign	GDFX_TEMP_SIGNAL_0 = {L,H,H,H};
assign	GDFX_TEMP_SIGNAL_1 = {L,H,H,L};
assign	GDFX_TEMP_SIGNAL_10 = {L,H,L,H};
assign	GDFX_TEMP_SIGNAL_11 = {L,H,L,H};
assign	GDFX_TEMP_SIGNAL_12 = {L,H,L,L};
assign	GDFX_TEMP_SIGNAL_13 = {L,H,L,L};
assign	GDFX_TEMP_SIGNAL_9 = {L,L,H,H};
assign	GDFX_TEMP_SIGNAL_14 = {L,L,H,L};
assign	GDFX_TEMP_SIGNAL_15 = {L,L,H,L};
assign	GDFX_TEMP_SIGNAL_17 = {L,L,H,L};

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

assign	SYNTHESIZED_WIRE_2 = CMD_CURR_PREA & SYNTHESIZED_WIRE_0;

	initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
    end

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
	.D13_(GDFX_TEMP_SIGNAL_4),
	.D14_(GDFX_TEMP_SIGNAL_5),
	.D15_(GDFX_TEMP_SIGNAL_6),
	.D1_(GDFX_TEMP_SIGNAL_7),
	.D2_(GDFX_TEMP_SIGNAL_8),
	.D3_(GDFX_TEMP_SIGNAL_9),
	.D4_(GDFX_TEMP_SIGNAL_10),
	.D5_(GDFX_TEMP_SIGNAL_11),
	.D6_(GDFX_TEMP_SIGNAL_12),
	.D7_(GDFX_TEMP_SIGNAL_13),
	.D8_(GDFX_TEMP_SIGNAL_14),
	.D9_(GDFX_TEMP_SIGNAL_15),
	.Q_(OUT_SDRAM));


always@(posedge CLK)
begin
	SRFF_inst24 <= ~SRFF_inst24 & SYNTHESIZED_WIRE_36 | SRFF_inst24 & ~L;
end

assign	SYNTHESIZED_WIRE_36 = POWERON_STATE_MRS & CMD_DONE;

assign	POWERON_FINISHED = SRFF_inst24 | SYNTHESIZED_WIRE_36;


MX2x4	b2v_inst27(
	.S0(POWERON_FINISHED),
	.D0_(POWERON_CMD),
	.D1_(ACTIVE_CMD),
	.Q(CMD_NEXT));

assign	nPOWERON_REF_EXIT =  ~POWERON_REF_EXIT;


REG2_INC_CL	b2v_inst3(
	.CLK(CLK),
	.INC(POWERON_STATE_UPDATE),
	
	.DOUT(POWERON_CNT));


always@(posedge CLK)
begin
	begin
	CMD_LD_STATE_UPDATE <= SYNTHESIZED_WIRE_11;
	end
end

assign	SYNTHESIZED_WIRE_11 = POWERON_STATE_UPDATE | POWERON_STATE_UPDATE;

assign	POWERON_PREA_EXIT = H;


assign	CMD_LD_POWERON1 = POWERON_REF_DONE_TRIG & nPOWERON_REF_EXIT;

assign	nPOWERON_FINISHED =  ~POWERON_FINISHED;

assign	OUT_SELF = L;



assign	CMD_NOP = GDFX_TEMP_SIGNAL_16;


assign	CMD_MRS = GDFX_TEMP_SIGNAL_17;



assign	ACTIVE_CMD = CMD_NOP;






assign	CMD_PREA = GDFX_TEMP_SIGNAL_18;



assign	CMD_REF = GDFX_TEMP_SIGNAL_19;




REG2_INC_CL	b2v_inst48(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_12),
	.CL(CMD_LD),
	.DOUT(CMD_REF_CNT));


DC4	b2v_inst49(
	.D1(CMD_REF_CNT[1]),
	.D0(CMD_REF_CNT[0]),
	.E(CMD_CURR_REF),
	.Q3(SYNTHESIZED_WIRE_38),
	.Q2(SYNTHESIZED_WIRE_37),
	.Q1(SYNTHESIZED_WIRE_15),
	.Q0(SYNTHESIZED_WIRE_18));


MX4x1	b2v_inst5(
	
	.D2(POWERON_REF_EXIT),
	.D1(POWERON_PREA_EXIT),
	.D0(POWERON_STABLE_EXIT),
	.S1(POWERON_CNT[1]),
	.S0(POWERON_CNT[0]),
	.Q(POWERON_STATE_UPDATE));


REG2_INC_CL	b2v_inst50(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_13),
	.CL(CMD_LD),
	.DOUT(CMD_MRS_CNT));

assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_37 | SYNTHESIZED_WIRE_15 | SYNTHESIZED_WIRE_38;

assign	OUT_NOP = SYNTHESIZED_WIRE_17 ? H : 1'bz;

assign	OUT_REF = SYNTHESIZED_WIRE_18 ? H : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_37 ? H : 1'bz;

assign	OUT_PREA = SYNTHESIZED_WIRE_39 ? H : 1'bz;

assign	OUT_NOP = SYNTHESIZED_WIRE_21 ? H : 1'bz;

assign	OUT_PRE = SYNTHESIZED_WIRE_40 ? H : 1'bz;


DC2	b2v_inst58(
	.D0(SRFF_inst17),
	.E(CMD_CURR_PREA),
	.Q1(SYNTHESIZED_WIRE_21),
	.Q0(SYNTHESIZED_WIRE_39));

assign	CMD_DONE = SYNTHESIZED_WIRE_39 ? H : 1'bz;


REG4_LD_CL	b2v_inst6(
	.CLK(CLK),
	.LD(CMD_LD),
	
	.DIN(CMD_NEXT),
	.DOUT(CMD_CURRENT));


DC4	b2v_inst60(
	.D1(CMD_MRS_CNT[1]),
	.D0(CMD_MRS_CNT[0]),
	.E(CMD_CURR_MRS),
	.Q3(SYNTHESIZED_WIRE_42),
	.Q2(SYNTHESIZED_WIRE_25),
	.Q1(SYNTHESIZED_WIRE_41),
	.Q0(SYNTHESIZED_WIRE_29));

assign	nCMD_REF_LAST =  ~SYNTHESIZED_WIRE_38;

assign	SYNTHESIZED_WIRE_12 = CMD_CURR_REF & nCMD_REF_LAST;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_25 | SYNTHESIZED_WIRE_41 | SYNTHESIZED_WIRE_42;

assign	OUT_NOP = SYNTHESIZED_WIRE_28 ? H : 1'bz;

assign	OUT_MRS = SYNTHESIZED_WIRE_29 ? H : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_41 ? H : 1'bz;

assign	SYNTHESIZED_WIRE_13 = CMD_CURR_MRS & nCMD_MRS_LAST;

assign	nCMD_MRS_LAST =  ~SYNTHESIZED_WIRE_42;


REG16_INC_CL	b2v_inst7(
	.CLK(CLK),
	.INC(POWERON_STATE_STABLE),
	
	.DOUT(POWERON_STABLE_CNT));

assign	OUT_NOP = CMD_CURR_NOP ? H : 1'bz;


DC2	b2v_inst71(
	.D0(SRFF_inst20),
	.E(CMD_CURR_PRE),
	.Q1(SYNTHESIZED_WIRE_32),
	.Q0(SYNTHESIZED_WIRE_40));

assign	OUT_NOP = SYNTHESIZED_WIRE_32 ? H : 1'bz;

assign	CMD_DONE = SYNTHESIZED_WIRE_40 ? H : 1'bz;


assign	OUT_BST = L;


assign	OUT_WRITEA = L;


assign	OUT_WRITE = L;


assign	OUT_READA = L;


assign	OUT_READ = L;



REG8_INC_CL	b2v_inst8(
	.CLK(CLK),
	.INC(H),
	.CL(CMD_LD)
	);

assign	OUT_ACT = L;



REG2_LD_CL	b2v_inst81(
	.CLK(CLK),
	
	
	
	.DOUT(SDRAM_BA));


REG12_LD_CL	b2v_inst82(
	.CLK(CLK),
	
	
	
	.DOUT(SDRAM_A));

assign	SYNTHESIZED_WIRE_34 = ~(POWERON_STABLE_CNT[15] | POWERON_STABLE_CNT[13] | POWERON_STABLE_CNT[14] | POWERON_STABLE_CNT[12] | POWERON_STABLE_CNT[10] | POWERON_STABLE_CNT[11] | POWERON_STABLE_CNT[9] | POWERON_STABLE_CNT[8]);

assign	SYNTHESIZED_WIRE_35 = ~(POWERON_STABLE_CNT[7] | POWERON_STABLE_CNT[5] | POWERON_STABLE_CNT[6] | POWERON_STABLE_CNT[4] | POWERON_STABLE_CNT[2] | POWERON_STABLE_CNT[3] | POWERON_STABLE_CNT[1] | POWERON_STABLE_CNT[0]);

assign	CMD_LD_INIT = SYNTHESIZED_WIRE_34 & SYNTHESIZED_WIRE_35;

assign	CMD_LD = CMD_LD_STATE_UPDATE | CMD_LD_POWERON1 | CMD_LD_INIT;


DC16	b2v_inst9(
	.D3(CMD_CURRENT[3]),
	.D2(CMD_CURRENT[2]),
	.D1(CMD_CURRENT[1]),
	.D0(CMD_CURRENT[0]),
	.E(H),
	
	
	
	
	.Q11(CMD_CURR_REF),
	
	.Q9(CMD_CURR_PREA),
	.Q8(CMD_CURR_PRE),
	
	
	
	
	
	.Q2(CMD_CURR_MRS),
	
	.Q0(CMD_CURR_NOP));

assign	SDRAM_CKE = H;
assign	nSDRAM_CS = OUT_SDRAM[3];
assign	nSDRAM_RAS = OUT_SDRAM[2];
assign	nSDRAM_CAS = OUT_SDRAM[1];
assign	nSDRAM_WE = OUT_SDRAM[0];
assign	SDRAM_UDQM = nPOWERON_FINISHED;
assign	SDRAM_LDQM = nPOWERON_FINISHED;
assign	H = 1;
assign	L = 0;

endmodule
