module processorinput (
	address,clk
	);

input address[31:0];
input clk

wire [31:0] in;
wire clock;
wire outCtrl[8:0];
wire instruction[31:0]


always @(posedge clk) 
begin
	instructionmemory instruction1 (in,instruction);

	controlUnit control(instruction[31:26], outCtrl);
	
end