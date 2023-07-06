module CACHE_MAX_VALUE (
    input clk,
    input reset_b,
    input [9:0] SPI_Data,
    input Bit_Count_Reached,

    output reg [9:0] Channel_Max_Value
);
    
    wire [9:0] max_value;
    wire [9:0] max_value_comparator_out;
    
    always @ (posedge clk or negedge reset_b) begin
        if (!reset_b) Channel_Max_Value <= 10'b0;
        else Channel_Max_Value <= max_value;
    end
    
    assign max_value = Bit_Count_Reached? 10'b0 : max_value_comparator_out;
    assign max_value_comparator_out = (SPI_Data > Channel_Max_Value) ? SPI_Data : Channel_Max_Value;
    
endmodule