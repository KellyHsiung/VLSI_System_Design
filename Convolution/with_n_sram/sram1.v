module sram32768x8_1 (
	input clk,
	input wen,
	input en,
	input [14:0] addr,
	input [7:0] d,
	output [7:0] q
);
 
	reg [7:0] ram [0:32767];
	reg [14:0] read_addr;

	initial begin
		// load the gray-scale image
		$readmemh(`IMAGE_GRAY_HEX1, ram);
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
