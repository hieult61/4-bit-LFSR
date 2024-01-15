module LFSR_4bit(done,rst,clk,count_en,count_to,load);

input rst,clk,load,count_en;
input[3:0] count_to;
output done;
reg[3:0] reg_val;
reg result;
wire fb_val;

always@(posedge clk, negedge rst)
begin
	if(!rst)
		reg_val <= 4'b1111;
	else if (load)
		reg_val <= count_to;
	else if (!count_en || (count_en & done))
		reg_val <= reg_val;
	else
		reg_val <= {reg_val[2:0],fb_val};
	result <= &reg_val;
end

assign fb_val = reg_val[3] ^ reg_val[2];
assign done = result;

endmodule