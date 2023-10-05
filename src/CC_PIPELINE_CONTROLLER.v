// CC PIPELINE CONTROLLER -- controller for some enable/start signals for the whole
// SPI -> Trigger -> CC pipeline. Sits in Primary, no associated datapath.

module CC_PIPELINE_CONTROLLER (
    input clk,
    input slow_clk, // UART_clk -- 5.76 MHz
    input SPI_clk, // solely for SPI_en CDC
    input reset_b,
    input Trigger,
    input CC_Done,
    input Tx_Ready,
    input RsTx,
    //input [7:0] Max_Index, // from CC Block

    output reg Trigger_Persistant, // persistant Triggered signal for Ring Buffer
    output reg Start_CC, // for CC Block
    output reg TX_en,
    output reg TX_Write_en,
    output SPI_en // disable the SPI after triggering
);

reg [2:0] current_state, next_state;
//reg [7:0] max_index_reg, max_index_next; // stores Max_Index, probably not actually needed or you could modify Argmax so that Max_Index is persistant

// wires to/from internal General Counter 
wire post_cc_timeout;
reg [1:0] count_sel;
reg spi_en_int; // spi_en_internal; 100 MHz combinational logic

localparam [2:0]
    IDLE = 3'b000,
    TRIGGERED = 3'b001,
    WAIT_FOR_CC = 3'b010,
    CC_DONE = 3'b011,
    WAIT_FOR_TX = 3'b100,
    TX_EN = 3'b101,
    //TX_SEND = 3'b110,
    TIMEOUT = 3'b111;

localparam [1:0] 
        ZERO = 2'b00,
        HOLD_COUNT = 2'b10,
        COUNT = 2'b11;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) begin
        current_state <= IDLE;
        //max_index_reg <= 8'b0;
    end
    else begin
        current_state <= next_state;
        //max_index_reg <= max_index_next;
    end
end

always @ (*) begin
    case (current_state)
        IDLE: begin
            Trigger_Persistant    = 1'b0;
            Start_CC                = 1'b0;
            TX_en                   = 1'b0;
            TX_Write_en             = 1'b0;
            spi_en_int                  = 1'b1;
            //max_index_next          = 8'b0;
            count_sel               = ZERO;
            if (Trigger) next_state <= TRIGGERED;
            else next_state <= IDLE;
        end
        TRIGGERED: begin    // Start the CC frame, turn off SPI, assert Triggered_Persistant
            Trigger_Persistant    = 1'b1;
            Start_CC                = 1'b1;
            TX_en                   = 1'b0;
            TX_Write_en             = 1'b0;
            spi_en_int                  = 1'b0;
            //max_index_next          = 8'b0;
            count_sel = ZERO;

            next_state <= WAIT_FOR_CC;
        end
        WAIT_FOR_CC: begin // Wait for the CC to finish
            Trigger_Persistant    = 1'b1;
            Start_CC                = 1'b0;
            TX_en                   = 1'b0;
            TX_Write_en             = 1'b0;
            spi_en_int                  = 1'b0;
            //max_index_next          = 8'b0;
            count_sel = ZERO;

            if (CC_Done) next_state <= /*CC_DONE*/ WAIT_FOR_TX;
            else next_state <= WAIT_FOR_CC;
        end
        /*CC_DONE: begin // save the Max Index value
            Triggered_Persistant    = 1'b1;
            Start_CC                = 1'b0;
            TX_en                   = 1'b0;
            TX_Write_en             = 1'b0;
            CS                      = 1'b0;
            max_index_next          = Max_Index;
            count_sel = ZERO;

            next_state <= WAIT_FOR_TX;
        end*/
        WAIT_FOR_TX: begin // wait for TX to become available
            Trigger_Persistant    = 1'b1;
            Start_CC                = 1'b0;
            TX_en                   = 1'b0;
            TX_Write_en             = 1'b0;
            spi_en_int                  = 1'b0;
            //max_index_next          = max_index_reg;
            count_sel = ZERO;

            if (Tx_Ready) next_state <= TX_EN;
            else next_state <= WAIT_FOR_TX;
        end
        TX_EN: begin // kick off UART TX
            Trigger_Persistant    = 1'b1;
            Start_CC                = 1'b0;
            TX_en                   = 1'b1;
            TX_Write_en             = 1'b1;
            spi_en_int                  = 1'b0;
            //max_index_next          = 8'b0;
            count_sel = ZERO;

            if (!RsTx) next_state <= TIMEOUT;
            else next_state <= TX_EN;
        end
        TIMEOUT: begin // wait for 10 ms timeout to expire so we can look for new ping
            Trigger_Persistant    = 1'b0;
            Start_CC                = 1'b0;
            TX_en                   = 1'b0;
            TX_Write_en             = 1'b0;
            spi_en_int                  = 1'b0;
            //max_index_next          = 8'b0;
            count_sel = COUNT;

            if (post_cc_timeout) next_state <= IDLE;
            else next_state <= TIMEOUT;
        end
        default: begin
            Trigger_Persistant = 1'b0;
            Start_CC = 1'b0;
            TX_en = 1'b0;
            TX_Write_en = 1'b0;
            spi_en_int = 1'b1;
            //max_index_next = 8'b0;
            count_sel = ZERO;
            next_state <= IDLE;
        end 
    endcase
end

xpm_cdc_single #(
    .DEST_SYNC_FF(3),   // DECIMAL; range: 2-10
    .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
    .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
    .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
)
xpm_cdc_single_inst (
    .dest_out(SPI_en), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                        // registered.

    .dest_clk(SPI_clk), // 1-bit input: Clock signal for the destination clock domain.
    .src_clk(clk),   // 1-bit input: optional; required when SRC_INPUT_REG = 1
    .src_in(spi_en_int)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
);

// count to ~10 ms to not trigger on same ping twice
GENERAL_COUNTER #(.COUNT_VAL(1000000), .COUNT_BIT_WIDTH(20)) post_cc_timeout_counter(
    .clk(clk),
    .reset_b(reset_b),
    .Count_sel(count_sel),         
    .Count_Reached(post_cc_timeout)
);
    
endmodule