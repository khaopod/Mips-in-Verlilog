// Code your design here
module register(

input [4:0]read1,read2,reg_write,
  input [31:0]wdata,
input write,
  output reg [4:0]data1,data2

);

  reg [31:0]register[31:0];

always @(*) begin
	if(read1 == 0)
		data1 = 0;
  else if((read1 == reg_write) && write)
		data1 = wdata;
	else
      data1 = register[read1][31:0];
end

always @(*) begin
	if(read2 == 0)
		data2 = 0;
  else if((read2 == reg_write) && write)
		data2 = wdata;
	else
      data2 = register[read2][31:0];
end

always @(*) begin
  if(write && (reg_write != 0))
		register[reg_write] = wdata;
end
endmodule