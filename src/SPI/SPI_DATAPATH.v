//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2023 10:10:14 PM
// Design Name: 
// Module Name: SPI_DATAPATH
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SPI_DATAPATH #(parameter WIDTH=10, parameter TOTAL_BITS=14) (
    
    //input clk,
    input SPI_clk,
    input reset_b,
    input SPI_Data_in,
    input Bit_Counter_sel,
    input Data_Ready,
    input RX_Shift_Register_sel,
    
    output wire [WIDTH-1:0] SPI_Data_out,
    output Bit_Count_Reached
    
);

    reg [WIDTH-1:0] SPI_Data_out_reg;
    reg [WIDTH-1:0] SPI_Data_out_next;
    wire [WIDTH-1:0] SPI_Shift_Register_out;     

    SIPO SPI_SHIFT_REG(
    
        .clk(SPI_clk),
        .data_in(SPI_Data_in),
        .reset_b(reset_b),
        .data_logging(RX_Shift_Register_sel),
        .data_out(SPI_Shift_Register_out)
    
    );
    
    
    /*always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            SPI_Data_out_reg <= 0;
        end
        else begin
            SPI_Data_out_reg <= SPI_Data_out_next;
        end
    end*/
    
    always@(*) begin
        if(Data_Ready) begin
            SPI_Data_out_next <= SPI_Shift_Register_out;
        end
        else begin
            SPI_Data_out_next <= SPI_Data_out_reg;
        end
    end
    
    
    BIT_COUNTER #(.WORD_SIZE(TOTAL_BITS-1),.WORD_SIZE_WIDTH($clog2(TOTAL_BITS))) BIT_COUNTER_inst (
    
        .clk(SPI_clk),
        .reset_b(reset_b),
        .Bit_Counter_sel(Bit_Counter_sel),
        
        .Bit_Count_Reached(Bit_Count_Reached)
    
    ); 

    //assign SPI_Data_out = SPI_Data_out_reg;
    assign SPI_Data_out = SPI_Shift_Register_out;

endmodule
