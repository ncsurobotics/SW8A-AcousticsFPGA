`timescale 1ns / 100ps

module UART_tb;

    reg clk = 1'b0;
    wire UART_clk;
    wire SPI_clk;
    reg reset_b = 1'b1;
    reg TX_en;
    reg [7:0] TX_Data_in = 8'd0;


    wire TX_Ready;
    wire RsTx;

    initial #200 reset_b = 1'b1;

    always #100 clk = ~clk;

    initial begin
        #300 TX_Data_in <= 8'b01000001;
        #100 TX_en <= 1'b1;
        #200 TX_en <= 1'b0;
        #500 TX_en <= 1'b1;
        #100 TX_en <= 1'b0;
        #1000 TX_Data_in <= 8'b01000110;
        #100 TX_en <= 1'b1;
        #100 TX_en <= 1'b0;
    end

    DATA_clks DATA_clks_inst(
        .clk_in1(clk),
        
        .SPI_clk(SPI_clk),
        .UART_clk(UART_clk)
    );

    UART_TX DUT(
        .clk(clk),
        .UART_clk(UART_clk),
        .reset_b(reset_b),
        .TX_en(TX_en),
        .TX_Data_in(TX_Data_in),

        .TX_Ready(TX_Ready),
        .RsTx(RsTx)
    );

endmodule