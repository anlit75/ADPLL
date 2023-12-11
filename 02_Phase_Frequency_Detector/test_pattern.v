timescale Ins/ Ips

module TEST;
reg CLK, RESET;
reg IN, FS;
integer fp;

    always #2 CLK=-CLK;

    initial begin
        fp=$fopen( "pfd.vec") ;
        $fdisplay(fp, ";Vector Pattern");
        $fdisplay(fp, "radix        1   1   1");
        $fdisplay(fp, "vname  RESET_B  IN  FB");
        $fdisplay(fp, "io           i   i   i \n");

        $fdisplay(fp, ";Time unit and input rise/fall times");
        $fdisplay(fp, "tunit ns");
        $fdisplay(fp, "trise 0.1");
        $fdisplay(fp, "tfall 0.1");

        $fdisplay(fp, ";Specify logic high and logic low");
        $fdisplay(fp, "vih   1.8");
        $fdisplay(fp, "vil   0.0");
        $fdisplay(fp, "voh   1.8");
        $fdisplay(fp, "vol   0.0 \n");

        $fdisplay(fp, ";Input Pattern");
        $fmonitor(fp, "%08.3f    ", $realtime,
                      "%b     ", RESET,
                      "%h     ", IN,
                      "%h", FB);

        RESET = 0;
        CLK = 0;
        IN = 1'b0;
        FB = 1'b0;

        @(negedge CLK); RESET = 1;
        repeat(6) @(negedge CLK) begin
            IN <= !IN;
            #0.06 FB <= !FB;
        end
        repeat(6) @(negedge CLK) begin
            FB <= !FB;
            #0.06 IN <= !IN;
        end

        @(negedge CLK); 
        #10 $finish;
    end

endmodule