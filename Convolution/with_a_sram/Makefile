DEBUG = 0
SRC = top_a.v load_bmp_a.v sram.v hw03a.v


BAK = *.bak
LOG = *.log *.key *.fsdb img_gray*.txt out_log.txt *_output.bmp
INCA_libs = INCA_libs

SYNSRC = hw03_h.v top_a.v load_bmp_a.v sram.v hw03a_syn.v \
			-v /theda21_2/CBDK_IC_Contest/cur/Verilog/tsmc13.v



all:
	ncverilog +debug=${DEBUG} ${SRC} +access+r


syn:
	ncverilog +debug=${DEBUG} ${SYNSRC} +access+r


clean:
	-rm -f ${BAK} ${LOG}
	-rm -rf ${INCA_libs}
