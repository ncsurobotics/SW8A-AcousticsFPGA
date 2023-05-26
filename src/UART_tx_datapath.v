// UART Transmit Datapath
// The BAUD_COMPARE and BIT_COUNTER submodules are located in UART_rx_datapath.v

module UART_TX_DATAPATH #(parameter BAUD = 11'd868) (
    input           clk,
    input           reset,
    input   [7:0]   UART_tx_in,

    input   [1:0]   shift_tx_sel,
    input   [1:0]   tx_out_sel,
    input   [1:0]   UART_Baud_Counter_sel,
    input   [1:0]   bit_counter_sel,
    //input           ready_to_send,

    output          baud_compare_val,
    output reg      tx_out,
    output          bit_counter_compare_val         
);

parameter [1:0]
    START_BIT = 2'b00,   // tx_out_sel vals
    STOP_BIT = 2'b10,
    DATA_BIT = 2'b11,

    ZERO = 2'b00,        // shift register select lines (shift_tx_sel)
    HOLD = 2'b01,        // in reality, 'ZERO' sets everything to 1s
    SHIFT = 2'b10,   
    DATA_IN = 2'b11;

wire tx_shift_reg_data; // serial data from shift register

// PISO shift register -- outputs tx_shift_reg_data
UART_TX_SHIFT_REG utsr  (   .tx_in(UART_tx_in),
                            .shift_tx_sel(shift_tx_sel),
                            .clk(clk),
                            .reset_b(reset_b),
                            .UART_tx_data(tx_shift_reg_data)
                        );

// baud rate counter -- counts up to 11'd868, determining state transitions; outputs to TX controller
BAUD_COMPARE  #  (   .ONE(11'd868), .ONE_ONE_HALF(11'd1301)  ) tx_baud_cmp
                            (   .UART_Baud_Counter_sel(UART_Baud_Counter_sel),
                                .Baud_Mid_Compare_sel(1'b1), // always compare to ONE = 11'd868
                                .clk(clk),
                                .reset_b(reset_b),
                                .Baud_Mid_Compare_val(baud_compare_val)
                            );

// bit counter -- counts how many bits have been sent; outputs to TX controller
BIT_COUNTER #    (   .MAX_COUNT(4'd8)    ) tx_bit_cnt 
                            (   .Bit_Counter_sel(bit_counter_sel),
                                .clk(clk),
                                .reset_b(reset_b),
                                .Bit_Counter_Compare_val(bit_counter_compare_val)
                            );

// determine value of tx_out: start (0), stop (1), or data
always @ (*) begin
    case (tx_out_sel)
        START_BIT: tx_out <= 1'b0;
        STOP_BIT:  tx_out <= 1'b1;
        DATA_BIT:  tx_out <= tx_shift_reg_data;
        default:   tx_out <= 1'b1; // by default send stop bit
    endcase
end

endmodule

// transmit shift register - 8-bit parallel word to send --> serial output
module UART_TX_SHIFT_REG(
    input   [7:0]   tx_in,
    input   [1:0]   shift_tx_sel,   // parallel in, hold, shift out, or set to 1's
    input           clk,
    input           reset_b,

    output          UART_tx_data    // assigned to LSB of shift register
);

parameter [1:0]
    ZERO = 2'b00,        // shift register select lines (shift_tx_sel)
    HOLD = 2'b01,        // in reality, 'ZERO' sets everything to 1s
    SHIFT = 2'b10,   
    DATA_IN = 2'b11;

    reg [7:0] shift_register;   // internal shift register

    always@(posedge clk or negedge reset_b)
    begin
        if(!reset_b) shift_register <= 8'b11111111;
        
        else begin
            case (shift_tx_sel)
                ZERO:    shift_register[7:0] <= 8'b11111111;
                HOLD:    shift_register[7:0] <= shift_register[7:0];
                SHIFT:   shift_register[7:0] <= {1'b1, shift_register[7:1]};
                DATA_IN: shift_register[7:0] <= tx_in[7:0]; 
                default: shift_register[7:0] <= 8'b11111111;
            endcase
        end
    end

    assign UART_tx_data = shift_register[0];
    
endmodule


