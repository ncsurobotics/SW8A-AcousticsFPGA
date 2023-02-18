// clock divider
module clock_div(input clk, reset, output reg clk2);

reg [2:0] counter = 3'b000;

always @ (posedge clk) begin
    if (!reset) begin
        counter <= 3'b000;
        clk2 <= 1'b0;
    end

    else if (counter == 6) begin
        counter <= 3'b000;
        clk2 <= !clk2;
    end

    else counter <= counter + 1;
end

endmodule


