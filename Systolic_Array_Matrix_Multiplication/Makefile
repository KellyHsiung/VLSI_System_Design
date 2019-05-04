DEBUG = 0
SRC = top.v load.v sramA.v sramB.v sramC.v PE.v hw04.v
BAK = *.bak
LOG = *.log *.key *.fsdb *_hex.txt
INCA_libs = INCA_libs

SYNSRC = hw04_h.v top.v load.v sramA.v sramB.v sramC.v hw04_syn.v -v /theda21_2/CBDK_IC_Contest/cur/Verilog/tsmc13.v

all:
	ncverilog +debug=${DEBUG} ${SRC} +access+r

syn:
	ncverilog +debug=${DEBUG} ${SYNSRC} +access+r

clean:
	-rm -f ${BAK} ${LOG}
	-rm -rf ${INCA_libs}
