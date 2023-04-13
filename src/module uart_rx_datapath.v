module UART_RX_DATAPATH(
    input           clk,
    input           UART_rx_in,
    input           shift_rx_sel,
    input           baud_mid_counter_sel,
    input           UART_baud_counter_sel,
    input           bit_counter_sel,
    input           reset_b,

    output          baud_mid_compare_val,
    output          bit_counter_compare_val,
    output  [7:0]   UART_rx_data_out


);
    UART_RX_SHIFT_REG ursr  (   .RX_in(UART_rx_in),
                                .Shift_Rx_sel(shift_rx_sel),
                                .clk(clk),
                                .reset_b(reset_b),
                                .UART_Rx_Data(UART_rx_data_out)
                            );

    BAUD_MID_COMPARE bmc    (   .Baud_Mid_Compare_val(baud_mid_compare_val),
                                .UART_Baud_Counter_sel(UART_baud_counter_sel),
                                .Baud_Mid_Compare_sel(baud_mid_counter_sel),
                                .clk(clk),
                                .reset_b(reset_b),
                                .Baud_Mid_Compare_val(baud_mid_compare_val)
                            );
    
    BIT_COUNTER      bc     (   .Bit_Counter_sel(bit_counter_sel),
                                .clk(clk),
                                .reset_b(reset_b),
                                .Bit_Couter_Compare_val(bit_counter_compare_val)
                            );    


endmodule


module UART_RX_SHIFT_REG(
    input           RX_in,
    input           Shift_Rx_sel,
    input           clk,
    input           reset_b,

    output  [7:0]   UART_Rx_Data
);

    always@(posedge clk or negedge reset_b) 
    begin
        if(!reset_b) UART_Rx_Data <= 7'b0;
        else 
        begin
        
            for(int i = 0; i < 8, i+=1) 
            begin
                if(Shift_Rx_sel)
                    UART_Rx_Data[i + 1] <= UART_Rx_Data[i];
                else 
                    UART_Rx_Data[i] = UART_Rx_Data[i];
            end 
            UART_Rx_Data[0] <= RX_in;

        end 
    end 
endmodule

module BAUD_MID_COMPARE
   #(parameter ONE = 11'd866,
     parameter ONE_ONE_HALF = 11'd1301)

    (
    input           Baud_Mid_Compare_val,
    input   [1:0]   UART_Baud_Counter_sel,
    input           Baud_Mid_Compare_sel,
    input           clk,
    input           reset_b,

    output          Baud_Mid_Compare_val
);

    reg     [10:0]  Baud_Counter_val;
    wire    [10:0]  compare_val;

    always@(posedge clk or negedge reset_b)
    begin
        case(UART_Baud_Counter_sel)
            2'b00:
                Baud_Counter_val <= 11'b0;
            2'01:
                Baud_Counter_val <= Baud_Counter_val;
            2'b10:
                Baud_Counter_val <= Baud_Counter_val;
            2'b11:
                Baud_Counter_val <= Baud_Counter_val + 1;
            default:
                Baud_Counter_val <= Baud_Counter_val;
        endcase 
    end 

    assign compare_val = Baud_Mid_Compare_sel ? ONE : ONE_ONE_HALF;

    assign Baud_Mid_Compare_val = (compare_val == Baud_Counter_val);

endmodule

module BIT_COUNTER(
    input   [1:0]   Bit_Counter_sel,
    input           clk,
    input           reset_b,

    output          Bit_Counter_Compare_val
);

    reg     [3:0] Bit_Counter_val;
    
    always@(posedge clk or negedge rest_b)
    begin
        case(Bit_Counter_sel)
            2'b00:
                Bit_Counter_val <= 4'b0;
            2'01:
                Bit_Counter_val <= Bit_Counter_val;
            2'b10:
                Bit_Counter_val <= Bit_Counter_val;
            2'b11:
                Bit_Counter_val <= Bit_Counter_val + 1;
            default:
                Bit_Counter_val <= Bit_Counter_val;
        endcase
    end

    assign Bit_Counter_Compare_val = (4'd8 == Bit_Counter_val);

endmodule