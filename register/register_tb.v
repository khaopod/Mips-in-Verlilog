// Code your testbench here
// or browse Examples
module register_tb ();
  
  //--- Register Input and output
  reg [4:0] read1,read2,reg_write;
  reg [31:0] data1,data2,wdata;
  reg write;
  reg clk;
  
  //--- call module
  register a (read1,read2,reg_write,wdata,write,clk,data1,data2);
   
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      clk = 0;
      repeat (1000) begin
        #5 clk = !clk;
      end
    end
    initial begin
      //--- change input
      read1 = 5'b00000;
      read2 = 5'b01000;
      wdata = 5'b01111;
      reg_write = 5'b01000;
      write = 1'b1;
      #20
      read1 = 5'b00011;
      read2 = 5'b00000;
      reg_write = 5'b00011;
      wdata = 5'b00111;
      write = 1'b1;
      #20
      read1 = 5'b00000;
      read2 = 5'b00000;
      reg_write = 5'b00000;
      wdata = 5'b00111;
      write = 1'b0;
      #20
      read1 = 5'b00000;
      read2 = 5'b00000;
      reg_write = 5'b00001;
      wdata = 5'b00011;
      write = 1'b1;
      #20
      read1 = 5'b00000;
      read2 = 5'b00001;
      reg_write = 5'b00000;
      write = 1'b0;
      #20
      $finish;
    end
  
endmodule