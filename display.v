//hien thi tren led7seg
module display(	
				count,		//gia tri hien thi
				clk,
				enable,		//cho phep hien thi
				hex0,			//hang don vi
				hex1			//hang chuc
		);
	input [4:0] count;
	input clk,enable;
	output [6:0] hex0, hex1;
	
	parameter		ZERO  =	7'b0000001; 
	parameter 		ONE 	= 	7'b1001111; 
	parameter 		TWO 	= 	7'b0010010; 
	parameter		THREE = 	7'b0000110; 
	parameter		FOUR 	= 	7'b1001100; 
	parameter 		FIVE 	= 	7'b0100100; 
	parameter		SIX	= 	7'b0100000; 
	parameter 		SEVEN =	7'b0001111; 
	parameter 		EIGHT	=	7'b0000000;	
	parameter		NINE	= 	7'b0000100; 
	parameter	BLANK = 	7'b1111111; 
	reg	[6:0] hex0,hex1;
	always@(clk, count, enable)
	begin	
	if (enable)
		if ((count < 3) && (clk))
			case(count)
				0: begin hex0 = ZERO;		hex1 = ZERO;  end
				1: begin hex0 = ONE;		hex1 = ZERO;  end
				default: begin hex0 = TWO;	hex1 = ZERO;  end
			endcase
		else if ((count < 3) && (!clk))
			begin
				hex0 = BLANK;
				hex1 = BLANK;
			end
		else
			case(count)
				3: begin hex0 = THREE; 		hex1 = ZERO;	end
				4: begin hex0 = FOUR; 		hex1 = ZERO;	end
				5: begin hex0 = FIVE; 		hex1 = ZERO;	end
				6: begin hex0 = SIX; 		hex1 = ZERO;	end
				7: begin hex0 = SEVEN; 		hex1 = ZERO;	end
				8: begin hex0 = EIGHT; 		hex1 = ZERO;	end
				9: begin hex0 = NINE; 		hex1 = ZERO;	end
				10: begin hex0 = ZERO; 		hex1 = ONE;		end
				11: begin hex0 = ONE; 		hex1 = ONE;		end
				12: begin hex0 = TWO; 		hex1 = ONE;		end
				13: begin hex0 = THREE; 	hex1 = ONE;		end
				14: begin hex0 = FOUR; 		hex1 = ONE;		end
				15: begin hex0 = FIVE; 		hex1 = ONE;		end
				16: begin hex0 = SIX; 		hex1 = ONE;		end
				17: begin hex0 = SEVEN; 	hex1 = ONE;		end
				18: begin hex0 = EIGHT; 	hex1 = ONE;		end
				19: begin hex0 = NINE; 		hex1 = ONE;		end
				20: begin hex0 = ZERO; 		hex1 = TWO;		end
				21: begin hex0 = ONE; 		hex1 = TWO;		end
				22: begin hex0 = TWO; 		hex1 = TWO;		end
				23: begin hex0 = THREE; 	hex1 = TWO;		end
				24: begin hex0 = FOUR; 		hex1 = TWO;		end
				25: begin hex0 = FIVE; 		hex1 = TWO;		end
				26: begin hex0 = SIX; 		hex1 = TWO;		end
				27: begin hex0 = SEVEN; 	hex1 = TWO;		end
				28: begin hex0 = EIGHT; 	hex1 = TWO;		end
				29: begin hex0 = NINE; 		hex1 = TWO;		end
				30: begin hex0 = ZERO; 		hex1 = THREE;	end
				31: begin hex0 = ONE; 		hex1 = THREE;	end					
				32: begin hex0 = TWO; 		hex1 = THREE;	end
				33: begin hex0 = THREE; 	hex1 = THREE;	end
				34: begin hex0 = FOUR; 		hex1 = THREE;	end
				35: begin hex0 = FIVE; 		hex1 = THREE;	end
				36: begin hex0 = SIX; 		hex1 = THREE;	end
				37: begin hex0 = SEVEN; 	hex1 = THREE;	end
				38: begin hex0 = EIGHT; 	hex1 = THREE;	end
				39: begin hex0 = NINE; 		hex1 = THREE;	end
				40: begin hex0 = ZERO; 		hex1 = FOUR;	end
				41: begin hex0 = ONE; 		hex1 = FOUR;	end
				42: begin hex0 = TWO; 		hex1 = FOUR;	end
				43: begin hex0 = THREE; 	hex1 = FOUR;	end
				default: begin hex0 = FOUR; 	hex1 = FOUR;	end
			endcase
	else 
		begin
			hex0 = BLANK; 
			hex1 = BLANK;
		end
	end
endmodule 