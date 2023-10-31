`timescale 1ns / 100ps

// Runs 2 UART modules into each other: "tester" which sends out a TX and gets back an RX,
// and "loopback" which transmits any word it receives

module UART_loopback_tb;

    reg clk = 1'b0;
    wire UART_clk;
    reg reset_b = 1'b1;

    reg reader_TX_en = 1'b0;
    reg [7:0] reader_TX_Data_in = 8'd0;
    wire reader_TX_Ready;
    wire reader_TX_Data_out;

    wire loopback_TX_out; //into reader RX
    wire [7:0] reader_RX_Data_out;
    wire reader_RX_Ready;

    always #5 clk = ~clk;
    
    DATA_clks DATA_clks_inst(
        .clk_in1(clk),
        
        .UART_clk(UART_clk)
    );

    UART #(.WORD_SIZE(8), .WORD_SIZE_WIDTH(4)) tester ( 
        .clk(clk),
        .UART_clk(UART_clk),
        .reset_b(reset_b),

        .TX_Data_in(reader_TX_Data_in),
        .TX_en(reader_TX_en),
        .RX_Data_in(loopback_TX_out),

        .TX_Data_out(reader_TX_Data_out),
        .TX_Ready_To_Send(reader_TX_Ready),
        .RX_Data_out(reader_RX_Data_out),
        .RX_Data_Ready(reader_RX_Ready)
    );

    loopback dut(   // defined below
        .clk(clk),
        .UART_clk(UART_clk),
        .reset_b(reset_b),
        .RX_Data_in(reader_TX_Data_out),
        .TX_Data_out(loopback_TX_out)
    );

    initial begin
        @ (posedge UART_clk)
        @ (posedge clk) reset_b = 1'b0;
        repeat (10) @ (posedge clk);
        reset_b = 1'b1;
        while (!reader_TX_Ready) @ (posedge clk);
        @ (posedge clk) reader_TX_Data_in <= 8'b01000001;
            reader_TX_en <= 1'b1;
        @ (posedge clk) reader_TX_en <= 1'b0;
        #10
        while (!reader_RX_Ready) @ (posedge clk);
        $display("TX in: 0x%h  RX out: 0x%h", reader_TX_Data_in, reader_RX_Data_out);
        while (!reader_TX_Ready) @ (posedge clk); // shouldn't really happen
        reader_TX_Data_in = 8'b01000110;
        reader_TX_en = 1'b1;
        while (reader_TX_Ready) @ (posedge clk);
        reader_TX_en <= 1'b0;
        #10
        while (!reader_RX_Ready) @ (posedge clk);
        $display("TX in: 0x%h  RX out: 0x%h", reader_TX_Data_in, reader_RX_Data_out);
    end

endmodule

module loopback (
    input clk,
    input UART_clk,
    input reset_b,

    input RX_Data_in,

    output TX_Data_out
);

    wire [7:0] Word_To_Send;
    wire rx_ready;
    wire tx_ready;

    UART #(.WORD_SIZE(8), .WORD_SIZE_WIDTH(4)) lb_uart( 
        .clk(clk),
        .UART_clk(UART_clk),
        .reset_b(reset_b),

        .TX_Data_in(Word_To_Send),
        .TX_en(rx_ready),
        .RX_Data_in(RX_Data_in),

        .TX_Data_out(TX_Data_out),
        .TX_Ready_To_Send(tx_ready),
        .RX_Data_out(Word_To_Send),
        .RX_Data_Ready(rx_ready)
    );
    
endmodule