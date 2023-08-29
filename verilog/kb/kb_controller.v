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
// CREATED		"Tue Aug 29 21:46:16 2023"

module kb_controller(
	INTA,
	CLK,
	PS2_CLK,
	PS2_DATA,
	INTR,
	Q
);


input wire	INTA;
input wire	CLK;
input wire	PS2_CLK;
input wire	PS2_DATA;
output reg	INTR;
output wire	[7:0] Q;

reg	[7:0] D;
wire	idle;
wire	KBCLK;
wire	LD;
reg	parity;
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
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_3;
reg	DFF_inst38;

assign	SYNTHESIZED_WIRE_4 = 0;




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


REG8_LD_CL	b2v_inst10(
	.CLK(CLK),
	.LD(LD),
	
	.DIN(D),
	.DOUT(Q));


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
	D[7] <= parity;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick9 <= tick8;
	end
end


assign	SYNTHESIZED_WIRE_3 =  ~PS2_DATA;


RisingEdge	b2v_inst27(
	.D(tick9),
	.CLK(CLK),
	.Q(LD));


always@(posedge KBCLK)
begin
	begin
	D[6] <= D[7];
	end
end


always@(posedge CLK)
begin
	INTR <= ~INTR & LD | INTR & ~INTA;
end

assign	idle = ~(tick9 | tick8 | tick7 | tick5 | tick6 | tick4 | tick2 | tick3 | tick1 | SYNTHESIZED_WIRE_4 | tick0 | SYNTHESIZED_WIRE_4);


always@(posedge KBCLK)
begin
	begin
	DFF_inst38 <= PS2_DATA;
	end
end


always@(posedge KBCLK)
begin
	begin
	D[5] <= D[6];
	end
end


always@(posedge KBCLK)
begin
	begin
	D[4] <= D[5];
	end
end


always@(posedge KBCLK)
begin
	begin
	D[3] <= D[4];
	end
end


always@(posedge KBCLK)
begin
	begin
	D[2] <= D[3];
	end
end

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_3 & DFF_inst38 & idle;


always@(posedge KBCLK)
begin
	begin
	D[1] <= D[2];
	end
end


always@(posedge KBCLK)
begin
	begin
	D[0] <= D[1];
	end
end


endmodule
