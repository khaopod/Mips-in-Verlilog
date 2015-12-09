module topmodule_t();
  
  //--- Register Input and output
  reg clk;
  wire [31:0] address;
  
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

  wire [31:0] outmux;
  wire [31:0] bitOutSignExtened;
  wire [31:0] dataOut;
  wire  [31:0] shiftBranch;
  wire  [31:0] addAddress;
  wire [31:0] PC4;
  wire selBranch;
  wire [31:0] memData;
  wire [31:0] jumpAddress;
  wire jump,jal;
  wire [4:0] wrRegis;

  //--- call module
processorinput process(clk, outALU,ALUCon, 
  bitOutSignExtened,outmux,data1,data2,
  instruction,zero,dataOut,alusrc,aluop,address,
  selBranch,shiftBranch,addAddress,PC4,regwrite,
  memread, memwrite,memtoreg,jumpAddress,jump,regdst,jal,
  wrRegis
  );
  
  initial begin
    //--- dump the file 
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk = 0;
    

    #100

    $finish;
  end

   always begin
  #5 clk = ~clk;
 end
  
endmodule
