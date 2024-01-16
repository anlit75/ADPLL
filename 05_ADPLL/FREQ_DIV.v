//-------------------------------------------------//
//- Advanced Digital IC Design                     //
//-                                                //
//- Exercise: Frequency Divider                    //
//-------------------------------------------------//

`timescale 1ns/1ps

module FREQ_DIV(
    input       reset,
    input       clk,
    input       M2,
    input       M1,
    input       M0,
    output reg  out_clk
);

    reg [2:0] cnt;
    wire [2:0] M = {M2, M1, M0};

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cnt <= 3'b0;
        end
        else if (cnt > 0) begin
            cnt <= cnt - 1'b1;
        end
        else if (cnt == 0) begin
            cnt <= M - 1;
        end
        else begin
            cnt <= cnt;
        end
    end

    always @(*) begin
        if (reset) begin
            out_clk = 1'b0;
        end
        else if (M == 3'b1) begin
            out_clk = clk;
        end
        else if (cnt < M - 1) begin
            out_clk = 1'b0;
        end
        else if (cnt == M - 1) begin
            out_clk = 1'b1;
        end
        else begin
            out_clk = out_clk;
        end
    end

endmodule