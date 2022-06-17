`timescale 1ns/1ps
module tb();

reg clk_20M, reset;

wire [6:0] HEX0,HEX1,HEX2,HEX3;
wire LR1,LR2,LG1,LG2,LY1,LY2;

traffic_light tl1(
                    .clk_20M(clk_20M),
                    .reset(reset),
                    .HEX0(HEX0),
                    .HEX1(HEX1),
                    .HEX2(HEX2),
                    .HEX3(HEX3),
                    .LR1(LR1),
                    .LR2(LR2),
                    .LG1(LG1),
                    .LG2(LG2),
                    .LY1(LY1),
                    .LY2(LY2)
);

initial begin
    clk_20M = 1'b0;
    forever begin
        #20
        clk_20M = ~clk_20M;
    end
end

initial begin
    reset = 1'b0;
    #22
    reset = 1'b1;
    #12
    reset = 1'b0;
end
endmodule