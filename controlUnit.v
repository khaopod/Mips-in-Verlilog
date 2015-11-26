//=====================
//
// MODULE: Control Unit
// AUTHOR: Phasathorn Suwansri ID: 56070503424
// @param [5:0] op - opcode 6 bits
// @return [8:0] ins - instruction signal 9 bits
//   ins[0] : RegDst
//   ins[1] : AluSrc
//   ins[2] : MemtoReg
//   ins[3] : RegWrite
//   ins[4] : MemRead
//   ins[5] : MemWrite
//   ins[6] : Branch
//   ins[7] : ALUOp1
//   ins[8] : ALUOp0
//
//=====================

module controlUnit (
	op,
	ins
	);

parameter OPCODE_WIDTH = 6;
parameter OUTPUT_WIDTH = 9;

//----------- INPUT
input 		[OPCODE_WIDTH-1:0] 	op 	;

//----------- OUTPUT
output reg 	[OUTPUT_WIDTH-1:0] 	ins	;

//----------- Code
wire and_1,and_2,and_3,and_4;
assign and_1 = (!op[0] && !op[1] && !op[2] && !op[3] && !op[4] && !op[5]);
assign and_2 = (op[0] && op[1] && !op[2] && !op[3] && !op[4] && op[5]);
assign and_3 = (op[0] && op[1] && !op[2] && op[3] && !op[4] && op[5]);
assign and_4 = (!op[0] && !op[1] && op[2] && !op[3] && !op[4] && !op[5]);

assign ins[0] = and_1; // RegDst
assign ins[1] = (and_2 || and_3); // AluSrc
assign ins[2] = and_2; // MemtoReg
assign ins[3] = (and_1 || and_2); // RegWrite
assign ins[4] = and_2; // MemRead
assign ins[5] = and_3; // MemWrite
assign ins[6] = and_4; // Branch
assign ins[7] = and_1; // ALUOp1
assign ins[8] = and_4; // ALUOp0


endmodule



