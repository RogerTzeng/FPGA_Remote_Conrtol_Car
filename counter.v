`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/24 10:25:52
// Design Name: 
// Module Name: counter
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


module counter(
input rst_n,
input clk,
input [1:0]drive,
output reg [3:0] a,
output reg [3:0] b,
output [3:0] c
    );
    reg [8:0]num;
    reg [8:0]num_tmp;
    always@*begin
        if((drive==2'b10)||(drive==2'b01))begin
            num_tmp = num + 1'b1;
        end    
        else begin
            if(num>9'd0)
                num_tmp = num - 1'b1;
            else
                num_tmp = num;
        end
    end
    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            num <= 9'd0;
        end
        else begin
            if(num_tmp>=9'd340)
                num <= 9'd340;
            else if(num_tmp<9'd1)
                num <= 9'd0;
            else
                num <= num_tmp;
        end
    end
    
    always@*
    if(num>10'd899)
        a=4'd9;
    else if(num>10'd799)
        a=4'd8;
    else if(num>10'd699)
        a=4'd7;
    else if(num>10'd599)
        a=4'd6;
    else if(num>9'd499)
        a=4'd5;
    else if(num>9'd399)
        a=4'd4;
    else if(num>9'd299)
        a=4'd3;
    else if(num>9'd199)
        a=4'd2;
    else if(num>9'd99)
        a=4'd1;
    else 
        a=4'd0;   
    
    always@*
    if(num-(a*10'd100)>9'd89)
        b=4'd9;
    else if(num-(a*10'd100)>9'd79)
        b=4'd8;
    else if(num-(a*10'd100)>9'd69)
        b=4'd7;
    else if(num-(a*10'd100)>9'd59)
        b=4'd6;
    else if(num-(a*10'd100)>9'd49)
        b=4'd5;
    else if(num-(a*10'd100)>9'd39)
        b=4'd4;
    else if(num-(a*10'd100)>9'd29)
        b=4'd3;
    else if(num-(a*10'd100)>9'd19)
        b=4'd2;
    else if(num-(a*10'd100)>9'd9)
        b=4'd1;
    else 
        b=4'd0;             

   assign c = num-(a*10'd100)-(b*4'd10);
   
endmodule
