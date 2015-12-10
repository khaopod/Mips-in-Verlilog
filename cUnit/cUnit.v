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

module controlUnit(
		input  wire	[5:0]	opcode,
		output reg			branch_eq, branch_ne,
		output reg [1:0]	aluop,
		output reg			memread, memwrite, memtoreg,
		output reg			regdst, regwrite, alusrc,
		input clk,
		output reg			jump,
		output reg 			jumpReg,
		output reg 			jal
		);

	
	always @(*) begin
		/* defaults */
		aluop[1:0]	<= 2'b10;
		alusrc		<= 1'b0;
		branch_eq	<= 1'b0;
		branch_ne	<= 1'b0;
		memread		<= 1'b0;
		memtoreg	<= 1'b0;
		memwrite	<= 1'b0;
		regdst		<= 1'b1;
		regwrite	<= 1'b1;
		jump        <= 1'b0;
		jumpReg     <= 1'b0;
		jal			<= 1'b0;

		case (opcode)
			6'b100011: begin	/* lw */
				memread  <= 1'b1;
				regdst   <= 1'b0;
				memtoreg <= 1'b1;
				aluop[1] <= 1'b0;
				alusrc   <= 1'b1;
			end
			6'b001000: begin	/* addi */
				regdst   <= 1'b0;
				aluop[1] <= 1'b0;
				alusrc   <= 1'b1;
				memread  <= 1'b0;
			end
			6'b000100: begin	/* beq */
				aluop[0]  <= 1'b1;
				aluop[1]  <= 1'b0;
				branch_eq <= 1'b1;
				regwrite  <= 1'b0;
			end
			6'b101011: begin	/* sw */
				memwrite <= 1'b1;
				aluop[1] <= 1'b0;
				alusrc   <= 1'b1;
				regwrite <= 1'b0;
			end
			6'b000101: begin	/* bne */
				aluop[0]  <= 1'b1;
				aluop[1]  <= 1'b0;
				branch_ne <= 1'b1;
				regwrite  <= 1'b0;
			end
			6'b000000: begin	/* add */

			end
			6'b000010: begin	/* j jump */
				jump <= 1'b1;
				jal <= 1'b1;
			end
			6'b000011: begin 	/* jal */
			jump <= 1'b1;
				jal <= 1'b1;
			end
			6'h08: begin	/* jr jump register */
				jumpReg <= 1'b1;
			end
		endcase
	end
endmodule



