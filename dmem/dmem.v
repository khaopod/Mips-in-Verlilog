module dmem(dataOut, address, dataIn, readmode, writemode);
    output reg [31:0] dataOut;
    input [31:0] address;
    input [31:0] dataIn;
    input readmode;
    input writemode;

    reg [31:0] dMemory [9999:0];

    integer i;
    initial begin
       //Zero all the cells.
      for (i = 0; i<10000; i = i + 1)
        dMemory[i] = 0;
    end

    //do when read or write signal is recieved
    always@ (readmode or writemode)
    begin
        if (writemode == 1)
            dMemory[address]=dataIn; //store data
        else if (readmode == 1)
            dataOut = dMemory[address]; //load data
    end

endmodule
