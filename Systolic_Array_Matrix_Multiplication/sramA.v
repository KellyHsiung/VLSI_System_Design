module sramA (
	input clk,
	input wen,
	input en,
	input [10:0] addr,
	input [7:0] d,
	output [7:0] q
);
 
	reg [7:0] ram [0:2047];
	reg [10:0] read_addr;

	integer cc;
	integer matrixA_in;

	initial begin
		// load the matrix A
		$readmemh(`INPUT_A_HEX, ram);
	end
	
	always @(posedge clk) begin
		if (en) begin
			if (wen == 0)
				ram[addr] <= d;
			read_addr <= addr;
		end
	end
	assign q = ram[read_addr];

	// NOTE: you should declare q as reg type
	//
	// always @(posedge clk) begin
	//   if (en) begin
	//     if (wen == 0)
	//       ram[addr] <= d;
	//     q <= #1 ram[addr];
	//   end
	// end
	//

endmodule
