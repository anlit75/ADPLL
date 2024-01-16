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

`include "FILTER.v"

module CONTROLLER(
    input              reset,           // Reset signal
    input              phase_clk,       // Phase clock signal
    input              p_up,            // Phase up signal
    input              p_down,          // Phase down signal
    output reg         freq_lock,       // Frequency lock output
    output reg         polarity,        // Polarity output
    output reg [128:0] dco_code         // DCO control code output
);

    reg [4:0] step = 8;                 // Step size for DCO code adjustment
    reg [7:0] dco_code_int = 8'd0;      // Integer DCO code
    reg [128:0] dco_code_bit = 129'h0;  // DCO code in binary
    reg p_history;                      // History of phase signal
    wire [7:0] avg_code_int;            // Integer DCO code after FILTER

    FILTER FILTER(
        .rst(reset),
        .clk(phase_clk),
        .lock(freq_lock),
        .p_up(p_up),
        .p_down(p_down),
        .code(dco_code_int),
        .avg_code(avg_code_int)
    );

    always @(*) begin
        if (reset) dco_code = dco_code_bit;
        else dco_code = dco_code_bit;
    end

    always @(*) begin
        case(avg_code_int)
              0: dco_code_bit = 129'h000000000000000000000000000000000;
              1: dco_code_bit = 129'h000000000000000000000000000000001;
              2: dco_code_bit = 129'h000000000000000000000000000000003;
              3: dco_code_bit = 129'h000000000000000000000000000000007;
              4: dco_code_bit = 129'h00000000000000000000000000000000f;
              5: dco_code_bit = 129'h00000000000000000000000000000001f;
              6: dco_code_bit = 129'h00000000000000000000000000000003f;
              7: dco_code_bit = 129'h00000000000000000000000000000007f;
              8: dco_code_bit = 129'h0000000000000000000000000000000ff;
              9: dco_code_bit = 129'h0000000000000000000000000000001ff;
             10: dco_code_bit = 129'h0000000000000000000000000000003ff;
             11: dco_code_bit = 129'h0000000000000000000000000000007ff;
             12: dco_code_bit = 129'h000000000000000000000000000000fff;
             13: dco_code_bit = 129'h000000000000000000000000000001fff;
             14: dco_code_bit = 129'h000000000000000000000000000003fff;
             15: dco_code_bit = 129'h000000000000000000000000000007fff;
             16: dco_code_bit = 129'h00000000000000000000000000000ffff;
             17: dco_code_bit = 129'h00000000000000000000000000001ffff;
             18: dco_code_bit = 129'h00000000000000000000000000003ffff;
             19: dco_code_bit = 129'h00000000000000000000000000007ffff;
             20: dco_code_bit = 129'h0000000000000000000000000000fffff;
             21: dco_code_bit = 129'h0000000000000000000000000001fffff;
             22: dco_code_bit = 129'h0000000000000000000000000003fffff;
             23: dco_code_bit = 129'h0000000000000000000000000007fffff;
             24: dco_code_bit = 129'h000000000000000000000000000ffffff;
             25: dco_code_bit = 129'h000000000000000000000000001ffffff;
             26: dco_code_bit = 129'h000000000000000000000000003ffffff;
             27: dco_code_bit = 129'h000000000000000000000000007ffffff;
             28: dco_code_bit = 129'h00000000000000000000000000fffffff;
             29: dco_code_bit = 129'h00000000000000000000000001fffffff;
             30: dco_code_bit = 129'h00000000000000000000000003fffffff;
             31: dco_code_bit = 129'h00000000000000000000000007fffffff;
             32: dco_code_bit = 129'h0000000000000000000000000ffffffff;
             33: dco_code_bit = 129'h0000000000000000000000001ffffffff;
             34: dco_code_bit = 129'h0000000000000000000000003ffffffff;
             35: dco_code_bit = 129'h0000000000000000000000007ffffffff;
             36: dco_code_bit = 129'h000000000000000000000000fffffffff;
             37: dco_code_bit = 129'h000000000000000000000001fffffffff;
             38: dco_code_bit = 129'h000000000000000000000003fffffffff;
             39: dco_code_bit = 129'h000000000000000000000007fffffffff;
             40: dco_code_bit = 129'h00000000000000000000000ffffffffff;
             41: dco_code_bit = 129'h00000000000000000000001ffffffffff;
             42: dco_code_bit = 129'h00000000000000000000003ffffffffff;
             43: dco_code_bit = 129'h00000000000000000000007ffffffffff;
             44: dco_code_bit = 129'h0000000000000000000000fffffffffff;
             45: dco_code_bit = 129'h0000000000000000000001fffffffffff;
             46: dco_code_bit = 129'h0000000000000000000003fffffffffff;
             47: dco_code_bit = 129'h0000000000000000000007fffffffffff;
             48: dco_code_bit = 129'h000000000000000000000ffffffffffff;
             49: dco_code_bit = 129'h000000000000000000001ffffffffffff;
             50: dco_code_bit = 129'h000000000000000000003ffffffffffff;
             51: dco_code_bit = 129'h000000000000000000007ffffffffffff;
             52: dco_code_bit = 129'h00000000000000000000fffffffffffff;
             53: dco_code_bit = 129'h00000000000000000001fffffffffffff;
             54: dco_code_bit = 129'h00000000000000000003fffffffffffff;
             55: dco_code_bit = 129'h00000000000000000007fffffffffffff;
             56: dco_code_bit = 129'h0000000000000000000ffffffffffffff;
             57: dco_code_bit = 129'h0000000000000000001ffffffffffffff;
             58: dco_code_bit = 129'h0000000000000000003ffffffffffffff;
             59: dco_code_bit = 129'h0000000000000000007ffffffffffffff;
             60: dco_code_bit = 129'h000000000000000000fffffffffffffff;
             61: dco_code_bit = 129'h000000000000000001fffffffffffffff;
             62: dco_code_bit = 129'h000000000000000003fffffffffffffff;
             63: dco_code_bit = 129'h000000000000000007fffffffffffffff;
             64: dco_code_bit = 129'h00000000000000000ffffffffffffffff;
             65: dco_code_bit = 129'h00000000000000001ffffffffffffffff;
             66: dco_code_bit = 129'h00000000000000003ffffffffffffffff;
             67: dco_code_bit = 129'h00000000000000007ffffffffffffffff;
             68: dco_code_bit = 129'h0000000000000000fffffffffffffffff;
             69: dco_code_bit = 129'h0000000000000001fffffffffffffffff;
             70: dco_code_bit = 129'h0000000000000003fffffffffffffffff;
             71: dco_code_bit = 129'h0000000000000007fffffffffffffffff;
             72: dco_code_bit = 129'h000000000000000ffffffffffffffffff;
             73: dco_code_bit = 129'h000000000000001ffffffffffffffffff;
             74: dco_code_bit = 129'h000000000000003ffffffffffffffffff;
             75: dco_code_bit = 129'h000000000000007ffffffffffffffffff;
             76: dco_code_bit = 129'h00000000000000fffffffffffffffffff;
             77: dco_code_bit = 129'h00000000000001fffffffffffffffffff;
             78: dco_code_bit = 129'h00000000000003fffffffffffffffffff;
             79: dco_code_bit = 129'h00000000000007fffffffffffffffffff;
             80: dco_code_bit = 129'h0000000000000ffffffffffffffffffff;
             81: dco_code_bit = 129'h0000000000001ffffffffffffffffffff;
             82: dco_code_bit = 129'h0000000000003ffffffffffffffffffff;
             83: dco_code_bit = 129'h0000000000007ffffffffffffffffffff;
             84: dco_code_bit = 129'h000000000000fffffffffffffffffffff;
             85: dco_code_bit = 129'h000000000001fffffffffffffffffffff;
             86: dco_code_bit = 129'h000000000003fffffffffffffffffffff;
             87: dco_code_bit = 129'h000000000007fffffffffffffffffffff;
             88: dco_code_bit = 129'h00000000000ffffffffffffffffffffff;
             89: dco_code_bit = 129'h00000000001ffffffffffffffffffffff;
             90: dco_code_bit = 129'h00000000003ffffffffffffffffffffff;
             91: dco_code_bit = 129'h00000000007ffffffffffffffffffffff;
             92: dco_code_bit = 129'h0000000000fffffffffffffffffffffff;
             93: dco_code_bit = 129'h0000000001fffffffffffffffffffffff;
             94: dco_code_bit = 129'h0000000003fffffffffffffffffffffff;
             95: dco_code_bit = 129'h0000000007fffffffffffffffffffffff;
             96: dco_code_bit = 129'h000000000ffffffffffffffffffffffff;
             97: dco_code_bit = 129'h000000001ffffffffffffffffffffffff;
             98: dco_code_bit = 129'h000000003ffffffffffffffffffffffff;
             99: dco_code_bit = 129'h000000007ffffffffffffffffffffffff;
            100: dco_code_bit = 129'h00000000fffffffffffffffffffffffff;
            101: dco_code_bit = 129'h00000001fffffffffffffffffffffffff;
            102: dco_code_bit = 129'h00000003fffffffffffffffffffffffff;
            103: dco_code_bit = 129'h00000007fffffffffffffffffffffffff;
            104: dco_code_bit = 129'h0000000ffffffffffffffffffffffffff;
            105: dco_code_bit = 129'h0000001ffffffffffffffffffffffffff;
            106: dco_code_bit = 129'h0000003ffffffffffffffffffffffffff;
            107: dco_code_bit = 129'h0000007ffffffffffffffffffffffffff;
            108: dco_code_bit = 129'h000000fffffffffffffffffffffffffff;
            109: dco_code_bit = 129'h000001fffffffffffffffffffffffffff;
            110: dco_code_bit = 129'h000003fffffffffffffffffffffffffff;
            111: dco_code_bit = 129'h000007fffffffffffffffffffffffffff;
            112: dco_code_bit = 129'h00000ffffffffffffffffffffffffffff;
            113: dco_code_bit = 129'h00001ffffffffffffffffffffffffffff;
            114: dco_code_bit = 129'h00003ffffffffffffffffffffffffffff;
            115: dco_code_bit = 129'h00007ffffffffffffffffffffffffffff;
            116: dco_code_bit = 129'h0000fffffffffffffffffffffffffffff;
            117: dco_code_bit = 129'h0001fffffffffffffffffffffffffffff;
            118: dco_code_bit = 129'h0003fffffffffffffffffffffffffffff;
            119: dco_code_bit = 129'h0007fffffffffffffffffffffffffffff;
            120: dco_code_bit = 129'h000ffffffffffffffffffffffffffffff;
            121: dco_code_bit = 129'h001ffffffffffffffffffffffffffffff;
            122: dco_code_bit = 129'h003ffffffffffffffffffffffffffffff;
            123: dco_code_bit = 129'h007ffffffffffffffffffffffffffffff;
            124: dco_code_bit = 129'h00fffffffffffffffffffffffffffffff;
            125: dco_code_bit = 129'h01fffffffffffffffffffffffffffffff;
            126: dco_code_bit = 129'h03fffffffffffffffffffffffffffffff;
            127: dco_code_bit = 129'h07fffffffffffffffffffffffffffffff;
            128: dco_code_bit = 129'h0ffffffffffffffffffffffffffffffff;
            default: dco_code_bit = 129'000000000000000000000000000000001;
        endcase
    end

    // DCO code is adjusted by step size every time the phase up or down signal is asserted
    always @(negedge phase_clk or posedge reset) begin
        if (reset) 
            dco_code_int <= 9'd32;
        else if (!p_up && p_down && (dco_code_int + step) <= 129) 
            dco_code_int <= dco_code_int + step;
        else if (p_up && !p_down && (dco_code_int >= (step + 1))) 
            dco_code_int <= dco_code_int - step;
        else 
            dco_code_int <= dco_code_int;
    end

    // Frequency lock is asserted when the step size is 1
    always @(negedge phase_clk or posedge reset) begin
        if (reset) 
            freq_lock <= 1'b0;
        else if (step == 1) 
            freq_lock <= 1'b1;
        else 
            freq_lock <= 1'b0;
    end

    // If phase direction is switched, polarity is set to 1
    always @(negedge phase_clk or posedge reset) begin
        if (reset) 
            polarity <= 1'b0;
        else if (p_up == p_history) 
            polarity <= 1'b1;
        else 
            polarity <= 1'b0;
    end

    // Store the previous phase down signal
    always @(negedge phase_clk) begin
        p_history <= p_down;
    end

    // Step size is halved every time the polarity is switched
    always @(negedge polarity or posedge reset) begin
        if (reset) step <= 4;
        else if (step != 1) step <= step >> 1;
        else step <= 1;
    end

endmodule