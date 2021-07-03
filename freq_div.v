`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/18 16:13:22
// Design Name: 
// Module Name: freq_div
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


module freq_div(
input clk,
input rst_n,
output reg clk_dec
    );
reg [15:0]cnt;
reg [15:0]cnt_next;
reg clk_tmp;

always@*
begin
    if(cnt==15'd24999)
        begin
        clk_tmp=~clk_dec;
        cnt_next=0;
        end
    else
    begin
        cnt_next=cnt+1'b1;
        clk_tmp=clk_dec;
    end
end
always@(posedge clk or posedge rst_n)
    if(rst_n==0) begin
        cnt<=15'b0;
        clk_dec = 1'b0;
    end else begin 
        cnt<=cnt_next;
        clk_dec = clk_tmp;
    end
endmodule