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
	parameter IDLE   = 3'b000;
	parameter IDLE2  = 3'b001;
	parameter CALC   = 3'b010;
	parameter FINISH = 3'b011;
	parameter FINISH2= 3'b100;
	reg [2:0] state, next_state;

	reg start, next_start, next_DONE, next_ERROR;
	reg[7:0]  A_hi, B_hi, temp_A_hi, temp_B_hi, next_A_hi, next_B_hi, next_Y;
	reg[15:0] A_all, B_all, diff, next_A_all, next_B_all, next_diff;


	always @( posedge CLK, negedge RST_N ) begin
		if( !RST_N ) begin
			start     <= 1'b0;
			state     <= IDLE;
			DONE      <=  1'b0;
			ERROR     <=  1'b0;
			A_hi      <=  8'd0;
			B_hi      <=  8'd0;
			A_all     <=  8'd0;
			B_all     <=  8'd0;
			diff      <= 16'd0;
			Y         <= 8'd0;
			temp_A_hi <= 8'd0;
			temp_B_hi <= 8'd0;
			
		end else begin
			start     <= START;
			state     <= next_state;
			DONE      <= next_DONE;
			ERROR     <= next_ERROR;
			A_hi      <= A;
			B_hi      <= B;
			A_all     <= next_A_all;
			B_all     <= next_B_all;
			diff      <= next_diff;
			Y         <= next_Y;
			temp_A_hi <= next_A_hi;
			temp_B_hi <= next_B_hi;
			
		end
	end

	always @(*) begin
		next_state =  IDLE;
		next_DONE  =  1'b1;
		next_ERROR =  1'b0;
		next_A_hi  =  8'd0;
		next_B_hi  =  8'd0;
		next_A_all = 16'd0;
		next_B_all = 16'd0;
		next_diff  = 16'd0;
		next_Y     =  8'd0;
		
		case(state)
			IDLE: begin
				next_DONE  =  1'b0;
				next_ERROR =  1'b0;
				next_A_all = 16'd0;
				next_B_all = 16'd0;
				next_diff  = 16'd0;
				next_Y     =  8'd0;
				if(start) begin
					next_state = IDLE2;
					next_A_hi  = A_hi;
					next_B_hi  = B_hi;
				end else begin
					next_state = IDLE;
					next_A_hi  = 8'd0;
					next_B_hi  = 8'd0;
				end
			end
			IDLE2: begin
				next_DONE = 1'b0;
				next_A_hi = A_hi;
				next_B_hi = B_hi;
				next_diff = 16'd0;
				next_Y    = 8'd0;
				if(start) begin
					next_state = IDLE2;
					next_ERROR = 1'b0;
					next_A_all = {temp_A_hi, A_hi};
					next_B_all = {temp_B_hi, B_hi};
				end else begin
					next_state = CALC;
					next_ERROR = (A_all==0 || B_all==0); 
					next_A_all = A_all;
					next_B_all = B_all;
				end
			end
			CALC: begin
				next_DONE  =  1'b0;
				next_ERROR = ERROR;
				next_A_hi  =  8'd0;
				next_B_hi  =  8'd0;
				next_Y     =  8'd0;
				if(ERROR) begin
					next_state = FINISH;
					next_A_all = A_all;
					next_B_all = B_all;
					next_diff  = 16'd0;
				end else if(A_all > B_all) begin
					next_state = CALC;
					next_A_all = A_all - B_all;
					next_B_all = B_all;
					next_diff  = A_all - B_all;
				end else if(A_all < B_all) begin
					next_state = CALC;
					next_A_all = B_all - A_all;
					next_B_all = A_all;
					next_diff  = B_all - A_all;
				end else begin
					next_state = FINISH;
					next_A_all = A_all;
					next_B_all = B_all;
					next_diff  = A_all;
				end
			end
			FINISH: begin
				next_state = FINISH2;
				next_DONE  = 1'b1;
				next_ERROR = ERROR;
				next_A_hi  = A_hi;
				next_B_hi  = B_hi;
				next_A_all = A_all;
				next_B_all = B_all;
				next_diff  = diff;
				next_Y     = diff[15:8];
			end
			FINISH2: begin
				next_state =  IDLE;
				next_DONE  =  DONE;
				next_ERROR = ERROR;
				next_A_hi  =  A_hi;
				next_B_hi  =  B_hi;
				next_A_all = A_all;
				next_B_all = B_all;
				next_diff  =  diff;
				next_Y     = diff[7:0];
			end
		endcase
	end

endmodule