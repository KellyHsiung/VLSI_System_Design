`define IMAGE_SOURCE    "../lena_256x256.bmp"
`define IMAGE_OUTPUT    "../lena_output.bmp"
`define IMAGE_GRAY_HEX1 "img_gray_hex1.txt"
`define IMAGE_GRAY_DEC1 "img_gray_dec1.txt"
`define IMAGE_GRAY_HEX2 "img_gray_hex2.txt"
`define IMAGE_GRAY_DEC2 "img_gray_dec2.txt"
`define IMAGE_GRAY_HEX3 "img_gray_hex3.txt"
`define IMAGE_GRAY_DEC3 "img_gray_dec3.txt"
`define IMAGE_GRAY_HEX4 "img_gray_hex4.txt"
`define IMAGE_GRAY_DEC4 "img_gray_dec4.txt"
`define EDGE_OUTPUT     "out_log.txt"
// Change the filename when necessary
`define FSDB_FILE       "hw03b.fsdb"
`define SYN_FSDB_FILE   "hw03b_syn.fsdb"
`define SYN_SDF_FILE    "hw03b_syn.sdf"

module load_bmp(
	clk,
	rst_n,
	start,
	fc_valid,
	fc,
	out_pixel0,
	out_pixel1,
	out_pixel2,
	out_pixel3,
	out_valid
);
	parameter period = 10;
	parameter delay = 1;
	integer img_in, img_out, cc, out_log, gray_dec1, gray_hex1;
	integer gray_dec2, gray_hex2, gray_dec3, gray_hex3, gray_dec4, gray_hex4;
	output reg clk;
	output reg rst_n;
	output reg start;
	output reg fc_valid;
	output reg signed [7:0] fc;

	input [7:0] out_pixel0, out_pixel1, out_pixel2, out_pixel3;
	input out_valid;

	reg [7:0] bmp_data [0:2000000];
	reg [23:0] bmp_new [0:255][0:255];
	// reg [7:0] ans_pixel [0:255][0:255];
	reg [23:0] tmp_data;
	integer bmp_width, bmp_height, data_start_index, bmp_size,
			pixel_bits, reserve1, reserve2, image_size;
	integer i, j, index;
	integer debug;                // debug flag
	reg signed [8:0] index_x;
	reg signed [8:0] index_y;
	reg signed [3:0] m, n;

	initial begin
		`ifdef SYNTHESIS
			$sdf_annotate(`SYN_SDF_FILE, BIGfilt);
			// $fsdbDumpfile(`SYN_FSDB_FILE);
		`else	
			$fsdbDumpfile(`FSDB_FILE);
		`endif
		$fsdbDumpvars;
	end

	initial begin

		// setting the debug level
		if ($value$plusargs("debug=%d", debug)) begin
			$display(">> Debug level = %d", debug);
		end else begin
			debug = 0;
		end

		// File handlers
		img_in   = $fopen(`IMAGE_SOURCE,   "rb");
		out_log  = $fopen(`EDGE_OUTPUT,    "wd");
		img_out  = $fopen(`IMAGE_OUTPUT,   "wb");

		gray_dec1 = $fopen(`IMAGE_GRAY_DEC1, "wd");
		gray_hex1 = $fopen(`IMAGE_GRAY_HEX1, "wd");
		gray_dec2 = $fopen(`IMAGE_GRAY_DEC2, "wd");
		gray_hex2 = $fopen(`IMAGE_GRAY_HEX2, "wd");
		gray_dec3 = $fopen(`IMAGE_GRAY_DEC3, "wd");
		gray_hex3 = $fopen(`IMAGE_GRAY_HEX3, "wd");
		gray_dec4 = $fopen(`IMAGE_GRAY_DEC4, "wd");
		gray_hex4 = $fopen(`IMAGE_GRAY_HEX4, "wd");

		// Read the input BMP image
		$display(">> Reading the image file: %s", `IMAGE_SOURCE);
		cc = $fread(bmp_data, img_in);
		$fclose(img_in);

		// Parse the BMP header
		// Don't worry about the header processing
		$display(">> Parsing the image file header...");
		reserve1   = {bmp_data[7],  bmp_data[6] };
		reserve2   = {bmp_data[9],  bmp_data[8] };
		pixel_bits = {bmp_data[29], bmp_data[28]};
	    // $display("pixel_bits: %d", pixel_bits);
		bmp_width = {bmp_data[21], bmp_data[20], bmp_data[19], bmp_data[18]};
	    // $display("width: %d", bmp_width);
		bmp_height = {bmp_data[25], bmp_data[24], bmp_data[23], bmp_data[22]};
	    // $display("height: %d", bmp_height);
		data_start_index = {bmp_data[13], bmp_data[12], bmp_data[11], bmp_data[10]};
	    // $display("start_index: %d", data_start_index);
		bmp_size = {bmp_data[5], bmp_data[4], bmp_data[3], bmp_data[2]};
		image_size = {bmp_data[37], bmp_data[36], bmp_data[35], bmp_data[34]};

		// obtain pixel values from the BMP image
		// and convert them to gray scale
		$display(">> Converting to gray scale...");
		// $display(">> Writing to gray-scale decimal values to %s", `IMAGE_GRAY_DEC);
		// $display(">> Writing to gray-scale hexadecimal values to %s", `IMAGE_GRAY_HEX);
		
		for(i = 0; i < 512; i = i + 1) begin
			$fwrite(gray_dec1, "0\n");
			$fwrite(gray_hex1, "0\n");
		end

		for(i = 0; i < 256; i = i + 1) begin
			for(j = 0; j < 256; j = j + 1) begin
				index = i * 256 * 3 + j * 3 + data_start_index;
				bmp_new[i][j][23:16] = bmp_data[index+2]; // Red
				bmp_new[i][j][15:8]  = bmp_data[index+1]; // Green
				bmp_new[i][j][7:0]   = bmp_data[index];   // Blue

				// writing the gray scale value in decimal & hexadecimal
				//sram1
				if(i < 66) begin
					$fwrite(gray_dec1, "%d\n",  (bmp_data[index+2] + bmp_data[index+1] + bmp_data[index]) / 3);
					$fwrite(gray_hex1, "%2h\n", (bmp_data[index+2] + bmp_data[index+1] + bmp_data[index]) / 3);
				end else if (i < 126) begin
					$fwrite(gray_dec1, "0\n");
					$fwrite(gray_hex1, "0\n");
				end
				//sram2
				if(i > 61 && i < 130) begin
					$fwrite(gray_dec2, "%d\n",  (bmp_data[index+2] + bmp_data[index+1] + bmp_data[index]) / 3);
					$fwrite(gray_hex2, "%2h\n", (bmp_data[index+2] + bmp_data[index+1] + bmp_data[index]) / 3);
				end else if (i > 129 && i < 190) begin
					$fwrite(gray_dec2, "0\n");
					$fwrite(gray_hex2, "0\n");
				end
				//sram3
				if(i > 125 && i < 194) begin
					$fwrite(gray_dec3, "%d\n",  (bmp_data[index+2] + bmp_data[index+1] + bmp_data[index]) / 3);
					$fwrite(gray_hex3, "%2h\n", (bmp_data[index+2] + bmp_data[index+1] + bmp_data[index]) / 3);
				end else if (i > 193 && i < 254) begin
					$fwrite(gray_dec3, "0\n");
					$fwrite(gray_hex3, "0\n");
				end
				//sram4
				if(i > 189) begin
					$fwrite(gray_dec4, "%d\n",  (bmp_data[index+2] + bmp_data[index+1] + bmp_data[index]) / 3);
					$fwrite(gray_hex4, "%2h\n", (bmp_data[index+2] + bmp_data[index+1] + bmp_data[index]) / 3);
				end
			end
		end

		for(i = 0; i < 15872; i = i + 1) begin
			$fwrite(gray_dec4, "0\n");
			$fwrite(gray_hex4, "0\n");
		end

		// writing the BMP file header to output image
		for(i = 0; i < data_start_index; i = i + 1) begin
			$fwrite(img_out, "%c", bmp_data[i]);
		end
	
		$fclose(gray_dec1);
		$fclose(gray_hex1);
		$fclose(gray_dec2);
		$fclose(gray_hex2);
		$fclose(gray_dec3);
		$fclose(gray_hex3);
		$fclose(gray_dec4);
		$fclose(gray_hex4);
	end
	
	// create the clock
	always #(period/2) clk = ~clk;

	// test patterns
	initial begin
		clk = 0;
		rst_n = 1;
		fc_valid =0;
		fc = 0;
		start = 0;
		#(delay) rst_n = 0;
		#(period) rst_n = 1;
		#(period) start = 1;

		// Output the filter coefficients (fc) 
		// You may see there are 25 coefficients, where the 13th is 24, and all others are -1
		// The signal fc_valid will be high during these 25 cycles; 
		// It will be zero otherwise.
		for (i = 0; i < 5; i = i + 1 ) begin
			for (j = 0; j < 5; j = j + 1) begin
				#(period)
				fc_valid = 1;
				$write(">> Filter Coeff [%2d][%2d] = ", i, j);
				if (i == 2 && j == 2) begin
					fc = 24;
					$write("24\n");
				end else begin
					fc = -1;
					$write("-1\n");
				end
			end
		end
		#(period) fc_valid = 0;
		$display(">> Filter coeff done.");

		// Obtain the output pixel
		for(i = 0; i < 64; i = i + 1) begin
			for(j = 0; j < 256; j = j + 1) begin
				@(posedge out_valid)

				if (debug >= 3)
					$display(">> Computed pixel value [%4d][%4d] = %d", i, j, out_pixel0);

				bmp_new[i][j][23:16] = out_pixel0; // Red
				bmp_new[i][j][15:8]  = out_pixel0; // Green
				bmp_new[i][j][7:0]   = out_pixel0; // Blue

				bmp_new[i+64][j][23:16] = out_pixel1; // Red
				bmp_new[i+64][j][15:8]  = out_pixel1; // Green
				bmp_new[i+64][j][7:0]   = out_pixel1; // Blue

				bmp_new[i+128][j][23:16] = out_pixel2; // Red
				bmp_new[i+128][j][15:8]  = out_pixel2; // Green
				bmp_new[i+128][j][7:0]   = out_pixel2; // Blue

				bmp_new[i+192][j][23:16] = out_pixel3; // Red
				bmp_new[i+192][j][15:8]  = out_pixel3; // Green
				bmp_new[i+192][j][7:0]   = out_pixel3; // Blue
			end
		end
		start = 0;

		for(i = 0; i < 256; i = i + 1) begin
			for(j = 0; j < 256; j = j + 1) begin

				$fwrite(img_out, "%c", bmp_new[i][j][7:0]); //B
				$fwrite(img_out, "%c", bmp_new[i][j][15:8]); //G
				$fwrite(img_out, "%c", bmp_new[i][j][23:16]); //R

				// We also write the decimal value to the log file for your validation
				$fwrite(out_log, "%d\n", bmp_new[i][j][7:0]);
			end
		end
		$fclose(img_out);
		$fclose(out_log);

		// delay 100 more cycles
		#(period*100)
		$finish;

		// enjoy the Verilog coding
	end
endmodule
