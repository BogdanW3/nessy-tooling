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
// CREATED		"Tue Aug 29 21:48:36 2023"

module cpu(
	nNMI,
	CLK,
	FC,
	DIN,
	OUT0,
	RD,
	WR,
	A,
	DOUT
);


input wire	nNMI;
input wire	CLK;
input wire	FC;
input wire	[7:0] DIN;
output wire	OUT0;
output wire	RD;
output wire	WR;
output wire	[15:0] A;
output wire	[7:0] DOUT;

wire	[7:0] ACC;
reg	C;
wire	clC;
wire	clD;
wire	clI;
wire	clN;
wire	clV;
wire	clZ;
reg	D;
wire	decSP;
wire	decX;
wire	decY;
reg	end5;
reg	end6;
wire	fail;
reg	five_1;
reg	five_10;
reg	five_11;
reg	five_2;
reg	five_3;
reg	five_4;
reg	five_5;
reg	five_6;
reg	five_7;
reg	five_8;
reg	five_9;
wire	H;
reg	I;
wire	[7:0] IBUS1_;
wire	[15:0] IBUS2_;
wire	incMAR;
wire	incSP;
wire	incX;
wire	incY;
wire	[7:0] inMARH;
wire	[7:0] inMARL;
wire	[7:0] IR0_;
wire	[15:0] IRADDR;
wire	[7:0] IRDATA;
wire	L;
wire	ldACC;
wire	ldMAR;
wire	ldMARH;
wire	ldMARL;
wire	ldMDR;
wire	ldSP;
wire	ldX;
wire	ldY;
wire	[15:0] MAR;
wire	MARout;
wire	[7:0] MDR;
wire	MDRout;
wire	mxMDR;
reg	N;
wire	NMI;
wire	[7:0] PSW;
wire	RD_ALTERA_SYNTHESIZED;
reg	RDSTATUS;
reg	six_1;
reg	six_10;
reg	six_11;
reg	six_2;
reg	six_3;
reg	six_4;
reg	six_5;
reg	six_6;
reg	six_7;
reg	six_8;
reg	six_9;
wire	[15:0] SP;
reg	START;
wire	start5;
wire	start6;
wire	START_ADDR;
wire	START_EXEC;
wire	START_EXEC_ADDR;
wire	START_EXEC_FETCH;
wire	START_FETCH;
wire	START_INTR;
wire	START_INTR_ADDR;
wire	START_INTR_EXEC;
wire	START_INTR_FETCH;
wire	stC;
wire	stD;
wire	stI;
wire	stN;
wire	STRT_INTR_EXEC;
wire	stV;
wire	stZ;
reg	V;
wire	WR_ALTERA_SYNTHESIZED0;
wire	WR_ALTERA_SYNTHESIZED1;
wire	WR_ALTERA_SYNTHESIZED2;
wire	WR_ALTERA_SYNTHESIZED20;
wire	WR_ALTERA_SYNTHESIZED3;
wire	WR_ALTERA_SYNTHESIZED5;
wire	WR_ALTERA_SYNTHESIZED58;
wire	WR_ALTERA_SYNTHESIZED6;
wire	WR_ALTERA_SYNTHESIZED80;
wire	WR_ALTERA_SYNTHESIZED84;
wire	WR_ALTERA_SYNTHESIZED90;
wire	WR_ALTERA_SYNTHESIZED94;
wire	WRA0;
wire	WRF;
wire	[7:0] X;
wire	[7:0] Y;
reg	Z;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[0:7] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_17 = 0;
wire	[15:0] GDFX_TEMP_SIGNAL_12;
wire	[7:0] GDFX_TEMP_SIGNAL_13;
wire	[15:0] GDFX_TEMP_SIGNAL_14;
wire	[15:0] GDFX_TEMP_SIGNAL_15;
wire	[15:0] GDFX_TEMP_SIGNAL_16;
wire	[7:0] GDFX_TEMP_SIGNAL_0;
wire	[7:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_4;
wire	[7:0] GDFX_TEMP_SIGNAL_5;
wire	[7:0] GDFX_TEMP_SIGNAL_6;
wire	[7:0] GDFX_TEMP_SIGNAL_7;
wire	[7:0] GDFX_TEMP_SIGNAL_8;
wire	[7:0] GDFX_TEMP_SIGNAL_9;
wire	[7:0] GDFX_TEMP_SIGNAL_10;
wire	[7:0] GDFX_TEMP_SIGNAL_11;
wire	[7:0] GDFX_TEMP_SIGNAL_1;
wire	[7:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_12 = {L,L,L,L,L,L,L,L,H,H,H,H,H,H,L,H};
assign	GDFX_TEMP_SIGNAL_13 = {H,H,H,H,H,H,H,H};
assign	GDFX_TEMP_SIGNAL_14 = {L,L,H,L,L,L,L,L,L,L,L,L,L,H,H,L};
assign	GDFX_TEMP_SIGNAL_15 = {L,L,H,L,L,L,L,L,L,L,L,L,L,H,L,H};
assign	GDFX_TEMP_SIGNAL_16 = {L,L,H,L,L,L,L,L,L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_0 = {L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_3 = {L,L,L,L,L,L,L,H};
assign	GDFX_TEMP_SIGNAL_4 = {L,L,L,L,L,L,H,L};
assign	GDFX_TEMP_SIGNAL_5 = {L,L,L,L,L,L,H,H};
assign	GDFX_TEMP_SIGNAL_6 = {L,L,L,L,H,H,H,H};
assign	GDFX_TEMP_SIGNAL_7 = {L,L,H,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_8 = {L,H,L,H,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_9 = {H,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_10 = {H,L,L,L,L,H,L,L};
assign	GDFX_TEMP_SIGNAL_11 = {H,L,L,H,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_1 = {H,L,L,H,L,H,L,L};
assign	GDFX_TEMP_SIGNAL_2 = {H,L,H,L,L,L,L,L};


always@(posedge CLK)
begin
	begin
	START <= SYNTHESIZED_WIRE_0;
	end
end



REG8_LD_INC_CL	b2v_inst10(
	.CLK(CLK),
	.LD(SYNTHESIZED_WIRE_1),
	.INC(SYNTHESIZED_WIRE_2),
	
	.DIN(inMARH),
	.DOUT(MAR[15:8]));

assign	SYNTHESIZED_WIRE_3 = START | end6 | fail | end5;


always@(posedge CLK)
begin
	begin
	RDSTATUS <= SYNTHESIZED_WIRE_3;
	end
end

assign	SYNTHESIZED_WIRE_12 =  ~DIN[6];

assign	ldMARH = L;


assign	incMAR = L;


assign	ldMDR = L;


assign	mxMDR = L;


assign	start6 = DIN[6] & RDSTATUS;


assign	IBUS1_ = SYNTHESIZED_WIRE_17;


assign	IBUS2_[7:0] = SYNTHESIZED_WIRE_17;


assign	MDRout = L;



cpu_fetch	b2v_inst148(
	.FC(FC),
	.START(START_FETCH),
	.CLK(CLK),
	.MDR(MDR),
	.START_ADDR(START_ADDR),
	.START_EXEC(START_EXEC_FETCH),
	
	.IR0_(IR0_)
	
	);

assign	fail = RDSTATUS & SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_6 = ~(DIN[6] | DIN[5]);


always@(posedge CLK)
begin
	begin
	five_1 <= start5;
	end
end


cpu_addr	b2v_inst177(
	.FC(FC),
	.START(START_ADDR),
	.CLK(CLK),
	.IR0_(IR0_),
	.START_EXEC(START_EXEC_ADDR),
	.START_INTR(START_INTR_ADDR));


cpu_exec	b2v_inst178(
	.FC(FC),
	.START(START_EXEC),
	.CLK(CLK),
	.IR0_(IR0_)
	);


cpu_intr	b2v_inst179(
	.FC(FC),
	.START(START_INTR),
	.CLK(CLK),
	.IR0_(IR0_),
	.START_FETCH(START_FETCH));


REG8_LD_CL	b2v_inst18(
	.CLK(CLK),
	.LD(ldMDR),
	
	.DIN(SYNTHESIZED_WIRE_7),
	.DOUT(MDR));

assign	START_EXEC = START_EXEC_ADDR | START_EXEC_FETCH;

assign	START_INTR = START_INTR_EXEC | START_INTR_ADDR;


cpu_decode	b2v_inst182(
	.IR0_(IR0_)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	);

assign	RD_ALTERA_SYNTHESIZED = RDSTATUS;


assign	MARout = L;


assign	ldMAR = L;


assign	ldMARL = L;



RisingEdge	b2v_inst2(
	.D(NMI),
	.CLK(CLK),
	.Q(OUT0));


CD16	b2v_inst20(
	.D15(MDRout),
	
	
	
	.D11(WRA0),
	.D10(WR_ALTERA_SYNTHESIZED94),
	.D9(WR_ALTERA_SYNTHESIZED90),
	.D8(WR_ALTERA_SYNTHESIZED84),
	.D7(WR_ALTERA_SYNTHESIZED80),
	.D6(WR_ALTERA_SYNTHESIZED58),
	.D5(WR_ALTERA_SYNTHESIZED20),
	.D4(WRF),
	.D3(WR_ALTERA_SYNTHESIZED3),
	.D2(WR_ALTERA_SYNTHESIZED2),
	.D1(WR_ALTERA_SYNTHESIZED1),
	.D0(WR_ALTERA_SYNTHESIZED0),
	.Q3(SYNTHESIZED_WIRE_8),
	.Q2(SYNTHESIZED_WIRE_9),
	.Q1(SYNTHESIZED_WIRE_10),
	.Q0(SYNTHESIZED_WIRE_11)
	);


MX16x8	b2v_inst21(
	.S3(SYNTHESIZED_WIRE_8),
	.S2(SYNTHESIZED_WIRE_9),
	.S1(SYNTHESIZED_WIRE_10),
	.S0(SYNTHESIZED_WIRE_11),
	.D0_(GDFX_TEMP_SIGNAL_0),
	.D10_(GDFX_TEMP_SIGNAL_1),
	.D11_(GDFX_TEMP_SIGNAL_2),
	
	
	
	.D15_(MDR),
	.D1_(GDFX_TEMP_SIGNAL_3),
	.D2_(GDFX_TEMP_SIGNAL_4),
	.D3_(GDFX_TEMP_SIGNAL_5),
	.D4_(GDFX_TEMP_SIGNAL_6),
	.D5_(GDFX_TEMP_SIGNAL_7),
	.D6_(GDFX_TEMP_SIGNAL_8),
	.D7_(GDFX_TEMP_SIGNAL_9),
	.D8_(GDFX_TEMP_SIGNAL_10),
	.D9_(GDFX_TEMP_SIGNAL_11),
	.Q(DOUT));


REG16_LD_INC_DEC	b2v_inst22(
	.CLK(CLK),
	.LD(ldSP),
	.INC(incSP),
	.DEC(decSP),
	.DIN(GDFX_TEMP_SIGNAL_12)
	);

assign	WR_ALTERA_SYNTHESIZED0 = five_2 | five_4 | five_3 | five_5 | five_7 | five_6 | six_1 | six_3;

assign	WR_ALTERA_SYNTHESIZED80 = L;


assign	WR_ALTERA_SYNTHESIZED90 = six_6 | six_4;

assign	WR_ALTERA_SYNTHESIZED84 = L;





always@(posedge CLK)
begin
	begin
	five_2 <= five_1;
	end
end


RisingEdge	b2v_inst3(
	.D(H),
	.CLK(CLK),
	.Q(SYNTHESIZED_WIRE_0));


always@(posedge CLK)
begin
	begin
	five_3 <= five_2;
	end
end


always@(posedge CLK)
begin
	begin
	five_4 <= five_3;
	end
end


always@(posedge CLK)
begin
	begin
	five_5 <= five_4;
	end
end


always@(posedge CLK)
begin
	begin
	five_6 <= five_5;
	end
end


always@(posedge CLK)
begin
	begin
	five_7 <= five_6;
	end
end


always@(posedge CLK)
begin
	begin
	five_8 <= five_7;
	end
end


always@(posedge CLK)
begin
	begin
	five_9 <= five_8;
	end
end


always@(posedge CLK)
begin
	begin
	five_10 <= five_9;
	end
end


always@(posedge CLK)
begin
	begin
	five_11 <= five_10;
	end
end


always@(posedge CLK)
begin
	begin
	six_1 <= start6;
	end
end



always@(posedge CLK)
begin
	begin
	six_2 <= six_1;
	end
end


always@(posedge CLK)
begin
	begin
	six_3 <= six_2;
	end
end


always@(posedge CLK)
begin
	begin
	six_4 <= six_3;
	end
end


always@(posedge CLK)
begin
	begin
	six_5 <= six_4;
	end
end


always@(posedge CLK)
begin
	begin
	six_6 <= six_5;
	end
end


always@(posedge CLK)
begin
	begin
	six_7 <= six_6;
	end
end


always@(posedge CLK)
begin
	begin
	six_8 <= six_7;
	end
end


always@(posedge CLK)
begin
	begin
	six_9 <= six_8;
	end
end


always@(posedge CLK)
begin
	begin
	six_10 <= six_9;
	end
end


always@(posedge CLK)
begin
	begin
	six_11 <= six_10;
	end
end

assign	NMI =  ~nNMI;


always@(posedge CLK)
begin
	begin
	end5 <= five_11;
	end
end


always@(posedge CLK)
begin
	begin
	end6 <= six_11;
	end
end


assign	WR_ALTERA_SYNTHESIZED1 = six_5 | six_9 | six_11 | six_7;

assign	WRF = six_2 | five_1;


assign	WR_ALTERA_SYNTHESIZED58 = five_10;


assign	WR_ALTERA_SYNTHESIZED20 = five_8;


assign	WR_ALTERA_SYNTHESIZED94 = six_10;


assign	WRA0 = six_8;


assign	start5 = SYNTHESIZED_WIRE_12 & DIN[5] & RDSTATUS;

assign	WR_ALTERA_SYNTHESIZED5 = five_3 | five_2 | five_1 | five_6 | five_5 | five_4 | five_8 | five_7 | five_9 | five_11 | five_10 | L;

assign	WR_ALTERA_SYNTHESIZED6 = six_3 | six_2 | six_1 | six_6 | six_5 | six_4 | six_8 | six_7 | six_9 | six_11 | six_10 | L;

assign	WR_ALTERA_SYNTHESIZED3 = five_9;


assign	WR_ALTERA_SYNTHESIZED2 = five_11;



REG8_LD_CL	b2v_inst64(
	.CLK(CLK),
	.LD(ldACC),
	
	.DIN(IBUS1_)
	);




assign	WR =  ~RD_ALTERA_SYNTHESIZED;


MX2x8	b2v_inst72(
	.S0(mxMDR),
	.D0_(IBUS1_),
	.D1_(DIN),
	.Q(SYNTHESIZED_WIRE_7));


REG8_LD_INC_CL	b2v_inst73(
	.CLK(CLK),
	.LD(SYNTHESIZED_WIRE_13),
	.INC(incMAR),
	
	.DIN(inMARL),
	.DOUT(MAR[7:0]));


CMP8	b2v_inst74(
	.A(MAR[7:0]),
	.B(GDFX_TEMP_SIGNAL_13),
	
	.E(SYNTHESIZED_WIRE_14)
	);

assign	SYNTHESIZED_WIRE_2 = incMAR & SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_1 = ldMAR | ldMARH;

assign	SYNTHESIZED_WIRE_13 = ldMAR | ldMARL;


MX2x8	b2v_inst79(
	.S0(ldMAR),
	.D0_(IBUS2_[7:0]),
	.D1_(IBUS2_[15:8]),
	.Q(inMARH));


MX4x16	b2v_inst8(
	.S1(SYNTHESIZED_WIRE_15),
	.S0(SYNTHESIZED_WIRE_16),
	.D0_(GDFX_TEMP_SIGNAL_14),
	.D1_(GDFX_TEMP_SIGNAL_15),
	.D2_(GDFX_TEMP_SIGNAL_16),
	.D3_(MAR),
	.Q_(A));

assign	inMARL = IBUS2_[7:0];



REG8_LD_INC_DEC	b2v_inst83(
	.CLK(CLK),
	.LD(ldX),
	.INC(incX),
	.DEC(decX),
	.DIN(MDR)
	);


REG8_LD_INC_DEC	b2v_inst84(
	.CLK(CLK),
	.LD(ldY),
	.INC(incY),
	.DEC(decY),
	.DIN(MDR)
	);


CD4	b2v_inst9(
	.D3(MARout),
	.D2(RDSTATUS),
	.D1(WR_ALTERA_SYNTHESIZED5),
	.D0(WR_ALTERA_SYNTHESIZED6),
	.Q1(SYNTHESIZED_WIRE_15),
	.Q0(SYNTHESIZED_WIRE_16)
	);

assign	RD = RD_ALTERA_SYNTHESIZED;
assign	H = 1;
assign	L = 0;

endmodule
