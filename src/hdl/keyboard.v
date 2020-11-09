module keyboard(
    input wire clk, // Clock pin form keyboard
    input wire data, //Data pin form keyboard
    output reg [15:0] d_out
);
    reg [7:0] data_curr;
    reg [7:0] data_pre;
    reg [3:0] b;
    reg flag;

    initial begin
        b <= 4'h1;
        flag <= 1'b0;
        data_curr <= 8'hf0;
        data_pre <= 8'hf0;
        d_out <= 16'd0;
    end

    always @(negedge clk) //Activating at negative edge of clock from keyboard
    begin
        case(b)
            1: ; //first bit
            2: data_curr[0] <= data;
            3: data_curr[1] <= data;
            4: data_curr[2] <= data;
            5: data_curr[3] <= data;
            6: data_curr[4] <= data;
            7: data_curr[5] <= data;
            8: data_curr[6] <= data;
            9: data_curr[7] <= data;
            10: flag <= 1'b1; //Parity bit
            11: flag <= 1'b0; //Ending bit
        endcase

        if(b <= 10) begin
            b <= b + 1;
        end
        else if(b == 11) begin
            b <= 1;
        end
    end

    always@(posedge flag)// Printing data obtained to led
    begin 
        if(data_curr == 8'hf0) begin
            case(data_pre)
                8'h5a: d_out <= 16'd128; // enter
                8'h66: d_out <= 16'd129; // backspace
                8'h6b: d_out <= 16'd130; // left arrow
                8'h75: d_out <= 16'd131; // up arrow
                8'h74: d_out <= 16'd132; // right arrow
                8'h72: d_out <= 16'd133; // down arrow
                8'h6c: d_out <= 16'd134; // home
                8'h69: d_out <= 16'd135; // end
                8'h7d: d_out <= 16'd136; // page up
                8'h7a: d_out <= 16'd137; // page down
                8'h70: d_out <= 16'd138; // insert
                8'h71: d_out <= 16'd139; // delete
                8'h76: d_out <= 16'd140; // escape
                default: d_out <= 16'd0;
            endcase
        end
        else begin
            data_pre <= data_curr;
        end
    end

    endmodule