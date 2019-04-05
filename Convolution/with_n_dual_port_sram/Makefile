DEBUG = 0
SRC = top_c.v load_bmp_c.v sram_dp1.v sram_dp2.v BIGfilter_c.v hw03c.v

BAK = *.bak
LOG = *.log *.key *.fsdb img_gray*.txt out_log.txt *_output.bmp
INCA_libs = INCA_libs

SYNSRC = hw03_h.v top_c.v load_bmp_c.v sram_dp1.v sram_dp2.v hw03c_syn.v \
			-v /theda21_2/CBDK_IC_Contest/cur/Verilog/tsmc13.v

all:
	ncverilog +debug=${DEBUG} ${SRC} +access+r


syn:
	ncverilog +debug=${DEBUG} ${SYNSRC} +access+r

clean:
	-rm -f ${BAK} ${LOG}
	-rm -rf ${INCA_libs}
