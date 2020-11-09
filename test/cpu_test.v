`timescale 1ns / 1ps

module cpu_test;
    
    reg clk = 0;
    reg reset = 0;
    reg[15:0] in_m = 0;
    reg[15:0] instruction = 0;
    
    wire[15:0] out_m;
    wire[14:0] pc;
    wire[14:0] address;
    wire[15:0] dreg;
    wire[15:0] a_out;
    wire write_m;
    
    reg assert_address = 0;
    reg assert_write_m = 0;
    reg assert_pc = 1;
    reg assert_dreg = 0;
    reg assert_out_m = 1;
    
    cpu UUT(
        .clk(clk),
        .reset(reset),
        .in_m(in_m),
        .instruction(instruction),
        .out_m(out_m),
        .out_pc(pc),
        .address_m(address),
        .write_m(write_m),
        .d_out(dreg),
        .a_out(a_out)
    );
    
    
    always #1 clk = ~clk;

    initial begin
        in_m=16'b0000000000000000;
        instruction=16'b0011000000111001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd0;
        assign assert_pc = pc==16'd0;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0011000000111001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd12345;
        assign assert_pc = pc==16'd1;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b1110110000010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd12345;
        assign assert_pc = pc==16'd1;
        assign assert_dreg= dreg == 14'd12345;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b1110110000010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd12345;
        assign assert_pc = pc==16'd2;
        assign assert_dreg= dreg == 14'd12345;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0101101110100000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd12345;
        assign assert_pc = pc==16'd2;
        assign assert_dreg= dreg == 14'd12345;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0101101110100000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd23456;
        assign assert_pc = pc == 16'd3;
        assign assert_dreg= dreg == 14'd12345;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b1110000111010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd23456;
        assign assert_pc = pc==16'd3;
        assign assert_dreg= dreg == 14'd11111;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b1110000111010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd23456;
        assign assert_pc = pc==16'd4;
        assign assert_dreg= dreg == 14'd11111;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0000001111101000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd23456;
        assign assert_pc = pc==16'd4;
        assign assert_dreg= dreg == 14'd11111;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0000001111101000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd5;
        assign assert_dreg= dreg == 14'd11111;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b1110001100001000;
        reset=0;
        assign assert_out_m = out_m == 16'd11111;
        assign assert_write_m = write_m==1;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd5;
        assign assert_dreg= dreg == 14'd11111;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b1110001100001000;
        reset=0;
        assign assert_out_m = out_m == 16'd11111;
        assign assert_write_m = write_m==1;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd6;
        assign assert_dreg= dreg == 14'd11111;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0000001111101001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd6;
        assign assert_dreg= dreg == 14'd11111;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0000001111101001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1001;
        assign assert_pc = pc==16'd7;
        assign assert_dreg= dreg == 14'd11111;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b1110001110011000;
        reset=0;
        assign assert_out_m = out_m == 16'd11110;
        assign assert_write_m = write_m==1;
        assign assert_address = address == 15'd1001;
        assign assert_pc = pc==16'd7;
        assign assert_dreg= dreg == 14'd11110;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b1110001110011000;
        reset=0;
        assign assert_out_m = out_m == 16'd11109;
        assign assert_write_m = write_m==1;
        assign assert_address = address == 15'd1001;
        assign assert_pc = pc==16'd8;
        assign assert_dreg= dreg == 14'd11110;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0000001111101000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1001;
        assign assert_pc = pc==16'd8;
        assign assert_dreg= dreg == 14'd11110;
        
        #1
        in_m=16'b0000000000000000;
        instruction=16'b0000001111101000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd9;
        assign assert_dreg= dreg == 14'd11110;
        
        #1
        in_m=11111;
        instruction=16'b1111010011010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd9;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1111010011010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd10;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000000000001110;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd10;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000000000001110;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd14;
        assign assert_pc = pc==16'd11;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000100;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd14;
        assign assert_pc = pc==16'd11;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000100;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd14;
        assign assert_pc = pc==16'd14;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000001111100111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd14;
        assign assert_pc = pc==16'd14;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000001111100111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd999;
        assign assert_pc = pc==16'd15;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110110111100000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd999;
        assign assert_pc = pc==16'd15;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110110111100000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd16;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100001000;
        reset=0;
        assign assert_out_m = out_m == -16'd1;
        assign assert_write_m = write_m==1;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd16;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100001000;
        reset=0;
        assign assert_out_m = out_m == -16'd1;
        assign assert_write_m = write_m==1;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd17;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000000000010101;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd17;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000000000010101;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd21;
        assign assert_pc = pc==16'd18;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110011111000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd21;
        assign assert_pc = pc==16'd18;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110011111000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd21;
        assign assert_pc = pc==16'd21;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000000000000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd21;
        assign assert_pc = pc==16'd21;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000000000000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd2;
        assign assert_pc = pc==16'd22;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110000010010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd2;
        assign assert_pc = pc==16'd22;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110000010010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd2;
        assign assert_pc = pc==16'd23;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000001111101000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd2;
        assign assert_pc = pc==16'd23;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0000001111101000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd24;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110111010010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd24;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110111010010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd25;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd25;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd26;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd26;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd27;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000011;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd27;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000011;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd28;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000100;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd28;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000100;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000101;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000101;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000110;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000110;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == -14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110101010010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110101010010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1002;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1002;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000011;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000011;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000100;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000100;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000101;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000101;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1002;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000110;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1002;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000110;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd0;
        
        #1
        in_m=11111;
        instruction=16'b1110111111010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110111111010000;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000001;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000010;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000011;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000011;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000100;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000100;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000101;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000101;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000110;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000110;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1001;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000111;
        reset=1;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd1000;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b1110001100000111;
        reset=1;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd0;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0111111111111111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd1000;
        assign assert_pc = pc==16'd0;
        assign assert_dreg= dreg == 14'd1;
        
        #1
        in_m=11111;
        instruction=16'b0111111111111111;
        reset=0;
        assign assert_write_m = write_m==0;
        assign assert_address = address == 15'd32767;
        assign assert_pc = pc==16'd1;
        assign assert_dreg= dreg == 14'd1;
        
        
        #1
        $finish;
    end

endmodule
