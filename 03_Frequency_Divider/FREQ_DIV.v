//------------------------------------------------------------------------------------------//
//- Advanced Digital IC Design                                                              //
//-                                                                                         //
//- Exercise : Frequency Divider                                                            //
//- Function Description:                                                                   //
//- 1. The frequency divider is used to divide the input clock frequency by a factor of M.  //
//- 2. The output clock is asserted when the counter reaches 0.                             //
//-                                                                                         //
//------------------------------------------------------------------------------------------//

`timescale 1ns/1ps

module FREQ_DIV(
    input       reset,     // Reset signal
    input       clk,       // Input clock signal
    input [2:0] M,         // Input for the frequency division factor
    output reg  out_clk    // Output clock signal
);

    reg [2:0] cnt;         // Counter register

    // Counter counts from M - 1 to 0
    always @(posedge clk) begin
        if (reset) cnt <= 3'd0;
        else if (cnt > 0) cnt <= cnt - 1;
        else if (cnt == 0) cnt <= M - 1;
        else cnt <= cnt;
    end

    // Output clock is asserted when the counter reaches 0
    always @(*) begin
        if (reset) out_clk = 1'b0;
        else if (M == 3'd1) out_clk = clk;
        else if (cnt < M - 1) out_clk = 1'b0;
        else if (cnt == M - 1) out_clk = 1'b1;
        else out_clk = out_clk;
    end

endmodule