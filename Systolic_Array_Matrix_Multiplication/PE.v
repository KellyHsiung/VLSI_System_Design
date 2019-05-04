module PE (
	input wire clk,
	input wire rst_n,
    input wire START,
	input wire [7:0] A,
    input wire [7:0] B,
    output reg [7:0] Aout,
    output reg [7:0] Bout,
	output reg [7:0] Cout,
	output reg DONE
);
	
	parameter IDLE   = 2'b00;
	parameter READ   = 2'b01;
	parameter CALC   = 2'b10;
	parameter FINISH = 2'b11;


    reg start, next_DONE;
    reg [1:0] state, next_state;
    reg [2:0] count, next_count;
    reg [7:0] a, next_a;
    reg [7:0] b, next_b;
    reg [7:0] c, next_c;
    reg [7:0] next_Cout;
    reg [7:0] triggerCount, next_triggerCount;


	always @(posedge clk) begin

		if( !rst_n ) begin
            start = 1'd0;
            DONE  = 1'd0;
            state = IDLE;
            count = 3'd0;
			a     = 8'd0;
            b     = 8'd0;
            c     = 8'd0;
            Cout  = 8'd0;
            Aout  = 8'd0;
            Bout  = 8'd0;
            triggerCount = 8'd0;
		end else begin
			start = START;
            DONE  = next_DONE;
            state = next_state;
            count = next_count;
            // a     = next_a;
            // b     = next_b;
            a     = A;
            b     = B;
            c     = next_c;
            Cout  = next_Cout;
            Aout  = A;
            Bout  = B;
            triggerCount = next_triggerCount;
		end
	end



	always @(*) begin
        next_DONE  = 1'd0;
        next_state = IDLE;
        next_count = 3'd0;
        next_Cout  = Cout;
        next_c     = 8'd0;
        next_triggerCount = triggerCount;

		case (state)

			IDLE: begin
                if(start) begin
                    next_state = CALC;
                    next_triggerCount = triggerCount;
                end else begin
                    next_state = IDLE;
                    next_triggerCount = 8'd0;
                end
            end

            CALC: begin
                if(triggerCount == 8'd128 ) begin
                    next_state = FINISH;
                    next_triggerCount = triggerCount;
                end else if(count < 4) begin
                    next_DONE = 1'd0;
                    next_c    = c + a * b;
                    next_state = CALC;
                    next_count = count + 1;
                    next_triggerCount = triggerCount;
                end else begin
                    next_DONE = 1'd1;
                    next_Cout = c;
                    next_c    = a * b;
                    next_count = 3'd1;
                    next_state = CALC;
                    next_triggerCount = triggerCount + 1;
                end
            end

            FINISH: begin
                next_DONE = 1'd0;
                next_Cout = 8'd0;
                next_c    = 8'd0;
                next_count = 3'd0;
                next_state = IDLE;
                next_triggerCount = triggerCount;
            end
		endcase
	end

endmodule