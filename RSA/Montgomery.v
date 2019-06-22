`define MAX_BIT 2048
`define MAX_BIT1 2049
`define MAX_BIT_BIT 12
// `define MAX_BIT 32
// `define MAX_BIT_BIT 6

module Montgomery (
	input wire clk,
	input wire rst_n,
    input wire START,
	input wire [`MAX_BIT-1: 0] X,
    input wire [`MAX_BIT-1: 0] Y,
    input wire [`MAX_BIT-1: 0] N,
    output reg [`MAX_BIT-1: 0] O,
	output reg DONE
);

    parameter IDLE = 2'b00;
    parameter CALC = 2'b01;
    parameter CHECK = 2'b10;
    parameter FINISH = 2'b11;

	reg start, next_DONE;
    reg [1:0] state, next_state;
    reg [`MAX_BIT-1: 0] x, y, n;
    reg [`MAX_BIT-1: 0] next_x, next_y, next_n;
    reg [`MAX_BIT-1: 0] temp_x, temp_y, temp_n;
    reg [`MAX_BIT-1: 0] A, next_A;
    reg [`MAX_BIT-1: 0] next_O;
    reg [`MAX_BIT: 0] temp_AY;
    reg [`MAX_BIT_BIT-1: 0] k, next_k;

	always @(posedge clk) begin

		if( !rst_n ) begin
            x = `MAX_BIT'd0;
            y = `MAX_BIT'd0;
            n = `MAX_BIT'd0;
            O = `MAX_BIT'd0;
            A = `MAX_BIT'd0;
            k = `MAX_BIT_BIT'd0;
            temp_x = `MAX_BIT'd0;
            temp_y = `MAX_BIT'd0;
            temp_n = `MAX_BIT'd0;
            DONE = 1'b0;
            start = 1'b0;
            state = IDLE;
		end else begin
			temp_x = X;
            temp_y = Y;
            temp_n = N;
            x = next_x;
            y = next_y;
            n = next_n;
            O = next_O;
            A = next_A;
            k = next_k;
            DONE = next_DONE;
            start = START;
            state = next_state;
		end
	end



	always @(*) begin
        next_x = x;
        next_y = y;
        next_n = n;
        next_O = O;
        next_A = A;
        next_k = k;
        next_DONE = 1'b0;
        next_state = IDLE;

        case (state)
            IDLE: begin
                if(start)begin
                    next_state = CALC;
                    next_x = temp_x;
                    next_y = temp_y;
                    next_n = temp_n;
                    next_O = `MAX_BIT'd0;
                    next_A = `MAX_BIT'd0;
                    next_k = `MAX_BIT_BIT'd0;
                end else begin
                    next_state = IDLE;
                end
            end 

            CALC: begin
                if(k == `MAX_BIT) begin
                    next_k = `MAX_BIT_BIT'd0;
                    next_state = CHECK;
                end else begin
                    next_k = k + `MAX_BIT_BIT'd1;
                    next_state = CALC;
                    if( x[k] ) begin
                        temp_AY = A + Y;
                        if( temp_AY[0] )begin
                            next_A = (A + Y + N) >> 1'b1;
                        end else begin
                            next_A = (A + Y) >> 1'b1;
                        end
                    end else begin
                        if( A[0] )begin
                            next_A = (A + N) >> 1'b1;
                        end else begin
                            next_A = A >> 1'b1;
                        end
                        // temp_AY = A;
                        // if( temp_AY[0] )begin
                        //     next_A = (A + N) >> 1'b1;
                        // end else begin
                        //     next_A = (A) >> 1'b1;
                        // end
                    end
                end
            end 

            CHECK: begin
                // if( A == 0) begin
                // end else 
                if(A > n)begin
                    next_O = A - n;
                end else begin
                    next_O = A;
                end
                next_state = FINISH;
                next_DONE = 1'd1;
            end 

            FINISH: begin
                next_DONE = 1'd0;
                next_state = IDLE;
            end 

        endcase
	end

endmodule