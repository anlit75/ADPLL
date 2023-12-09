`timescale 1ns/10ps

module TEST;

  reg           CLK, RESET;
  reg   [128:0] code;
  integer       fp;

  always #5 CLK = ~CLK;

  initial begin
    fp=$fopen("dco.vec");
    
    $fdisplay(fp, ";Vector Pattern");
    $fdisplay(fp, "radix      1       144444444444444444444444444444444");
    $fdisplay(fp, "vname  reset   code[[128:0]]");
    $fdisplay(fp, "io         i       iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    $fdisplay(fp, " \n");             

    $fdisplay(fp, ";Time unit and input rise/fall time");
    $fdisplay(fp, "tunit ns");
    $fdisplay(fp, "trise 0.1");
    $fdisplay(fp, "tfall 0.1\n");

    $fdisplay(fp, ";Speficy logic high and logic low");
    $fdisplay(fp, "vih   1.8");
    $fdisplay(fp, "vil   0.0");
    $fdisplay(fp, "voh   1.8");  
    $fdisplay(fp, "vol   0.0\n");   

    $fdisplay(fp, ";Input Patterns");
    $fmonitor(fp, "%08.0f     ", $realtime,
                  "%b     ", RESET,
                  "%h", code);
    
    RESET=0; CLK=0;
    code=129'b1;

    @(negedge CLK) RESET=1;
    repeat(128) @(negedge CLK) code <= (code << 1) + 1;
    @(negedge CLK) ;
    #10 $finish;
  end
endmodule
   
