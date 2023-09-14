// UART TX DATAPATH -- 9/13/2023 -- Ilena Johnson
// This is the new UART TX Datapath made to eliminate the slow UART "clock" which was causing timing issues.

module UART_TX_DATAPATH (
    input UART_clk, // 5.76 MHz
    input reset_b, // async

    input TX_en,                // TX_en and W2S are from outside modules
    input [7:0] Word_To_Send,   // but CDC is handled in UART_TX.v

    input TX_Ready,             // signals from TX_CONTROLLER
    input Counter_Reset,        
    input [3:0] TX_Bit_sel,     

    output Count_Reached,       // to TX_CONTROLLER -- counter counts the time to send 1 bit
    output RsTx                 // RsTx -- directly to the FPGA's RS232 peripheral
);

// Word To Send + Start Bit + Stop Bit --> RsTx
reg [9:0] tx_bits_register;
always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) tx_bits_register <= 10'b0;
    else begin
        if (TX_en & TX_Ready) tx_bits_register <= {1'b0, Word_To_Send[0:7], 1'b1}; // start bit + data, LSB --> MSB + stop bit
        else tx_bits_register <= tx_bits_register;
    end
end

assign RsTx = tx_bits_register[TX_Bit_sel];

// Counter -- counts from 0 to 49 -- 6 bits
// 49 = 50-1 where 50 = 5.76 MHz / 115200

reg [5:0] count_val_register;
always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) count_val_register <= 6'b0; // consider taking reset_b out of this
    else begin
        if (Counter_Reset | Count_Reached) count_val_register <= 6'b0; // if FSM is idle OR count "overflows" to 49, reset to 0
        else count_val_register <= count_val_register + 1;             // else, increment the counter
    end
end

assign Count_Reached = (count_val_register == 6'd49);

endmodule