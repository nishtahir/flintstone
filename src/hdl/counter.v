/**
* Generic 16 bit counter
*/
module counter16(
    input[15:0] d_in,
    input clk,
    input reset,
    input inc,
    input load,
    output reg[15:0] d_out = 0
);
    always @(posedge clk, posedge reset) begin
        if(reset)
            d_out <= 0;
        else if (load)
            d_out <= d_in;
        else if (inc)
            d_out <= d_out + 1;
        else
            d_out <= d_out;
    end
endmodule