`timescale 1ns/100ps
module LFSR_4bit_tb;

reg load,rst,clk,count_en;
reg[3:0] count_to;
wire done;

LFSR_4bit LFSR_1(done,rst,clk,count_en,count_to,load);

always #5 clk = ~clk;

initial
	begin
			clk = 0; rst = 1; load = 0; count_en = 0; count_to = 4'b1;
	#10	rst = 0;
	#10	count_to = 4'b0101; load = 1; rst = 1;
	#10	load = 0; count_en = 1;
	#30	
	#10	count_to = 4'b1101; load = 1;
	#10	load = 0;
	#30	
	$stop;
	$finish;
	end

endmodule