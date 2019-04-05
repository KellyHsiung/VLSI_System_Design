module BIGfilter(
	input wire clk,
	input wire rst_n,
	input wire fc_valid,
	input wire [7:0] working_pixel0, working_pixel1, working_pixel2, working_pixel3,
	input signed [7:0] fc,
	input wire start,
	output wire [7:0] out_pixel0, out_pixel1, out_pixel2, out_pixel3,
	output wire out_valid0, out_valid1, out_valid2, out_valid3,
	output wire [15:0] addr0,
    output wire [15:0] addr1,
    output wire [15:0] addr2,
    output wire [15:0] addr3,
	output wire wen0, wen1, wen2, wen3,
	output wire en0, en1, en2, en3,
	output wire [7:0] d0, d1, d2, d3
);

	

	filter filt0 (
		.clk(clk),
		.rst_n(rst_n),
		.fc_valid(fc_valid),
		.working_pixel(working_pixel0),
		.wen(wen0),
		.en(en0),
		.fc(fc),
        .num(2'd0),
		.out_pixel(out_pixel0),
		.out_valid(out_valid0),
		.d(d0),
		.addr(addr0),
		.start(start)
	);
    filter filt1 (
		.clk(clk),
		.rst_n(rst_n),
		.fc_valid(fc_valid),
		.working_pixel(working_pixel1),
		.wen(wen1),
		.en(en1),
		.fc(fc),
        .num(2'd1),
		.out_pixel(out_pixel1),
		.out_valid(out_valid1),
		.d(d1),
		.addr(addr1),
		.start(start)
	);
    filter filt2 (
		.clk(clk),
		.rst_n(rst_n),
		.fc_valid(fc_valid),
		.working_pixel(working_pixel2),
		.wen(wen2),
		.en(en2),
		.fc(fc),
        .num(2'd2),
		.out_pixel(out_pixel2),
		.out_valid(out_valid2),
		.d(d2),
		.addr(addr2),
		.start(start)
	);
    filter filt3 (
		.clk(clk),
		.rst_n(rst_n),
		.fc_valid(fc_valid),
		.working_pixel(working_pixel3),
		.wen(wen3),
		.en(en3),
		.fc(fc),
        .num(2'd3),
		.out_pixel(out_pixel3),
		.out_valid(out_valid3),
		.d(d3),
		.addr(addr3),
		.start(start)
	);

endmodule
