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
    output TX_Data_out   // to RS232 peripheral
);

wire Counter_Reset, Count_Reached;
wire [3:0] TX_Bit_sel;
wire [7:0] TX_Data_in_576;
wire empty, data_in_sel;
wire wr_rst_busy, rd_rst_busy, rst_busy;

//assign TX_Ready = rst_busy ? 1'b0 : ~full;
assign TX_Ready = ~wr_rst_busy && ~full; 
//assign rst_busy = !reset_b | wr_rst_busy | rd_rst_busy;

// registering wr_en and data_in to fix timing violation
/*reg [7:0] data_in_fifo;
reg write_en_fifo;
always @ (posedge clk) begin
    data_in_fifo <= TX_Data_in;
    write_en_fifo <= TX_en & ~wr_rst_busy;
end*/

// Clock Domain Crossing for TX_Data_in
xpm_fifo_async #(
    .FIFO_WRITE_DEPTH(5'd16), .READ_DATA_WIDTH(4'd8), .WRITE_DATA_WIDTH(4'd8)
) MASTER_TO_UART(
    .din(TX_Data_in),
    .rst(~reset_b), // FIFO has an active high reset
    .wr_clk(clk),
    .wr_en(TX_en),
    .rd_clk(UART_clk),
    .rd_en(read_en),
    .wr_rst_busy(wr_rst_busy),
    .rd_rst_busy(rd_rst_busy),

    .dout(TX_Data_in_576),
    .full(full),
    .empty(empty)
    //.data_valid(data_valid)
);


UART_TX_DATAPATH UART_TX_DATAPATH_inst(
    .clk(UART_clk),
    .reset_b(reset_b),
    //.data_valid(data_valid),
    .Data_In_sel(data_in_sel),
    .Word_To_Send(TX_Data_in_576),
    .Counter_Reset(Counter_Reset),
    .TX_Bit_sel(TX_Bit_sel),

    .Count_Reached(Count_Reached),
    .TX_Data_out(TX_Data_out)
);

UART_TX_CONTROLLER UART_TX_CONTROLLER_inst(
    .clk(UART_clk),
    .reset_b(reset_b),
    //.data_valid(data_valid),
    .Count_Reached(Count_Reached),
    .empty(empty),
    .rd_rst_busy(rd_rst_busy),

    .Counter_Reset(Counter_Reset),
    .Data_In_sel(data_in_sel),
    .TX_Bit_sel(TX_Bit_sel),
    .read_en(read_en)
);

endmodule