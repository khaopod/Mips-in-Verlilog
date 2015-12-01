module ALUControl_t();
  
  //--- Register Input and output
  reg clk;
  reg [31:0] address;
  
  wire          clock;
  wire          branch_eq, branch_ne;
  wire  [1:0]   aluop;
  wire          memread, memwrite, memtoreg;
  wire          regdst, regwrite, alusrc;
  wire  [31:0]  instruction;
  wire  [31:0]  data1,data2;
  wire  [3:0]   ALUCon;
  wire  [31:0]  outALU;
  wire zero;

  //--- call module
processorinput process(address, clk, outALU);
  
  initial begin
    //--- dump the file 
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk = 0;
    address = 32'b00000000000000000000000000000000;
    #20

    $finish;
  end

   always begin
 #10 clk = ~clk; 
 end
  
endmodule
