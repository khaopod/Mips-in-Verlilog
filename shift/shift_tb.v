module shift_tb;
    reg [5:0] in = 6'b0110_01;
    reg [5:0] out;
    reg clk = 1'b0;

    shift s1(out,in,clk);

  	always #5 clk=!clk;

  	initial
    begin
     	$dumpfile("dump.vcd");
        $dumpvars(1);
    end
  	initial #200 $finish;
endmodule
