module controlUnit_t ();
  
  //--- Register Input and output
  reg [5:0] op;
  reg [8:0] ins;
  
  //--- call module
  controlUnit a (
    op,ins
  );
   
  initial begin
    //--- dump the file

    //--- change input
    op = 6'b000000;
    #20
    op = 6'b000001;
    #20
    op = 6'b000010;
    #20
    op = 6'b000011;
    #20
    $finish;
  end
  
endmodule