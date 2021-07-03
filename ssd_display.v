`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 16:14:44
// Design Name: 
// Module Name: decoder
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
`define ssd_d 8'b10000101
`define ssd_r 8'b11110101
`define ssd_I 8'b11110011
`define ssd_V 8'b10101011
`define ssd_n 8'b11010101
`define ssd_G 8'b01000011
`define ssd_S 8'b01001001
`define ssd_t 8'b11100001
`define ssd_O 8'b00000011
`define ssd_P 8'b00110001

module ssd_display(
input rst_n,clk,
input [1:0]drive,
input[2:0] q0,
input[2:0] q1,
input[2:0] q2,
input[2:0] q3,
output reg [3:0] ssd_ctrl,
output reg [7:0] D_ssd
    );
reg[3:0]value;
always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            ssd_ctrl <= 4'b1111;
            value <= 3'd0;
        end
        else begin
            case(ssd_ctrl)
                4'b1110:begin
                    if(drive==2'b10 || drive==2'b01)
                        value <= q2;
                    else
                        value <= 4'd9;
                    ssd_ctrl <= 4'b1101;
                end
                4'b1101: begin
                    if(drive==2'b10 || drive==2'b01)
                        value <= q1;
                    else
                        value <= 4'd8;
                    ssd_ctrl <= 4'b1011;
                end
                4'b1011: begin
                    if(drive==2'b10 || drive==2'b01)
                        value <= q0;
                    else
                        value <= 4'd7;
                    ssd_ctrl <= 4'b0111;
                end
                4'b0111: begin
                    if(drive==2'b10 || drive==2'b01)
                        value <= q3;
                    else
                        value <= 4'd10;
                    ssd_ctrl <= 4'b1110;
                end
                default: begin
                    value <= 3'd0;
                    ssd_ctrl <= 4'b1110;
                end                                                     
            endcase
        end
end
always@* begin
    case(value)
       4'd0:D_ssd = `ssd_d;
       4'd1:D_ssd = `ssd_r;
       4'd2:D_ssd = `ssd_I;
       4'd3:D_ssd = `ssd_V;
       4'd4:D_ssd = `ssd_I;
       4'd5:D_ssd = `ssd_n;
       4'd6:D_ssd = `ssd_G;
       4'd7:D_ssd = `ssd_S;
       4'd8:D_ssd = `ssd_t;
       4'd9:D_ssd = `ssd_O;
       4'd10:D_ssd = `ssd_P;
       default:D_ssd= 8'b11111111; 
    endcase
end
endmodule
