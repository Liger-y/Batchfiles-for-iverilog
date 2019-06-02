module detect101(clk,clrn,s_in, p_out);
	input clk,clrn,s_in;
	output reg p_out; //H
	
	reg [2:0] state;
	reg [2:0] next_state;
	parameter IDLE = 3'b000;
	parameter A = 3'b001;
	parameter B = 3'b010;
	parameter C = 3'b011;
	parameter D = 3'b100;
	parameter E = 3'b101;
	
	always @(posedge clk or negedge clrn) begin //FSM part I
		if(!clrn) begin
			state <= IDLE;
			next_state = IDLE;
		end else state <= next_state;
	end
	
	always @(state or s_in) begin //FSM part II
		case(state)
			IDLE: next_state = s_in?A:IDLE;
			A: next_state = s_in?B:IDLE;
			B: next_state = s_in?B:C;
			C: next_state = s_in?D:IDLE;
			D: next_state = s_in?E:IDLE;
			E: next_state = s_in?B:C;
			default: next_state = IDLE;
		endcase
	end
	
	always @(posedge clk or negedge clrn) begin //FSM part III
		if(!clrn) begin
			p_out <= 0;
		end else begin
			case (next_state)
				IDLE: p_out <= 0;
				A: p_out <= 0;
				B: p_out <= 0;
				C: p_out <= 0;
				D: p_out <= 0;
				E: p_out <= 1;
				default: p_out <= 0;
			endcase
		end
	end
endmodule // detect101
