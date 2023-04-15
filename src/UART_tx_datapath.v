module UART_TX_DATAPATH #(
    parameter BAUD = 11'868
) (
    input           clk,
    input   [7:0]   UART_tx_in,

    input   [1:0]   shift_tx_sel,
    input   [1:0]   tx_out_sel,
    input   [1:0]   UART_Baud_Counter_sel,
    input   [1:0]   bit_counter_sel,
    input           ready_to_send,

    output          baud_compare_val,
    output          tx_out,
    output          bit_counter_compare_val         

);





    
endmodule


module UART_RX_SHIFT_REG(
    input   [7:0]   UART_tx_in,
    input   [1:0]   shift_tx_sel,
    input   [1:0]   tx_out_sel,
    input           clk,
    input           reset_b,

    output          UART_Tx_Data
);

    always@(posedge clk, or negedge reset_b)
    begin
        if(!reset_b) UART_Tx_Data <= 1'b0;

    end
    
endmodule







