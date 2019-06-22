`define SDF_FILE  	  "final_syn.sdf"
`define FSDB_FILE 	  "final.fsdb"
`define SYN_FSDB_FILE "final_syn.fsdb"
`define INPUT_HEX     "input_hex.txt"
`define MAX_BIT 2048
`define MAX_BIT1 2049
`define MAX_BIT_BIT 12
// `define MAX_BIT 32
// `define MAX_BIT1 33


module load(
	clk,
	rst_n,
	start,
	M,
	E,
	N,
	MODE,
	O,
	finish
);
	parameter period = 10;
	parameter delay = 1;

	output reg clk;
	output reg rst_n;
	output reg start;
	output reg MODE;
	output reg[`MAX_BIT-1: 0] M;
	output reg[`MAX_BIT-1: 0] N;
	output reg[`MAX_BIT-1: 0] E;
	input [`MAX_BIT-1: 0] O;         //change
	input finish;

	integer i, j, jj;
	integer input_hex;
	// reg[`MAX_BIT: 0] i;
	reg[`MAX_BIT-1: 0] DATA[0:3];
	reg[`MAX_BIT-1: 0] temp;
	reg[31: 0] data;


	// initial begin
	// 	`ifdef SYNTHESIS
	// 		$sdf_annotate(`SDF_FILE, rl);
	// 		$fsdbDumpfile(`SYN_FSDB_FILE);
	// 	`else	
	// 		$fsdbDumpfile(`FSDB_FILE);
	// 	`endif
	// 	$fsdbDumpvars;
	// 	$monitor(">> %10d ^ %10d mod %10d = %10d", M, E, N, O);	//943
	// end

	initial begin
		// File handlers
		input_hex   = $fopen(`INPUT_HEX,   "wd");

		// convert data to hexadecimal file
		$display(">> Converting to input data...");
		$display(">> Writing to hexadecimal values to %s", `INPUT_HEX);
		DATA[0] = `MAX_BIT'd67447646196807041044487161750000255686074259327873672287328618093365447670610; 
		DATA[1] = `MAX_BIT'd66464481640536293837185008583072588030979848284593712256807723295841414113033; 
		DATA[2] = `MAX_BIT'd74041861860884363236573073389577225936070545448027859973073691116391526935741;
		for(i = 0; i < 3; i = i + 1) begin
			for(j = 2016; j >=0; j = j - 32) begin
				temp = DATA[i] >> j;
				data = temp[31:0];
				// writing the gray scale value in hexadecimal
				$fwrite(input_hex, "%8h\n", data );
			end
		end	
		// $fclose(input_hex);
		for(j = 2016; j >=0; j = j - 32) begin
			// writing the gray scale value in hexadecimal
			$fwrite(input_hex, "%8h\n", 32'd0 );
		end
		$fclose(input_hex);

		clk = 0;
		rst_n = 1;
		start = 0;
		#(delay)  rst_n = 0;
		#(period) rst_n = 1; MODE = 1'b0; M = `MAX_BIT'd0; E = `MAX_BIT'd0; N = `MAX_BIT'd0; //R = `MAX_BIT1'd0;
		#(period) start = 1; MODE = 1'b1; 
		M = `MAX_BIT'd67447646196807041044487161750000255686074259327873672287328618093365447670610; 
		E = `MAX_BIT'd66464481640536293837185008583072588030979848284593712256807723295841414113033; 
		N = `MAX_BIT'd74041861860884363236573073389577225936070545448027859973073691116391526935741; 

		#(period) start = 0;

		@(posedge finish)
		// $display(">> %10d ^ %10d mod %10d = %10d", M, E, N, O);	//943
		jj = 2016;
		DATA[3] = `MAX_BIT'd0;
		for(j = 192; j < 256; j = j + 1) begin
			DATA[3] = DATA[3] + (sram.ram[j] << jj);
			jj = jj - 32;
			$display("Mem[%3d] %8d", j, sram.ram[j]);	//943
		end
		if(MODE) begin
			$display(">> %10d * %10d mod %10d", DATA[0], DATA[1], DATA[2]);
		end else begin
			$display(">> %10d ^ %10d mod %10d", DATA[0], DATA[1], DATA[2]);
		end
		$display("Answer = %40d", DATA[3]);
		// ME answer 98791686394755
		// MM answer 1838319689327490204160022913609784046122421496245851412441731034243885510215
		$finish;
		// $finish;
	end



	
	// create the clock
	always #(period/2) clk = ~clk;

	// test patterns
	// initial begin
	// 	clk = 0;
	// 	rst_n = 1;
	// 	start = 0;
	// 	#(delay)  rst_n = 0;
	// 	#(period) rst_n = 1; MODE = 1'b0; M = `MAX_BIT'd0; E = `MAX_BIT'd0; N = `MAX_BIT'd0; //R = `MAX_BIT1'd0;

	// 	//ME
	// 	// for(i = `MAX_BIT'd0; i < `MAX_BIT1'b00100; i = i + `MAX_BIT'd1) begin
	// 	// 	#(period) start = 1; MODE = 1'b0; M = `MAX_BIT'b1000; E = i; N = `MAX_BIT'b0011; //R = `MAX_BIT1'd100000000;
	// 	// 	#(period) start = 0;
	// 	// 	$display("----------------------------------");
	// 	// 	@(negedge finish)
	// 	// 	// $display("----------------------------------");
	// 	// 	$display(">> %d ^ %d mod %d = %d", M, E, N, O);
	// 	// 	$display("----------------------------------");
		
	// 	// end



	// 	#(period) start = 1; MODE = 1'b0; M = `MAX_BIT'd6926335; E = `MAX_BIT'd31; N = `MAX_BIT'd1763; //R = `MAX_BIT1'd100000000;
	// 	#(period) start = 0;
	// 	// for(j = 2016; j >=0; j = j - 32) begin
	// 		@(negedge finish)
	// 		$monitor(">> %10d ^ %10d mod %10d = %10d", M, E, N, O);	//943
	// 	// end
	// 	// @(negedge finish)
	// 	// $display(">> %d ^ %d mod %d = %d", M, E, N, O);	//943

	// 	// #(period) start = 1; MODE = 1'b0; M = `MAX_BIT'd105; E = `MAX_BIT'd79; N = `MAX_BIT'd3337; //R = `MAX_BIT1'd100000000;
	// 	// #(period) start = 0;
	// 	// @(posedge finish)
	// 	// $display(">> %d ^ %d mod %d = %d", M, E, N, O);	//193

	// 	// //MM
	// 	// #(period) start = 1; MODE = 1'b1; M = `MAX_BIT'd20; E = `MAX_BIT'd20; N = `MAX_BIT'd3337; //R = `MAX_BIT1'd100000000;
	// 	// #(period) start = 0;
	// 	// @(posedge finish)
	// 	// $display(">> %d x %d mod %d = %d", M, E, N, O);	//400

	// 	// #(period) start = 1; MODE = 1'b0; M = `MAX_BIT'd6270975; E = `MAX_BIT'd23; N = `MAX_BIT'd899; //R = `MAX_BIT1'd100000000;
	// 	// #(period) start = 0;
	// 	// @(posedge finish)
	// 	// $display(">> %d ^ %d mod %d = %d", M, E, N, O);	//438
		
	// 	// #(100000000000*period);
	// 	$finish;
	// end
	
endmodule
