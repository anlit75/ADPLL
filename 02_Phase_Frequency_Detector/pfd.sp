*******************************************************
* Advanced Digital IC Design                          *
*                                                     *
* Exercise: Phase/Frequency Detector                  *
*******************************************************

***********************************
* Operation Condition             *
***********************************
*** Process: Typical ***
*.lib "ultrasim_model.122" L18U18V_TT
*.lib "ultrasim_model.122" L18U18V_FF
.lib "ultrasim_model.122" L18U18V_SS

*** Voltage: 1.62V ***
.PARAM supply=1.62v

*** Temperature: 125C ***
.TEMP 125

***********************************
* Transition Analysis             *
***********************************
.TRAN 1ps 400ns

***********************************
* UltraSIM Simulation Options     *
***********************************
*ultrasim: .usim_opt  sim_mode=ms
*ultrasim: .usim_opt  postl=2 analog=0 speed=5

***********************************
* UltraSIM Output Options         *
***********************************
*ultrasim: .usim_opt  wf_format=fsdb 
*ultrasim: .usim_opt  wf_tres=1p
*ultrasim: .usim_opt  vh=0.9
*ultrasim: .usim_opt  vl=0.9

*ultrasim: .lprobe v(RESET_B) v(IN) v(FB) v(QU) v(QD) v(RN) v(OUTU) v(OUTD) v(OUTBU) v(OUTBD) v(flagU) v(flagD) preserve=port

***********************************
* Output Analog Signals           *
***********************************
*.probe tran v(IN) v(FB) 

***********************************
* Measurement Commands            *
***********************************
*** Average && Peak Power ***
.MEAS tran avg_power avg par('v(VDD)*i(VDD)')
.MEAS tran max_power min par('v(VDD)*i(VDD)')

***********************************
* Define Global Nets              *
***********************************
.GLOBAL VDD VSS

***********************************
* Voltage Sources                 *
***********************************
vdd      VDD   0  DC supply
vss      VSS   0  DC 0
*vin       IN   0  PULSE(0 supply 2n 0.1n 0.1n 24.9n 50n)
*vfb       FB   0  PULSE(0 supply 0n 0.1n 0.1n 24.9n 50n)
*vrst RESET_B   0  PWL(0n 0v, 5n supply)

*** Digital Vector Input ***
.VEC "pfd.vec"

***********************************
* TOP Circuit                     *
***********************************
XDFFIN IN VDD RN QN1 QU DFFRX4
XDFFFB FB VDD RN QN2 QD DFFRX4
XR1 QU QD      Y1 NAND2X1
XR2 Y1 RESET_B RN AND2X1

XINV1  QU QUI INVX2
XBUF1 QUI QUI BUFX1

XINV2  QD QDI INVX2
XBUF2 QDI QDI BUFX1

XND1  QU QDI OUTU NAND2X1
XND2  QD QUI OUTD NAND2X1

XDPA1 OUTU OUTBU DPA
XDPA2 OUTD OUTBD DPA

XDFFU IN VDD OUTBU QN3 flagU DFFRX4
XDFFD FB VDD OUTBD QN4 flagD DFFRX4

***********************************
* Subckt Definition               *
***********************************
.SUBCKT DPA INPUT OUTPUT
    XAND0 INPUT INPUT Y0      AND2X1
    XAND1 Y0    INPUT Y1      AND2X1
    XAND2 Y1    Y0    Y2      AND2X1
    XAND3 Y2    Y1    Y3      AND2X1
    XAND4 Y3    Y2    Y4      AND2X1
    XAND5 Y4    Y3    OUTPUT  AND2X1
.ENDS DPA

.INCLUDE "ultrasim_cells.sp"

.END
