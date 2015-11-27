module processorinput (
	address,clk
	);

input [31:0] address;
input clk;

//wire [31:0] in;
wire clock;
wire			branch_eq, branch_ne;
wire [1:0]	aluop;
wire			memread, memwrite, memtoreg;
wire			regdst, regwrite, alusrc;
wire [31:0] instruction;

instructionmemory instruction1 (address,instruction);
controlUnit control(instruction[31:26], branch_eq,branch_ne,aluop,memread,memwrite,memtoreg,regdst,regwrite,alusrc);

always @(posedge clk) 
begin


end

endmodule