`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/18 16:23:00
// Design Name: 
// Module Name: move
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
`define drive 2'b10
`define stop 2'b00
`define back 2'b01

module move(
input rst_n,
input clk_dec,
input [1:0]drive,
output reg pwm_m
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
case(drive)
    `back: begin
    if (cnt==6'd1 || cnt==6'd2)
        pwm_m = 1'd1;
    else
        pwm_m = 1'd0;
    end
    `stop: begin
    if (cnt==6'd1 || cnt==6'd2 || cnt==6'd3)
        pwm_m = 1'd1;
    else
        pwm_m = 1'd0;
    end
    `drive: begin
    if (cnt==6'd1 || cnt==6'd2 || cnt==6'd3 || cnt==6'd4)
        pwm_m = 1'd1;
    else
        pwm_m = 1'd0;
    end
endcase
endmodule