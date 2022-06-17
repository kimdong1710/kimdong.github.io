module divide_clk( clk_20M, reset, clk, rst);

input clk_20M;
input reset;
output rst;
output reg clk;

reg [0:26] count;

assign rst = reset;

always @ ( posedge clk_20M or posedge reset ) begin
		if( reset ) begin
			count <= 0;
			clk <= 0;
		end
		else if( count == 19999999 ) begin
			clk <= ~clk;
			count <= 0;
		end
		else 
			count <= count + 1;
end
endmodule 