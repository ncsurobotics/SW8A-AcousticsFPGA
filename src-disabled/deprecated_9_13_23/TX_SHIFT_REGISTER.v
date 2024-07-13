//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2023 04:37:10 PM
// Design Name: 
// Module Name: TX_SHIFT_REGISTER
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




module TX_SHIFT_REGISTER #(parameter WORD_SIZE=8)(

    input clk,
    input reset_b,
    input [1:0] TX_Shift_Register_sel,
    input [WORD_SIZE-1:0] TX_Data_in,
    
    output wire TX_Data_out

);

    parameter [1:0]
        CLEAR = 2'b00,
        SHIFT = 2'b01,
        LOAD  = 2'b10;


    reg [WORD_SIZE+1:0] TX_Shift_Register_reg;
    reg [WORD_SIZE+1:0] TX_Shift_Register;
    
    integer i;
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            for(i = 0; i < WORD_SIZE+2; i = i + 1) begin
                TX_Shift_Register_reg[i] <= 1'b1;
            end
        end
        else begin
            for(i = 0; i < WORD_SIZE+2; i = i + 1) begin
                TX_Shift_Register_reg[i] <= TX_Shift_Register[i];
            end
        end
    end
    
    always@(*)begin
        case(TX_Shift_Register_sel)
            CLEAR:
                for(i = 0; i < WORD_SIZE+2; i = i + 1) begin
                    TX_Shift_Register[i] <= 1'b1;
                end
            SHIFT: begin
                for(i = 0; i < WORD_SIZE+1; i = i + 1) begin 
                    TX_Shift_Register[i] <= TX_Shift_Register_reg[i+1];
                end 
                TX_Shift_Register[WORD_SIZE+1] <= 1'b1;
            end
            LOAD: begin
                TX_Shift_Register[0] <= 1'b0;
                TX_Shift_Register[WORD_SIZE+1] <= 1'b1;
                TX_Shift_Register[WORD_SIZE:1] <= TX_Data_in;  
            end
            default: begin
                for(i = 0; i < WORD_SIZE+2; i = i + 1) begin
                    TX_Shift_Register[i] <= 1'b1;
                end
            end
        endcase
    end

    assign TX_Data_out = TX_Shift_Register_reg[0];

endmodule