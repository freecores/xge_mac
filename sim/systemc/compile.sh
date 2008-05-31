
clear

verilator --trace-dups -f verilator.cmd

cd obj_dir

#$SYSTEMPERL/sp_preproc --preproc *.sp

make -f Vxge_mac.mk Vxge_mac__ALL.a

make -f ../sc.mk crc.o

make -f ../sc.mk sc_packet.o

make -f ../sc.mk sc_pkt_generator.o

make -f ../sc.mk sc_scoreboard.o

make -f ../sc.mk sc_xgmii_if.o

make -f ../sc.mk sc_pkt_if.o

make -f ../sc.mk sc_cpu_if.o

make -f ../sc.mk sc_testbench.o

make -f ../sc.mk sc_testcases.o

make -f ../sc.mk sc_main.o

make -f ../sc.mk verilated.o

make -f ../sc.mk SpTraceVcd.o

make -f ../sc.mk SpTraceVcdC.o

g++ -L$SYSTEMC/lib-linux sc_main.o sc_testcases.o sc_testbench.o sc_pkt_if.o sc_xgmii_if.o sc_cpu_if.o sc_pkt_generator.o sc_scoreboard.o sc_packet.o crc.o Vxge_mac__ALLcls.o Vxge_mac__ALLsup.o verilated.o SpTraceVcdC.o SpTraceVcd.o -o Vxge_mac -lsystemc

cd ..
