`timescale 1ns/1ps

module FILTER(
    input  wire rst,
    input  wire clk,
    input  wire lock,
    input  wire p_up,
    input  wire p_down,
    input  wire [7:0] code,
    output reg  [7:0] avg_code
);

    parameter CNT_N = 4;

    reg [2:0] cnt_up, cnt_down;

    always @(negedge p_up or negedge p_down or posedge rst) begin
        if (rst) 
            cnt_up <= 0;
        else if (cnt_up > (CNT_N - 1) || !p_down) 
            cnt_up <= 0;
        else if (lock && !p_up && p_down) 
            cnt_up <= cnt_up + 1'b1;
        else 
            cnt_up <= cnt_up; 
    end

    always @(negedge p_up or negedge p_down or posedge rst) begin
        if (rst) 
            cnt_down <= 0;
        else if (cnt_down > (CNT_N - 1) || !p_up) 
            cnt_down <= 0;
        else if (lock && p_up && !p_down) 
            cnt_down <= cnt_down + 1'b1;
        else 
            cnt_down <= cnt_down; 
    end

    always @(*) begin
        if (!lock) 
            avg_code = code;
        else if (cnt_up == CNT_N && avg_code != 128) 
            avg_code = avg_code + 1'b1;
        else if (cnt_down == CNT_N && avg_code != 0) 
            avg_code = avg_code - 1'b1;
        else 
            avg_code = avg_code;
    end

endmodule