`timescale 1ns / 1ps


module counter_test();

    reg [15:0] in; 
    reg load;
    reg reset;
    reg clk;
    reg inc;
    wire [15: 0] out;

    counter16 DUT(
        .d_in(in),
        .clk(clk), 
        .reset(reset),
        .inc(inc),
        .load(load),
        .d_out(out)
    ); 

    always #5 clk = ~clk;

    initial begin        
        $display ("time\t clk reset enable counter");	
        $monitor ("%g\t %b   %b     %b      %b", $time, clk, reset, load, out);
    
        in = 16'b0000000000000000;
        clk = 1;
        reset = 0;
        load = 0;
        inc = 0;
    
        #10
        inc = 1;
        
        #10
        in = 16'b0000000010000000;
        load = 1;
    
        #10 
        load = 0;
        inc = 1;
        
        #5
        inc = 1;
    
        #5
        inc = 1;
        
        #5
        inc = 1;
        
        #5 
        load = 1;
        inc = 1;
    
        #5 
        load = 1;
        inc = 1;
    
        #5 
        load = 1;
        inc = 1;
    
        #5 
        load = 0;
        inc = 0;
    
        #5 
        load = 0;
        inc = 0;
        
        #5 
        load = 0;
        inc = 0;
    
        #10 
        reset = 1;
    
        #5 
        $finish;
    end

endmodule
