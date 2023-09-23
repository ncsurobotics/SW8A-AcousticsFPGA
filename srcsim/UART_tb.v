`timescale 1ns / 100ps

module UART_tb;

    reg clk = 1'b0;
    wire UART_clk;
    reg reset_b = 1'b1;
    reg TX_en = 1'b0;
    reg [7:0] TX_Data_in = 8'd0;


    wire TX_Ready;
    wire RsTx;
    wire [7:0] RX_Data_out;
    wire RX_Ready;

    always #5 clk = ~clk;
    
    DATA_clks DATA_clks_inst(
        .clk_in1(clk),
        
        .UART_clk(UART_clk)
    );

    UART #(.WORD_SIZE(8), .WORD_SIZE_WIDTH(4)) dut ( 
        .clk(clk),
        .UART_clk(UART_clk),
        .reset_b(reset_b),

        .TX_Data_in(TX_Data_in),
        .TX_en(TX_en),
        .RX_Data_in(RsTx),

        .TX_Data_out(RsTx),
        .TX_Ready_To_Send(TX_Ready),
        .RX_Data_out(RX_Data_out),
        .RX_Data_Ready(RX_Ready)
    );

    initial begin
        #50 reset_b = 1'b1;
        #50 TX_Data_in <= 8'b01000001;
            TX_en <= 1'b1;
        while (TX_Ready) @ (posedge clk);
        TX_en <= 1'b0;
        #10
        while (!RX_Ready) @ (posedge clk);
        $display("TX in: 0x%h  RX out: 0x%h", TX_Data_in, RX_Data_out);
        while (!TX_Ready) @ (posedge clk); // shouldn't really happen
        TX_Data_in = 8'b01000110;
        TX_en = 1'b1;
        while (TX_Ready) @ (posedge clk);
        TX_en <= 1'b0;
        #10
        while (!RX_Ready) @ (posedge clk);
        $display("TX in: 0x%h  RX out: 0x%h", TX_Data_in, RX_Data_out);
    end

endmodule