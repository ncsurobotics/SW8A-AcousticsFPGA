// TRIGGER FFT Testbench -- July 20, 2023
// Simulates the entire top-level module with new TRIGGER_FFT and RING_BUFFER modules

`timescale 1ns / 1ps


module TRIGGER_FFT_tb();

reg clk = 1'b1;
reg reset_b = 1'b0;

top dut(.clk(clk),
        .btnU(reset_b)
);

always #10 clk = ~clk;

initial begin
#20 reset_b = 1'b0;
#100 reset_b = 1'b1;

$display("Reset done");
end

endmodule
