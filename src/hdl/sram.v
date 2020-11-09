module sram(
    input i_we,
    input i_clk_a,
    input[15: 0] i_data,
    input[14:0] i_addr_a,
    output[15:0] o_data_a,
    input i_clk_b,
    input[14:0] i_addr_b,
    output[15:0] o_data_b
);
    reg [15:0] memory [32768:0];
    reg [14:0] addr_reg_a;
    reg [14:0] addr_reg_b;

    
    always @(posedge i_clk_a) begin   
        if (i_we) begin
            memory[i_addr_a] <= i_data;
        end
        addr_reg_a <= i_addr_a;
    end
    
    always @(posedge i_clk_b) begin   
        addr_reg_b <= i_addr_b;
    end
    
    assign o_data_a = memory[addr_reg_a];
    assign o_data_b = memory[addr_reg_b];
endmodule