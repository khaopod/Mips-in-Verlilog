module signExtend(bitOut, bitIn);
  output reg [31:0] bitOut;
  input [15:0] bitIn;

    //do when read or write signal is recieved
  always@ (bitIn)
    begin
      bitOut={bitIn,16'h00000000};
    end

endmodule
