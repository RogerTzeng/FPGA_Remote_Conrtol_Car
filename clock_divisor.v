`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/18 16:32:41
// Design Name: 
// Module Name: clock_divisor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divisor(
input clk,
input rst_n,
output clk1,
output clk22,
output clk_d,
output clk_ssd,
output clk_mid,
output clk_noise,
output clk_M,
output clk_LR,
output clk_S,
output clk_cn
);
reg [25:0] num;
wire [25:0] next_num;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk1 = num[1];
assign clk22 = num[21];
assign clk_d = num[25];
assign clk_ssd = num[17];
assign clk_M = num[1];
assign clk_LR = num[8];
assign clk_S = num[3];
assign clk_noise = num[25];
assign clk_mid = num[15];
assign clk_cn = num[14];
endmodule
