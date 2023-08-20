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
// CREATED		"Sun Aug 20 16:56:03 2023"

module cpu(
	nNMI,
	CLK,
	OUT0,
	RD,
	WR,
	A,
	D
);


input wire	nNMI;
input wire	CLK;
output wire	OUT0;
output wire	RD;
output wire	WR;
output wire	[15:0] A;
inout wire	[7:0] D;

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
wire	L;
wire	NMI;
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
reg	START;
wire	start5;
wire	start6;
wire	WR_ALTERA_SYNTHESIZED0;
wire	WR_ALTERA_SYNTHESIZED1;
wire	WR_ALTERA_SYNTHESIZED5;
wire	WR_ALTERA_SYNTHESIZED6;
wire	WR_ALTERA_SYNTHESIZED80;
wire	WR_ALTERA_SYNTHESIZED84;
wire	WR_ALTERA_SYNTHESIZED90;
wire	WR_ALTERA_SYNTHESIZED94;
wire	WRA0;
wire	WRF;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;

wire	[7:0] GDFX_TEMP_SIGNAL_7;
wire	[7:0] GDFX_TEMP_SIGNAL_6;
wire	[7:0] GDFX_TEMP_SIGNAL_5;
wire	[7:0] GDFX_TEMP_SIGNAL_4;
wire	[7:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_2;
wire	[7:0] GDFX_TEMP_SIGNAL_1;
wire	[7:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_8;
wire	[15:0] GDFX_TEMP_SIGNAL_9;
wire	[15:0] GDFX_TEMP_SIGNAL_10;


assign	GDFX_TEMP_SIGNAL_7 = {H,L,H,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_6 = {H,L,L,H,L,H,L,L};
assign	GDFX_TEMP_SIGNAL_5 = {H,L,L,H,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_4 = {H,L,L,L,L,H,L,L};
assign	GDFX_TEMP_SIGNAL_3 = {H,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_2 = {L,L,L,L,H,H,H,H};
assign	GDFX_TEMP_SIGNAL_1 = {L,L,L,L,L,L,L,H};
assign	GDFX_TEMP_SIGNAL_0 = {L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_8 = {L,L,H,L,L,L,L,L,L,L,L,L,L,H,H,L};
assign	GDFX_TEMP_SIGNAL_9 = {L,L,H,L,L,L,L,L,L,L,L,L,L,H,L,H};
assign	GDFX_TEMP_SIGNAL_10 = {L,L,H,L,L,L,L,L,L,L,L,L,L,L,L,L};


always@(posedge CLK)
begin
	begin
	START <= SYNTHESIZED_WIRE_0;
	end
end



MX8x8	b2v_inst10(
	.S2(SYNTHESIZED_WIRE_1),
	.S1(SYNTHESIZED_WIRE_2),
	.S0(SYNTHESIZED_WIRE_3),
	.D0_(GDFX_TEMP_SIGNAL_0),
	.D1_(GDFX_TEMP_SIGNAL_1),
	.D2_(GDFX_TEMP_SIGNAL_2),
	.D3_(GDFX_TEMP_SIGNAL_3),
	.D4_(GDFX_TEMP_SIGNAL_4),
	.D5_(GDFX_TEMP_SIGNAL_5),
	.D6_(GDFX_TEMP_SIGNAL_6),
	.D7_(GDFX_TEMP_SIGNAL_7),
	.Q(D));

assign	SYNTHESIZED_WIRE_4 = START | end6 | fail | end5;


always@(posedge CLK)
begin
	begin
	RDSTATUS <= SYNTHESIZED_WIRE_4;
	end
end

assign	start5 = D[5] & RDSTATUS;

assign	start6 = D[6] & RDSTATUS;

assign	fail = RDSTATUS & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_5 = ~(D[6] | D[5]);


always@(posedge CLK)
begin
	begin
	five_1 <= start5;
	end
end


CD8	b2v_inst18(
	.D7(WRA0),
	.D6(WR_ALTERA_SYNTHESIZED94),
	.D5(WR_ALTERA_SYNTHESIZED90),
	.D4(WR_ALTERA_SYNTHESIZED84),
	.D3(WR_ALTERA_SYNTHESIZED80),
	.D2(WRF),
	.D1(WR_ALTERA_SYNTHESIZED1),
	.D0(WR_ALTERA_SYNTHESIZED0),
	.Q2(SYNTHESIZED_WIRE_1),
	.Q1(SYNTHESIZED_WIRE_2),
	.Q0(SYNTHESIZED_WIRE_3)
	);

assign	RD_ALTERA_SYNTHESIZED = RDSTATUS;



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

assign	WR_ALTERA_SYNTHESIZED0 = five_2 | five_5 | five_3 | five_7 | five_11 | five_9 | six_1 | six_3;

assign	WR_ALTERA_SYNTHESIZED1 = six_5 | six_9 | six_11 | six_7;

assign	WRF = six_2 | five_1;

assign	WR_ALTERA_SYNTHESIZED80 = five_6 | five_4;

assign	WR_ALTERA_SYNTHESIZED84 = five_10;


assign	WR_ALTERA_SYNTHESIZED90 = six_4 | six_6 | five_8;

assign	WR_ALTERA_SYNTHESIZED94 = six_10;


assign	WRA0 = six_8;


assign	WR_ALTERA_SYNTHESIZED5 = five_3 | five_2 | five_1 | five_6 | five_5 | five_4 | five_8 | five_7 | five_9 | five_11 | five_10 | L;

assign	WR_ALTERA_SYNTHESIZED6 = six_3 | six_2 | six_1 | six_6 | six_5 | six_4 | six_8 | six_7 | six_9 | six_11 | six_10 | L;

assign	WR =  ~RD_ALTERA_SYNTHESIZED;


MX4x16	b2v_inst8(
	.S1(SYNTHESIZED_WIRE_6),
	.S0(SYNTHESIZED_WIRE_7),
	
	.D1_(GDFX_TEMP_SIGNAL_8),
	.D2_(GDFX_TEMP_SIGNAL_9),
	.D3_(GDFX_TEMP_SIGNAL_10),
	.Q_(A));


CD4	b2v_inst9(
	.D3(RDSTATUS),
	.D2(WR_ALTERA_SYNTHESIZED5),
	.D1(WR_ALTERA_SYNTHESIZED6),
	
	.Q1(SYNTHESIZED_WIRE_6),
	.Q0(SYNTHESIZED_WIRE_7)
	);

assign	RD = RD_ALTERA_SYNTHESIZED;
assign	H = 1;
assign	L = 0;

endmodule
