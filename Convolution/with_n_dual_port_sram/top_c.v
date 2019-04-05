module top;
	wire clk;
	wire rst_n;
	wire start;
	wire [15:0] addra1, addrb1, addra2, addrb2;
	wire wena1, wenb1, wena2, wenb2;
	wire ena1, enb1, ena2, enb2;
	wire out_valid1, out_valid2, out_valid3, out_valid4;
	wire [7:0] da1, db1, da2, db2;
	wire [7:0] qa1, qb1, qa2, qb2;
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


	sram_dp1 sram1(
		.clka(clk),
		.clkb(~clk),
		.ena(ena1),
		.enb(enb1),
		.wena(wena1),
		.wenb(wenb1),
		.addra(addra1),
		.addrb(addrb1),
		.da(da1),
		.db(db1),
		.qa(qa1),
		.qb(qb1)
	);

	sram_dp2 sram2(
		.clka(clk),
		.clkb(~clk),
		.ena(ena2),
		.enb(enb2),
		.wena(wena2),
		.wenb(wenb2),
		.addra(addra2),
		.addrb(addrb2),
		.da(da2),
		.db(db2),
		.qa(qa2),
		.qb(qb2)
	);



	BIGfilter BIGfilt (
		.clk(clk),
		.rst_n(rst_n),
		.fc_valid(fc_valid),
		.working_pixel0(qa1),
		.working_pixel1(qb1),
		.working_pixel2(qa2),
		.working_pixel3(qb2),
		.wen0(wena1),
		.wen1(wenb1),
		.wen2(wena2),
		.wen3(wenb2),
		.en0(ena1),
		.en1(enb1),
		.en2(ena2),
		.en3(enb2),
		.fc(fc),
		.out_pixel0(out_pixel1),
		.out_pixel1(out_pixel2),
		.out_pixel2(out_pixel3),
		.out_pixel3(out_pixel4),
		.out_valid0(out_valid1),
		.out_valid1(out_valid2),
		.out_valid2(out_valid3),
		.out_valid3(out_valid4),
		.d0(da1),
		.d1(db1),
		.d2(da2),
		.d3(db2),
		.addr0(addra1),
		.addr1(addrb1),
		.addr2(addra2),
		.addr3(addrb2),
		.start(start)
	);

endmodule
