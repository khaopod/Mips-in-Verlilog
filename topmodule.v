module processorinput (
	clk,outALU,ALUCon,
	bitOutSignExtened,
	outmux,data1,data2,
	instruction,zero,dataOut,
	alusrc,aluop,address,selBranch,
	shiftBranch,addAddress,PC4,
	regwrite,memread, memwrite,
	memtoreg,jumpAddress,jump,
	regdst,jal,wrRegis, dataToReg
	);


input 			clk;
output	[31:0]	outALU;
output 			regwrite;
output 	[31:0]	dataToReg;
output reg [31:0] address;
output 	[4:0] 	wrRegis;
output 	[31:0] 	instruction;
output 	[31:0] 	data1;
output  [31:0] 	data2;
output	[3:0]	ALUCon;
output  [31:0] 	bitOutSignExtened;
output  [31:0] 	outmux;
output	[31:0] 	dataOut;
output			alusrc;
output	[1:0]	aluop;
output 			memtoreg;
output			memread, memwrite;
output 			regdst; 
output			jump;
output 			selBranch;
output 	[31:0] 	shiftBranch;
output 	[31:0] 	addAddress;
output 	[31:0] 	PC4;
output 			jal;
wire 	[31:0] 	PC;
wire 	[4:0] 	writeRegister;
wire 			clock;
wire 			branch_eq, branch_ne;
wire  			jumpReg;
wire 	[31:0] 	memData;
wire 	[31:0] 	forBranch;
output 			zero;
output 	[31:0] 	jumpAddress;
wire 	[31:0]	jMuxConnect;
wire 	[31:0]	jrMuxConnect;

initial 
begin 
address   = 32'd40;
address   = address << 2;
end

instructionmemory inst (address,instruction);
assign PC = address+4;

controlUnit control (instruction[31:26], branch_eq,branch_ne,aluop,memread,memwrite,memtoreg,regdst,regwrite,alusrc,clk,jump,jumpReg,jal);
mux5reg muxregis   	(writeRegister, instruction[20:16],instruction[15:11] ,regdst);
register regis 		(instruction[25:21],instruction[20:16],writeRegister,dataToReg,regwrite,data1,data2);
ALUControl aluControl(aluop,instruction[5:0],ALUCon);
signExtend extend 	(bitOutSignExtened, instruction[15:0]);
mux32 mux1 			(outmux,data2,bitOutSignExtened, alusrc);
ALU alu 			(ALUCon,data1,outmux,outALU,zero);

always @(posedge clk)
   address <= PC4; 

dmem mem 	(clk,dataOut,outALU,data2,memwrite,memread);
mux32 muxmem(memData, outALU,dataOut , memtoreg);

and A(selBranch,branch_eq,zero);
assign shiftBranch = bitOutSignExtened<<2;
assign addAddress  = PC + shiftBranch;
assign jumpAddress = {PC[31:28],instruction[25:0] << 2};

mux32 mux2 	 (jMuxConnect, PC, addAddress, selBranch);
mux32 muxJump(jrMuxConnect,jMuxConnect,jumpAddress,jump);
mux32 muxJumpRegister(PC4,jrMuxConnect,data1,jumpReg);
mux5reg muxRA(wrRegis,writeRegister,5'b11111,jal);
mux32 muxJAL (dataToReg,memData,PC,jal);


endmodule