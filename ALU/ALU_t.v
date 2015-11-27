module ALU_t();
  
  //--- Register Input and output
    reg [3:0] ALUCon; 
  reg [31:0] a;
  reg [31:0] b;

  
  wire [31:0]out;
  wire zero;

  //--- call module
  ALU caca(ALUCon, a, b, out, zero);
  
  
  initial begin
    //--- dump the file
  $dumpfile("dump.vcd");
      $dumpvars(1);
    //--- change input
    ALUCon = 4'b0010; #20 a = 3'b100; #20 b = 3'b100;
    #20
    ALUCon = 4'b0110; #20 a = 3'b100; #20 b = 3'b100;
    #20
    ALUCon = 4'b0001; #20 a = 3'b100; #20 b = 3'b100;
    #20
    ALUCon = 4'b0000; #20 a = 3'b100; #20 b = 3'b100;
    #20
    ALUCon = 4'b0111; #20 a = 3'b100; #20 b = 3'b010;
    #20
    ALUCon = 4'b0111; #20 a = 3'b100; #20 b = 3'b110;
    #20
    $finish;
  end
  
endmodule