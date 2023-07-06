
module button_handler (
    input clk, 
    input button_pressed,
    
    output reg button_out
);

//reg [19:0] counter_val = 21'b0;
wire [19:0] counter_val;
reg current_state, next_state;
reg counter_next;
reg counter_sel;

parameter
    PRESSED = 1'b1,
    NOT_PRESSED = 1'b0;
    
wire Bit_Count_Reached;

BIT_COUNTER #(.WORD_SIZE(10000000), .WORD_SIZE_WIDTH(24)) button_counter( 

                        .clk(clk),
                        .reset_b(1'b1),
                        .Bit_Counter_sel(counter_sel),
                        .Bit_Count_Reached(Bit_Count_Reached)
                        
);

always @ (posedge clk) begin
    current_state <= next_state;   
end

always @ (*) begin
    case (current_state)
        NOT_PRESSED: begin
            if(button_pressed) next_state <= PRESSED;
            else next_state <= NOT_PRESSED;
            counter_sel <= 1'b0;
            button_out <= 1'b0;
        end
        PRESSED: begin
            if(Bit_Count_Reached) next_state <= NOT_PRESSED;
            else next_state <= PRESSED;
            counter_sel <= 1'b1;
            button_out <= 1'b1;
        end
    endcase
end

endmodule



module seven_segment (
    input clk, btnC,
    input [15:0] decimal_num,
    output reg [6:0] segments,
    output reg [3:0] anode
);

// 7-segment bitmap
parameter [6:0] 
    ZERO  = 7'b100_0000,
    ONE   = 7'b111_1001,
    TWO   = 7'b010_0100,
    THREE = 7'b011_0000, 
    FOUR  = 7'b001_1001,  
    FIVE  = 7'b001_0010,
    SIX   = 7'b000_0010,
    SEVEN = 7'b111_1000,
    EIGHT = 7'b000_0000,
    NINE  = 7'b001_0000,
    A     = 7'b000_1000,
    B     = 7'b000_0011,
    C     = 7'b100_0110,
    D     = 7'b010_0001,
    E     = 7'b000_0110,
    F     = 7'b000_1110;

// 7-seg display digit anodes
parameter [3:0]
    A0 = 4'b1110,
    A1 = 4'b1101,
    A2 = 4'b1011,
    A3 = 4'b0111;



// change digit illuminated every 0.25 ms
reg [1:0] digit_sel;
reg [14:0] digit_timer; 

always @ (posedge clk) begin

    if (btnC) begin
        digit_timer <= 0;
        digit_sel <= 0;
    end

    else if (digit_timer == 25000) begin
        digit_timer <= 0;
        digit_sel <= digit_sel + 1;
    end

    else digit_timer <= digit_timer + 1;

end

reg [3:0] encode_bits;

always @ (*) begin

    case (digit_sel)
        2'b00: begin
            anode = A0;
            encode_bits = decimal_num[3:0]; 
        end

        2'b01: begin
            anode = A1;
            encode_bits = decimal_num[7:4];
        end

        2'b10: begin
            anode = A2;
            encode_bits = decimal_num[11:8];
        end

        2'b11: begin
            anode = A3;
            encode_bits = decimal_num[15:12];
        end

        default: begin
            anode = 4'b1111; // turn off every segment
            encode_bits = decimal_num[3:0];
        end
    endcase

    case (encode_bits)
        4'b0000 : segments = ZERO;
        4'b0001 : segments = ONE;
        4'b0010 : segments = TWO;
        4'b0011 : segments = THREE;
        4'b0100 : segments = FOUR;
        4'b0101 : segments = FIVE;
        4'b0110 : segments = SIX;
        4'b0111 : segments = SEVEN;
        4'b1000 : segments = EIGHT;
        4'b1001 : segments = NINE;
        4'b1010 : segments = A;
        4'b1011 : segments = B;
        4'b1100 : segments = C;
        4'b1101 : segments = D;
        4'b1110 : segments = E;
        4'b1111 : segments = F;
    endcase

end

endmodule