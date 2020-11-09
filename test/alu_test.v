`timescale 1ns / 1ps

module alu_test;

    reg clk = 0;
    reg[15:0] x = 0;
    reg[15:0] y = 0;
    
    reg zx = 0;
    reg nx = 0;
    reg zy = 0;
    reg ny = 0;
    reg f = 0;
    reg no = 0;
    
    wire[15:0] d_out;
    wire zr;
    wire ng;
    
    // Make shift assertion register
    // if it's ever low, consider the test case failed
    reg assert_dout = 0;
    reg assert_zr = 0;
    reg assert_ng = 0;
    
    alu UUT (
        .x(x),
        .y(y),
        .zx(zx),
        .nx(nx),
        .zy(zy),
        .ny(ny),
        .f(f),
        .no(no),
        .d_out(d_out),
        .zr(zr),
        .ng(ng)
    );
    
    
    always #5 clk = ~clk;
    
    initial begin 
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=1;
        nx=0;
        zy=1;
        ny=0;
        f=1;
        no=0;
        assign assert_dout=16'b0000000000000000===d_out;
        assign assert_zr=1==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=1;
        nx=1;
        zy=1;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000000001===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=1;
        nx=1;
        zy=1;
        ny=0;
        f=1;
        no=0;
        assign assert_dout=16'b1111111111111111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f=0;
        no=0;
        assign assert_dout=16'b0000000000000000===d_out;
        assign assert_zr=1==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f=0;
        no=0;
        assign assert_dout=16'b1111111111111111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f=0;
        no=1;
        assign assert_dout=16'b1111111111111111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f=0;
        no=1;
        assign assert_dout=16'b0000000000000000===d_out;
        assign assert_zr=1==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000000000===d_out;
        assign assert_zr=1==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000000001===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=1;
        zy=1;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000000001===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=1;
        nx=1;
        zy=0;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000000000===d_out;
        assign assert_zr=1==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f=1;
        no=0;
        assign assert_dout=16'b1111111111111111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f=1;
        no=0;
        assign assert_dout=16'b1111111111111110===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=0;
        zy=0;
        ny=0;
        f=1;
        no=0;
        assign assert_dout=16'b1111111111111111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=1;
        zy=0;
        ny=0;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000000001===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=0;
        zy=0;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b1111111111111111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=0;
        zy=0;
        ny=0;
        f=0;
        no=0;
        assign assert_dout=16'b0000000000000000===d_out;
        assign assert_zr=1==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000000000;
        y=16'b1111111111111111;
        zx=0;
        nx=1;
        zy=0;
        ny=1;
        f=0;
        no=1;
        assign assert_dout=16'b1111111111111111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=1;
        nx=0;
        zy=1;
        ny=0;
        f=1;
        no=0;
        assign assert_dout=16'b0000000000000000===d_out;
        assign assert_zr=1==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=1;
        nx=1;
        zy=1;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000000001===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=1;
        nx=1;
        zy=1;
        ny=0;
        f=1;
        no=0;
        assign assert_dout=16'b1111111111111111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f=0;
        no=0;
        assign assert_dout=16'b0000000000010001===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f=0;
        no=0;
        assign assert_dout=16'b0000000000000011===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f=0;
        no=1;
        assign assert_dout=16'b1111111111101110===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f=0;
        no=1;
        assign assert_dout=16'b1111111111111100===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b1111111111101111===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f=1;
        no=1;
        assign assert_dout=16'b1111111111111101===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=1;
        zy=1;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000010010===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=1;
        nx=1;
        zy=0;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000000100===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f=1;
        no=0;
        assign assert_dout=16'b0000000000010000===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f=1;
        no=0;
        assign assert_dout=16'b0000000000000010===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=0;
        zy=0;
        ny=0;
        f=1;
        no=0;
        assign assert_dout=16'b0000000000010100===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=1;
        zy=0;
        ny=0;
        f=1;
        no=1;
        assign assert_dout=16'b0000000000001110===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=0;
        zy=0;
        ny=1;
        f=1;
        no=1;
        assign assert_dout=16'b1111111111110010===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=1==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=0;
        zy=0;
        ny=0;
        f=0;
        no=0;
        assign assert_dout=16'b0000000000000001===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #1
        x=16'b0000000000010001;
        y=16'b0000000000000011;
        zx=0;
        nx=1;
        zy=0;
        ny=1;
        f=0;
        no=1;
        assign assert_dout=16'b0000000000010011===d_out;
        assign assert_zr=0==zr;
        assign assert_ng=0==ng;
        
        #5
        $finish;
    end
endmodule
