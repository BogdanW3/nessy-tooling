module CMPX (
    input wire [size-1:0] A,
    input wire [size-1:0] B,
    output reg eq,
    output reg ls,
    output reg gr
    );
	 parameter size = 16;

    always @* begin
      if (A<B) begin
        eq = 0;
        ls = 1;
        gr = 0;
      end
      else if (A==B) begin
        eq = 1;
        ls = 0;
        gr = 0;
      end
      else begin
        eq = 0;
        ls = 0;
        gr = 1;
      end
    end
endmodule