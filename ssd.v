`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/19 10:19:40
// Design Name: 
// Module Name: ssd
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


module ssd(
input [1:0]drive,
input clk_d,
input clk_ssd,
input rst_n,
output [7:0]D,
output [3:0]ssd_ctrl
    );
    reg [2:0]q0;
    reg [2:0]q1;
    reg [2:0]q2;
    reg [2:0]q3;
    reg [2:0]q0_tmp;
    reg [2:0]q1_tmp;
    reg [2:0]q2_tmp;
    reg [2:0]q3_tmp;
    always@*begin
        if(drive==2'b10||drive==2'b01)begin
            q0_tmp = q0 + 3'd1;
            q1_tmp = q1 + 3'd1;
            q2_tmp = q2 + 3'd1;
            q3_tmp = q3 + 3'd1;
        end
        else if(drive==2'b00)begin
            q0_tmp = 3'd0;
            q1_tmp = 3'd1;
            q2_tmp = 3'd2;
            q3_tmp = 3'd3;
        end
        else begin
           q0_tmp = 3'd0;
           q1_tmp = 3'd1;
           q2_tmp = 3'd2;
           q3_tmp = 3'd3;  
        end
    end
    always@(posedge clk_d or negedge rst_n)begin
        if(~rst_n)begin
            q0 <= 3'd0;
            q1 <= 3'd1;
            q2 <= 3'd2;
            q3 <= 3'd3;
        end
        else if(q0_tmp>=3'd7)begin
            q0 <= 3'd0;
            q1 <= q1_tmp;
            q2 <= q2_tmp;
            q3 <= q3_tmp;
        end
        else if(q1_tmp>=3'd7)begin
            q0 <= q0_tmp;
            q1 <= 3'd0;
            q2 <= q2_tmp;
            q3 <= q3_tmp;
        end
        else if(q2_tmp>=3'd7)begin
            q0 <= q0_tmp;
            q1 <= q1_tmp;
            q2 <= 3'd0;
            q3 <= q3_tmp;
        end
        else if(q3_tmp>=3'd7)begin
            q0 <= q0_tmp;
            q1 <= q1_tmp;
            q2 <= q2_tmp;
            q3 <= 3'd0;
        end                
        else begin
            q0 <= q0_tmp;
            q1 <= q1_tmp;
            q2 <= q2_tmp;
            q3 <= q3_tmp;
        end
    end
    ssd_display U_ssd(.clk(clk_ssd),.rst_n(rst_n),.drive(drive),.q0(q0),.q1(q1),.q2(q2),.q3(q3),.ssd_ctrl(ssd_ctrl),.D_ssd(D));
endmodule
