`timescale 1ns / 1ps

module top (
    input wire CLK_I,
    input wire reset,
    input wire [3:0] SW,
    input wire PS2_D1,
    input wire PS2_D2,
    input wire PS2_C1,
    input wire PS2_C2,
    output wire VGA_HS_O,
    output wire VGA_VS_O,
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output wire [3:0] LED
);

    // reset button is active low on Arty
    wire rst = ~reset;

    wire wme;
    wire i_clk;
    wire clk_75;

    wire[10:0] px;
    wire[10:0] py;
    
    wire[14:0] addrb;
    wire[14:0] address_m;
    wire[14:0] pc_out;

    wire[15:0] in_m;
    wire[15:0] out_m;
    wire[15:0] d_out;
    wire[15:0] doutb;
    wire[15:0] instruction;
    wire[15:0] keyboard_out;
    
    clk_wiz_0 clock(
        .o_clk_vga(clk_75),
        .reset(rst),
        .i_clk_100(CLK_I)
    );
        
    vga_sync_gen display (
        .i_clk(clk_75),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .line_count(), 
        .pixel_count(),
        .px(px),
        .py(py)
    );
    
    cpu core ( 
        .clk(i_clk),
        .reset(rst),
        .in_m(in_m),
        .instruction(instruction),
        .out_m(out_m),
        .out_pc(pc_out),
        .address_m(address_m),
        .write_m(wme),
        .d_out(d_out)
    );
    
    ila_0 debug_probe(
        .clk(CLK_I),
        .probe0(in_m),
        .probe1(out_m),
        .probe2(pc_out),
        .probe3(instruction),
        .probe4(address_m),
        .probe5(doutb),
        .probe6(wme),
        .probe7(d_out),
        .probe8(addrb),
        .probe9(keyboard_out)
    );
    
    sram ram(
        .i_we(wme),
        .i_clk_a(i_clk),
        .i_data(out_m),
        .i_addr_a(address_m),
        .o_data_a(in_m),
        .i_clk_b(clk_75),
        .i_addr_b(addrb),
        .o_data_b(doutb)
    );
    
    rom instruction_memory(
        .i_clk_a(i_clk),
        .i_addr_a(pc_out),
        .o_data_a(instruction)
    );
    
    keyboard keyboard(
        .clk(PS2_C1),
        .data(PS2_D1),
        .d_out(keyboard_out)
    );
    
//    assign i_clk = SW[3];
    assign i_clk = CLK_I;

    // screen is 256 rows of 512 pixels per row  
    assign addrb = 16384 + (py * 32) + (px / 16);

    assign VGA_R[3] = doutb[px % 16];
    assign VGA_G[3] = doutb[px % 16];
    assign VGA_B[3] = doutb[px % 16];    
    
    assign LED[0] = SW[0] & clk_75;
    assign LED[1] = SW[1];
    assign LED[2] = SW[2];
    
    // Visual indicator of the input
    // clock signal
    assign LED[3] = i_clk;
    
endmodule