//---------------------------------------------------------------------------------------------------//
//- Advanced Digital IC Design                                                                       //
//-                                                                                                  //
//- Exercise : PLL Controller                                                                        //
//- Function Description:                                                                            //
//- 1. The PLL controller is used to control the DCO code.                                           //
//- 2. The DCO code is adjusted by step size every time the phase up or down signal is asserted.     //
//- 3. The step size is halved every time the polarity is switched.                                  //
//- 4. The frequency lock is asserted when the step size is 1.                                       //
//- 5. The polarity is set to 1 when the phase direction is switched.                                //
//-                                                                                                  //
//---------------------------------------------------------------------------------------------------//

`timescale 1ns/1ps

module CONTROLLER(
    input            reset,       // Reset signal
    input            phase_clk,   // Phase clock signal
    input            p_up,        // Phase up signal
    input            p_down,      // Phase down signal
    output reg [4:0] dco_code,    // DCO control code output
    output reg       freq_lock,   // Frequency lock output
    output reg       polarity     // Polarity output
);

    reg [4:0] step;               // Step size for DCO code adjustment
    reg p_history;                // History of phase signal

    // DCO code is adjusted by step size every time the phase up or down signal is asserted
    always @(posedge phase_clk or posedge reset) begin
        if (reset) dco_code <= 5'd16;
        else if (!p_up && p_down) dco_code <= dco_code + step;
        else if (p_up && !p_down) dco_code <= dco_code - step;
        else dco_code <= dco_code;
    end

    // Frequency lock is asserted when the step size is 1
    always @(posedge phase_clk or posedge reset) begin
        if (reset) freq_lock <= 1'b0;
        else if (step == 1) freq_lock <= 1'b1;
        else freq_lock <= 1'b0;
    end

    // If phase direction is switched, polarity is set to 1
    always @(posedge phase_clk or posedge reset) begin
        if (reset) polarity <= 1'b0;
        else if (p_up == p_history) polarity <= 1'b1;
        else polarity <= 1'b0;
    end

    // Store the previous phase down signal
    always @(negedge phase_clk) begin
        p_history <= p_down;
    end

    // Step size is halved every time the polarity is switched
    always @(negedge polarity) begin
        if (reset) step <= 5'd4;
        else if (step != 1) step <= step >> 1;
        else step <= 5'd1;
    end

endmodule