module SPI_tb();

    reg clk = 0;
    reg reset_b;
    wire SPI_clk;

    wire [9:0] SPI_Data_out;

    reg SPI_en;
    reg adc1;
    wire Data_Ready;
    wire CS;

    reg [9:0] x_data;

    always #5 clk = ~clk;

    DATA_clks DATA_clks_inst(
        .clk_in1(clk),
        .SPI_clk(SPI_clk)
    );

    initial begin
        reset_b = 0;
        SPI_en = 0;
        #100 reset_b = 1;
        #100 SPI_en = 1;
        while(!Data_Ready) @ (posedge clk)
        #50  x_data = 10'h2A4;
        while(Data_Ready) @ (posedge clk)
        while(!Data_Ready) @ (posedge clk)
        #50 x_data = 10'h1B6;
    end

    integer index;
    task drive_adc;
        input reg [9:0]                x_data;

        begin
            index = 9;
            adc1 = 1'b0;
            repeat(5)@(posedge SPI_clk);
            while (index >= 0) begin
                adc1 = x_data[index];
                index = index - 1;
                @ (posedge SPI_clk);
            end
        end
    endtask

    always @ (negedge CS) begin
        drive_adc(x_data);
    end

    SPI SPI_inst(
        .clk(clk),
        .SPI_clk(SPI_clk),
        .reset_b(reset_b),
        .SPI_Data_in(adc1),
        .SPI_en(SPI_en),

        .SPI_Data_out(SPI_Data_out),
        .Data_Ready(Data_Ready),
        .CS(CS)
    );



endmodule