// UART TX -- 9/13/2023 -- Ilena Johnson
// This is the new UART TX made to eliminate the slow UART "clock" which was causing timing issues.
// Houses the Controller and Datapath; handles Clock Domain Crossing

module UART_TX (
    input clk, // 100 MHz
    input UART_clk, // 5.76 MHz,
    input reset_b,

    input TX_en, // all inputs are from outside modules running at 100 MHz
    input [7:0] TX_Data_in,

    output reg TX_Ready,    // changes slowly; it's the outside module's responsibility 
                        // to check whether Ready has gone high before it goes low
    output TX_Data_out   // to RS232 peripheral
);

wire Counter_Reset, Count_Reached;
wire [3:0] TX_Bit_sel;

// Clock Domain Crossing for TX_en and TX_Data_in
// Outside TX_en, TX_Data_in --> [100 MHz FF] --> [5.76 MHz FF] --> Controller and Datapath

reg TX_en_100, TX_en_576;
(* ASYNC_REG = "TRUE" *) reg [7:0]TX_Data_in_576;
reg [7:0] TX_Data_in_100;

always @ (posedge clk) begin
    TX_en_100 <= TX_en;
    TX_Data_in_100 <= TX_Data_in;
end
always @ (posedge UART_clk) begin
    TX_en_576 <= TX_en_100;
    TX_Data_in_576 <= TX_Data_in_100;
end

// Clock Domain Crossing for TX_Ready
// Controller and Datapath --> [5.76 MHz FF] --> [100 MHz FF] --> TX_Ready
wire TX_Ready_Controller;
(* ASYNC_REG = "TRUE" *) reg TX_Ready_576;
always @ (posedge UART_clk) begin
    TX_Ready_576 <= TX_Ready_Controller;
end
always @ (posedge clk) begin
    TX_Ready <= TX_Ready_576;
end


UART_TX_DATAPATH UART_TX_DATAPATH_inst(
    .clk(UART_clk),
    .reset_b(reset_b),
    .TX_en(TX_en_576),
    .Word_To_Send(TX_Data_in_576),
    .TX_Ready(TX_Ready_Controller),
    .Counter_Reset(Counter_Reset),
    .TX_Bit_sel(TX_Bit_sel),

    .Count_Reached(Count_Reached),
    .TX_Data_out(TX_Data_out)
);

UART_TX_CONTROLLER UART_TX_CONTROLLER_inst(
    .clk(UART_clk),
    .reset_b(reset_b),
    .TX_en(TX_en_576),
    .Count_Reached(Count_Reached),

    .TX_Ready(TX_Ready_Controller),
    .Counter_Reset(Counter_Reset),
    .TX_Bit_sel(TX_Bit_sel)
);

endmodule