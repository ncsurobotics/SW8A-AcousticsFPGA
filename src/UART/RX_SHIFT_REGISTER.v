//////////////////////////////////////////////////////////////////////////////////
// Company: AquaPack Robotics 
// Engineer: Christopher Mori
// 
// Create Date: 06/11/2023 04:39:10 PM
// Design Name: UART RX Driver
// Module Name: RX_SHIFT_REGISTER
// Project Name:UART Driver 
// Target Devices: Basys 3/Artix 7
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


module RX_SHIFT_REGISTER #(parameter WORD_SIZE=8) (

    input clk,
    input reset_b,
    input RX_Shift_Register_sel,
    input RX_Data_in,
    
    output wire[WORD_SIZE-1:0] RX_Data_out

);

    parameter 
        HOLD = 1'b0,
        SHIFT = 1'b1;
        
    reg [WORD_SIZE-1:0] RX_Shift_Register_reg;
    reg [WORD_SIZE-1:0] RX_Shift_Register;
    
    integer i;
    always@(posedge clk or negedge reset_b)begin
        if(!reset_b) begin
            for(i = 0; i < WORD_SIZE; i = i + 1) begin
                RX_Shift_Register_reg[i] <= 1'b1;
            end
        end
        
        else begin
            for(i = 0; i < WORD_SIZE; i = i + 1) begin
                RX_Shift_Register_reg[i] <= RX_Shift_Register[i];
            end
        end
    
    end
    
    always@(*) begin
        case(RX_Shift_Register_sel) 
            HOLD:
                for(i = 0; i < WORD_SIZE; i = i + 1) begin
                    RX_Shift_Register[i] <= RX_Shift_Register_reg[i];
                end
            SHIFT: begin
                for(i = 0; i < WORD_SIZE-1; i = i + 1) begin
                    RX_Shift_Register[i] <= RX_Shift_Register_reg[i+1];
                end
                RX_Shift_Register[WORD_SIZE-1] <= RX_Data_in; 
            end
        endcase    
    end
    
    assign RX_Data_out = RX_Shift_Register_reg;
    
endmodule
