module ALUControl_t();
  
  //--- Register Input and output
  reg [1:0] ALUOp;
  reg [5:0] funct;
  
  wire [3:0] ALUCon;
  
  //--- call module
  ALUControl dada(ALUOp, funct, ALUCon);
  
  initial begin
    //--- dump the file 
    $dumpfile("dump.vcd");
      $dumpvars(1);
    //--- change input
    ALUOp = 2'b00; #20 funct = 6'b100000; 
    #20
    ALUOp = 2'b01; #20 funct = 6'b100000; 
    #20
   ALUOp = 2'b10; #20 funct = 6'b100000; 
    #20
   ALUOp = 2'b11; #20 funct = 6'b100000; 
    #20

   ALUOp = 2'b00; #20  funct = 6'b100010; 
    #20
    ALUOp = 2'b01; #20 funct = 6'b100010; 
    #20
   ALUOp = 2'b10; #20  funct = 6'b100010; 
    #20
    ALUOp = 2'b11; #20 funct = 6'b100010; 
	#20
    
    ALUOp = 2'b11; #20 funct = 6'b100101; 
	#20
    ALUOp = 2'b11; #20 funct = 6'b100100; 
	#20

    $finish;
  end
  
endmodule