//module dem nguoc 45s
//
module time_couter(
				rst,			//tin hieu reset
				clk,
				count, 		//gia tri dem dua ra hien thi
				timeout45,		//tin hieu ra dieu khien FSM
				timeout30
			);
	input rst,clk;
	output [4:0] count;
	output timeout45,timeout30;
	wire [4:0] cnt;
	reg [4:0] count;
	reg timeout45,timeout30,timeout;	//timeout: tin hieu cho biet da dem het 45s de bo dem dem lai

//xu ly gia tri dem
	always@ (posedge clk or posedge rst or posedge timeout)
		if (rst|timeout) 
			begin	count <= 5'd44; 		end
		else 
			begin	count <= count-1'b1; 	end
	
	assign cnt= count;
//dua ra cac tin hieu dieu khien
	always@(cnt)
		if(cnt==5)
			begin
				timeout30<=1'b1;
				timeout45<=1'b0;
				timeout <=1'b0;
			end
		else if(cnt==0)
			begin 
				timeout30<=1'b0;
				timeout45<=1'b1;
				timeout <=1'b0;
			end
		else if(cnt==5'h1F)
			begin 
				timeout <=1'b1;
				timeout30<=1'b0;
				timeout45<=1'b0;
			end
endmodule 