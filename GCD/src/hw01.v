module GCD (
	input wire CLK,
	input wire RST_N,
	input wire [7:0] A,
	input wire [7:0] B,
	input wire START,
	output reg [7:0] Y,
	output reg DONE,
	output reg ERROR
);
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	reg [1:0] state, next_state;

	reg found, next_found;
	reg next_error;
	reg next_done;
	reg [7:0] a, b;
	reg [7:0] next_a, next_b;
	reg [7:0] diff, next_diff;
	reg [7:0] next_Y;


	always @( posedge CLK, negedge RST_N ) begin
		if( !RST_N ) begin
			DONE <= 1'b0;
			ERROR <= 1'b0;
			next_state <= S0;
		end else begin
			state <= next_state;
			ERROR <= next_error;
			DONE <= next_done;
			diff <= next_diff;
			found <= next_found;
			a <= next_a;
			b <= next_b;
			Y <= next_Y;
		end
	end

	always @(*) begin
		case(state)
			//IDLE
			S0: begin
				next_done = 1'b0;
				next_found = 1'b0;
				next_Y = 8'd0;
				if(START) begin
					{next_a, next_b} = {A, B};
					next_state = S1;
					next_error = (A==0 || B==0);
					next_state = S1;
					next_diff = A;		
				end else begin
					next_state = S0;
					next_error = 1'b0;
					next_diff = 8'd0;
					next_a = 8'd0;
					next_b = 8'd0;
				end
			end
			//CALC
			S1: begin
				next_a = diff;
				next_b = b;
				
				if(ERROR) begin
					next_error = 1'b1;
					next_diff = 8'b0;
					next_state = S2;
					next_done = 1'b1;
					next_found = 1'b1;
				end else if(found) begin
					next_error = 1'b0;
					next_diff = a;
					next_state = S2;
					next_found = 1'b1;
					next_done = 1'b1;
					next_Y = diff;
				end else if(b>a) begin
					{next_b, next_a} = {a, b};
					next_diff = b-a;
					next_state = S1;
					next_error = 1'b0;
					next_done = 1'b0;
					next_found = 1'b0;
				end else if(b<a) begin
					next_diff = a-b;
					next_state = S1;
					next_error = 1'b0;
					next_done = 1'b0;
					next_found = 1'b0;
				end else begin
					next_error = 1'b0;
					next_done = 1'b0;
					next_diff = a;
					next_state = S1;
					next_found = 1'b1;
				end
			end
			//FINISH
			S2: begin
				next_state = S0;
				next_Y = 0;
				next_done = 1'b0;
				next_error = 1'b0;
			end
		endcase
	end
endmodule