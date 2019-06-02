`timescale 1ns/1ns
module TB;
	reg 

	always #1 clk = ~clk;
		
	always @()
	begin

	end

	initial
		begin

		#100
		$dumpflush;
		$stop;
		end

	 D1();
	initial
		begin
			$dumpfile("test.vcd");
			$dumpvars(0, TB);
			$dumpvars(0, D1);
		end
endmodule 
