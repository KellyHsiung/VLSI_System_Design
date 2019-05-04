`define INPUT_A   "input_A.txt"
`define INPUT_B   "input_B.txt"
`define OUTPUT    "output.txt"
`define OUTPUT_C  "response_C.txt"

`define INPUT_A_HEX  "input_A_hex.txt"
`define INPUT_B_HEX  "input_B_hex.txt"
`define OUTPUT_C_HEX "response_C_hex.txt"

`define SDF_FILE  	  "hw04_syn.sdf"
`define FSDB_FILE 	  "hw04.fsdb"
`define SYN_FSDB_FILE "hw04_syn.fsdb"

module load_matrix(
	clk,
	rst_n,
	start,
	FINISH
);
	parameter period = 10;
	parameter delay = 1;
	integer matrixA_in, matrixB_in, matrixC_in, matrixA_hex, matrixB_hex, matrixC_hex;
	output reg clk;
	output reg rst_n;
	output reg start;
	input FINISH;

	reg [7:0] matrixA_data [0:2047];
	reg [7:0] matrixB_data [0:2047];
	reg [7:0] matrixC_data [0:2047];
	reg [7:0] data;
	integer i, j, index;



	initial begin
		`ifdef SYNTHESIS
			$sdf_annotate(`SDF_FILE, top_PE);
			$fsdbDumpfile(`SYN_FSDB_FILE);
		`else	
			$fsdbDumpfile(`FSDB_FILE);
		`endif
		$fsdbDumpvars;
	end

	initial begin
		// File handlers
		matrixA_in  = $fopen(`INPUT_A,      "r");
		matrixB_in  = $fopen(`INPUT_B,	    "r");
		// matrixC_in  = $fopen(`OUTPUT_C,	    "r");
		matrixA_hex = $fopen(`INPUT_A_HEX,  "w");
		matrixB_hex = $fopen(`INPUT_B_HEX,  "w");
		// matrixC_hex = $fopen(`OUTPUT_C_HEX, "w");

		// obtain values from the txt file and convert them to hexadecimal values
		$display(">> Writing matrix A to hexadecimal values to %s, %s and %s", `INPUT_A_HEX, `INPUT_B_HEX, `OUTPUT_C_HEX);
		for(i = 0; i < 128; i = i + 1) begin
			for(j = 0; j < 16; j = j + 1) begin
				index = i * 16 + j;
				// Read the input matrix A and B
				$fscanf(matrixA_in, "%d", matrixA_data[index]);
				$fscanf(matrixB_in, "%d", matrixB_data[index]);
				// $fscanf(matrixC_in, "%d", matrixC_data[index]);
				// writing the value in hexadecimal
				$fwrite(matrixA_hex, "%2h\n", matrixA_data[index] );
				$fwrite(matrixB_hex, "%2h\n", matrixB_data[index] );
				// $fwrite(matrixC_hex, "%2h\n", matrixC_data[index] );
			end
		end

		$fclose(matrixA_in);
		$fclose(matrixB_in);
		$fclose(matrixC_in);
		$fclose(matrixA_hex);
		$fclose(matrixB_hex);
		// $fclose(matrixC_hex);
	end
	
	// create the clock
	always #(period/2) clk = ~clk;

	// test patterns
	initial begin
		clk = 0;
		rst_n = 1;
		start = 0;
		#(delay)  rst_n = 0;
		#(period) rst_n = 1;
		#(period) start = 1;
		#(period) start = 0;
		@(posedge FINISH)
		$display(">> Finish matrix multiplication\n");


		matrixC_in  = $fopen(`OUTPUT_C,	"r");
		// matrixC_hex = $fopen("CC.txt",	"w");
		// Check answer
		for(i = 0; i < 128; i = i + 1) begin
				`ifdef SYNTHESIS
					index = 4 * i+1;
				`else
					index = 4 * i;
				`endif

				for(j = 0; j < 4; j = j + 1) begin
					$fscanf(matrixC_in, "%d", data);
					if(sram_C1.ram[index + j] != data) $write("Fault!\n");
				end
				for(j = 0; j < 4; j = j + 1) begin
					$fscanf(matrixC_in, "%d", data);
					if(sram_C2.ram[index + j] != data) $write("Fault!\n");
				end
				for(j = 0; j < 4; j = j + 1) begin
					$fscanf(matrixC_in, "%d", data);
					if(sram_C3.ram[index + j] != data) $write("Fault!\n");
				end
				for(j = 0; j < 4; j = j + 1) begin
					$fscanf(matrixC_in, "%d", data);
					if(sram_C4.ram[index + j] != data) $write("Fault!\n");
				end
				// $fwrite(matrixC_hex, "%3d %3d %3d %3d ",  sram_C1.ram[index], sram_C1.ram[index+1], sram_C1.ram[index+2], sram_C1.ram[index+3]);
				// $fwrite(matrixC_hex, "%3d %3d %3d %3d ",  sram_C2.ram[index], sram_C2.ram[index+1], sram_C2.ram[index+2], sram_C2.ram[index+3]);
				// $fwrite(matrixC_hex, "%3d %3d %3d %3d ",  sram_C3.ram[index], sram_C3.ram[index+1], sram_C3.ram[index+2], sram_C3.ram[index+3]);
				// $fwrite(matrixC_hex, "%3d %3d %3d %3d\n", sram_C4.ram[index], sram_C4.ram[index+1], sram_C4.ram[index+2], sram_C4.ram[index+3]);
		end
		$fclose(matrixC_in);
		// $fclose(matrixC_hex);

		$finish;
	end
	
endmodule
