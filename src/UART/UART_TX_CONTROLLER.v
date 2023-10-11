// UART TX CONTROLLER -- 9/13/2023 -- Omar Obeid
// This is the new UART TX Controller made to eliminate the slow UART "clock" which was causing timing issues

module UART_TX_CONTROLLER(
    input clk, // 5.76 MHz
    input reset_b, // Active low

    input Count_Reached, empty,

    output reg Counter_Reset, // When IDLE, tell the clock counter in the Datapath to reset
    output reg [3:0] TX_Bit_sel, // Outputs a value 0-9 to the Datapath as the select line to a MUX
    output reg read_en,
    output reg Data_In_sel // to DP -- capture FIFO output
);

    // The States of the State Machine
    parameter [3:0]
        IDLE = 4'b0000,
        START = 4'b0001,
        D0 = 4'b0010,
        D1 = 4'b0011,
        D2 = 4'b0100,
        D3 = 4'b0101,
        D4 = 4'b0110,
        D5 = 4'b0111,
        D6 = 4'b1000,
        D7 = 4'b1001,
        STOP = 4'b1010,
        READ_EN = 4'b1011,
        WAIT = 4'b1100;
    
    reg [3:0] current_state, next_state;

    always @(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @ (*) begin
        case (current_state)
            // Waits until the outside world lets the TX know there is data to send. Until then, lets the outside world know that it is ready to recieve a new world and lets the counter know not to start counting, while sending STOP bits to the outside world.
            IDLE: begin
                Counter_Reset <= 1'b1;
                TX_Bit_sel <= 4'd9;
                read_en <= 1'b0;
                Data_In_sel <= 1'b0;
                next_state <= !empty ? READ_EN:IDLE;
            end
            READ_EN: begin
                Counter_Reset <= 1'b1;
                TX_Bit_sel <= 4'd9;
                read_en <=1'b1;
                Data_In_sel <= 1'b0;
                next_state <= WAIT;
            end
            WAIT: begin
                Counter_Reset <= 1'b1;
                TX_Bit_sel <= 4'd9;
                read_en <=1'b0;
                Data_In_sel <= 1'b1;
                //next_state <= data_valid ? START:WAIT;
                next_state <= START; // don't know why, but data_valid is never going high
            end
            // Lets the outside world know that TX is not ready to receive a new Word and lets the counter know to start counting. Each state below selects which bit of the Word the Datapath will output.
            START: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd0;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? D0:START;
            end
            D0: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd1;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? D1:D0;
            end
            D1: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd2;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? D2:D1;
            end
            D2: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd3;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? D3:D2;
            end
            D3: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd4;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? D4:D3;
            end
            D4: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd5;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? D5:D4;
            end
            D5: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd6;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? D6:D5;
            end
            D6: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd7;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? D7:D6;
            end
            D7: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd8;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? STOP:D7;
            end
            STOP: begin
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd9;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= Count_Reached ? IDLE:STOP;
            end
            // If we end up in this state something went horribly wrong, we want to let the outside world know we are NOT ready to receive a new word, reset the counter, and return to IDLE as soon as possible.
            default: begin
                Counter_Reset <= 1'b1;
                TX_Bit_sel <= 4'd9;
                read_en <=1'b0;
                Data_In_sel <= 1'b0;
                next_state <= IDLE;
            end
        endcase
    end

endmodule