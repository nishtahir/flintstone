module vga_sync_gen (
    input i_clk,	
    input i_rst,
    output reg o_hs,
    output reg o_vs,
    output reg 	dp_en,
    output reg  [10:0]	line_count,
    output reg  [10:0]  pixel_count,
    output reg [10:0] px,
    output reg [10:0] py
);

    // 1024 X 768 @ 60Hz requires a 65.000MHz pixel clock

    localparam H_ACTIVE = 1024;
    localparam H_FRONT_PORCH = 24;
    localparam H_SYNCH = 136;	
    localparam H_BACK_PORCH = 160;	
    localparam H_TOTAL = H_SYNCH + H_BACK_PORCH + H_ACTIVE + H_FRONT_PORCH; //1344 pixels

    localparam V_ACTIVE	= 768;	
    localparam V_FRONT_PORCH = 3;	
    localparam V_SYNCH = 6;	 
    localparam V_BACK_PORCH	= 29;	
    localparam V_TOTAL = V_SYNCH + V_BACK_PORCH + V_ACTIVE + V_FRONT_PORCH; //806 lines
	
    reg h_en = 0;
    reg v_en = 0;

    always @(posedge i_clk) begin
        if (i_rst) begin
            pixel_count <= 0;
            px <= 0;
        end
        else if (pixel_count == H_TOTAL - 1) begin
            pixel_count <= 0;
            px <= 0;
        end
        else begin
            pixel_count <= pixel_count + 1;
            if(pixel_count % 2 == 0)
                px <= px + 1;
        end
    end
    
    always @(posedge i_clk) begin
        if (i_rst) begin
            line_count <= 0;
            py <= 0;
        end
        else if (pixel_count == H_TOTAL - 1) begin
            if (line_count == V_TOTAL - 1) begin
                line_count <= 0;
                py <= 0;
            end
            else begin
                line_count <= line_count + 1;
                if (line_count % 3 == 0)
                py <= py + 1;
            end
        end
    end

    always@(posedge i_clk) begin
        if (pixel_count == H_TOTAL - 1) begin 
            h_en <= 1;
        end
        else if (pixel_count == H_ACTIVE - 1) begin
            h_en <= 0;
        end
    end

    always@(posedge i_clk) begin
        if (pixel_count == H_TOTAL - 1) begin
            if (line_count == V_TOTAL - 1) begin
                v_en <= 1;
            end
            else if (line_count == V_ACTIVE - 1) begin
                v_en <= 0;
            end
        end
    end

    always@(posedge i_clk) begin
        dp_en <= v_en & h_en;
    end

    always@(posedge i_clk) begin
        if (pixel_count == H_ACTIVE + H_FRONT_PORCH - 1) begin
            o_hs <= 0;
        end
        else if (pixel_count == H_ACTIVE + H_FRONT_PORCH + H_SYNCH - 1) begin
            o_hs <= 1;
        end
    end

    always@(posedge i_clk) begin
        if (pixel_count == H_TOTAL-1) begin
            if (line_count == V_ACTIVE + V_FRONT_PORCH - 1) begin
                o_vs <= 0;
            end
            else if (line_count == V_ACTIVE + V_FRONT_PORCH + V_SYNCH - 1) begin
                o_vs <= 1;
            end
        end
    end
endmodule