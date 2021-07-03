`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/17 15:54:54
// Design Name: 
// Module Name: top
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


module top(
input clk,
input rst,
output [3:0]vgaRed,
output [3:0]vgaGreen,
output [3:0]vgaBlue,
output hsync,
output vsync,
output pwm,
output pwm_m,
inout PS2_DATA,
inout PS2_CLK,
input left_light,
input right_light,
input stop,
output [7:0]D,
output [3:0]ssd_ctrl,
output SDIN,
output clk_M,
output clk_LR,
output clk_S,
output [7:0]left_out,
output [7:0]right_out
);

    wire [11:0] pixel;
    wire [16:0] pixel_addr;
    wire [16:0] pixel_addr_num;
    
    wire clk_25MHz;
    wire clk_22;
    wire clk_dec;
    wire clk_d;
    wire clk_ssd;
    wire clk_noise;
    wire clk_mid; 
    wire clk_cn;
    
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
    
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire key_valid;
    
    wire [1:0]direc;
    wire [1:0]drive;
    wire[3:0]a,b,c;
    
    wire [15:0]audio_left,audio_right;
    wire [21:0]note_div;
//    wire [1:0]drive;
     
assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;
assign rst_n=~rst;


KeyboardDecoder KD( 
  .key_down(key_down),
  .last_change(last_change),
  .key_valid(key_valid),
  .PS2_DATA(PS2_DATA),
  .PS2_CLK(PS2_CLK),
  .rst(rst),
  .clk(clk)
);
decoder DECODER(
  .key_down(key_down),
  .direc(direc),
  .drive(drive)
);
    // Frequency Divider
clock_divisor clk_wiz_0_inst(
      .clk(clk),
      .rst_n(rst_n),
      .clk1(clk_25MHz),
      .clk22(clk_22),
      .clk_d(clk_d),
      .clk_ssd(clk_ssd),
      .clk_mid(clk_mid),
      .clk_noise(clk_noise),
      .clk_M(clk_M),
      .clk_LR(clk_LR),
      .clk_S(clk_S),
      .clk_cn(clk_cn)
    );
freq_div FQ(
    .clk(clk),
    .rst_n(rst_n),
    .clk_dec(clk_dec)
);
direction DR(
    .rst_n(rst_n),
    .clk_dec(clk_dec),
    .direc(direc),
    .pwm(pwm)
);
move MOVE(
    .rst_n(rst_n),
    .clk_dec(clk_dec),
    .drive(drive),
    .pwm_m(pwm_m)
);
// Reduce frame address from 640x480 to 320x240
mem_addr_gen mem_addr_gen_inst(
  .clk(clk_22),
  .rst(rst),
  .h_cnt(h_cnt),
  .v_cnt(v_cnt),
  .pixel_addr(pixel_addr)
);
mem_addr_gen_num mem_addr_gen_num_inst(
  .clk(clk_22),
  .rst(rst),
  .h_cnt(h_cnt),
  .v_cnt(v_cnt),
  .pixel_addr(pixel_addr_num)
);      
    monitor MON(
        .clk_25MHz(clk_25MHz),
        .rst_n(rst_n),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .drive(drive),
        .a(a),
        .b(b),
        .c(c),
        .pixel_addr(pixel_addr),
        .pixel_addr_num(pixel_addr_num),
        .pixel(pixel)
    );
// Render the picture by VGA controller
    vga_controller   vga_inst(
      .pclk(clk_25MHz),
      .reset(rst),
      .hsync(hsync),
      .vsync(vsync),
      .valid(valid),
      .h_cnt(h_cnt),
      .v_cnt(v_cnt)
    );
    counter COUNTER(
        .clk(clk_cn),
        .rst_n(rst_n),
        .drive(drive),
        .a(a),
        .b(b),
        .c(c)
    );
ssd SSD(
        .drive(drive),
        .clk_d(clk_d),
        .clk_ssd(clk_ssd),
        .rst_n(rst_n),
        .D(D),
        .ssd_ctrl(ssd_ctrl)
    );
buzzer(
        .clk(clk),
        .rst_n(rst_n),
        .note_div(note_div),
        .audio_left(audio_left),
        .audio_right(audio_right)
    );
p_to_s(
        .clk1(clk_LR),
        .clk2(clk_S),
        .rst_n(rst_n),
        .audio_left(audio_left),
        .audio_right(audio_right),
        .SDIN(SDIN)
    );
fsm_buttom(
        .key_down(key_down),
        .clk_noise(clk_noise),
        .rst_n(rst_n),
        .note_div(note_div)
    );            
fsm_light(
        .rst_n(rst_n),
        .clk_noise(clk_noise),
        .clk_mid(clk_mid),
        .left_light(left_light),
        .right_light(right_light),
        .stop(stop),
        .left_out(left_out),
        .right_out(right_out)
    );    
endmodule
