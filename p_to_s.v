`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 10:55:40
// Design Name: 
// Module Name: p_to_s
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


module p_to_s(
input clk1,
input clk2,
input rst_n,
input [15:0]audio_left,
input [15:0]audio_right,
output reg SDIN
    );
reg [15:0]audio_left_reg;
reg [15:0]audio_right_reg;
reg [4:0]cnt;
reg [4:0]cnt_next;
reg SDIN_tmp;

always@(posedge clk1 or negedge rst_n)
if (~rst_n) begin
    audio_left_reg <= 16'd0;
    audio_right_reg <= 16'd0;
end else begin
    audio_left_reg <= audio_left;
    audio_right_reg <= audio_right;
end

always@(cnt)
cnt_next=cnt+1'b1;
always@(posedge clk2 or negedge rst_n)
if(rst_n==0)
cnt<=5'd0;
else
cnt<=cnt_next;


always@*
case (cnt)
5'd0 : SDIN_tmp = audio_left_reg[15];
5'd1 : SDIN_tmp = audio_left_reg[14];
5'd2 : SDIN_tmp = audio_left_reg[13];
5'd3 : SDIN_tmp = audio_left_reg[12];
5'd4 : SDIN_tmp = audio_left_reg[11];
5'd5 : SDIN_tmp = audio_left_reg[10];
5'd6 : SDIN_tmp = audio_left_reg[9];
5'd7 : SDIN_tmp = audio_left_reg[8];
5'd8 : SDIN_tmp = audio_left_reg[7];
5'd9 : SDIN_tmp = audio_left_reg[6];
5'd10 : SDIN_tmp = audio_left_reg[5];
5'd11 : SDIN_tmp = audio_left_reg[4];
5'd12 : SDIN_tmp = audio_left_reg[3];
5'd13 : SDIN_tmp = audio_left_reg[2];
5'd14 : SDIN_tmp = audio_left_reg[1];
5'd15 : SDIN_tmp = audio_left_reg[0];
5'd16 : SDIN_tmp = audio_right_reg[15];
5'd17 : SDIN_tmp = audio_right_reg[14];
5'd18 : SDIN_tmp = audio_right_reg[13];
5'd19 : SDIN_tmp = audio_right_reg[12];
5'd20 : SDIN_tmp = audio_right_reg[11];
5'd21 : SDIN_tmp = audio_right_reg[10];
5'd22 : SDIN_tmp = audio_right_reg[9];
5'd23 : SDIN_tmp = audio_right_reg[8];
5'd24 : SDIN_tmp = audio_right_reg[7];
5'd25 : SDIN_tmp = audio_right_reg[6];
5'd26 : SDIN_tmp = audio_right_reg[5];
5'd27 : SDIN_tmp = audio_right_reg[4];
5'd28 : SDIN_tmp = audio_right_reg[3];
5'd29 : SDIN_tmp = audio_right_reg[2];
5'd30 : SDIN_tmp = audio_right_reg[1];
5'd31 : SDIN_tmp = audio_right_reg[0];
default : SDIN_tmp = 0;
endcase

always@(posedge clk2 or negedge rst_n)
if (~rst_n)
    SDIN <= 1'd0;
else
    SDIN <= SDIN_tmp;
endmodule
