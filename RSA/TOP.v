`define MAX_BIT 2048
`define MAX_BIT1 2049
// `define MAX_BIT 32
// `define MAX_BIT1 33


module TOP;
	wire clk;
	wire rst_n;
	wire start;
	wire mode;
	wire finish;
	wire [`MAX_BIT-1: 0] M;
	wire [`MAX_BIT-1: 0] E;
	wire [`MAX_BIT-1: 0] N;
	wire [`MAX_BIT-1: 0] O;         //change

	// SRAM signal
	wire [7:0] addr;
	wire wen;
	wire en;
	wire out_valid;
	wire [31:0] d;
	wire [31:0] q;


	load testbench (
		.clk(clk),
		.rst_n(rst_n),
		.start(start),
		.M(M),
		.E(E),
		.N(N),
		.MODE(mode),
		.O(O),
		.finish(finish)
	);

	// Montgomery m(
	// 	.clk(clk),
	// 	.rst_n(rst_n),
    // 	.START(start),
	// 	.X(M),
    // 	.Y(E),
    // 	.N(N),
    // 	.O(O),
	// 	.DONE(finish)
	// );

	SRAM sram (
		.clk(clk),
		.wen(wen),
		.en(en),
		.addr(addr),
		.d(O),
		.q(q)
	);


	RL rl(
		.clk(clk),
		.rst_n(rst_n),
		.START(start),
		.MODE(mode),
		.Message(M),
		.PublicE(E),
		.KeyN(N),
		.RESULT(O),
		.OE_N(finish),
        .EN(en),
		.WEN(wen),
        .ADDR(addr),
        .Q(q)
	);

endmodule
