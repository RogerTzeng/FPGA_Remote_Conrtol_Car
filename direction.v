`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/03 19:35:26
// Design Name: 
// Module Name: direction
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

`define left 2'b10
`define mid 2'b00
`define right 2'b01

module direction(
input rst_n,
input clk_dec,
input [1:0]direc,
output reg pwm
    );

reg [5:0]cnt_tmp;
reg [5:0]cnt;

always@*
    if (cnt==6'd40)
        cnt_tmp = 1'd1;
    else
        cnt_tmp = cnt + 1'd1;

always@(posedge clk_dec or negedge rst_n)
    if (rst_n==0)
        cnt <= 1'd1;
    else
        cnt <= cnt_tmp;

always@*
case(direc)
    `right: begin
    if (cnt==6'd1 || cnt==6'd2)
        pwm = 1'd1;
    else
        pwm = 1'd0;
    end
    `mid: begin
    if (cnt==6'd1 || cnt==6'd2 || cnt==6'd3)
        pwm = 1'd1;
    else
        pwm = 1'd0;
    end
    `left: begin
    if( cnt==6'd1 || cnt==6'd2|| cnt==6'd3|| cnt==6'd4)
        pwm = 1'd1;
    else
        pwm = 1'd0;
    end
endcase
endmodule
