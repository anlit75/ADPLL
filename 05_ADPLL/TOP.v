*******************************************************
* Advanced Digital IC Design                          *
*                                                     *
* Final Project: ADPLL                                *
*******************************************************

`timescale 1ns/1ps
`include "ADPLL.v"
`include "TEST.v"

module TOP;

    ADPLL ADPLL(
        .REF_CLK(REF_CLK),
        .RESET(RESET),
        .M2(M2),
        .M1(M1),
        .M0(M0),
        .LOCK(LOCK),
        .OUT_CLK(OUT_CLK)
    );

    TEST TEST(
        .REF_CLK(REF_CLK),
        .RESET(RESET),
        .M2(M2),
        .M1(M1),
        .M0(M0),
        .LOCK(LOCK),
        .OUT_CLK(OUT_CLK)
    );

endmodule