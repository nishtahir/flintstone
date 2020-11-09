`timescale 1ns / 1ps

/**
* 16 bit register
*/
module reg16(
    input[15:0] d_in,
    input load,
    input clk,
    input reset,
    output reg[15:0] d_out = 0
);
    always @(posedge clk, posedge reset) begin
        if(reset)
            d_out <= 16'd0; 
        else if(load)
            d_out <= d_in;
        else 
            d_out <= d_out;
    end
endmodule