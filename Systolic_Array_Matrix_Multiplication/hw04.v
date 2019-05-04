module TOP_PE (
	input wire clk,
	input wire rst_n,
	input wire START,
	input wire [31:0] AIN,
	input wire [31:0] BIN,
	output reg [43:0] addrA,
	output reg [43:0] addrB,
	output reg [43:0] addrC,
	output reg [3:0] wenC,
	// output reg [31:0] en,
	output reg [31:0] COUT,
	output reg FINISH
);
	wire [31:0] Ain, Bin;
	wire [7:0] Aout [4:0][4:0];
	wire [7:0] Bout [4:0][4:0];
	wire [7:0] Cout [4:0][4:0];
	wire [15:0] DONE;
	wire Trigger [4:0][4:0];

	PE pe11( .clk(clk), .rst_n(rst_n), .START(Trigger[1][1]), .A(Ain[7:0]),   .B(Bin[7:0]),   .Aout(Aout[1][1]), .Bout(Bout[1][1]), .Cout(Cout[1][1]), .DONE(DONE[15]) );
	PE pe12( .clk(clk), .rst_n(rst_n), .START(Trigger[1][2]), .A(Ain[15:8]),  .B(Bout[1][1]), .Aout(Aout[1][2]), .Bout(Bout[1][2]), .Cout(Cout[1][2]), .DONE(DONE[14]) );
	PE pe13( .clk(clk), .rst_n(rst_n), .START(Trigger[1][3]), .A(Ain[23:16]), .B(Bout[1][2]), .Aout(Aout[1][3]), .Bout(Bout[1][3]), .Cout(Cout[1][3]), .DONE(DONE[13]) );
	PE pe14( .clk(clk), .rst_n(rst_n), .START(Trigger[1][4]), .A(Ain[31:24]), .B(Bout[1][3]), .Aout(Aout[1][4]), .Bout(Bout[1][4]), .Cout(Cout[1][4]), .DONE(DONE[12]) );
	
	PE pe21( .clk(clk), .rst_n(rst_n), .START(Trigger[2][1]), .A(Aout[1][1]), .B(Bin[15:8]),  .Aout(Aout[2][1]), .Bout(Bout[2][1]), .Cout(Cout[2][1]), .DONE(DONE[11]) );
	PE pe22( .clk(clk), .rst_n(rst_n), .START(Trigger[2][2]), .A(Aout[1][2]), .B(Bout[2][1]), .Aout(Aout[2][2]), .Bout(Bout[2][2]), .Cout(Cout[2][2]), .DONE(DONE[10]) );
	PE pe23( .clk(clk), .rst_n(rst_n), .START(Trigger[2][3]), .A(Aout[1][3]), .B(Bout[2][2]), .Aout(Aout[2][3]), .Bout(Bout[2][3]), .Cout(Cout[2][3]), .DONE(DONE[9]) );
	PE pe24( .clk(clk), .rst_n(rst_n), .START(Trigger[2][4]), .A(Aout[1][4]), .B(Bout[2][3]), .Aout(Aout[2][4]), .Bout(Bout[2][4]), .Cout(Cout[2][4]), .DONE(DONE[8]) );
	
	PE pe31( .clk(clk), .rst_n(rst_n), .START(Trigger[3][1]), .A(Aout[2][1]), .B(Bin[23:16]), .Aout(Aout[3][1]), .Bout(Bout[3][1]), .Cout(Cout[3][1]), .DONE(DONE[7])  );
	PE pe32( .clk(clk), .rst_n(rst_n), .START(Trigger[3][2]), .A(Aout[2][2]), .B(Bout[3][1]), .Aout(Aout[3][2]), .Bout(Bout[3][2]), .Cout(Cout[3][2]), .DONE(DONE[6])  );
	PE pe33( .clk(clk), .rst_n(rst_n), .START(Trigger[3][3]), .A(Aout[2][3]), .B(Bout[3][2]), .Aout(Aout[3][3]), .Bout(Bout[3][3]), .Cout(Cout[3][3]), .DONE(DONE[5]) );
	PE pe34( .clk(clk), .rst_n(rst_n), .START(Trigger[3][4]), .A(Aout[2][4]), .B(Bout[3][3]), .Aout(Aout[3][4]), .Bout(Bout[3][4]), .Cout(Cout[3][4]), .DONE(DONE[4]) );
	
	PE pe41( .clk(clk), .rst_n(rst_n), .START(Trigger[4][1]), .A(Aout[3][1]), .B(Bin[31:24]), .Aout(Aout[4][1]), .Bout(Bout[4][1]), .Cout(Cout[4][1]), .DONE(DONE[3]) );
	PE pe42( .clk(clk), .rst_n(rst_n), .START(Trigger[4][2]), .A(Aout[3][2]), .B(Bout[4][1]), .Aout(Aout[4][2]), .Bout(Bout[4][2]), .Cout(Cout[4][2]), .DONE(DONE[2]) );
	PE pe43( .clk(clk), .rst_n(rst_n), .START(Trigger[4][3]), .A(Aout[3][3]), .B(Bout[4][2]), .Aout(Aout[4][3]), .Bout(Bout[4][3]), .Cout(Cout[4][3]), .DONE(DONE[1]) );
	PE pe44( .clk(clk), .rst_n(rst_n), .START(Trigger[4][4]), .A(Aout[3][4]), .B(Bout[4][3]), .Aout(Aout[4][4]), .Bout(Bout[4][4]), .Cout(Cout[4][4]), .DONE(DONE[0]) );



	parameter IDLE   	 = 3'b000;
	parameter READtoSRAM = 3'b001;
	parameter TRIGGER    = 3'b010;
	parameter CALC   	 = 3'b011;
	parameter OUTPUT 	 = 3'b100;
	
	parameter A_ADD = 11'd1;
	parameter B_ADD = 11'd4;
	parameter A_ADD_MATRIX = 11'd13;
	parameter B_ADD_MATRIX = 11'd4;

	integer i, j;

	reg [15:0] done;
	reg trigger [4:0][4:0];
	reg next_trigger [4:0][4:0];
	reg start;
	reg [2:0] state, next_state;

	reg [1:0] inCount, next_inCount;
	reg [3:0] triggerCount, next_triggerCount;
	reg [7:0] cout [4:0][4:0];
	reg [31:0] ain, bin, next_ain, next_bin;
	
	reg next_FINISH;
	// reg [15:0] next_wenC;
	// reg [31:0] next_en;
	reg [1:0] ADDRACount[4:0], next_ADDRACount[4:0], ADDRBCount[4:0], next_ADDRBCount[4:0];
	reg [10:0] ADDRA[4:0], next_ADDRA[4:0], ADDRB[4:0], next_ADDRB[4:0];
	reg [43:0] next_addrA, next_addrB, next_addrC;
	reg [31:0] next_COUT;


	wire [15:0] done0 = {1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0};
	wire [15:0] done1 = {1'd1, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0};
	wire [15:0] done2 = {1'd0, 1'd1, 1'd0, 1'd0,
						 1'd1, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0};
	wire [15:0] done3 = {1'd0, 1'd0, 1'd1, 1'd0,
						 1'd0, 1'd1, 1'd0, 1'd0,
						 1'd1, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0};
	wire [15:0] done4 = {1'd0, 1'd0, 1'd0, 1'd1,
						 1'd0, 1'd0, 1'd1, 1'd0,
						 1'd0, 1'd1, 1'd0, 1'd0,
						 1'd1, 1'd0, 1'd0, 1'd0};
	wire [15:0] done5 = {1'd1, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd1,
						 1'd0, 1'd0, 1'd1, 1'd0,
						 1'd0, 1'd1, 1'd0, 1'd0};
	wire [15:0] done6 = {1'd0, 1'd1, 1'd0, 1'd0,
						 1'd1, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd1,
						 1'd0, 1'd0, 1'd1, 1'd0};
	wire [15:0] done7 = {1'd0, 1'd0, 1'd1, 1'd0,
						 1'd0, 1'd1, 1'd0, 1'd0,
						 1'd1, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd1};
	wire [15:0] done8 = {1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd1,
						 1'd0, 1'd0, 1'd1, 1'd0,
						 1'd0, 1'd1, 1'd0, 1'd0};
	wire [15:0] done9 = {1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd1,
						 1'd0, 1'd0, 1'd1, 1'd0};
	wire [15:0] done10 = {1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd0,
						 1'd0, 1'd0, 1'd0, 1'd1};


	genvar g_i, g_j;
	for(g_i = 0; g_i < 5; g_i = g_i + 1) begin
		for(g_j = 0; g_j < 5; g_j = g_j + 1) begin
			assign Trigger[g_i][g_j] = trigger[g_i][g_j];
		end
	end
	assign Ain = ain;
	assign Bin = bin;



	always @(posedge clk) begin
		if( !rst_n ) begin
			start   = 1'd0;
			FINISH  = 1'd0;
			wenC    = 4'd0;
			state   = IDLE;
			addrA   = { 11'd12, 11'd8, 11'd4, 11'd0 };
			addrB   = { 11'd3,  11'd2, 11'd1, 11'd0 };
			addrC   = 44'd0;
			ain		= 32'd0;
			bin		= 32'd0;
			inCount = 2'd0;
			done    = 16'd0;
			triggerCount = 4'd2;
			COUT = 32'd0;
			
			
			// en      = 32'd0;

			for(i = 0; i < 5; i = i + 1) begin
				ADDRA[i] = i * 4;
				ADDRB[i] = i;
				ADDRACount[i] = 2'd0;
				ADDRBCount[i] = 2'd0;
				for(j = 0; j < 5; j = j + 1) begin
					trigger[i][j] = 1'd0;
					cout[i][j]    = 8'd0;
				end
			end
		end else begin
			start 	= START;
			FINISH  = next_FINISH;
			state 	= next_state;
			addrA 	= next_addrA;
			addrB 	= next_addrB;
			ain		= next_ain;
			bin		= next_bin;
			inCount = next_inCount;
			done	= DONE;
			triggerCount = next_triggerCount;
			// en    	= next_en;

			for(i = 0; i < 5; i = i + 1) begin
				ADDRA[i] = next_ADDRA[i];
				ADDRB[i] = next_ADDRB[i];
				ADDRACount[i] = next_ADDRACount[i];
				ADDRBCount[i] = next_ADDRBCount[i];
				for(j = 0; j < 5; j = j + 1) begin
					trigger[i][j] = next_trigger[i][j];
					cout[i][j]    = Cout[i][j];
				end
			end

			COUT  = 32'd0;
			addrC = next_addrC;
			wenC  = 4'b1111;
			case (DONE)
					done0: begin
						COUT[7:0]   = 8'd0;
						COUT[15:8]  = 8'd0;
						COUT[23:16] = 8'd0;
						COUT[31:24] = 8'd0;
						wenC[0] = 1'd1; 
						wenC[1] = 1'd1;
						wenC[2] = 1'd1;
						wenC[3] = 1'd1;
					end
					done1: begin
						COUT[7:0]   = Cout[1][1];
						COUT[15:8]  = 8'd0;
						COUT[23:16] = 8'd0;
						COUT[31:24] = 8'd0;
						wenC[0] = 1'd0; 
						wenC[1] = 1'd1;
						wenC[2] = 1'd1;
						wenC[3] = 1'd1;
					end
					done2: begin
						COUT[7:0]   = Cout[2][1];
						COUT[15:8]  = Cout[1][2];
						COUT[23:16] = 8'd0;
						COUT[31:24] = 8'd0;
						wenC[0] = 1'd0; 
						wenC[1] = 1'd0;
						wenC[2] = 1'd1;
						wenC[3] = 1'd1;
					end
					done3: begin
						COUT[7:0]   = Cout[3][1];
						COUT[15:8]  = Cout[2][2];
						COUT[23:16] = Cout[1][3];
						COUT[31:24] = 8'd0;
						wenC[0] = 1'd0; 
						wenC[1] = 1'd0;
						wenC[2] = 1'd0;
						wenC[3] = 1'd1;
					end
					done4: begin
						COUT[7:0]   = Cout[4][1];
						COUT[15:8]  = Cout[3][2];
						COUT[23:16] = Cout[2][3];
						COUT[31:24] = Cout[1][4];
						wenC[0] = 1'd0; 
						wenC[1] = 1'd0;
						wenC[2] = 1'd0;
						wenC[3] = 1'd0;
					end
					done5: begin
						COUT[7:0]   = Cout[1][1];
						COUT[15:8]  = Cout[4][2];
						COUT[23:16] = Cout[3][3];
						COUT[31:24] = Cout[2][4];
						wenC[0] = 1'd0; 
						wenC[1] = 1'd0;
						wenC[2] = 1'd0;
						wenC[3] = 1'd0;
					end
					done6: begin
						COUT[7:0]   = Cout[2][1];
						COUT[15:8]  = Cout[1][2];
						COUT[23:16] = Cout[4][3];
						COUT[31:24] = Cout[3][4];
						wenC[0] = 1'd0; 
						wenC[1] = 1'd0;
						wenC[2] = 1'd0;
						wenC[3] = 1'd0;
					end
					done7: begin
						COUT[7:0]   = Cout[3][1];
						COUT[15:8]  = Cout[2][2];
						COUT[23:16] = Cout[1][3];
						COUT[31:24] = Cout[4][4];
						wenC[0] = 1'd0; 
						wenC[1] = 1'd0;
						wenC[2] = 1'd0;
						wenC[3] = 1'd0;
					end
					done8: begin
						COUT[7:0]   = 8'd0;
						COUT[15:8]  = Cout[4][2];
						COUT[23:16] = Cout[3][3];
						COUT[31:24] = Cout[2][4];
						wenC[0] = 1'd1; 
						wenC[1] = 1'd0;
						wenC[2] = 1'd0;
						wenC[3] = 1'd0;
					end
					done9: begin
						COUT[7:0]   = 8'd0;
						COUT[15:8]  = 8'd0;
						COUT[23:16] = Cout[4][3];
						COUT[31:24] = Cout[3][4];
						wenC[0] = 1'd1; 
						wenC[1] = 1'd1;
						wenC[2] = 1'd0;
						wenC[3] = 1'd0;
					end
					done10: begin
						COUT[7:0]   = 8'd0;
						COUT[15:8]  = 8'd0;
						COUT[23:16] = 8'd0;
						COUT[31:24] = Cout[4][4];
						wenC[0] = 1'd1; 
						wenC[1] = 1'd1;
						wenC[2] = 1'd1;
						wenC[3] = 1'd0;
					end
				endcase
			
		end
	end

	always @(*) begin

		if(state == TRIGGER) begin
			case (DONE)
				done2: begin
					next_addrC[10:0] = addrC[10:0] + 11'd1;  
				end
				done3: begin
					next_addrC[10:0]  = addrC[10:0]  + 11'd1;
					next_addrC[21:11] = addrC[21:11] + 11'd1;  
				end
				done4: begin
					next_addrC[10:0]  = addrC[10:0]  + 11'd1;
					next_addrC[21:11] = addrC[21:11] + 11'd1; 
					next_addrC[32:22] = addrC[32:22] + 11'd1;  
				end
				done5: begin
					next_addrC[10:0]  = addrC[10:0]  + 11'd1;
					next_addrC[21:11] = addrC[21:11] + 11'd1; 
					next_addrC[32:22] = addrC[32:22] + 11'd1;
					next_addrC[43:33] = addrC[43:33] + 11'd1;  
				end
				done6: begin
					next_addrC[10:0]  = addrC[10:0]  + 11'd1;
					next_addrC[21:11] = addrC[21:11] + 11'd1; 
					next_addrC[32:22] = addrC[32:22] + 11'd1;
					next_addrC[43:33] = addrC[43:33] + 11'd1;
				end
				done7: begin
					next_addrC[10:0]  = addrC[10:0]  + 11'd1;
					next_addrC[21:11] = addrC[21:11] + 11'd1; 
					next_addrC[32:22] = addrC[32:22] + 11'd1;
					next_addrC[43:33] = addrC[43:33] + 11'd1;
				end
				done8: begin
					next_addrC[21:11] = addrC[21:11] + 11'd1; 
					next_addrC[32:22] = addrC[32:22] + 11'd1;
					next_addrC[43:33] = addrC[43:33] + 11'd1;
				end
				done9: begin 
					next_addrC[32:22] = addrC[32:22] + 11'd1;
					next_addrC[43:33] = addrC[43:33] + 11'd1;
				end
				done10: begin
					next_addrC[43:33] = addrC[43:33] + 11'd1;
				end
			endcase
		end else begin
			next_addrC = addrC;
		end

	end


	always @(*) begin
		next_state   = IDLE;
		next_addrA   = addrA;
		next_addrB   = addrB;
		// next_addrC   = addrC;
		next_ain	 = ain;
		next_bin	 = bin;
		next_inCount = 2'd0;
		next_COUT    = COUT;
		next_FINISH  = 1'd0;
		next_triggerCount = triggerCount;
		
		// next_wenC  = 16'd0;
		// next_en    = 32'd0;

		for(i = 0; i < 5; i = i + 1) begin
			next_ADDRA[i] = ADDRA[i];
			next_ADDRB[i] = ADDRB[i];
			next_ADDRACount[i] = ADDRACount[i];
			next_ADDRBCount[i] = ADDRBCount[i];
			for(j = 0; j < 5; j = j + 1) begin
				next_trigger[i][j] = trigger[i][j];
			end
		end
	
		case (state)
			IDLE: begin
				if(start) begin
					// next_state = READtoSRAM;
					next_state = TRIGGER;
					next_ain = { 24'd0, AIN[7:0] };		//******************************//
					next_bin = { 24'd0, BIN[7:0] };
				end else begin
					next_state = IDLE;
				end
			end

			// READtoSRAM: begin
			// end

			TRIGGER: begin
				next_ain = AIN;													//******************************//
				next_bin = BIN;
				next_state = TRIGGER;
				next_COUT = COUT;
				next_triggerCount = triggerCount;
				next_FINISH = 1'd0;
				if(done == done10) begin
					// next_FINISH = 1'd1;
					next_state = OUTPUT;
				end

				//calculate address of sramA
				if(trigger[1][1] && ADDRACount[1] < 2'd3 ) begin
					next_addrA[10:0] = addrA[10:0] + A_ADD;
					next_ADDRACount[1] = ADDRACount[1] + 2'd1;
				end else begin
					next_addrA[10:0] = addrA[10:0] + A_ADD_MATRIX;
					next_ADDRACount[1] = 2'd0;
				end

				if(trigger[1][2]) begin
					if(ADDRACount[2] < 2'd3) begin
						next_addrA[21:11] = addrA[21:11] + A_ADD;
						next_ADDRACount[2] = ADDRACount[2] + 2'd1;
					end else begin
						next_addrA[21:11] = addrA[21:11] + A_ADD_MATRIX;
						next_ADDRACount[2] = 2'd0;
					end
				end

				if(trigger[1][3]) begin
					if(ADDRACount[3] < 2'd3) begin
						next_addrA[32:22] = addrA[32:22] + A_ADD;
						next_ADDRACount[3] = ADDRACount[3] + 2'd1;
					end else begin
						next_addrA[32:22] = addrA[32:22] + A_ADD_MATRIX;
						next_ADDRACount[3] = 2'd0;
					end
				end

				if(trigger[1][4]) begin
					if(ADDRACount[4] < 2'd3) begin
						next_addrA[43:33] = addrA[43:33] + A_ADD;
						next_ADDRACount[4] = ADDRACount[4] + 2'd1;
					end else begin
						next_addrA[43:33] = addrA[43:33] + A_ADD_MATRIX;
						next_ADDRACount[4] = 2'd0;
					end
				end


				//calculate address of sramB
				if(trigger[1][1] && ADDRBCount[1] < 2'd3 ) begin
					next_addrB[10:0] = addrB[10:0] + B_ADD;
					next_ADDRBCount[1] = ADDRBCount[1] + 2'd1;
				end else begin
					next_addrB[10:0] = addrB[10:0] + B_ADD_MATRIX;
					next_ADDRBCount[1] = 2'd0;
				end

				if(trigger[2][1]) begin
					if(ADDRBCount[2] < 2'd3) begin
						next_addrB[21:11] = addrB[21:11] + B_ADD;
						next_ADDRBCount[2] = ADDRBCount[2] + 2'd1;
					end else begin
						next_addrB[21:11] = addrB[21:11] + B_ADD_MATRIX;
						next_ADDRBCount[2] = 2'd0;
					end
				end

				if(trigger[3][1]) begin
					if(ADDRBCount[3] < 2'd3) begin
						next_addrB[32:22] = addrB[32:22] + B_ADD;
						next_ADDRBCount[3] = ADDRBCount[3] + 2'd1;
					end else begin
						next_addrB[32:22] = addrB[32:22] + B_ADD_MATRIX;
						next_ADDRBCount[3] = 2'd0;
					end
				end

				if(trigger[4][1]) begin
					if(ADDRBCount[4] < 2'd3) begin
						next_addrB[43:33] = addrB[43:33] + B_ADD;
						next_ADDRBCount[4] = ADDRBCount[4] + 2'd1;
					end else begin
						next_addrB[43:33] = addrB[43:33] + B_ADD_MATRIX;
						next_ADDRBCount[4] = 2'd0;
					end
				end
				

				
				case (triggerCount)
					4'd2: begin
						next_trigger[1][1] = 1'd1;
						next_ain = { 16'd0, AIN[15:8], AIN[7:0] };				//******************************//
						next_bin = { 16'd0, BIN[15:8], BIN[7:0] };
						next_addrA[10:0] = addrA[10:0] + A_ADD;
						next_addrB[10:0] = addrB[10:0] + B_ADD;
						next_ADDRACount[1] = ADDRACount[1] + 2'd1;
						next_ADDRBCount[1] = ADDRBCount[1] + 2'd1;
						next_triggerCount = triggerCount + 1;
					end
					4'd3: begin
						next_trigger[1][2] = 1'd1;
						next_trigger[2][1] = 1'd1;
						next_ain = { 8'd0, AIN[23:16], AIN[15:8], AIN[7:0] };	//******************************//
						next_bin = { 8'd0, BIN[23:16], BIN[15:8], BIN[7:0] };
						next_addrA[21:11] = addrA[21:11] + A_ADD;
						next_addrB[21:11] = addrB[21:11] + B_ADD;
						next_ADDRACount[2] = ADDRACount[2] + 2'd1;
						next_ADDRBCount[2] = ADDRBCount[2] + 2'd1;
						next_triggerCount = triggerCount + 1;
					end
					4'd4: begin
						next_trigger[1][3] = 1'd1;
						next_trigger[2][2] = 1'd1;
						next_trigger[3][1] = 1'd1;
						next_addrA[32:22] = addrA[32:22] + A_ADD;
						next_addrB[32:22] = addrB[32:22] + B_ADD;
						next_ADDRACount[3] = ADDRACount[3] + 2'd1;
						next_ADDRBCount[3] = ADDRBCount[3] + 2'd1;
						next_triggerCount = triggerCount + 1;

					end
					4'd5: begin
						next_trigger[1][4] = 1'd1;
						next_trigger[2][3] = 1'd1;
						next_trigger[3][2] = 1'd1;
						next_trigger[4][1] = 1'd1;
						next_addrA[43:33] = addrA[43:33] + A_ADD;
						next_addrB[43:33] = addrB[43:33] + B_ADD;
						next_ADDRACount[4] = ADDRACount[4] + 2'd1;
						next_ADDRBCount[4] = ADDRBCount[4] + 2'd1;
						next_triggerCount = triggerCount + 1;
					end
					4'd6: begin
						next_trigger[2][4] = 1'd1;
						next_trigger[3][3] = 1'd1;
						next_trigger[4][2] = 1'd1;
						next_triggerCount = triggerCount + 1;
					end
					4'd7: begin
						next_trigger[4][3] = 1'd1;
						next_trigger[3][4] = 1'd1;
						next_triggerCount = triggerCount + 1;
					end
					4'd8: begin
						next_trigger[4][4] = 1'd1;
						next_triggerCount = triggerCount + 1;
					end
					
				endcase
			end

			CALC: begin
				next_ain = AIN;			//******************************//
				next_bin = AIN;
				next_state = CALC;

			end

			OUTPUT: begin
				next_FINISH = 1'd1;
				next_state = IDLE;
			end		
		endcase
	end





endmodule
