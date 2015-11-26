module shift (out, in);
    parameter inWidth = 6;
    parameter outWidth = 6;
    parameter shiftAmount = 2;

    output [outWidth-1:0] out;
    input [inWidth-1:0] in;
    reg [outWidth-1+shiftAmount:0] temp;

  	always @(in)
    begin
      temp={in[inWidth-1:0],2'b00}; //shift left amount
    end

    assign out = temp[outWidth-1:0];
endmodule
