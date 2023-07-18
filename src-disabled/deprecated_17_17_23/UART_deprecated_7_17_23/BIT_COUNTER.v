//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2023 04:35:11 PM
// Design Name: 
// Module Name: BIT_COUNTER
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




module BIT_COUNTER #(
    parameter WORD_SIZE = 8,
    parameter WORD_SIZE_WIDTH = 4
) (

    input clk,
    input reset_b,
    input Bit_Counter_sel,
    
    output wire Bit_Count_Reached

);


    parameter 
        ZERO      = 1'b0,
        INCREMENT    = 1'b1;

    
    reg [WORD_SIZE_WIDTH-1 : 0] Bit_Counter_Value;
    reg [WORD_SIZE_WIDTH-1 : 0] Bit_Counter_Value_reg;

    always @ (posedge clk or negedge reset_b)begin
        if( !reset_b ) begin
            Bit_Counter_Value_reg <= 0;
        end
        else begin
            Bit_Counter_Value_reg <= Bit_Counter_Value;
        end
    end

    always @ (*)begin
        case(Bit_Counter_sel)
                ZERO        :   Bit_Counter_Value <= 0;
                INCREMENT   :   Bit_Counter_Value <= Bit_Counter_Value_reg + 1;
            endcase 
    end


    assign Bit_Count_Reached = (Bit_Counter_Value_reg == WORD_SIZE);


endmodule