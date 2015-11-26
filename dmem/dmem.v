module dmem(dataOut, address, dataIn, readmode, writemode);
    output reg [31:0] dataOut;
    input [31:0] address;
    input [31:0] dataIn;
    input readmode;
    input writemode;

    reg [31:0] memory [511:0];

    always@ (readmode or writemode)
    begin
        if (writemode == 1)
            memory[address]=dataIn;
        if (readmode == 1)
            dataOut = memory[address];
    end

endmodule
