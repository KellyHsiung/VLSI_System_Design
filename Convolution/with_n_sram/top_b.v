module top;
	wire clk;
	wire rst_n;
	wire start;
	wire [14:0] addr1, addr2, addr3, addr4;
	wire wen1, wen2, wen3, wen4;
	wire en1, en2, en3, en4;
	wire out_valid1, out_valid2, out_valid3, out_valid4;
	wire [7:0] d1, d2, d3, d4;
	wire [7:0] q1, q2, q3, q4;
	wire signed [7:0] fc;
	wire [7:0] out_pixel1, out_pixel2, out_pixel3, out_pixel4;

	load_bmp testbench (
		.clk(clk),
		.rst_n(rst_n),
		.start(start),
		.fc_valid(fc_valid),
		.fc(fc),
		.out_pixel0(out_pixel1),
		.out_pixel1(out_pixel2),
		.out_pixel2(out_pixel3),
		.out_pixel3(out_pixel4),
		.out_valid(out_valid1)
	);

	sram32768x8_1 sram1 (
		.clk(clk),
		.wen(wen1),
		.en(en1),
		.addr(addr1),
		.d(d1),
		.q(q1)
	);
	sram32768x8_2 sram2 (
		.clk(clk),
		.wen(wen2),
		.en(en2),
		.addr(addr2),
		.d(d2),
		.q(q2)
	);
	sram32768x8_3 sram3 (
		.clk(clk),
		.wen(wen3),
		.en(en3),
		.addr(addr3),
		.d(d3),
		.q(q3)
	);
	sram32768x8_4 sram4 (
		.clk(clk),
		.wen(wen4),
		.en(en4),
		.addr(addr4),
		.d(d4),
		.q(q4)
	);

	BIGfilter BIGfilt (
		.clk(clk),
		.rst_n(rst_n),
		.fc_valid(fc_valid),
		.working_pixel0(q1),
		.working_pixel1(q2),
		.working_pixel2(q3),
		.working_pixel3(q4),
		.wen0(wen1),
		.wen1(wen2),
		.wen2(wen3),
		.wen3(wen4),
		.en0(en1),
		.en1(en2),
		.en2(en3),
		.en3(en4),
		.fc(fc),
		.out_pixel0(out_pixel1),
		.out_pixel1(out_pixel2),
		.out_pixel2(out_pixel3),
		.out_pixel3(out_pixel4),
		.out_valid0(out_valid1),
		.out_valid1(out_valid2),
		.out_valid2(out_valid3),
		.out_valid3(out_valid4),
		.d0(d1),
		.d1(d2),
		.d2(d3),
		.d3(d4),
		.addr0(addr1),
		.addr1(addr2),
		.addr2(addr3),
		.addr3(addr4),
		.start(start)
	);

endmodule
