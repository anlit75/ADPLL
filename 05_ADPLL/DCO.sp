*******************************************************
* Advanced Digital IC Design                          *
*                                                     *
* Lab05b: Tri-State Inverters DCO                     *
*******************************************************

***********************************
* Operation Condition             *
***********************************
*** TT Corner Voltage: 1.8V ***
.PARAM supply=1.8v

*** Include Subcircuit File ***
.INCLUDE "hspice_cells.sp"

***********************************
* Define Global Nets              *
***********************************
.GLOBAL VDD VSS

***********************************
* Voltage Sources                 *
***********************************
vdd     VDD   0  DC supply
vss     VSS   0  DC 0

***********************************
* TOP Circuit                     *
***********************************
.SUBCKT DCO RESET code0 code1 code2 code3 code4 code5 code6 code7 code8 code9 
+           code10 code11 code12 code13 code14 code15 code16 code17 code18 code19
+           code20 code21 code22 code23 code24 code25 code26 code27 code28 code29
+           code30 code31 code32 code33 code34 code35 code36 code37 code38 code39
+           code40 code41 code42 code43 code44 code45 code46 code47 code48 code49
+           code50 code51 code52 code53 code54 code55 code56 code57 code58 code59
+           code60 code61 code62 code63 code64 code65 code66 code67 code68 code69
+           code70 code71 code72 code73 code74 code75 code76 code77 code78 code79
+           code80 code81 code82 code83 code84 code85 code86 code87 code88 code89
+           code90 code91 code92 code93 code94 code95 code96 code97 code98 code99
+           code100 code101 code102 code103 code104 code105 code106 code107 code108 code109
+           code110 code111 code112 code113 code114 code115 code116 code117 code118 code119
+           code120 code121 code122 code123 code124 code125 code126 code127 code128 OUT_CLK

XDelayC1  B0   B1  INVX2
XDelayC2  B1   OUT_CLK  INVX2
XDelayC3  OUT_CLK   B0  INVX2

XDelayC1T1  code0  B0   B1  TBUFIX1
XDelayC2T1  code1  B1   OUT_CLK  TBUFIX1
XDelayC3T1  code2  OUT_CLK   B0  TBUFIX1

XDelayC1T2  code3  B0   B1  TBUFIX1
XDelayC2T2  code4  B1   OUT_CLK  TBUFIX1
XDelayC3T2  code5  OUT_CLK   B0  TBUFIX1

XDelayC1T3  code6  B0   B1  TBUFIX1
XDelayC2T3  code7  B1   OUT_CLK  TBUFIX1
XDelayC3T3  code8  OUT_CLK   B0  TBUFIX1

XDelayC1T4  code9  B0   B1  TBUFIX1
XDelayC2T4  code10  B1   OUT_CLK  TBUFIX1
XDelayC3T4  code11  OUT_CLK   B0  TBUFIX1

XDelayC1T5  code12  B0   B1  TBUFIX1
XDelayC2T5  code13  B1   OUT_CLK  TBUFIX1
XDelayC3T5  code14  OUT_CLK   B0  TBUFIX1

XDelayC1T6  code15  B0   B1  TBUFIX1
XDelayC2T6  code16  B1   OUT_CLK  TBUFIX1
XDelayC3T6  code17  OUT_CLK   B0  TBUFIX1

XDelayC1T7  code18  B0   B1  TBUFIX1
XDelayC2T7  code19  B1   OUT_CLK  TBUFIX1
XDelayC3T7  code20  OUT_CLK   B0  TBUFIX1

XDelayC1T8  code21  B0   B1  TBUFIX1
XDelayC2T8  code22  B1   OUT_CLK  TBUFIX1
XDelayC3T8  code23  OUT_CLK   B0  TBUFIX1

XDelayC1T9  code24  B0   B1  TBUFIX1
XDelayC2T9  code25  B1   OUT_CLK  TBUFIX1
XDelayC3T9  code26  OUT_CLK   B0  TBUFIX1

XDelayC1T10  code27  B0   B1  TBUFIX1
XDelayC2T10  code28  B1   OUT_CLK  TBUFIX1
XDelayC3T10  code29  OUT_CLK   B0  TBUFIX1

XDelayC1T11  code30  B0   B1  TBUFIX1
XDelayC2T11  code31  B1   OUT_CLK  TBUFIX1
XDelayC3T11  code32  OUT_CLK   B0  TBUFIX1

XDelayC1T12  code33  B0   B1  TBUFIX1
XDelayC2T12  code34  B1   OUT_CLK  TBUFIX1
XDelayC3T12  code35  OUT_CLK   B0  TBUFIX1

XDelayC1T13  code36  B0   B1  TBUFIX1
XDelayC2T13  code37  B1   OUT_CLK  TBUFIX1
XDelayC3T13  code38  OUT_CLK   B0  TBUFIX1

XDelayC1T14  code39  B0   B1  TBUFIX1
XDelayC2T14  code40  B1   OUT_CLK  TBUFIX1
XDelayC3T14  code41  OUT_CLK   B0  TBUFIX1

XDelayC1T15  code42  B0   B1  TBUFIX1
XDelayC2T15  code43  B1   OUT_CLK  TBUFIX1
XDelayC3T15  code44  OUT_CLK   B0  TBUFIX1

XDelayC1T16  code45  B0   B1  TBUFIX1
XDelayC2T16  code46  B1   OUT_CLK  TBUFIX1
XDelayC3T16  code47  OUT_CLK   B0  TBUFIX1

XDelayC1T17  code48  B0   B1  TBUFIX1
XDelayC2T17  code49  B1   OUT_CLK  TBUFIX1
XDelayC3T17  code50  OUT_CLK   B0  TBUFIX1

XDelayC1T18  code51  B0   B1  TBUFIX1
XDelayC2T18  code52  B1   OUT_CLK  TBUFIX1
XDelayC3T18  code53  OUT_CLK   B0  TBUFIX1

XDelayC1T19  code54  B0   B1  TBUFIX1
XDelayC2T19  code55  B1   OUT_CLK  TBUFIX1
XDelayC3T19  code56  OUT_CLK   B0  TBUFIX1

XDelayC1T20  code57  B0   B1  TBUFIX1
XDelayC2T20  code58  B1   OUT_CLK  TBUFIX1
XDelayC3T20  code59  OUT_CLK   B0  TBUFIX1

XDelayC1T21  code60  B0   B1  TBUFIX1
XDelayC2T21  code61  B1   OUT_CLK  TBUFIX1
XDelayC3T21  code62  OUT_CLK   B0  TBUFIX1

XDelayC1T22  code63  B0   B1  TBUFIX1
XDelayC2T22  code64  B1   OUT_CLK  TBUFIX1
XDelayC3T22  code65  OUT_CLK   B0  TBUFIX1

XDelayC1T23  code66  B0   B1  TBUFIX1
XDelayC2T23  code67  B1   OUT_CLK  TBUFIX1
XDelayC3T23  code68  OUT_CLK   B0  TBUFIX1

XDelayC1T24  code69  B0   B1  TBUFIX1
XDelayC2T24  code70  B1   OUT_CLK  TBUFIX1
XDelayC3T24  code71  OUT_CLK   B0  TBUFIX1

XDelayC1T25  code72  B0   B1  TBUFIX1
XDelayC2T25  code73  B1   OUT_CLK  TBUFIX1
XDelayC3T25  code74  OUT_CLK   B0  TBUFIX1

XDelayC1T26  code75  B0   B1  TBUFIX1
XDelayC2T26  code76  B1   OUT_CLK  TBUFIX1
XDelayC3T26  code77  OUT_CLK   B0  TBUFIX1

XDelayC1T27  code78  B0   B1  TBUFIX1
XDelayC2T27  code79  B1   OUT_CLK  TBUFIX1
XDelayC3T27  code80  OUT_CLK   B0  TBUFIX1

XDelayC1T28  code81  B0   B1  TBUFIX1
XDelayC2T28  code82  B1   OUT_CLK  TBUFIX1
XDelayC3T28  code83  OUT_CLK   B0  TBUFIX1

XDelayC1T29  code84  B0   B1  TBUFIX1
XDelayC2T29  code85  B1   OUT_CLK  TBUFIX1
XDelayC3T29  code86  OUT_CLK   B0  TBUFIX1

XDelayC1T30  code87  B0   B1  TBUFIX1
XDelayC2T30  code88  B1   OUT_CLK  TBUFIX1
XDelayC3T30  code89  OUT_CLK   B0  TBUFIX1

XDelayC1T31  code90  B0   B1  TBUFIX1
XDelayC2T31  code91  B1   OUT_CLK  TBUFIX1
XDelayC3T31  code92  OUT_CLK   B0  TBUFIX1

XDelayC1T32  code93  B0   B1  TBUFIX1
XDelayC2T32  code94  B1   OUT_CLK  TBUFIX1
XDelayC3T32  code95  OUT_CLK   B0  TBUFIX1

XDelayC1T33  code96  B0   B1  TBUFIX1
XDelayC2T33  code97  B1   OUT_CLK  TBUFIX1
XDelayC3T33  code98  OUT_CLK   B0  TBUFIX1

XDelayC1T34  code99  B0   B1  TBUFIX1
XDelayC2T34  code100  B1   OUT_CLK  TBUFIX1
XDelayC3T34  code101  OUT_CLK   B0  TBUFIX1

XDelayC1T35  code102  B0   B1  TBUFIX1
XDelayC2T35  code103  B1   OUT_CLK  TBUFIX1
XDelayC3T35  code104  OUT_CLK   B0  TBUFIX1

XDelayC1T36  code105  B0   B1  TBUFIX1
XDelayC2T36  code106  B1   OUT_CLK  TBUFIX1
XDelayC3T36  code107  OUT_CLK   B0  TBUFIX1

XDelayC1T37  code108  B0   B1  TBUFIX1
XDelayC2T37  code109  B1   OUT_CLK  TBUFIX1
XDelayC3T37  code110  OUT_CLK   B0  TBUFIX1

XDelayC1T38  code111  B0   B1  TBUFIX1
XDelayC2T38  code112  B1   OUT_CLK  TBUFIX1
XDelayC3T38  code113  OUT_CLK   B0  TBUFIX1

XDelayC1T39  code114  B0   B1  TBUFIX1
XDelayC2T39  code115  B1   OUT_CLK  TBUFIX1
XDelayC3T39  code116  OUT_CLK   B0  TBUFIX1

XDelayC1T40  code117  B0   B1  TBUFIX1
XDelayC2T40  code118  B1   OUT_CLK  TBUFIX1
XDelayC3T40  code119  OUT_CLK   B0  TBUFIX1

XDelayC1T41  code120  B0   B1  TBUFIX1
XDelayC2T41  code121  B1   OUT_CLK  TBUFIX1
XDelayC3T41  code122  OUT_CLK   B0  TBUFIX1

XDelayC1T42  code123  B0   B1  TBUFIX1
XDelayC2T42  code124  B1   OUT_CLK  TBUFIX1
XDelayC3T42  code125  OUT_CLK   B0  TBUFIX1

XDelayC1T43  code126  B0   B1  TBUFIX1
XDelayC2T43  code127  B1   OUT_CLK  TBUFIX1
XDelayC3T43  code128  OUT_CLK   B0  TBUFIX1

.ENDS
