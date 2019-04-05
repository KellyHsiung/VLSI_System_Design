// Dual-port SRAM template

module sram_dp1 (
	input clka,
	input clkb,
	input ena,
	input enb,
	input wena,
	input wenb,
	input [15:0] addra,
	input [15:0] addrb,
	input [7:0] da,
	input [7:0] db,
	output reg [7:0] qa,
	output reg [7:0] qb
);

	reg [7:0] ram [0:65535];

	initial begin
		// load the gray-scale image
		$readmemh(`IMAGE_GRAY_HEX1, ram);
	end

	always @(posedge clka) begin
		if (ena) begin
		if (wena == 0)
			ram[addra] <= da;
		qa <= #1 ram[addra];
		end
	end

	// 
	// always @(posedge clka) begin
	//   if (ena) begin
	//     if (wena == 0) begin
	//       ram[addra] <= da;
	//       qa <= #1 da;
	//     end else begin
	//       qa <= #1 ram[addra];
	//     end
	//   end
	// end
	//

	always @(posedge clkb) begin
		if (enb) begin
		if (wenb == 0)
			ram[addrb] <= db;
		qb <= #1 ram[addrb];
		end
	end

endmodule
