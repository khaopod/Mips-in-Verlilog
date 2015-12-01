module signExtend_tb;
  reg [15:0] in16bit=16'h0023;
  reg [31:0] out;

  signExtend s1(out,in16bit);

  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
  	initial #200 $finish;
endmodule
