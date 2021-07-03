`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/21 20:05:38
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
`define left_control 8'h1C
`define right_control 8'h23
`define drive_control 8'h1D
`define back_control 8'h1B 

module decoder(
input [511:0]key_down,
output reg [1:0]direc,
output reg [1:0]drive
    );
   
always@*begin
    if (key_down[`left_control]==1'd1 && key_down[`right_control]==1'd0)
        direc = 2'b10;
    else if (key_down[`left_control]==1'd0 && key_down[`right_control]==1'd1)
        direc = 2'b01;
    else
        direc = 2'b00;
end
always@*begin
    if (key_down[`drive_control]==1'd1 && key_down[`back_control]==1'd0)
        drive = 2'b10;
    else if (key_down[`drive_control]==1'd0 && key_down[`back_control]==1'd1)
        drive = 2'b01;
    else
        drive = 2'b00;
end                
endmodule