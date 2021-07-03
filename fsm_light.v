`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/19 02:31:25
// Design Name: 
// Module Name: fsm_light
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

`define state_ini 2'b00
`define state_left 2'b10
`define state_right 2'b01

module fsm_light(
input rst_n,
input clk_noise,
input clk_mid,
input left_light,
input right_light,
input stop,
output reg [7:0]left_out,
output reg [7:0]right_out
    );
 
 reg [1:0]state;
 reg [1:0]state_tmp;
 reg cnt;
 reg cnt_tmp;
    
always@*
case(state)
`state_ini: begin
    if (left_light==1'd1) begin
        state_tmp = `state_left;
        left_out[0] = cnt;
        left_out[1] = cnt;
        left_out[2] = cnt;
        left_out[3] = cnt;
        left_out[4] = cnt;
        left_out[5] = cnt;
        left_out[6] = cnt;
        left_out[7] = cnt;
        right_out[7:0] = 8'd0;
    end else if (right_light==1'd1) begin
        state_tmp = `state_right;
        left_out = 8'd0;
        right_out[0] = cnt;
        right_out[1] = cnt;
        right_out[2] = cnt;
        right_out[3] = cnt;
        right_out[4] = cnt;
        right_out[5] = cnt;
        right_out[6] = cnt;
        right_out[7] = cnt;
    end else begin
        state_tmp = `state_ini;
        left_out = 8'd0;
        right_out = 8'd0;
    end
end
`state_left: begin
    if (stop==1'd1) begin
        state_tmp = `state_ini;
        left_out = 8'd0;
        right_out = 8'd0;
    end else begin
        state_tmp = `state_left;
        left_out[0] = cnt;
        left_out[1] = cnt;
        left_out[2] = cnt;
        left_out[3] = cnt;
        left_out[4] = cnt;
        left_out[5] = cnt;
        left_out[6] = cnt;
        left_out[7] = cnt;
        right_out= 8'd0;
    end
end
`state_right: begin
    if (stop==1'd1) begin
        state_tmp = `state_ini;
        left_out = 8'd0;
        right_out = 8'd0;
    end else begin
        state_tmp = `state_right;
        left_out = 8'd0;
        right_out[0] = cnt;
        right_out[1] = cnt;
        right_out[2] = cnt;
        right_out[3] = cnt;
        right_out[4] = cnt;
        right_out[5] = cnt;
        right_out[6] = cnt;
        right_out[7] = cnt;
    end
end   
endcase

always@(posedge clk_mid or negedge rst_n)
if (rst_n==0)
    state <= 1'd0;
else
    state <= state_tmp;

always@(cnt)
cnt_tmp = ~cnt;

always@(posedge clk_noise or negedge rst_n)
if (rst_n==0) 
    cnt <= 1'd0;
else
    cnt <= cnt_tmp;
endmodule
