`timescale 1ns/1ns
module TB;
//input

// Instantial Mux8
Mux8 D1();
initial
	begin
		$dumpfile("test.vcd");
		$dumpvars(0, TB);
		$dumpvars(0, D1., D1., D1., D1.);
	end

always #1 clk = ~clk;
	
always @()
begin

end

initial
	begin

	
	$dumpflush; //保存数据
	$stop; //结束
	end
endmodule 

/*
module endmodule 
assign wire reg
begin end 
initial always
function endfunction 
task endtask
case default endcase
parameter 
posedge negedge
*/