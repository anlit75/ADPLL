#rm -rf *.ic* *.lis *.mt* *.st* *.tr* *.pa* novas.* *.err* *.log* ncverilog.* nWaveLog INCA_libs vfast*
ncverilog ./test_dco.v
hspice -i 'dco.sp' -o dco.lis
