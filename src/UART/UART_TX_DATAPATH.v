// UART TX DATAPATH -- 9/13/2023 -- Ilena Johnson
// This is the new UART TX Datapath made to eliminate the slow UART "clock" which was causing timing issues.

module UART_TX_DATAPATH (
    input clk, // 5.76 MHz
    input reset_b, // async

    input Data_In_sel,            
    input [7:0] Word_To_Send,   // but CDC is handled in UART_TX.v

    input Counter_Reset,        
    input [3:0] TX_Bit_sel,     

    output Count_Reached,       // to TX_CONTROLLER -- counter counts the time to send 1 bit
    output TX_Data_out                 // TX_Data_out -- directly to the FPGA's RS232 peripheral
);

// Word To Send + Start Bit + Stop Bit --> TX_Data_out
integer i;
reg [9:0] tx_bits_register;
always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) tx_bits_register <= 10'b11_1111_1111;
    else begin
        if (Data_In_sel) begin // start bit + data, LSB --> MSB + stop bit
            //tx_bits_register[9] <= 1'b0;
            //tx_bits_register[0] <= 1'b1;
            //for (i=8; i>0; i=i-1) begin
            //    tx_bits_register[i] <= Word_To_Send[8-i];
            //end
            tx_bits_register <= {1'b1, Word_To_Send[7:0], 1'b0};
        end 
        else tx_bits_register <= tx_bits_register;
    end
end

assign TX_Data_out = tx_bits_register[TX_Bit_sel];

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