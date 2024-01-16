//---------------------------------------------//
//- Advanced Digital IC Design                 //
//-                                            //
//- Exercise : PLL Controller                  //
//---------------------------------------------//

`timescale 1ns/1ps

// Include the Sub Module
`include "CONTROLLER.v"

module tb;

    reg RESET;      // System reset signal
    reg P_UP;       // PFD output (Phase up signal)
    reg P_DOWN;     // PFD output (Phase down signal)
    reg PHASE_CLK;  // Phase clock signal
    reg FREQ_LOCK;  // Frequency lock output
    reg POLARITY;   // Polarity output

    wire [4:0] DCO_CODE;    // DCO control code output

    // Instantiate the PLL controller module
    CONTROLLER PLL_CONTROLLER(
        .reset(RESET),
        .phase_clk(PHASE_CLK),
        .p_up(P_UP),
        .p_down(P_DOWN),
        .dco_code(DCO_CODE),
        .freq_lock(FREQ_LOCK),
        .polarity(POLARITY)
    );

    // Generate the phase clock signal
    always @(P_UP or P_DOWN) PHASE_CLK <= #0.3 (P_UP && P_DOWN);

    initial begin
        // WaveDump all signals
        $fsdbDumpfile("CONTROLLER.fsdb");
        $fsdbDumpvars;

        RESET = 1'b0;
        #5 RESET = 1'b1;
        P_UP = 1'b1;
        P_DOWN = 1'b1;

        #20 RESET = 1'b0;

        // Test up
        #20 P_UP = 1'b0;
        #2  P_UP = 1'b1;
        #20 P_UP = 1'b0;
        #2  P_UP = 1'b1;
        #20 P_UP = 1'b0;
        #2  P_UP = 1'b1;

        // Test down
        #20 P_DOWN = 1'b0;
        #2  P_DOWN = 1'b1;
        #20 P_UP = 1'b0;
        #2  P_UP = 1'b1;
        #20 P_UP = 1'b0;
        #2  P_UP = 1'b1;
        #20 P_DOWN = 1'b0;
        #2  P_DOWN = 1'b1;
        #20 P_UP = 1'b0;
        #2  P_UP = 1'b1;
        #20 P_DOWN = 1'b0;
        #2  P_DOWN = 1'b1;
        #20 P_UP = 1'b0;
        #2  P_UP = 1'b1;
        #20 P_DOWN = 1'b0;
        #2  P_DOWN = 1'b1;
        #20 P_UP = 1'b0;
        #2  P_UP = 1'b1;
        #20 P_DOWN = 1'b0;
        #2  P_DOWN = 1'b1;

        #15 $finish;
    end

endmodule