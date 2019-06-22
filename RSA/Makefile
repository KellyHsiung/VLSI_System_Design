DEBUG = 0
SRC = TOP.v load.v Montgomery.v RL.v sram.v
BAK = *.bak
LOG = *.log *.key *.fsdb *_hex.txt
INCA_libs = INCA_libs

SYNSRC = final_h.v TOP.v load.v sram.v final_syn.v -v /theda21_2/NanGate_exp20170511/NangateOpenCellLibrary_PDKv1_3_v2010_12/Verilog/NangateOpenCellLibrary.v
#  sram.v
all:
	ncverilog +debug=${DEBUG} ${SRC} +access+r

syn:
	ncverilog +debug=${DEBUG} ${SYNSRC} +access+r

clean:
	-rm -f ${BAK} ${LOG}
	-rm -rf ${INCA_libs}
