module instructionmemory(
  input [31:0] address,
  output [31:0] instruction
);

  reg [31:0] memory [511:0];

  integer i;

  initial
    begin
      for (i=0; i<512; i=i+1) memory[i] = 32'b0;

      
      memory[0] = 32'b001000_00000_01000_00000_00000_000101;    // addi     $t0,    $0,     5

      
    end

  assign instruction = memory[address>>4];

endmodule

