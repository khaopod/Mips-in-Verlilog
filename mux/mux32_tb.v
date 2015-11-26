module t_mux32;
  reg [31:0] in0 = 32'h00000001;
  reg [31:0] in1 = 32'h00000003;
  reg [31:0] out;
  reg sel=1'b1;

  mux32 mux1(out,in0,in1,sel);

  always #5 sel=!sel;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
  	initial #200 $finish;
endmodule
