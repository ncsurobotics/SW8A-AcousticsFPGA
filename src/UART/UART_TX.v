// UART TX -- 9/13/2023 -- Ilena Johnson
// This is the new UART TX made to eliminate the slow UART "clock" which was causing timing issues.
// Houses the Controller and Datapath; handles Clock Domain Crossing

module UART_TX (
    input clk, // 100 MHz
    input UART_clk, // 5.76 MHz,
    input reset_b,

    input TX_en, // all inputs are from outside modules running at 100 MHz
    input [7:0] TX_Data_in,

    output TX_Ready,    // changes slowly; it's the outside module's responsibility 
                        // to check whether Ready has gone high before it goes low
    output RsTx   // to RS232 peripheral
);

// Clock Domain Crossing for TX_en and TX_Data_in
// Outside TX_en, TX_Data_in --> [100 MHz FF] --> [5.76 MHz FF] --> Controller and Datapath
reg TX_en_100, TX_en_576;
reg [7:0] TX_Data_in_100, TX_Data_in_576;
always @ (posedge clk) begin
    TX_en_100 <= TX_en;
    TX_Data_in_100 <= TX_Data_in; 
end
always @ (posedge UART_clk) begin
    TX_en_576 <= TX_en_100;
    TX_Data_in_576 <= TX_Data_in_100;
end

// Clock Domain Crossing for TX_

endmodule