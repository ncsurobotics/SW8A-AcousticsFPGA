module uart_tb();

reg clk, reset;
reg adc1;
reg RsRx;

wire cs;
wire spi_clk_out;
wire RsTx;
wire rx_state_debug;
wire seg;
wire an;

top dut (   .clk(clk),
            .reset(reset),
            .adc1(adc1),
            .cs(cs),
            .spi_clk_out(spi_clk_out),
            .RsRx(RsRx),
            .RsTx(RsTx),
            .rx_state_debug(rx_state_debug),
            .seg(seg),
            .an(an)
        );

clk = 0;
reset = 1;

always #1 clk = ~clk;

initial begin
    #1 reset = 0;
    #1 reset = 1;

    
    
end
    
endmodule