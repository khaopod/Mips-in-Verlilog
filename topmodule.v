module processorinput (
	address,clk
	);

input [31:0] address;
input clk;

//wire [31:0] in;
wire clock;
output reg			branch_eq, branch_ne;
output reg [1:0]	aluop;
output reg			memread, memwrite, memtoreg;
output reg			regdst, regwrite, alusrc;
wire [31:0] instruction;

instructionmemory instruction1 (address,instruction);
controlUnit control(instruction[31:26], branch_eq,branch_ne,aluop,memread,memwrite,memtoreg,regdst,regwrite,alusrc);

always @(posedge clk) 
begin

	instruction = 0;
	#20
	instruction = 1;



end

endmodule