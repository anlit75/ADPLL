//---------------------------------------------//
//- Advanced Digital IC Design                 //
//-                                            //
//- Exercise : Frequency Divider               //
//---------------------------------------------//

`timescale 1ns/1ps

// Include the Sub Module
`include "FREQ_DIV.v"

module tb;

    reg RESET;
    reg REF_CLK;
    reg CLK_OUT;
    reg [2:0] M;

    // 100MHz Reference Clock: Period = 10ns
    always #5 REF_CLK = ~REF_CLK;

    // Instantiate the DUT
    FREQ_DIV DUT(
        .reset(RESET),
        .clk(REF_CLK),
        .M(M),
        .out_clk(CLK_OUT)
    );

    initial begin
        // WaveDump all signals
        $fsdbDumpfile("FREQ_DIV.fsdb");
        $fsdbDumpvars;

        REF_CLK = 1'b0;
        M = 3'd0;
        RESET = 1'b1;
        #20 RESET = 1'b0;

        repeat (8) begin
            M = M + 1;
            repeat (M*5) @(negedge REF_CLK)
        end

        #15 $finish;
    end

endmodule