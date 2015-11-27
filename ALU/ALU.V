module ALU(ALUCon,a,b,out,zero);
	input [3:0] ALUCon; 
	input [31:0] a;
	input [31:0] b;
	output reg [31:0] out;
	output reg zero;

always @(*) begin
		case (ALUCon)
			4'b0010:  out <= a + b;				/* add */
			4'b0110:  out <= a - b;				/* sub */
			4'b0001:  out <= a | b;				/* or */
			4'b0000:  out <= a & b;				/* and */
			4'b0111:  begin if(a < b) 
							out <= 32'd1; 
						else 
                          out <= 32'd0; end
			default: out <= 32'd0;
		endcase
	end
  
always @(*) begin
  if(out)
	zero <= 0;
  else
    zero <= 1;
end
  
endmodule