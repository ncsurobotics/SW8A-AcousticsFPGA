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
    
    GENERAL_COUNT #(.COUNT_VAL(54), . COUNT_VAL_WIDTH(6)) BAUD_COUNTER (
    
        .clk(clk),
        .reset_b(reset_b),
        .Count_sel(Baud_Counter_sel),
        
        .Count_Reached(Baud_Count_Reached) 
    
    );
    
    GENERAL_COUNT #(.COUNT_VAL(8), . COUNT_VAL_WIDTH(4)) BIT_COUNTER (
    
        .clk(clk),
        .reset_b(reset_b),
        .Count_sel(Bit_Counter_sel),
        
        .Count_Reached(Bit_Count_Reached) 
    
    );
    
    
endmodule
