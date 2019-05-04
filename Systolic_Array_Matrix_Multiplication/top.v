module top;
	wire clk;
	wire rst_n;
	wire start;
	// wire [10:0] addrA1, addrA2, addrA3, addrA4;
	// wire [10:0] addrB1, addrB2, addrB3, addrB4;
	wire [43:0] addrA, addrB, addrC;
	// wire wen;
	wire en;
	wire FINISH;
	wire [7:0] d;
	wire [7:0] qA1, qA2, qA3, qA4;
	wire [7:0] qB1, qB2, qB3, qB4;
	wire [7:0] qC1, qC2, qC3, qC4;
	// wire [7:0] dC1, dC2, dC3, dC4;

	wire [3:0] wenC;


	wire [31:0] COUT;
	// wire signed [7:0] fc;
	// wire [7:0] out_pixel;

	load_matrix testbench (
		.clk(clk),
		.rst_n(rst_n),
		.start(start),
		.FINISH(FINISH)
		// .fc_valid(fc_valid)
		// .fc(fc),
		// .out_pixel(out_pixel),
		// .out_valid(out_valid)
	);

	sramA sram_A1 (
		.clk(clk),
		.wen(1'd1),
		.en(1'd1),
		.addr(addrA[10:0]),
		.d(d),
		.q(qA1)
	);

	sramA sram_A2 (
		.clk(clk),
		.wen(1'd1),
		.en(1'd1),
		.addr(addrA[21:11]),
		.d(d),
		.q(qA2)
	);

	sramA sram_A3 (
		.clk(clk),
		.wen(1'd1),
		.en(1'd1),
		.addr(addrA[32:22]),
		.d(d),
		.q(qA3)
	);

	sramA sram_A4 (
		.clk(clk),
		.wen(1'd1),
		.en(1'd1),
		.addr(addrA[43:33]),
		.d(d),
		.q(qA4)
	);

	sramB sram_B1 (
		.clk(clk),
		.wen(1'd1),
		.en(1'd1),
		.addr(addrB[10:0]),
		.d(d),
		.q(qB1)
	);

	sramB sram_B2 (
		.clk(clk),
		.wen(1'd1),
		.en(1'd1),
		.addr(addrB[21:11]),
		.d(d),
		.q(qB2)
	);

	sramB sram_B3 (
		.clk(clk),
		.wen(1'd1),
		.en(1'd1),
		.addr(addrB[32:22]),
		.d(d),
		.q(qB3)
	);

	sramB sram_B4 (
		.clk(clk),
		.wen(1'd1),
		.en(1'd1),
		.addr(addrB[43:33]),
		.d(d),
		.q(qB4)
	);

	sramC sram_C1 (
		.clk(clk),
		.wen(wenC[0]),
		.en(1'd1),
		.addr(addrC[10:0]),
		.d(COUT[7:0]),
		.q(qC1)
	);

	sramC sram_C2 (
		.clk(clk),
		.wen(wenC[1]),
		.en(1'd1),
		.addr(addrC[21:11]),
		.d(COUT[15:8]),
		.q(qC2)
	);

	sramC sram_C3 (
		.clk(clk),
		.wen(wenC[2]),
		.en(1'd1),
		.addr(addrC[32:22]),
		.d(COUT[23:16]),
		.q(qC3)
	);

	sramC sram_C4 (
		.clk(clk),
		.wen(wenC[3]),
		.en(1'd1),
		.addr(addrC[43:33]),
		.d(COUT[31:24]),
		.q(qC4)
	);

	TOP_PE top_PE (
		.clk(clk),
		.rst_n(rst_n),
		.wenC(wenC),
		// .en(en),
		// .d(d),
		.AIN( {qA4, qA3, qA2, qA1} ),
		.BIN( {qB4, qB3, qB2, qB1} ),
		.addrA(addrA),
		.addrB(addrB),
		.addrC(addrC),
		.START(start),
		.COUT(COUT),
		.FINISH(FINISH)
	);

endmodule
