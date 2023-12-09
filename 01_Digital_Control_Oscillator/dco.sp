*******************************************************
* Advanced Digital IC Design                          *
*                                                     *
* Lab05b: Tri-State Inverters DCO                     *
*******************************************************

***********************************
* Operation Condition             *
***********************************
*** Process: Typical ***
.lib "hspice_model.122" L18U18V_TT
*.lib "hspice_model.122" L18U18V_FF
*.lib "hspice_model.122" L18U18V_SS

*** TT Corner Voltage: 1.8V ***
.PARAM supply=1.8v

*** Temperature: 25C ***
.TEMP 25

*** Include Subcircuit File ***
.INCLUDE "hspice_cells.sp"

***********************************
* Transition Analysis             *
***********************************
.TRAN 1ps 1290ns

***********************************
* HSPICE Options                  *
***********************************
.OPTION POST PROBE
.OPTION NOMOD BRIEF MEASDGT=7 
.OPTION CAPTAB NOTOP AUTOSTOP

***********************************
* Output Signals                  *
***********************************
.probe tran v(B0) 
.probe tran v(B1) v(B2)
.probe tran i(VDD)

***********************************
* Measurement Commands            *
***********************************
*** Pin-to-Pin Delay ***
.MEAS TRAN T000  TRIG V(B0)   val='supply*0.5' rise=1  TD=5n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=5n
.MEAS TRAN T001  TRIG V(B0)   val='supply*0.5' rise=1  TD=15n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=15n
.MEAS TRAN T002  TRIG V(B0)   val='supply*0.5' rise=1  TD=25n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=25n
.MEAS TRAN T003  TRIG V(B0)   val='supply*0.5' rise=1  TD=35n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=35n
.MEAS TRAN T004  TRIG V(B0)   val='supply*0.5' rise=1  TD=45n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=45n
.MEAS TRAN T005  TRIG V(B0)   val='supply*0.5' rise=1  TD=55n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=55n
.MEAS TRAN T006  TRIG V(B0)   val='supply*0.5' rise=1  TD=65n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=65n
.MEAS TRAN T007  TRIG V(B0)   val='supply*0.5' rise=1  TD=75n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=75n
.MEAS TRAN T008  TRIG V(B0)   val='supply*0.5' rise=1  TD=85n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=85n
.MEAS TRAN T009  TRIG V(B0)   val='supply*0.5' rise=1  TD=95n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=95n
.MEAS TRAN T010  TRIG V(B0)   val='supply*0.5' rise=1  TD=105n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=105n
.MEAS TRAN T011  TRIG V(B0)   val='supply*0.5' rise=1  TD=115n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=115n
.MEAS TRAN T012  TRIG V(B0)   val='supply*0.5' rise=1  TD=125n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=125n
.MEAS TRAN T013  TRIG V(B0)   val='supply*0.5' rise=1  TD=135n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=135n
.MEAS TRAN T014  TRIG V(B0)   val='supply*0.5' rise=1  TD=145n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=145n
.MEAS TRAN T015  TRIG V(B0)   val='supply*0.5' rise=1  TD=155n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=155n
.MEAS TRAN T016  TRIG V(B0)   val='supply*0.5' rise=1  TD=165n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=165n
.MEAS TRAN T017  TRIG V(B0)   val='supply*0.5' rise=1  TD=175n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=175n
.MEAS TRAN T018  TRIG V(B0)   val='supply*0.5' rise=1  TD=185n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=185n
.MEAS TRAN T019  TRIG V(B0)   val='supply*0.5' rise=1  TD=195n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=195n
.MEAS TRAN T020  TRIG V(B0)   val='supply*0.5' rise=1  TD=205n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=205n
.MEAS TRAN T021  TRIG V(B0)   val='supply*0.5' rise=1  TD=215n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=215n
.MEAS TRAN T022  TRIG V(B0)   val='supply*0.5' rise=1  TD=225n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=225n
.MEAS TRAN T023  TRIG V(B0)   val='supply*0.5' rise=1  TD=235n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=235n
.MEAS TRAN T024  TRIG V(B0)   val='supply*0.5' rise=1  TD=245n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=245n
.MEAS TRAN T025  TRIG V(B0)   val='supply*0.5' rise=1  TD=255n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=255n
.MEAS TRAN T026  TRIG V(B0)   val='supply*0.5' rise=1  TD=265n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=265n
.MEAS TRAN T027  TRIG V(B0)   val='supply*0.5' rise=1  TD=275n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=275n
.MEAS TRAN T028  TRIG V(B0)   val='supply*0.5' rise=1  TD=285n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=285n
.MEAS TRAN T029  TRIG V(B0)   val='supply*0.5' rise=1  TD=295n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=295n
.MEAS TRAN T030  TRIG V(B0)   val='supply*0.5' rise=1  TD=305n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=305n
.MEAS TRAN T031  TRIG V(B0)   val='supply*0.5' rise=1  TD=315n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=315n
.MEAS TRAN T032  TRIG V(B0)   val='supply*0.5' rise=1  TD=325n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=325n
.MEAS TRAN T033  TRIG V(B0)   val='supply*0.5' rise=1  TD=335n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=335n
.MEAS TRAN T034  TRIG V(B0)   val='supply*0.5' rise=1  TD=345n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=345n
.MEAS TRAN T035  TRIG V(B0)   val='supply*0.5' rise=1  TD=355n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=355n
.MEAS TRAN T036  TRIG V(B0)   val='supply*0.5' rise=1  TD=365n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=365n
.MEAS TRAN T037  TRIG V(B0)   val='supply*0.5' rise=1  TD=375n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=375n
.MEAS TRAN T038  TRIG V(B0)   val='supply*0.5' rise=1  TD=385n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=385n
.MEAS TRAN T039  TRIG V(B0)   val='supply*0.5' rise=1  TD=395n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=395n
.MEAS TRAN T040  TRIG V(B0)   val='supply*0.5' rise=1  TD=405n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=405n
.MEAS TRAN T041  TRIG V(B0)   val='supply*0.5' rise=1  TD=415n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=415n
.MEAS TRAN T042  TRIG V(B0)   val='supply*0.5' rise=1  TD=425n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=425n
.MEAS TRAN T043  TRIG V(B0)   val='supply*0.5' rise=1  TD=435n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=435n
.MEAS TRAN T044  TRIG V(B0)   val='supply*0.5' rise=1  TD=445n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=445n
.MEAS TRAN T045  TRIG V(B0)   val='supply*0.5' rise=1  TD=455n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=455n
.MEAS TRAN T046  TRIG V(B0)   val='supply*0.5' rise=1  TD=465n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=465n
.MEAS TRAN T047  TRIG V(B0)   val='supply*0.5' rise=1  TD=475n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=475n
.MEAS TRAN T048  TRIG V(B0)   val='supply*0.5' rise=1  TD=485n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=485n
.MEAS TRAN T049  TRIG V(B0)   val='supply*0.5' rise=1  TD=495n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=495n
.MEAS TRAN T050  TRIG V(B0)   val='supply*0.5' rise=1  TD=505n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=505n
.MEAS TRAN T051  TRIG V(B0)   val='supply*0.5' rise=1  TD=515n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=515n
.MEAS TRAN T052  TRIG V(B0)   val='supply*0.5' rise=1  TD=525n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=525n
.MEAS TRAN T053  TRIG V(B0)   val='supply*0.5' rise=1  TD=535n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=535n
.MEAS TRAN T054  TRIG V(B0)   val='supply*0.5' rise=1  TD=545n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=545n
.MEAS TRAN T055  TRIG V(B0)   val='supply*0.5' rise=1  TD=555n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=555n
.MEAS TRAN T056  TRIG V(B0)   val='supply*0.5' rise=1  TD=565n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=565n
.MEAS TRAN T057  TRIG V(B0)   val='supply*0.5' rise=1  TD=575n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=575n
.MEAS TRAN T058  TRIG V(B0)   val='supply*0.5' rise=1  TD=585n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=585n
.MEAS TRAN T059  TRIG V(B0)   val='supply*0.5' rise=1  TD=595n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=595n
.MEAS TRAN T060  TRIG V(B0)   val='supply*0.5' rise=1  TD=605n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=605n
.MEAS TRAN T061  TRIG V(B0)   val='supply*0.5' rise=1  TD=615n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=615n
.MEAS TRAN T062  TRIG V(B0)   val='supply*0.5' rise=1  TD=625n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=625n
.MEAS TRAN T063  TRIG V(B0)   val='supply*0.5' rise=1  TD=635n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=635n
.MEAS TRAN T064  TRIG V(B0)   val='supply*0.5' rise=1  TD=645n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=645n
.MEAS TRAN T065  TRIG V(B0)   val='supply*0.5' rise=1  TD=655n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=655n
.MEAS TRAN T066  TRIG V(B0)   val='supply*0.5' rise=1  TD=665n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=665n
.MEAS TRAN T067  TRIG V(B0)   val='supply*0.5' rise=1  TD=675n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=675n
.MEAS TRAN T068  TRIG V(B0)   val='supply*0.5' rise=1  TD=685n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=685n
.MEAS TRAN T069  TRIG V(B0)   val='supply*0.5' rise=1  TD=695n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=695n
.MEAS TRAN T070  TRIG V(B0)   val='supply*0.5' rise=1  TD=705n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=705n
.MEAS TRAN T071  TRIG V(B0)   val='supply*0.5' rise=1  TD=715n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=715n
.MEAS TRAN T072  TRIG V(B0)   val='supply*0.5' rise=1  TD=725n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=725n
.MEAS TRAN T073  TRIG V(B0)   val='supply*0.5' rise=1  TD=735n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=735n
.MEAS TRAN T074  TRIG V(B0)   val='supply*0.5' rise=1  TD=745n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=745n
.MEAS TRAN T075  TRIG V(B0)   val='supply*0.5' rise=1  TD=755n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=755n
.MEAS TRAN T076  TRIG V(B0)   val='supply*0.5' rise=1  TD=765n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=765n
.MEAS TRAN T077  TRIG V(B0)   val='supply*0.5' rise=1  TD=775n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=775n
.MEAS TRAN T078  TRIG V(B0)   val='supply*0.5' rise=1  TD=785n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=785n
.MEAS TRAN T079  TRIG V(B0)   val='supply*0.5' rise=1  TD=795n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=795n
.MEAS TRAN T080  TRIG V(B0)   val='supply*0.5' rise=1  TD=805n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=805n
.MEAS TRAN T081  TRIG V(B0)   val='supply*0.5' rise=1  TD=815n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=815n
.MEAS TRAN T082  TRIG V(B0)   val='supply*0.5' rise=1  TD=825n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=825n
.MEAS TRAN T083  TRIG V(B0)   val='supply*0.5' rise=1  TD=835n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=835n
.MEAS TRAN T084  TRIG V(B0)   val='supply*0.5' rise=1  TD=845n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=845n
.MEAS TRAN T085  TRIG V(B0)   val='supply*0.5' rise=1  TD=855n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=855n
.MEAS TRAN T086  TRIG V(B0)   val='supply*0.5' rise=1  TD=865n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=865n
.MEAS TRAN T087  TRIG V(B0)   val='supply*0.5' rise=1  TD=875n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=875n
.MEAS TRAN T088  TRIG V(B0)   val='supply*0.5' rise=1  TD=885n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=885n
.MEAS TRAN T089  TRIG V(B0)   val='supply*0.5' rise=1  TD=895n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=895n
.MEAS TRAN T090  TRIG V(B0)   val='supply*0.5' rise=1  TD=905n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=905n
.MEAS TRAN T091  TRIG V(B0)   val='supply*0.5' rise=1  TD=915n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=915n
.MEAS TRAN T092  TRIG V(B0)   val='supply*0.5' rise=1  TD=925n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=925n
.MEAS TRAN T093  TRIG V(B0)   val='supply*0.5' rise=1  TD=935n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=935n
.MEAS TRAN T094  TRIG V(B0)   val='supply*0.5' rise=1  TD=945n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=945n
.MEAS TRAN T095  TRIG V(B0)   val='supply*0.5' rise=1  TD=955n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=955n
.MEAS TRAN T096  TRIG V(B0)   val='supply*0.5' rise=1  TD=965n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=965n
.MEAS TRAN T097  TRIG V(B0)   val='supply*0.5' rise=1  TD=975n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=975n
.MEAS TRAN T098  TRIG V(B0)   val='supply*0.5' rise=1  TD=985n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=985n
.MEAS TRAN T099  TRIG V(B0)   val='supply*0.5' rise=1  TD=995n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=995n
.MEAS TRAN T100  TRIG V(B0)   val='supply*0.5' rise=1  TD=1005n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1005n
.MEAS TRAN T101  TRIG V(B0)   val='supply*0.5' rise=1  TD=1015n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1015n
.MEAS TRAN T102  TRIG V(B0)   val='supply*0.5' rise=1  TD=1025n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1025n
.MEAS TRAN T103  TRIG V(B0)   val='supply*0.5' rise=1  TD=1035n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1035n
.MEAS TRAN T104  TRIG V(B0)   val='supply*0.5' rise=1  TD=1045n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1045n
.MEAS TRAN T105  TRIG V(B0)   val='supply*0.5' rise=1  TD=1055n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1055n
.MEAS TRAN T106  TRIG V(B0)   val='supply*0.5' rise=1  TD=1065n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1065n
.MEAS TRAN T107  TRIG V(B0)   val='supply*0.5' rise=1  TD=1075n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1075n
.MEAS TRAN T108  TRIG V(B0)   val='supply*0.5' rise=1  TD=1085n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1085n
.MEAS TRAN T109  TRIG V(B0)   val='supply*0.5' rise=1  TD=1095n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1095n
.MEAS TRAN T110  TRIG V(B0)   val='supply*0.5' rise=1  TD=1105n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1105n
.MEAS TRAN T111  TRIG V(B0)   val='supply*0.5' rise=1  TD=1115n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1115n
.MEAS TRAN T112  TRIG V(B0)   val='supply*0.5' rise=1  TD=1125n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1125n
.MEAS TRAN T113  TRIG V(B0)   val='supply*0.5' rise=1  TD=1135n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1135n
.MEAS TRAN T114  TRIG V(B0)   val='supply*0.5' rise=1  TD=1145n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1145n
.MEAS TRAN T115  TRIG V(B0)   val='supply*0.5' rise=1  TD=1155n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1155n
.MEAS TRAN T116  TRIG V(B0)   val='supply*0.5' rise=1  TD=1165n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1165n
.MEAS TRAN T117  TRIG V(B0)   val='supply*0.5' rise=1  TD=1175n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1175n
.MEAS TRAN T118  TRIG V(B0)   val='supply*0.5' rise=1  TD=1185n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1185n
.MEAS TRAN T119  TRIG V(B0)   val='supply*0.5' rise=1  TD=1195n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1195n
.MEAS TRAN T120  TRIG V(B0)   val='supply*0.5' rise=1  TD=1205n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1205n
.MEAS TRAN T121  TRIG V(B0)   val='supply*0.5' rise=1  TD=1215n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1215n
.MEAS TRAN T122  TRIG V(B0)   val='supply*0.5' rise=1  TD=1225n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1225n
.MEAS TRAN T123  TRIG V(B0)   val='supply*0.5' rise=1  TD=1235n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1235n
.MEAS TRAN T124  TRIG V(B0)   val='supply*0.5' rise=1  TD=1245n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1245n
.MEAS TRAN T125  TRIG V(B0)   val='supply*0.5' rise=1  TD=1255n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1255n
.MEAS TRAN T126  TRIG V(B0)   val='supply*0.5' rise=1  TD=1265n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1265n
.MEAS TRAN T127  TRIG V(B0)   val='supply*0.5' rise=1  TD=1275n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1275n
.MEAS TRAN T128  TRIG V(B0)   val='supply*0.5' rise=1  TD=1285n
+	             TARG V(B0)   val='supply*0.5' rise=2  TD=1285n


*** Average && Peak Power ***
.MEAS tran avg_power avg par('v(VDD)*i(VDD)') FROM=0ns TO=1290ns
.MEAS tran max_power min par('v(VDD)*i(VDD)') FROM=0ns TO=1290ns


***********************************
* Define Global Nets              *
***********************************
.GLOBAL VDD VSS

***********************************
* Voltage Sources                 *
***********************************
vdd     VDD   0  DC supply
vss     VSS   0  DC 0

*** Digital Vector Input ***
.VEC "dco.vec"

***********************************
* TOP Circuit                     *
***********************************
XDelayC1  B0   B1  INVX2
XDelayC2  B1   B2  INVX2
XDelayC3  B2   B0  INVX2

XDelayC1T1  code[0]  B0   B1  TBUFIX1
XDelayC2T1  code[1]  B1   B2  TBUFIX1
XDelayC3T1  code[2]  B2   B0  TBUFIX1

XDelayC1T2  code[3]  B0   B1  TBUFIX1
XDelayC2T2  code[4]  B1   B2  TBUFIX1
XDelayC3T2  code[5]  B2   B0  TBUFIX1

XDelayC1T3  code[6]  B0   B1  TBUFIX1
XDelayC2T3  code[7]  B1   B2  TBUFIX1
XDelayC3T3  code[8]  B2   B0  TBUFIX1

XDelayC1T4  code[9]  B0   B1  TBUFIX1
XDelayC2T4  code[10]  B1   B2  TBUFIX1
XDelayC3T4  code[11]  B2   B0  TBUFIX1

XDelayC1T5  code[12]  B0   B1  TBUFIX1
XDelayC2T5  code[13]  B1   B2  TBUFIX1
XDelayC3T5  code[14]  B2   B0  TBUFIX1

XDelayC1T6  code[15]  B0   B1  TBUFIX1
XDelayC2T6  code[16]  B1   B2  TBUFIX1
XDelayC3T6  code[17]  B2   B0  TBUFIX1

XDelayC1T7  code[18]  B0   B1  TBUFIX1
XDelayC2T7  code[19]  B1   B2  TBUFIX1
XDelayC3T7  code[20]  B2   B0  TBUFIX1

XDelayC1T8  code[21]  B0   B1  TBUFIX1
XDelayC2T8  code[22]  B1   B2  TBUFIX1
XDelayC3T8  code[23]  B2   B0  TBUFIX1

XDelayC1T9  code[24]  B0   B1  TBUFIX1
XDelayC2T9  code[25]  B1   B2  TBUFIX1
XDelayC3T9  code[26]  B2   B0  TBUFIX1

XDelayC1T10  code[27]  B0   B1  TBUFIX1
XDelayC2T10  code[28]  B1   B2  TBUFIX1
XDelayC3T10  code[29]  B2   B0  TBUFIX1

XDelayC1T11  code[30]  B0   B1  TBUFIX1
XDelayC2T11  code[31]  B1   B2  TBUFIX1
XDelayC3T11  code[32]  B2   B0  TBUFIX1

XDelayC1T12  code[33]  B0   B1  TBUFIX1
XDelayC2T12  code[34]  B1   B2  TBUFIX1
XDelayC3T12  code[35]  B2   B0  TBUFIX1

XDelayC1T13  code[36]  B0   B1  TBUFIX1
XDelayC2T13  code[37]  B1   B2  TBUFIX1
XDelayC3T13  code[38]  B2   B0  TBUFIX1

XDelayC1T14  code[39]  B0   B1  TBUFIX1
XDelayC2T14  code[40]  B1   B2  TBUFIX1
XDelayC3T14  code[41]  B2   B0  TBUFIX1

XDelayC1T15  code[42]  B0   B1  TBUFIX1
XDelayC2T15  code[43]  B1   B2  TBUFIX1
XDelayC3T15  code[44]  B2   B0  TBUFIX1

XDelayC1T16  code[45]  B0   B1  TBUFIX1
XDelayC2T16  code[46]  B1   B2  TBUFIX1
XDelayC3T16  code[47]  B2   B0  TBUFIX1

XDelayC1T17  code[48]  B0   B1  TBUFIX1
XDelayC2T17  code[49]  B1   B2  TBUFIX1
XDelayC3T17  code[50]  B2   B0  TBUFIX1

XDelayC1T18  code[51]  B0   B1  TBUFIX1
XDelayC2T18  code[52]  B1   B2  TBUFIX1
XDelayC3T18  code[53]  B2   B0  TBUFIX1

XDelayC1T19  code[54]  B0   B1  TBUFIX1
XDelayC2T19  code[55]  B1   B2  TBUFIX1
XDelayC3T19  code[56]  B2   B0  TBUFIX1

XDelayC1T20  code[57]  B0   B1  TBUFIX1
XDelayC2T20  code[58]  B1   B2  TBUFIX1
XDelayC3T20  code[59]  B2   B0  TBUFIX1

XDelayC1T21  code[60]  B0   B1  TBUFIX1
XDelayC2T21  code[61]  B1   B2  TBUFIX1
XDelayC3T21  code[62]  B2   B0  TBUFIX1

XDelayC1T22  code[63]  B0   B1  TBUFIX1
XDelayC2T22  code[64]  B1   B2  TBUFIX1
XDelayC3T22  code[65]  B2   B0  TBUFIX1

XDelayC1T23  code[66]  B0   B1  TBUFIX1
XDelayC2T23  code[67]  B1   B2  TBUFIX1
XDelayC3T23  code[68]  B2   B0  TBUFIX1

XDelayC1T24  code[69]  B0   B1  TBUFIX1
XDelayC2T24  code[70]  B1   B2  TBUFIX1
XDelayC3T24  code[71]  B2   B0  TBUFIX1

XDelayC1T25  code[72]  B0   B1  TBUFIX1
XDelayC2T25  code[73]  B1   B2  TBUFIX1
XDelayC3T25  code[74]  B2   B0  TBUFIX1

XDelayC1T26  code[75]  B0   B1  TBUFIX1
XDelayC2T26  code[76]  B1   B2  TBUFIX1
XDelayC3T26  code[77]  B2   B0  TBUFIX1

XDelayC1T27  code[78]  B0   B1  TBUFIX1
XDelayC2T27  code[79]  B1   B2  TBUFIX1
XDelayC3T27  code[80]  B2   B0  TBUFIX1

XDelayC1T28  code[81]  B0   B1  TBUFIX1
XDelayC2T28  code[82]  B1   B2  TBUFIX1
XDelayC3T28  code[83]  B2   B0  TBUFIX1

XDelayC1T29  code[84]  B0   B1  TBUFIX1
XDelayC2T29  code[85]  B1   B2  TBUFIX1
XDelayC3T29  code[86]  B2   B0  TBUFIX1

XDelayC1T30  code[87]  B0   B1  TBUFIX1
XDelayC2T30  code[88]  B1   B2  TBUFIX1
XDelayC3T30  code[89]  B2   B0  TBUFIX1

XDelayC1T31  code[90]  B0   B1  TBUFIX1
XDelayC2T31  code[91]  B1   B2  TBUFIX1
XDelayC3T31  code[92]  B2   B0  TBUFIX1

XDelayC1T32  code[93]  B0   B1  TBUFIX1
XDelayC2T32  code[94]  B1   B2  TBUFIX1
XDelayC3T32  code[95]  B2   B0  TBUFIX1

XDelayC1T33  code[96]  B0   B1  TBUFIX1
XDelayC2T33  code[97]  B1   B2  TBUFIX1
XDelayC3T33  code[98]  B2   B0  TBUFIX1

XDelayC1T34  code[99]  B0   B1  TBUFIX1
XDelayC2T34  code[100]  B1   B2  TBUFIX1
XDelayC3T34  code[101]  B2   B0  TBUFIX1

XDelayC1T35  code[102]  B0   B1  TBUFIX1
XDelayC2T35  code[103]  B1   B2  TBUFIX1
XDelayC3T35  code[104]  B2   B0  TBUFIX1

XDelayC1T36  code[105]  B0   B1  TBUFIX1
XDelayC2T36  code[106]  B1   B2  TBUFIX1
XDelayC3T36  code[107]  B2   B0  TBUFIX1

XDelayC1T37  code[108]  B0   B1  TBUFIX1
XDelayC2T37  code[109]  B1   B2  TBUFIX1
XDelayC3T37  code[110]  B2   B0  TBUFIX1

XDelayC1T38  code[111]  B0   B1  TBUFIX1
XDelayC2T38  code[112]  B1   B2  TBUFIX1
XDelayC3T38  code[113]  B2   B0  TBUFIX1

XDelayC1T39  code[114]  B0   B1  TBUFIX1
XDelayC2T39  code[115]  B1   B2  TBUFIX1
XDelayC3T39  code[116]  B2   B0  TBUFIX1

XDelayC1T40  code[117]  B0   B1  TBUFIX1
XDelayC2T40  code[118]  B1   B2  TBUFIX1
XDelayC3T40  code[119]  B2   B0  TBUFIX1

XDelayC1T41  code[120]  B0   B1  TBUFIX1
XDelayC2T41  code[121]  B1   B2  TBUFIX1
XDelayC3T41  code[122]  B2   B0  TBUFIX1

XDelayC1T42  code[123]  B0   B1  TBUFIX1
XDelayC2T42  code[124]  B1   B2  TBUFIX1
XDelayC3T42  code[125]  B2   B0  TBUFIX1

XDelayC1T43  code[126]  B0   B1  TBUFIX1
XDelayC2T43  code[127]  B1   B2  TBUFIX1
XDelayC3T43  code[128]  B2   B0  TBUFIX1


***********************************
* .ALTER                          *
***********************************
*** SS Corner ***
.ALTER
.DEL LIB "hspice_model.122" L18U18V_TT
.LIB "hspice_model.122" L18U18V_SS
.PARAM supply=1.62v
.TEMP 125

*** FF Corner ***
.ALTER
.DEL LIB "hspice_model.122" L18U18V_SS
.LIB "hspice_model.122" L18U18V_FF
.PARAM supply=1.98v
.TEMP 0

.end
