module SPI_MAX_VALUE_CACHE_datapath #(
    parameter WORD_SIZE=16777215,
    parameter WORD_SIZE_WIDTH=24
) (
    input clk,
    input Slow_clk, // UART Clock
    input reset_b,
    input[9:0] SPI_Data_1,
    input[9:0] SPI_Data_2,
    input[9:0] SPI_Data_3,
    input[9:0] SPI_Data_4,
    input[2:0] Max_Value_Channel_sel,

    output reg [9:0] Max_Value
);
    parameter[2:0]
        CHANNEL_1=3'b001,
        CHANNEL_2=3'b010,
        CHANNEL_3=3'b011,
        CHANNEL_4=3'b100;

    wire [9:0] SPI_Max_1, SPI_Max_2, SPI_Max_3, SPI_Max_4;
    wire Bit_Count_Reached;
    wire Bit_Counter_sel;


    BIT_COUNTER #(.WORD_SIZE(WORD_SIZE), .WORD_SIZE_WIDTH(WORD_SIZE_WIDTH)) BIT_COUNTER_inst(
        .clk(Slow_clk),
        .reset_b(reset_b),
        .Bit_Counter_sel(1'b1),//always counting, count will overflow back to 0

        .Bit_Count_Reached(Bit_Count_Reached)
    );

    CACHE_MAX_VALUE SPI_1(
        .clk(clk),
        .reset_b(reset_b),
        .SPI_Data(SPI_Data_1),
        .Bit_Count_Reached(Bit_Count_Reached),
        
        .Channel_Max_Value(SPI_Max_1)
    );

    CACHE_MAX_VALUE SPI_2(
        .clk(clk),
        .reset_b(reset_b),
        .SPI_Data(SPI_Data_2),
        .Bit_Count_Reached(Bit_Count_Reached),
        
        .Channel_Max_Value(SPI_Max_2)
    );

    CACHE_MAX_VALUE SPI_3(
        .clk(clk),
        .reset_b(reset_b),
        .SPI_Data(SPI_Data_3),
        .Bit_Count_Reached(Bit_Count_Reached),
        
        .Channel_Max_Value(SPI_Max_3)
    );

    CACHE_MAX_VALUE SPI_4(
        .clk(clk),
        .reset_b(reset_b),
        .SPI_Data(SPI_Data_4),
        .Bit_Count_Reached(Bit_Count_Reached),
        
        .Channel_Max_Value(SPI_Max_4)
    );

    always @ (*) begin
        case(Max_Value_Channel_sel)
            CHANNEL_1: Max_Value <= SPI_Max_1;
            CHANNEL_2: Max_Value <= SPI_Max_2;
            CHANNEL_3: Max_Value <= SPI_Max_3;
            CHANNEL_4: Max_Value <= SPI_Max_4;
            default: Max_Value <= 10'b1111111111;
        endcase
    end



endmodule