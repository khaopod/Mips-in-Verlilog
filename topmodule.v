module processorinput (
	address,clk
	);

input [31:0] address;
input clk;

//wire [31:0] in;
wire 			clock;
wire 			branch_eq, branch_ne;
wire 	[1:0]	aluop;
wire 			memread, memwrite, memtoreg;
wire 			regdst, regwrite, alusrc;
reg 	[31:0] 	memData = 0;

wire 	[31:0] 	instruction;
wire 	[4:0] 	data1,data2;

instructionmemory instruction1 (address,instruction);
controlUnit control(instruction[31:26], branch_eq,branch_ne,aluop,memread,memwrite,memtoreg,regdst,regwrite,alusrc);
register reg(instruction[25:21],instruction[20:16],instruction[15:11],memData,regwrite,data1,data2);


always @(posedge clk) 
begin


end

endmodule