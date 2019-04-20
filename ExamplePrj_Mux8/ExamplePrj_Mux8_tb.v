`timescale 1ns/1ns
module TB;
parameter delay = 10;
reg clk;
//input of Mux8
reg en;
reg [2:0] addr;
reg [7:0] M_input; 

wire M_output;

// Instantial Mux8
Mux8 D1(en, addr, M_input, M_output);
initial
	begin
		$dumpfile("test.vcd");
		$dumpvars(0, TB);
		$dumpvars(0, D1.en, D1.addr, D1.M_input, D1.M_output);
	end

always #1 clk = ~clk;
	
always @(posedge clk)
begin
	if(en==0)
		M_input = ~M_input;
end

initial
	begin
	en = 1;
	clk = 1;
	M_input = 8'b11111111;
	#1 addr = 3'd0;
	#1 addr = 3'd1;
	#1 addr = 3'd2;
	#1 addr = 3'd3;
	#1 addr = 3'd4;
	#1 addr = 3'd5;
	#1 addr = 3'd6;
	#1 addr = 3'd7;
	#2 en=0;
	
	addr = 3'd0;
	M_input = 8'b00000001;
	#delay;
	addr = 3'd1;
	M_input = 8'b00000010;
	#delay;
	addr = 3'd2;
	M_input = 8'b00000100;
	#delay;
	addr = 3'd3;
	M_input = 8'b00001000;
	#delay;
	addr = 3'd4;
	M_input = 8'b00010000;
	#delay;
	addr = 3'd5;
	M_input = 8'b00100000;
	#delay;
	addr = 3'd6;
	M_input = 8'b01000000;
	#delay;
	addr = 3'd7;
	M_input = 8'b10000000;
	#delay;
	
	$dumpflush; //保存数据
	$stop; //结束
	end
endmodule 