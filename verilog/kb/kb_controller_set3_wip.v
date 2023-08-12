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
// CREATED		"Sat Aug 12 22:53:56 2023"

module kb_controller_set3_wip(
	INTA,
	CLK,
	INTR,
	PS2_DATA,
	PS2_CLK,
	Q
);


input wire	INTA;
input wire	CLK;
output wire	INTR;
inout wire	PS2_DATA;
inout wire	PS2_CLK;
output wire	[7:0] Q;

reg	BOOT0;
reg	BOOT1;
reg	BOOT2;
wire	BOOT3;
reg	BOOTCMD0;
reg	BOOTCMD1;
reg	BOOTCMD2;
reg	BOOTCMD3;
reg	BOOTCMD4;
reg	BOOTCMD5;
reg	BOOTCMD6;
reg	BOOTCMD7;
reg	BOOTSET0;
reg	BOOTSET1;
reg	BOOTSET2;
reg	BOOTSET3;
reg	BOOTSET4;
reg	BOOTSET5;
reg	BOOTSET6;
reg	BOOTSET7;
reg	BOOTUP_FINISHED;
wire	[15:0] BOOTUP_STABLE;
wire	BOOTUP_STABLE_DONE;
reg	D0;
reg	D1;
reg	D2;
reg	D3;
reg	D4;
reg	D5;
reg	D6;
reg	D7;
wire	H;
wire	idle;
wire	KBCLK;
wire	L;
wire	LD;
reg	parity;
reg	[7:0] Q_ALTERA_SYNTHESIZED;
reg	tick0;
reg	tick1;
reg	tick2;
reg	tick3;
reg	tick4;
reg	tick5;
reg	tick6;
reg	tick7;
reg	tick8;
reg	tick9;
reg	VALID;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
reg	DFF_inst38;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_11;
reg	SRFF_inst21;
wire	SYNTHESIZED_WIRE_5;
reg	SRFF_inst10;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
reg	SRFF_inst44;
reg	DFF_inst58;

assign	SYNTHESIZED_WIRE_11 = 0;




kb_debouncer	b2v_inst(
	.D(PS2_CLK),
	.CLK(CLK),
	.Q(KBCLK));


always@(posedge KBCLK)
begin
	begin
	parity <= PS2_DATA;
	end
end


always@(posedge CLK)
begin
	SRFF_inst10 <= ~SRFF_inst10 & H | SRFF_inst10 & ~L;
end


always@(posedge KBCLK)
begin
	begin
	tick0 <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick1 <= tick0;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick2 <= tick1;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick3 <= tick2;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick4 <= tick3;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick5 <= tick4;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick6 <= tick5;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick7 <= tick6;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick8 <= tick7;
	end
end


always@(posedge KBCLK)
begin
	begin
	D7 <= parity;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick9 <= tick8;
	end
end


always@(posedge CLK)
begin
	SRFF_inst21 <= ~SRFF_inst21 & BOOT2 | SRFF_inst21 & ~BOOT3;
end


assign	SYNTHESIZED_WIRE_0 = BOOTUP_FINISHED & SYNTHESIZED_WIRE_1 & DFF_inst38 & idle;


REG16_INC_CL	b2v_inst24(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_2),
	.CL(L),
	.DOUT(BOOTUP_STABLE));

assign	SYNTHESIZED_WIRE_1 =  ~PS2_DATA;


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[7] <= D7;
	end
end


RisingEdge	b2v_inst27(
	.D(tick9),
	.CLK(CLK),
	.Q(LD));


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[6] <= D6;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[5] <= D5;
	end
end


always@(posedge KBCLK)
begin
	begin
	D6 <= D7;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[4] <= D4;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[3] <= D3;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[2] <= D2;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[1] <= D1;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[0] <= D0;
	end
end


always@(posedge CLK)
begin
	VALID <= ~VALID & LD | VALID & ~INTA;
end

assign	idle = ~(tick9 | tick8 | tick7 | tick5 | tick6 | tick4 | tick2 | tick3 | tick1 | SYNTHESIZED_WIRE_11 | tick0 | SYNTHESIZED_WIRE_11);

assign	BOOT3 = SRFF_inst21 & SYNTHESIZED_WIRE_5;


always@(posedge KBCLK)
begin
	begin
	DFF_inst38 <= PS2_DATA;
	end
end

assign	BOOTUP_STABLE_DONE = BOOTUP_STABLE[12] & BOOTUP_STABLE[10];


always@(posedge KBCLK)
begin
	begin
	D5 <= D6;
	end
end

assign	SYNTHESIZED_WIRE_2 = SRFF_inst10 & SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_5 =  ~BOOTCMD0;

assign	PS2_CLK = SYNTHESIZED_WIRE_7 ? L : 1'bz;

assign	SYNTHESIZED_WIRE_8 =  ~BOOTUP_STABLE_DONE;


always@(posedge CLK)
begin
	SRFF_inst44 <= ~SRFF_inst44 & SYNTHESIZED_WIRE_8 | SRFF_inst44 & ~BOOT2;
end


always@(posedge CLK)
begin
	begin
	BOOT0 <= SYNTHESIZED_WIRE_9;
	end
end


RisingEdge	b2v_inst46(
	.D(BOOTUP_STABLE_DONE),
	.CLK(CLK),
	.Q(SYNTHESIZED_WIRE_9));

assign	PS2_DATA = SYNTHESIZED_WIRE_10 ? L : 1'bz;


always@(posedge CLK)
begin
	begin
	BOOT1 <= BOOT0;
	end
end


always@(posedge CLK)
begin
	begin
	BOOT2 <= BOOT1;
	end
end


always@(posedge KBCLK)
begin
	begin
	D4 <= D5;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTCMD0 <= BOOT3;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTCMD1 <= BOOTCMD0;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTCMD2 <= BOOTCMD1;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTCMD3 <= BOOTCMD2;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTCMD4 <= BOOTCMD3;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTCMD5 <= BOOTCMD4;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTCMD6 <= BOOTCMD5;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTCMD7 <= BOOTCMD6;
	end
end


always@(posedge KBCLK)
begin
	begin
	DFF_inst58 <= BOOTCMD7;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTSET1 <= BOOTSET0;
	end
end


always@(posedge KBCLK)
begin
	begin
	D3 <= D4;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTSET2 <= BOOTSET1;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTSET3 <= BOOTSET2;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTSET4 <= BOOTSET3;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTSET5 <= BOOTSET4;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTSET6 <= BOOTSET5;
	end
end


always@(posedge KBCLK)
begin
	begin
	BOOTSET7 <= BOOTSET6;
	end
end


always@(posedge KBCLK)
begin
	BOOTUP_FINISHED <= ~BOOTUP_FINISHED & BOOTSET7 | BOOTUP_FINISHED & ~L;
end

assign	SYNTHESIZED_WIRE_10 = BOOTCMD4 | BOOT2 | BOOT1 | BOOTCMD7 | BOOTCMD6 | BOOTCMD5 | BOOTSET3 | BOOTSET2 | BOOTSET4 | BOOTSET6 | BOOTSET5 | BOOTSET7;




always@(posedge KBCLK)
begin
	begin
	D2 <= D3;
	end
end

assign	SYNTHESIZED_WIRE_7 = SRFF_inst44 | BOOT2;

assign	SYNTHESIZED_WIRE_6 =  ~BOOTUP_STABLE_DONE;


always@(posedge KBCLK)
begin
	begin
	BOOTSET0 <= DFF_inst58;
	end
end


always@(posedge KBCLK)
begin
	begin
	D1 <= D2;
	end
end


always@(posedge KBCLK)
begin
	begin
	D0 <= D1;
	end
end

assign	INTR = VALID;
assign	Q = Q_ALTERA_SYNTHESIZED;
assign	H = 1;
assign	L = 0;

endmodule
