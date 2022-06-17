module state(	clk,
				rst,
				timeout45,timeout30,		//tin hieu dieu khien FSM
				LR1,LR2,LG1,LG2,LY1,LY2,	//tin hieu den bao
				eLED01, eLED23			//cho phep hien thi tren led7seg
				);
	input clk,rst,timeout45,timeout30;
	output LR1,LR2,LG1,LG2,LY1,LY2,eLED01,eLED23;
//gan ma trang thai
	parameter	S0 = 3'b000;
	parameter	S1 = 3'b001;
	parameter	S2 = 3'b010;
	parameter	S3 = 3'b011;

	reg	[2:0] current_state;
	reg	[2:0] next_state;
	wire s_s0,s_s1,s_s2,s_s3;
	
	always@(posedge clk or posedge rst)
		begin		
			if (rst)
				current_state <= S0;
			else
				current_state <= next_state;
		end
	assign LR1 = s_s0|s_s1;
	assign LR2 = s_s2|s_s3;
	assign LG1 = s_s2;
	assign LG2 = s_s0;
	assign LY1 = s_s3;
	assign LY2 = s_s1;
	assign eLED01 = s_s0|s_s1|s_s2;
	assign eLED23 = s_s0|s_s2|s_s3;

	always@(current_state or timeout45 or timeout30 or s_s0 or s_s1 or s_s2 or s_s3)
		begin	
			case (current_state)
				S0:	if (s_s0 & timeout30)
						next_state <= S1;
					else 
						next_state <= S0;
				S1:	if (s_s1 & timeout45)
						next_state <= S2;
					else 
						next_state <= S1;
				S2:	if (s_s2 & timeout30)
						next_state <= S3;
					else 
						next_state <= S2;
				S3:	if (s_s3 & timeout45)
						next_state <= S0;
					else 
						next_state <= S3;
				default: next_state <= S0;
			endcase
		end
	assign s_s0 = ~current_state[2]&~current_state[1]&~current_state[0];
	assign s_s1 = ~current_state[2]&~current_state[1]& current_state[0];
	assign s_s2 = ~current_state[2]& current_state[1]&~current_state[0];
	assign s_s3 = ~current_state[2]& current_state[1]& current_state[0];
endmodule
