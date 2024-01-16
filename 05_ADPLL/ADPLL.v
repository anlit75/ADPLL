`timescale 1ns/1ps

`include "DCO.v"
`include "PFD.v"
`include "CONTROLLER.v"
`include "FREQ_DIV.v"

module ADPLL(
    input  wire  REF_CLK,
    input  wire  RESET,
    input  wire  M2,
    input  wire  M1,
    input  wire  M0,
    output reg   LOCK,
    output reg   OUT_CLK
);

    wire Out_divM;
    wire flagu, flagd;
    wire [128:0] code;
    wire POLARITY;

    // PFD
    PFD PFD(
        .IN(REF_CLK),
        .FB(Out_divM),
        .flagu(flagu),
        .flagd(flagd)
    );

    // CONTROLLER
    CONTROLLER CONTROLLER(
        .reset(RESET),
        .phase_clk(flagu & flagd),
        .p_up(flagu),
        .p_down(flagd),
        .freq_lock(LOCK),
        .polarity(POLARITY),
        .dco_code(code)
    );

    // DCO
    DCO DCO(
        .RESET(RESET),
        .code0(code[0]),     .code1(code[1]),      .code2(code[2]),     .code3(code[3]),     .code4(code[4]),
        .code5(code[5]),     .code6(code[6]),      .code7(code[7]),     .code8(code[8]),     .code9(code[9]),
        .code10(code[10]),   .code11(code[11]),    .code12(code[12]),   .code13(code[13]),   .code14(code[14]),
        .code15(code[15]),   .code16(code[16]),    .code17(code[17]),   .code18(code[18]),   .code19(code[19]),
        .code20(code[20]),   .code21(code[21]),    .code22(code[22]),   .code23(code[23]),   .code24(code[24]),
        .code25(code[25]),   .code26(code[26]),    .code27(code[27]),   .code28(code[28]),   .code29(code[29]),
        .code30(code[30]),   .code31(code[31]),    .code32(code[32]),   .code33(code[33]),   .code34(code[34]),
        .code35(code[35]),   .code36(code[36]),    .code37(code[37]),   .code38(code[38]),   .code39(code[39]),
        .code40(code[40]),   .code41(code[41]),    .code42(code[42]),   .code43(code[43]),   .code44(code[44]),
        .code45(code[45]),   .code46(code[46]),    .code47(code[47]),   .code48(code[48]),   .code49(code[49]),
        .code50(code[50]),   .code51(code[51]),    .code52(code[52]),   .code53(code[53]),   .code54(code[54]),
        .code55(code[55]),   .code56(code[56]),    .code57(code[57]),   .code58(code[58]),   .code59(code[59]),
        .code60(code[60]),   .code61(code[61]),    .code62(code[62]),   .code63(code[63]),   .code64(code[64]),
        .code65(code[65]),   .code66(code[66]),    .code67(code[67]),   .code68(code[68]),   .code69(code[69]),
        .code70(code[70]),   .code71(code[71]),    .code72(code[72]),   .code73(code[73]),   .code74(code[74]),
        .code75(code[75]),   .code76(code[76]),    .code77(code[77]),   .code78(code[78]),   .code79(code[79]),
        .code80(code[80]),   .code81(code[81]),    .code82(code[82]),   .code83(code[83]),   .code84(code[84]),
        .code85(code[85]),   .code86(code[86]),    .code87(code[87]),   .code88(code[88]),   .code89(code[89]),
        .code90(code[90]),   .code91(code[91]),    .code92(code[92]),   .code93(code[93]),   .code94(code[94]),
        .code95(code[95]),   .code96(code[96]),    .code97(code[97]),   .code98(code[98]),   .code99(code[99]),
        .code100(code[100]), .code101(code[101]),  .code102(code[102]), .code103(code[103]), .code104(code[104]),
        .code105(code[105]), .code106(code[106]),  .code107(code[107]), .code108(code[108]), .code109(code[109]),
        .code110(code[110]), .code111(code[111]),  .code112(code[112]), .code113(code[113]), .code114(code[114]),
        .code115(code[115]), .code116(code[116]),  .code117(code[117]), .code118(code[118]), .code119(code[119]),
        .code120(code[120]), .code121(code[121]),  .code122(code[122]), .code123(code[123]), .code124(code[124]),
        .code125(code[125]), .code126(code[126]),  .code127(code[127]), .code128(code[128]),
        .OUT_CLK(OUT_CLK)
    );
        

    // FREQ_DIV
    FREQ_DIV FREQ_DIV(
        .reset(RESET),
        .clk(REF_CLK),
        .M2(M2),
        .M1(M1),
        .M0(M0),
        .out_clk(Out_divM)
    );

endmodule