`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/18 00:40:10
// Design Name: 
// Module Name: fsm_buttom
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


module fsm_buttom(
input [511:0]key_down,
input clk_noise,
input rst_n,
output reg [21:0]note_div
    );

reg [21:0]noise;
reg [21:0]noise_tmp;

always@*
if (key_down[8'h1B]==1'd1) begin
note_div = noise;
end else begin
note_div = 22'd0;
end

always@*
if (noise==22'd0)
    noise_tmp = 22'd151515;
else if (noise==22'd151515)
    noise_tmp = 22'd0;
else
    noise_tmp = 22'd0;

always@(posedge clk_noise or negedge rst_n)
if (rst_n==0)
    noise <= 22'd0;
else
    noise <= noise_tmp;

endmodule
