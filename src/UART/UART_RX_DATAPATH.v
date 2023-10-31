module UART_RX_DATAPATH #(parameter WORD_SIZE=8, parameter WORD_SIZE_WIDTH=4)(

    input clk,
    input reset_b,
    input [1:0] Bit_Counter_sel,
    input RX_Shift_Register_sel,
    input RX_Data_in,
    input [1:0] Baud_Counter_sel,
    
    output wire[WORD_SIZE-1:0] RX_Data_out,
    output wire Baud_Count_Reached,
    output wire Bit_Count_Reached
    
);

    RX_SHIFT_REGISTER #(.WORD_SIZE(WORD_SIZE)) RX_SHIFT_REGISTER_inst (
    
        .clk(clk),
        .reset_b(reset_b),
        .RX_Shift_Register_sel(RX_Shift_Register_sel),
        .RX_Data_in(RX_Data_in),
        .RX_Data_out(RX_Data_out)
    
    );
    
    // This counter's "Count Reached" samples the incoming UART line, and is timed to sample at even intervals
    // Sampling every 9370 ns guarantees that each data bit is sampled once, at a different "place" each bit
    // e.g. --> ¯¯¯¯|________|   D0   |   D1   |   D2   |   D3   |   D4   |   D5   |   D6   |   D7   |¯¯¯¯¯¯¯
    // sample                ^         ^         ^         ^         ^         ^         ^         ^
    GENERAL_COUNTER #(.COUNT_VAL(937), . COUNT_BIT_WIDTH(10)) BAUD_COUNTER (
    
        .clk(clk),
        .reset_b(reset_b),
        .Count_sel(Baud_Counter_sel),
        
        .Count_Reached(Baud_Count_Reached) 
    
    );
    
    GENERAL_COUNTER #(.COUNT_VAL(8), . COUNT_BIT_WIDTH(4)) BIT_COUNTER (
    
        .clk(clk),
        .reset_b(reset_b),
        .Count_sel(Bit_Counter_sel),
        
        .Count_Reached(Bit_Count_Reached) 
    
    );
    
    
endmodule
