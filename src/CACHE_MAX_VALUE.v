module CACHE_MAX_VALUE (
    input clk,
    input reset_b,
    input [9:0] SPI_Data,
    input Bit_Counter_Sel,

    output reg [9:0] Channel_Max_Value
);
    /*wire [9:0] Current_Max_out;
    wire [9:0] Current_Max_in;


    always @ (posedge clk) begin
        if(!reset_b) begin
            Channel_Max_Value <= 10'b0;
        end
        else begin
            Current_Max_out <= Current_Max_out;
        end
    end

    assign Current_Max_in = (SPI_Data > Channel_Max_Value) ? SPI_Data:Channel_Max_Value;
    assign Current_Max_out = Bit_Count_Reached ? 10'b0:Current_Max_out;*/
    
    wire [9:0] max_value_or_reset;
    wire [9:0] new_or_old_data;
    
    always @ (posedge clk or negedge reset_b) begin
        if (!reset_b) Channel_Max_Value <= 10'b0;
        else Channel_Max_Value <= max_value_or_reset;
    end
    
    assign max_value_or_reset = Bit_Counter_Sel? new_or_old_data : 10'b0 ;
    assign new_or_old_data = (SPI_Data > Channel_Max_Value) ? SPI_Data : Channel_Max_Value;
    
endmodule