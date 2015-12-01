module mux32(out, in0, in1, sel);
    output reg  [31:0] out;
    input [31:0] in0;
    input [31:0] in1;
	input sel;

  	always @(sel)
    begin
      if (sel==0)
            out = in0;
      else
            out = in1;
    end
endmodule
