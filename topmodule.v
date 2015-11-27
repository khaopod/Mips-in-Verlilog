module processorinput (
	address,clk
	);

input [31:0] address;
input clk;
output [31:0] outALU;

//wire [31:0] in;
wire 			clock;
wire 			branch_eq, branch_ne;
wire 	[1:0]	aluop;
wire 			memread, memwrite, memtoreg;
wire 			regdst, regwrite, alusrc;
reg 	[31:0] 	memData = 0;

wire 	[31:0] 	instruction;
wire 	[31:0] 	data1,data2;
wire 	[3:0]	ALUCon;
// wire [31:0] outALU;
wire zero;

instructionmemory inst (address,instruction);
controlUnit control(instruction[31:26], branch_eq,branch_ne,aluop,memread,memwrite,memtoreg,regdst,regwrite,alusrc);
register regis(instruction[25:21],instruction[20:16],instruction[15:11],memData,regwrite,data1,data2);
ALUControl aluControl(aluop,instruction[5:0],ALUCon);
ALU alu(ALUCon,data1,data2,outALU,zero);

always @(posedge clk) 
begin


end

endmodule