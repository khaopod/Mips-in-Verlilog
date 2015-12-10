module instructionmemory(
  input [31:0] address,
  output [31:0] instruction
);

  reg [31:0] memory [249:0];
  integer i;

  initial
    begin
      for (i=0; i<250; i=i+1) memory[i] = 32'b0;      
       memory[40]    = 32'b001000_00000_01000_0000000000000010; //addi $t0, $0, 2
       memory[41]    = 32'b001000_00000_01001_0000000000000010; //addi $t1, $0, 2
       //memory[48]  = 32'b000000_01000_01001_01011_00000_100010; //sub $t2, $t1, $t0
       memory[42]    = 32'b000100_01000_01001_0000000000000010; //branch
       memory[43]    = 32'b001000_00000_01010_0000000000000010; //addi $t2, $0, 2
       memory[44]    = 32'b001000_00000_01100_0000000000000001; //addi $t3, $0, 1
       memory[45]    = 32'b001000_00000_01101_0000000000000011; //addi $t4, $0, 3
       memory[46]    = 32'b001000_00000_01000_0000000000000010; //addi $t0, $0, 2
       memory[47]    = 32'b101011_01101_01000_0000011111010000; //sw $t4(rs),$t0(rt)
       memory[48]    = 32'b100011_01101_01000_0000011111010000; //lw $t0(rs) ,$t4(rt)
       // memory[43] = 32'b000100_01000_01001_0000000000001111;//beq $t0, $t1, 1
       // memory[0]  = 32'b00100000000010000000000000000101;    // addi     $t0,    $0,     5
       // memory[49]    = 32'b000010_00000_00000_0000000000101011; //jump
       memory[49]    = 32'b000011_00000_00000_0000000000101000; // jump and link
    end

  assign instruction = memory[address>>2];
endmodule

