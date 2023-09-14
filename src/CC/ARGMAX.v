module ARGMAX (
    input clk,
    input reset_b,
    input Frame_Start,
    input [31:0] Value_in,
    input [7:0]  Index_in,
    output reg [7:0] Max_Index
);

    reg [31:0] max_value_next;
    reg [31:0] max_value_reg;
    reg [7:0] max_index_next;
    
    always @ (posedge clk or negedge reset_b) begin
        if (!reset_b || Frame_Start) begin
            max_value_reg <= 32'b0;
            Max_Index <= 8'b0;
        end
        else begin
            max_value_reg <= max_value_next;
            Max_Index <= max_index_next;
        end
    end

    always @ (*) begin
        if ($signed(Value_in) > $signed(max_value_reg)) begin
            max_value_next <= Value_in;
            max_index_next <= Index_in;
        end
        else begin
            max_value_next <= max_value_reg;
            max_index_next <= Max_Index;
        end
    end    
    
endmodule