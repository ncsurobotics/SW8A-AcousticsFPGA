module CACHE_MAX_VALUE (
    input clk,
    input reset_b,
    input [9:0] SPI_Data,
    input Bit_Count_Reached,

    output [9:0] Channel_Max_Value
);
    wire [9:0] Current_Max_out;
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
    assign Current_Max_out = Bit_Count_Reached ? Current_Max_out: 10'b0;
    
endmodule