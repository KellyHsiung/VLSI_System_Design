`define MAX_BIT 2048
`define MAX_BIT1 2049
`define MAX_BIT_BIT 12


module RL (
	input wire clk,
	input wire rst_n,
    input wire START,
    input wire MODE,
	input wire [`MAX_BIT-1: 0] Message,
    input wire [`MAX_BIT-1: 0] PublicE,
    input wire [`MAX_BIT-1: 0] KeyN,
    input wire [31:0] Q,
    output reg [`MAX_BIT-1: 0] RESULT,         //change
	output reg OE_N,
    output reg EN,
    output reg WEN,
    output reg [7:0] ADDR

);
	
	parameter IDLE    = 4'b0000;
    parameter READ    = 4'b0001;
    parameter R2MODN  = 4'b0010;
    parameter CALCME  = 4'b0011;
	parameter WAITCR  = 4'b0100;
    parameter WAITPR  = 4'b0101;
    parameter WAITCPR = 4'b0110;
    parameter WAITCP  = 4'b0111;
    parameter P2MODN  = 4'b1000;
	parameter CALCME2 = 4'b1001;
    parameter CALCMM  = 4'b1010;
    parameter WAIT    = 4'b1011;
    parameter FINISH  = 4'b1100;

    parameter R = {1'b1, `MAX_BIT'd0};
    parameter H = `MAX_BIT'd`MAX_BIT - `MAX_BIT'd1;
    parameter ReadData = 8'd63;
    parameter Omega = 13'd4096;




    reg start, Mode, next_OE_N;
    reg mode, next_mode;
    reg [3:0] state, next_state;
    reg [`MAX_BIT-1:0] message, publicE, keyN;
    reg [`MAX_BIT-1:0] M, E, N, next_M, next_E, next_N;
    reg [`MAX_BIT-1:0] C, P, next_C, next_P;
    reg [`MAX_BIT-1:0] next_RESULT;          //change
    
    reg [1:0] calc, next_calc;
    reg [`MAX_BIT1-1: 0] countR, next_countR;
    reg [`MAX_BIT1: 0] R2, next_R2;
    reg [`MAX_BIT1-1: 0] countP, next_countP;
    reg [`MAX_BIT1: 0] P2, next_P2;

    // for sram
    reg next_EN, next_WEN;
    reg [7:0] next_ADDR;
    reg [31:0] QQ, q, next_q;
    reg [`MAX_BIT-1:0] temp, next_temp;


    // for montgomery 
    wire Trigger, Done;
    wire [`MAX_BIT-1:0] X, Y, OO;

    reg trigger, next_trigger;
    reg done, next_done;
    reg [`MAX_BIT-1:0] O, x, y, next_x, next_y;
    reg [`MAX_BIT-1:0] CR, PR, CPR, CP, next_CR, next_PR, next_CPR, next_CP;

    Montgomery m ( .clk(clk), .rst_n(rst_n), .START(Trigger), .X(X), .Y(Y),  .N(N), .O(OO),  .DONE(Done) );


    assign Trigger = trigger;
    assign X = x;
    assign Y = y;

	always @(posedge clk) begin

		if( !rst_n ) begin
            start = 1'd0;
            Mode  = 1'd0;
            mode  = 1'd0;
            OE_N  = 1'd1;
            state = IDLE;
            calc = 2'd0;
			temp    = `MAX_BIT'd0;
            RESULT  = `MAX_BIT'd0;         //change
            message = `MAX_BIT'd0;
            publicE = `MAX_BIT'd0;
            keyN    = `MAX_BIT'd0;
            M = `MAX_BIT'd0;
            E = `MAX_BIT'd0;
            N = `MAX_BIT'd0;
            C = `MAX_BIT'd0;
            P = `MAX_BIT'd0;
            P2 = `MAX_BIT'd0;
            R2 = `MAX_BIT1'd0;
            countR = `MAX_BIT1'd0;
            countP = `MAX_BIT1'd0;

            x = `MAX_BIT'd0;
            y = `MAX_BIT'd0;
            CR = `MAX_BIT'd0;
            PR = `MAX_BIT'd0;
            CPR = `MAX_BIT'd0;
            CP = `MAX_BIT'd0;
            O = `MAX_BIT'd0;
            trigger = 1'd0;

            EN = 1'd0;
            WEN = 1'd1;
            ADDR = 8'd0;
            QQ = 32'd0;
            q = 32'd0;
            temp = `MAX_BIT'd0;
		end else begin
			start = START;
            Mode  = MODE;
            mode  = next_mode;
            OE_N  = next_OE_N;
            state = next_state;
            calc = next_calc;
            message = Message;
            publicE = PublicE;
            keyN    = KeyN;
            M = next_M;
            E = next_E;
            N = next_N;
            C = next_C;
            P = next_P;
            P2 = next_P2;
            R2 = next_R2;
            countR = next_countR;
            countP = next_countP;
            RESULT = next_RESULT;

            done = Done;
            x = next_x;
            y = next_y;
            CR = next_CR;
            PR = next_PR;
            CPR = next_CPR;
            CP = next_CP;
            O = OO;
            trigger = next_trigger;

            EN = next_EN;
            WEN = next_WEN;
            ADDR = next_ADDR;
            QQ = Q;
            q = next_q;
            temp = next_temp;
		end
	end



	always @(*) begin
        next_OE_N   = 1'd1;
        next_state  = IDLE;
        next_mode   = mode;
        next_calc   = calc;
        next_countR = countR;
        next_countP = countP;
        next_RESULT = RESULT;
        next_R2 = R2;
        next_P2 = P2;
        next_M = M;
        next_E = E;
        next_N = N;
        next_C = C;
        next_P = P;

        next_x = x;
        next_y = y;
        next_CR = CR;
        next_PR = PR;
        next_CPR = CPR;
        next_CP = CP;
        next_trigger = 1'b0;

        next_EN = 1'b0;
        next_WEN = 1'b1;
        next_ADDR = ADDR;
        next_q = q;
        next_temp = temp;

		case (state)

			IDLE: begin
                if(start && !Mode) begin
                    next_state = READ;
                    next_mode  = Mode;
                    next_M = message;
                    next_E = publicE;
                    next_N = keyN;
                    next_C = `MAX_BIT'd1;
                    next_P = message;
                    next_R2 = `MAX_BIT1'd1;
                    next_countR = `MAX_BIT1'd0;
                    next_countP = `MAX_BIT1'd1;
                    next_EN = 1'b1;
                    next_ADDR = 4'd0;
                    next_q = QQ;
                end else if(start && Mode) begin
                    next_state = READ;
                    next_mode  = Mode;
                    next_M = message;
                    next_E = publicE;
                    next_N = keyN;
                    next_C = message;
                    next_P = publicE;
                    next_R2 = `MAX_BIT1'd1;
                    next_countR = `MAX_BIT1'd0;
                    next_countP = `MAX_BIT1'd1;
                    next_EN = 1'b1;
                    next_ADDR = 4'd0;
                    next_q = QQ;
                end else begin
                    next_state = IDLE;
                end
            end
            READ: begin
                next_EN = 1'b1;
                if(countR <= `MAX_BIT1'd2) begin
                    next_state = READ;
                    next_EN = 1'b1;
                    next_countR = countR + `MAX_BIT1'd1;
                    next_countP = countP;
                    next_ADDR = ADDR + 8'd1;
                    next_q = QQ;
                    next_temp = QQ;
                    // $display("[%2d] %d %d -> %d",countP, EN, ADDR, q);
                end else if(countP <= ReadData) begin
                    next_state = READ;
                    next_ADDR = ADDR + 8'd1;
                    next_q = QQ;
                    next_temp = (temp << 6'd32) + QQ;
                    next_countP = countP + `MAX_BIT1'd1;
                    // $display("[%2d] %d %d -> %d %30d",countP, EN, ADDR, q, temp);
                    
                end else begin
                    // $display("Hi [%2d] %d %d -> %d %30d",countP, EN, ADDR, q, temp);
                    next_state = READ;
                    next_EN = 1'b1;
                    next_ADDR = ADDR + 8'd1;
                    next_countR = countR + `MAX_BIT1'd1;
                    next_countP = `MAX_BIT1'd1;
                    next_q = QQ;
                    next_temp = (temp << 6'd32) + QQ;
                    if(countR == `MAX_BIT1'd3) begin
                        next_M = temp;
                        next_P = temp;
                        next_temp = QQ;
                    end else if(countR == `MAX_BIT1'd4) begin
                        // $display("      M = %20d", M);
                        next_E = temp;
                        next_temp = QQ;
                    end else if(countR == `MAX_BIT1'd5) begin
                        // $display("      E = %20d", E);
                        next_N = temp;
                        next_temp = QQ;
                        next_EN = 1'b0;
                        next_countP = countP;
                        next_ADDR = ADDR;
                    end else if(countR == `MAX_BIT1'd6) begin
                        // $display("      N = %20d", N);
                        next_EN = 1'b0;
                        next_countP = countP;
                        next_ADDR = ADDR;
                    end else if(countR == `MAX_BIT1'd7) begin
                        next_state = R2MODN;
                        // next_state = WAIT;
                        next_ADDR = ADDR;
                        next_EN = 1'b0;
                        next_countR = `MAX_BIT1'd1;
                        next_countP = `MAX_BIT1'd1;
                    end
                end
            end
            // calculate R^2 mod N
            R2MODN: begin
                if(countR <= Omega) begin
                    if(R2 >= N) begin
                        next_R2 = R2 - N;
                        // $display("[%4d] R2 %10d",countR, R2);
                    end else begin
                        next_countR = countR + `MAX_BIT1'd1;
                        next_R2 = R2 + R2;
                        // $display("[%4d] R2 %10d",countR, R2);
                    end
                    next_state = R2MODN;
                end else begin
                    if(R2 >= N) begin
                        next_R2 = R2 - N;
                        // $display("[%4d] R2 %10d",countR, R2);
                        next_state = R2MODN;
                    end else begin
                        $display(">> R^2 (mod %10d) = %10d", N, R2);
                        next_countR = `MAX_BIT1'd0;
                        if(mode) begin
                            // $display("R2MODN2");
                            next_state = CALCMM;
                        end else begin
                            // $display("R2MODN1");
                            next_state = CALCME;
                        end
                    end
                end
            end

            CALCME: begin
                if(countR <= H) begin
                    // calc CR mod N
                    if( E[countR] ) begin
                        next_x = C;
                        next_y = R2;
                        next_trigger = 1'b1;
                        next_state = WAITCR;
                        next_calc = 2'd0;
                    end else begin
                        next_P2 = P;
                        next_countP = `MAX_BIT1'd1;
                        next_state = P2MODN;
                    end
                    next_countR = countR + `MAX_BIT1'd1;
                end else begin 
                    next_state = CALCME2;
                end
            end

            CALCMM: begin
                next_x = C;
                next_y = R2;
                next_trigger = 1'b1;
                next_state = WAITCR;
                next_calc = 2'd3;
            end

            WAITCR: begin
                if( done ) begin
                    next_CR = O;
                    next_x = P;
                    next_y = R2;
                    next_trigger = 1'b1;
                    next_state = WAITPR; // calc PR mod N
                    // $display("[CR] %d x %d (mod %d) = %d",C, R, N, O);
                end else begin
                    next_trigger = 1'b0;
                    next_state = WAITCR;
                end
            end
            WAITPR: begin
                if( done ) begin
                    next_PR = O;
                    next_x = CR;
                    next_y = O;
                    next_trigger = 1'b1;
                    next_state = WAITCPR; // calc CPR mod N
                    // $display("[PR] %d x %d (mod %d) = %d",P, R, N, O);
                end else begin
                    next_trigger = 1'b0;
                    next_state = WAITPR;
                end
            end
            WAITCPR: begin
                if( done ) begin
                    next_CPR = O;
                    next_x = O;
                    next_y = `MAX_BIT'd1;
                    next_trigger = 1'b1;
                    next_state = WAITCP; // calc CP mod N
                    // $display("[CPR] %d x %d (mod %d) = %d",CR, PR, N, O);
                end else begin
                    next_trigger = 1'b0;
                    next_state = WAITCPR;
                end
            end
            WAITCP: begin
                if( done ) begin
                    if(calc == 2'd0) begin
                        next_CP = O;
                        next_C = O;
                        // $display("[CP] %d x %d (mod %d) = %d",C, P, N, O);
                        // next_countP = `MAX_BIT1'd1;
                        next_state = P2MODN;
                    end else if(calc == 2'd1)  begin
                        next_CP = O;
                        next_C = O;
                        // $display("[CP] %d x %d (mod %d) = %d",C, P, N, O);
                        // next_countP = `MAX_BIT1'd1;
                        next_state = WAIT;
                    end else if(calc == 2'd2) begin
                        next_P = O;
                        // $display("[PP] %d x %d (mod %d) = %d",P, P, N, O);
                        next_state = CALCME;
                    end else if(calc == 2'd3) begin
                        next_CP = O;
                        next_C = O;
                        // $display("[CP] %d x %d (mod %d) = %d",C, P, N, O);
                        next_state = WAIT;
                        next_countR = `MAX_BIT1'd0;
                        next_countP = `MAX_BIT1'd1;
                    end
                end else begin
                    next_state = WAITCP;
                end
            end

            P2MODN: begin
                next_x = P;
                next_y = R2;
                next_trigger = 1'b1;
                next_state = WAITCR;
                next_calc = 2'd2;
            end

            CALCME2: begin
                if(E[`MAX_BIT-1]) begin
                    next_x = C;
                    next_y = R2;
                    next_trigger = 1'b1;
                    next_state = WAITCR;
                    next_calc = 2'd1;
                end else begin
                    next_state = WAIT;
                    next_countR = `MAX_BIT1'd1;
                    next_countP = `MAX_BIT1'd1;
                end
            end

            WAIT: begin
                next_OE_N = 1'b0;
                next_WEN = 1'b0;
                next_EN = 1'b1;
                next_countP = `MAX_BIT_BIT'd1984;
                next_countR = `MAX_BIT1'd1;
                next_RESULT = C >> `MAX_BIT_BIT'd2016;
                next_state = FINISH;
                next_ADDR = 8'd192;
            end

            FINISH: begin
                next_WEN = 1'b0;
                next_EN = 1'b1;
                next_ADDR = ADDR + 8'd1;
                if(countR <= `MAX_BIT1'd2) begin
                    // $display("Mem[%d] %3d->%8d", ADDR, countP, RESULT);
                    next_OE_N = 1'b0;
                    next_countR = countR + `MAX_BIT1'd1;
                    next_countP = countP;
                    next_ADDR = ADDR;
                    next_RESULT = RESULT;
                    next_state = FINISH;
                end 
                else if(countP > `MAX_BIT_BIT'd0 && countP <= `MAX_BIT_BIT'd2016) begin
                    // $display("Mem[%d] %3d->%8d", ADDR, countP, RESULT);
                    next_OE_N = 1'b0;
                    next_countP = countP - `MAX_BIT_BIT'd32;
                    next_countR = `MAX_BIT1'd1;
                    next_RESULT = C >> countP;
                    next_state = FINISH;
                    next_countR = `MAX_BIT1'd1;

                end 
                else if(countP == `MAX_BIT_BIT'd0) begin
                    // $display("Mem[%d] %3d->%8d", ADDR, countP, RESULT);
                    next_OE_N = 1'b0;
                    next_countP = `MAX_BIT_BIT'd2048;
                    next_countR = `MAX_BIT1'd1;
                    next_RESULT = C >> countP;
                    next_state = FINISH;
                    next_countR = `MAX_BIT1'd1;

                end else begin
                    // $display("Mem[%d] %3d->%8d", ADDR, countP, RESULT);
                    // $display("[OUTPUT] %10d", C);

                    next_OE_N = 1'b1;
                    next_countP = `MAX_BIT_BIT'd1;
                    next_countR = `MAX_BIT1'd1;
                    next_RESULT = C >> countP;
                    next_state = IDLE;
                end
                
            end
		endcase
	end

endmodule