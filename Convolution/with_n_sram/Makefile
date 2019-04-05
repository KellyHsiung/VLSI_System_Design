DEBUG = 0
SRC = top_b.v load_bmp_b.v sram1.v sram2.v sram3.v sram4.v BIGfilter_b.v hw03b.v

BAK = *.bak
LOG = *.log *.key *.fsdb img_gray*.txt out_log.txt *_output.bmp
INCA_libs = INCA_libs

SYNSRC = hw03_h.v top_b.v load_bmp_b.v sram1.v sram2.v sram3.v sram4.v hw03b_syn.v \
			-v /theda21_2/CBDK_IC_Contest/cur/Verilog/tsmc13.v



all:
	ncverilog +debug=${DEBUG} ${SRC} +access+r

syn:
	ncverilog +debug=${DEBUG} ${SYNSRC} +access+r

clean:
	-rm -f ${BAK} ${LOG}
	-rm -rf ${INCA_libs}
