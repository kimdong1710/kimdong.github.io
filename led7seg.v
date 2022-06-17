//module hien thi dem thoi gian tren 4 led 7 thanh
//ben nao den do thi dem tu 44->0, ben con lai dem tu 29->0
module led7seg(		hex0,hex1,		//hex0, hex1 cho ben 1
				hex2,hex3,		//hex2, hex3 cho ben 2
				count,		//gia tri dua vao tu bo dem_nguoc
				LR1,			//den do ben 1		
				eLED01,		//cho phep sang hai led01
				eLED23, 		//cho phep sang hai led23
				clk
		);
	input LR1,clk;
	input eLED01,eLED23;
	input [4:0] count;
	reg	[4:0] cnt1,cnt2;		//luu 2 gia tri thoi gian o 2 ben (do hien thi khong giong nhau)
	output [6:0] hex0,hex1,hex2,hex3;
	always@(LR1 or count)
	begin	
		//lr=1: den do ben 1 sang, hien thi dem ben 1 tu 44->0, ben 2 dem tu 29->0
		if(LR1)
			begin	
				cnt1 <= count;
				cnt2 <= count - 5'd5;
			end
		//lr=0: den do ben 2 sang, hien thi dem ben 1 tu 29->0, ben 2 dem tu 44->0
		else 	
			begin
				cnt1 <= count - 5'd5;
				cnt2 <= count;
			end
	end
	//hai ham hien thi
	display led01(.count(cnt1),.clk(clk),.enable(eLED01),.hex0(hex0),.hex1(hex1));
	display led23(.count(cnt2),.clk(clk),.enable(eLED23),.hex0(hex2),.hex1(hex3));
endmodule 