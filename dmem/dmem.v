module dmem (
  input clk,
  input [31:0] address, dataIn,
  input writemode, readmode,
  output [31:0] dataOut
);

  reg [31:0] Mem [2499:250];

  always @(negedge clk) begin
    if(writemode)
      Mem[address >> 2] = dataIn;
  end
     assign dataOut = readmode ? Mem[address >> 2] : 0;
endmodule
