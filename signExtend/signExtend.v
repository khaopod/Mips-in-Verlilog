module signExtend(bitOut, bitIn);
  output reg [31:0] bitOut;
  input [15:0] bitIn;

    //do when read or write signal is recieved
  always@ (bitIn)
    begin
      bitOut={16'b0000_0000_0000_0000,bitIn};
    end

endmodule
