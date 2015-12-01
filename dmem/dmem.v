module dmem(dataOut, address, dataIn, readmode, writemode);
    output reg [31:0] dataOut;
    input [31:0] address;
    input [31:0] dataIn;
    input readmode;
    input writemode;


    always@ (readmode or writemode)
    begin
        if (writemode == 1)
        if (readmode == 1)
    end

endmodule
