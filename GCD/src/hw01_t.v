module stimulus;
	parameter cyc = 10;
	parameter delay = 1;

	reg clk, rst_n, start;
	reg [7:0] a, b;
	wire done, error;
	wire [7:0] y;

	//[HW] complete the port connections
	GCD gcd1 (
		.CLK(clk),
		.RST_N(rst_n),
		.A(a),
		.B(b),
		.START(start),
		.Y(y),
		.DONE(done),
		.ERROR(error)
	);


	always #(cyc/2) clk = ~clk;

	initial begin
		$fsdbDumpfile("gcd.fsdb");
		$fsdbDumpvars;

		$monitor($time, " CLK=%b RST_N=%b START=%b A=%d B=%d | DONE=%b Y=%d ERROR=%b",
			clk, rst_n, start, a, b, done, y, error);
	end

	initial begin
		clk = 1;
		rst_n = 1;
		#(cyc);
		#(delay) rst_n = 0;
		#(cyc*4) rst_n = 1;
		#(cyc*2);

		#(cyc) nop;
		
		//condition 1
		#(cyc) load; data_in(8'd233, 8'd0);
		#(cyc) nop;
		@(posedge done);
		//condition 2
		#(cyc) load; data_in(8'd0, 8'd233);
		#(cyc) nop;
		@(posedge done);
		//condition 3
		#(cyc) load; data_in(8'd0, 8'd0);
		#(cyc) nop;
		@(posedge done);
		//condition 4
		#(cyc) load; data_in(8'd23, 8'd23);
		#(cyc) nop;
		@(posedge done);
		//condition 5
		#(cyc) load; data_in(8'd13, 8'd255);
		#(cyc) nop;
		@(posedge done);
		//condition 6
		#(cyc) load; data_in(8'd233, 8'd144);
		#(cyc) nop;
		@(posedge done);
		

		#(cyc) nop;
		#(cyc*8);
		$finish;
	end

	// take a careful look at 
	// the usage of task here
	task nop;
		begin
			start = 0;
		end
	endtask
	task load;
		begin
			start = 1;
		end
	endtask
	task data_in;
		input [7:0] data1, data2;
		begin
			a = data1;
			b = data2;
		end
	endtask
endmodule

