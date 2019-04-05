module filter (
	input wire clk,
	input wire rst_n,
	input wire fc_valid,
	input wire [7:0] working_pixel,
	input signed [7:0] fc,
	input wire start,
	output reg [7:0] out_pixel,
	output reg out_valid,
	output reg [15:0] addr,
	output wire wen,
	output reg en,
	output wire [7:0] d
);

	
	//add sign to working pixel
	wire signed [8:0] calc_pixel = {1'b0, working_pixel};
	

	parameter IDLE   = 3'b000;
	parameter READfc = 3'b001;
	parameter CALC   = 3'b010;
	parameter WAIT   = 3'b011;
	parameter OUTPUT = 3'b100;
	
	parameter PIXELCOUNT = 16'd65535;

	integer i, j;
	

	reg START, FC_valid, next_out_valid;
	reg [2:0] state, next_state;
	reg [2:0] fc_i, fc_j, next_fc_i, next_fc_j;
	reg [4:0] calc_count, next_calc_count;
	reg [7:0] pixel_i, pixel_j, next_pixel_i, next_pixel_j, next_outPixel;
	
	reg [15:0] pixel_count, next_pixel_count;
	reg [15:0] next_addr;

	
	reg signed [7:0] temp_fc, next_temp_fc;
	reg signed [7:0] FC[0:4][0:4];
	reg signed [7:0] next_FC[0:4][0:4];
	reg signed [15:0] temp_pixel, next_temp_pixel;
	reg signed [10:0] padded_i, padded_j, next_padded_i, next_padded_j;

	reg signed [10:0] ibound, jbound, next_ibound, next_jbound;


	assign wen = 1'b1;
	assign d = 8'd0;
	always @(posedge clk) begin
		en = 1;
		if( !rst_n ) begin
			START = 1'b0;
			FC_valid = 1'b0;
			state = IDLE;
			for(i=0; i<5; i=i+1) begin
				for(j=0; j<5; j=j+1) begin
					FC[i][j] = 8'd0;
				end
			end


			fc_i = 3'd0;
			fc_j = 3'd0;
			pixel_i = 8'd0;
			pixel_j = 8'd0;
			padded_i = -2;
			padded_j = -2;
			ibound = 11'd0;
			jbound = 11'd0;


			calc_count = 5'd0;
			out_pixel = 8'd0;
			out_valid = 1'b0;
			pixel_count = 16'd0;
			addr = 16'd0;
			temp_pixel = $signed(0);
			temp_fc = 4'd0;
			
		end else begin
			START = start;
			FC_valid = fc_valid;
			state = next_state;
			for(i=0; i<5; i=i+1) begin
				for(j=0; j<5; j=j+1) begin
					FC[i][j] = next_FC[i][j];
				end
			end
			fc_i = next_fc_i;
			fc_j = next_fc_j;
			pixel_i = next_pixel_i;
			pixel_j = next_pixel_j;
			padded_i = next_padded_i;
			padded_j = next_padded_j;
			ibound = next_ibound;
			jbound = next_jbound;

			
			calc_count = next_calc_count;
			out_pixel = next_outPixel;
			out_valid = next_out_valid;
			pixel_count = next_pixel_count;
			addr = next_addr;
			temp_pixel = next_temp_pixel;
			temp_fc = next_temp_fc;
		end
	end



	always @(*) begin

		next_fc_i = 8'd0;
		next_fc_j = 8'd0;
		next_pixel_i = 8'd0;
		next_pixel_j = 8'd0;
		next_padded_i = -2;
		next_padded_j = -2;
		next_ibound = -2;
		next_jbound = -2;

		next_calc_count = 5'd0;
		next_outPixel = 10'd0;
		next_pixel_count = 16'd0;
		next_addr = 16'd0;	
		next_temp_pixel = $signed(0);
		next_temp_fc = 4'd0;

		next_state = IDLE;
		next_out_valid = 1'b0;
		for(i=0; i<5; i=i+1) begin
			for(j=0; j<5; j=j+1) begin
				next_FC[i][j] = FC[i][j];
			end
		end


		case (state)
			IDLE: begin
				next_fc_i = 8'd0;
				next_fc_j = 8'd0;
				next_pixel_i = 8'd0;
				next_pixel_j = 8'd0;
				next_padded_i = -2;
				next_padded_j = -2;
				next_ibound = -2;
				next_jbound = -2;

				next_calc_count = 5'd0;
				next_outPixel = 10'd0;
				next_pixel_count = 16'd0;
				next_addr = 16'd0;	
				next_temp_pixel = $signed(0);
				next_temp_fc = 4'd0;

				next_out_valid = 1'b0;
				for(i=0; i<5; i=i+1) begin
					for(j=0; j<5; j=j+1) begin
						next_FC[i][j] = FC[i][j];
					end
				end


				if(START) begin
					next_state = READfc;
				end else begin
					next_state = IDLE;
				end
			end
			READfc: begin
				next_pixel_i = 8'd0;
				next_pixel_j = 8'd0;
				next_padded_i = -2;
				next_padded_j = -2;
				next_ibound = -2;
				next_jbound = -2;

				next_calc_count = 5'd0;
				next_outPixel = 10'd0;
				next_pixel_count = 16'd0;
				next_addr = 16'd0;	
				next_temp_pixel = $signed(0);

				next_out_valid = 1'b0;
				for(i=0; i<5; i=i+1) begin
					for(j=0; j<5; j=j+1) begin
						if(i==fc_i && j==fc_j)begin
							next_FC[i][j] = temp_fc;
						end else begin
							next_FC[i][j] = FC[i][j];
						end
					end
				end

				if(FC_valid && START) begin
					if( fc_i >= 3'd4 && fc_j >= 3'd4 ) begin
						next_fc_i = 3'd0;
						next_fc_j = 3'd0;
					end else if( fc_j >= 3'd4 ) begin
						next_fc_i = fc_i + 3'd1;
						next_fc_j = 3'd0;
					end else begin
						next_fc_i = fc_i;
						next_fc_j = fc_j + 3'd1;
					end
					next_state = READfc;
					next_temp_fc = fc;
				end else begin
					next_fc_i = 3'd0;
					next_fc_j = 3'd0;
					next_temp_fc = 4'd0;
					next_state = CALC;
				end
			end
			CALC: begin
				next_addr = addr;	
				next_temp_fc = 4'd0;
				next_out_valid = 1'b0;
				for(i=0; i<5; i=i+1) begin
					for(j=0; j<5; j=j+1) begin
						next_FC[i][j] = FC[i][j];
					end
				end

				next_fc_i = fc_i;
				next_fc_j = fc_j;
				next_pixel_i = pixel_i;
				next_pixel_j = pixel_j;
				next_padded_i = padded_i;
				next_padded_j = padded_j;
				next_ibound = ibound;
				next_jbound = jbound;
				
				next_outPixel = 8'd0;
				next_pixel_count = pixel_count;

				next_calc_count = calc_count + 5'd1;
				next_state = CALC;
				next_temp_pixel = $signed(0);

				// calculate address
				if(padded_i<$signed(0) || padded_j<$signed(0) || padded_i>$signed(255) || padded_j>$signed(255)) begin
					next_addr = 15'd0;
				end else begin
					next_addr = (padded_i << 8 ) + padded_j;
				end
				//upadate padded pixel coordinate
				if( padded_i >= $signed(pixel_i + 10'd2) && padded_j >= $signed(pixel_j + 10'd2) ) begin
					next_padded_i = padded_i;
					next_padded_j = padded_j;
				end else if( padded_j >= $signed(pixel_j + 10'd2) ) begin
					next_padded_i = padded_i + 8'd1;
					next_padded_j = pixel_j - $signed(10'd2);
				end else begin
					next_padded_i = padded_i;
					next_padded_j = padded_j + $signed(10'd1);
				end
				
				// convulution
				if(calc_count < 5'd2) begin
					next_temp_pixel = $signed(0);
					next_ibound = ibound;
					next_jbound = jbound;
				end else begin

					//padded
					if( ibound < $signed(0) || jbound < $signed(0) || ibound > $signed(255) || jbound > $signed(255)) begin
						next_temp_pixel = temp_pixel;
					end else begin
						next_temp_pixel = temp_pixel + calc_pixel * FC[fc_i][fc_j];
					end
					
					if( ibound >= $signed(pixel_i + 2) && jbound >= $signed(pixel_j + 2) ) begin
						next_ibound = ibound;
						next_jbound = jbound;
					end else if( jbound >= $signed(pixel_j + 2) ) begin
						next_ibound = ibound + $signed(10'd1);
						next_jbound = pixel_j - $signed(10'd2);
					end else begin
						next_ibound = ibound;
						next_jbound = jbound + $signed(10'd1);
					end

					//upadate FC coordinate
					if( fc_i >= 3'd4 && fc_j >= 3'd4 ) begin
						next_fc_i = 3'd0;
						next_fc_j = 3'd0;
						next_state = OUTPUT;
					end else if( fc_j >= 3'd4 ) begin
						next_fc_i = fc_i + 3'd1;
						next_fc_j = 3'd0;
					end else begin
						next_fc_i = fc_i;
						next_fc_j = fc_j + 3'd1;
					end
				end

				// $write("Padded [%3d][%3d]  ||  ", padded_i, padded_j);
				// $write("Filter [%d][%d] = %2d  [%3d][%3d]  ||  ", fc_i, fc_j, FC[fc_i][fc_j], ibound, jbound);
				// $write("Address = %6d  ||  calc pixel = %3d  ||  Temp pixel = %5d\n", addr, calc_pixel, temp_pixel);
				
			end
			WAIT: begin
				next_out_valid = 1'b1;
				next_calc_count = 5'd0;
				next_addr = 16'd0;	
				next_temp_fc = 4'd0;
				for(i=0; i<5; i=i+1) begin
					for(j=0; j<5; j=j+1) begin
						next_FC[i][j] = FC[i][j];
					end
				end
				next_temp_pixel = temp_pixel;
				next_outPixel = out_pixel;
				next_pixel_count = pixel_count + 16'd1;

				next_fc_i = 3'd0;
				next_fc_j = 3'd0;
				next_pixel_i = pixel_i;
				next_pixel_j = pixel_j;
				next_padded_i = padded_i;
				next_padded_j = padded_j;
				next_ibound = ibound;
				next_jbound = jbound;

				next_state = CALC;
			end

			OUTPUT: begin

				next_calc_count = 5'd0;
				next_addr = 16'd0;	
				next_temp_fc = 4'd0;
				for(i=0; i<5; i=i+1) begin
					for(j=0; j<5; j=j+1) begin
						next_FC[i][j] = FC[i][j];
					end
				end

				next_fc_i = 3'd0;
				next_fc_j = 3'd0;

				next_temp_pixel = temp_pixel;
				next_outPixel = out_pixel;
				next_pixel_count = pixel_count + 16'd1;

				if(pixel_count > PIXELCOUNT) begin
					next_out_valid = 1'b0;
					next_state = IDLE;
				end else begin
					next_out_valid = 1'b0;
					next_state = WAIT;
					//change the value less than 0 to 0
					//change the value greater than 255 to 255
					if(temp_pixel > $signed(255))begin
						next_outPixel = 255;
					end else if(temp_pixel < $signed(0))begin
						next_outPixel = 0;
					end else begin
						next_outPixel = temp_pixel;
					end

					if( pixel_i >= 8'd255 && pixel_j >= 8'd255 ) begin
						next_pixel_i = 8'd0;
						next_pixel_j = 8'd0;
						next_padded_i = -2;
						next_padded_j = -2;
						next_ibound = -2;
						next_jbound = -2;
					end else if( pixel_j >= 8'd255 ) begin
						next_pixel_i = pixel_i + 8'd1;
						next_pixel_j = 8'd0;
						next_padded_i = pixel_i + 8'd1 - 2;
						next_padded_j = -2;
						next_ibound = pixel_i + 8'd1 - 2;
						next_jbound = -2;
					end else begin
						next_pixel_i = pixel_i;
						next_pixel_j = pixel_j + 8'd1;
						next_padded_i = pixel_i - 2;
						next_padded_j = pixel_j + 8'd1 - 2;
						next_ibound = pixel_i - 2;
						next_jbound = pixel_j + 8'd1 - 2;
					end
					

					
					// $write("===== Padded [%3d][%3d]  ||  Calculate [%3d][%3d]  ||  pixel count = %5d  ||  Out pixel = %3d =====\n", padded_i, padded_j, pixel_i, pixel_j, pixel_count, out_pixel);
				end
			end
		endcase
	end






endmodule
