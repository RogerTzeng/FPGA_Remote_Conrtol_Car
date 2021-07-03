`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/18 16:49:08
// Design Name: 
// Module Name: monitor
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


module monitor(
input clk_25MHz,
input rst_n,
input [16:0] pixel_addr,
input [16:0] pixel_addr_num,
input [9:0]h_cnt,
input [9:0]v_cnt,
input [1:0]drive,
input [3:0]a,
input [3:0]b,
input [3:0]c,
output reg [11:0]pixel
    );
    wire [11:0] data;
    wire [11:0] pixel0;
    wire [11:0] pixel1; 
    wire [11:0] pixel2;
    wire [11:0] pixel3;
    wire [11:0] pixel4;
    wire [11:0] pixel5;
    wire [11:0] pixel6;
    wire [11:0] pixel7;
    wire [11:0] pixel8;
    wire [11:0] pixel9;
    wire [11:0] pixelD;
    wire [11:0] pixelP;
    wire [11:0] pixelR;
        // Use reduced 320x240 address to output the saved picture from RAM 
    blk_mem_gen_0 blk_mem_gen_0_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel0)
    ); 
    blk_mem_gen_1 blk_mem_gen_1_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel1)
    ); 
    blk_mem_gen_2 blk_mem_gen_2_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel2)
    ); 
    blk_mem_gen_3 blk_mem_gen_3_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel3)
    ); 
    blk_mem_gen_4 blk_mem_gen_4_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel4)
    ); 
    blk_mem_gen_5 blk_mem_gen_5_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel5)
    ); 
    blk_mem_gen_6 blk_mem_gen_6_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel6)
    ); 

    blk_mem_gen_7 blk_mem_gen_7_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel7)
    ); 
    blk_mem_gen_8 blk_mem_gen_8_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel8)
    ); 

    blk_mem_gen_9 blk_mem_gen_9_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_num),
      .dina(data[11:0]),
      .douta(pixel9)
    ); 
    blk_mem_gen_D blk_mem_gen_D_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr),
      .dina(data[11:0]),
      .douta(pixelD)
    );
    blk_mem_gen_P blk_mem_gen_P_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr),
      .dina(data[11:0]),
      .douta(pixelP)
    ); 
    blk_mem_gen_R blk_mem_gen_R_inst(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr),
      .dina(data[11:0]),
      .douta(pixelR)
    );                      
    always@*begin
        if(v_cnt<10'd272 && v_cnt>10'd207)begin
            if(h_cnt<10'd288 && h_cnt>10'd223)
                if(a==4'd0)
                    pixel=pixel0;
                else if(a==4'd1)
                    pixel=pixel1;
                else if(a==4'd2)
                    pixel=pixel2;
                else if(a==4'd3)
                    pixel=pixel3;
                else if(a==4'd4)  
                    pixel=pixel4;     
                else if(a==4'd5)  
                    pixel=pixel5;     
                else if(a==4'd6)  
                    pixel=pixel6;  
                else if(a==4'd7)   
                    pixel=pixel7;      
                else if(a==4'd8)   
                    pixel=pixel8;     
                else if(a==4'd9)   
                    pixel=pixel9;  
                else
                    pixel=pixel0;    
            else if(h_cnt<10'd352 && h_cnt>10'd287)
                if(b==4'd0)
                    pixel=pixel0;
                else if(b==4'd1)
                    pixel=pixel1;
                else if(b==4'd2)
                    pixel=pixel2;
                else if(b==4'd3)
                    pixel=pixel3;
                else if(b==4'd4)  
                    pixel=pixel4;     
                else if(b==4'd5)  
                    pixel=pixel5;     
                else if(b==4'd6)  
                    pixel=pixel6;  
                else if(b==4'd7)   
                    pixel=pixel7;      
                else if(b==4'd8)   
                    pixel=pixel8;     
                else if(b==4'd9)   
                    pixel=pixel9;  
                else
                    pixel=pixel0;
            else if(h_cnt<10'd416 && h_cnt>10'd351)
                if(c==4'd0)
                    pixel=pixel0;
                else if(c==4'd1)
                    pixel=pixel1;
                else if(c==4'd2)
                    pixel=pixel2;
                else if(c==4'd3)
                    pixel=pixel3;
                else if(c==4'd4)  
                    pixel=pixel4;     
                else if(c==4'd5)  
                    pixel=pixel5;     
                else if(c==4'd6)  
                    pixel=pixel6;  
                else if(c==4'd7)   
                    pixel=pixel7;      
                else if(c==4'd8)   
                    pixel=pixel8;     
                else if(c==4'd9)   
                    pixel=pixel9;  
                else
                    pixel=pixel0;
            else
                pixel = 12'hfff;
        end
        else if(v_cnt<10'd64)begin
            if(h_cnt<10'd64)begin
                if(drive==2'b01)
                    pixel = pixelR;
                else if(drive==2'b10)
                    pixel = pixelD;
                else
                    pixel = pixelP;
            end
            else
                pixel = 12'hfff;
        end    
        else
            pixel = 12'hfff;
    end
endmodule
