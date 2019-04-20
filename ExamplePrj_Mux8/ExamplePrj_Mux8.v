module Mux8(en,addr,M_input,M_output);
input en;
input [2:0] addr;
input [7:0] M_input; //多路输入

output reg M_output;

always @*
begin
	if(!en)  //低电平使能,开启Mux
		case(addr)
			3'd0: M_output = M_input[0];
			3'd1: M_output = M_input[1];
			3'd2: M_output = M_input[2];
			3'd3: M_output = M_input[3];
			3'd4: M_output = M_input[4];
			3'd5: M_output = M_input[5];
			3'd6: M_output = M_input[6];
			3'd7: M_output = M_input[7];
		endcase
	else
		M_output = 0;
end
endmodule