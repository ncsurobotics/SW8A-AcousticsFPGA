`timescale 1ns/1ps

module xpm_cdc_tb();

  ///////////////////////////////////////////////////////////////////////////
  // Define local constants.
  ///////////////////////////////////////////////////////////////////////////

  localparam TCQ = 1;
  parameter SrcClkPeriod   = 10;
  parameter DestClkPeriod  = 140;

  parameter SIM_ASSERT_CHK            = 1;

// cdc_single parameters
  parameter S_DEST_SYNC_FF            = 4;
  parameter S_SRC_INPUT_REG           = 1;

  ///////////////////////////////////////////////////////////////////////////
  // Declare signals.
  ///////////////////////////////////////////////////////////////////////////


//Master clock
  reg                   src_clk;
  reg                   dest_clk;

// cdc_single ports
  reg                   s_src_in;
  wire                  s_dest_out;

// Generate clock
  initial
    begin
      src_clk    = 1'b0;
      dest_clk   = 1'b0;
    end

    always #(SrcClkPeriod/2) src_clk = !src_clk;
    always #(DestClkPeriod/2) dest_clk = !dest_clk;

 // Generate other stimulus
  initial
    begin
      s_src_in     = 1'b1;

//****************************************************************************
// XPM_CDC_SINGLE
//****************************************************************************
      #(SrcClkPeriod*20);
      //  High Pulse
      @ (posedge src_clk);
      s_src_in = 1'b1;
      #(SrcClkPeriod*20);
      @ (posedge src_clk);
      s_src_in = 1'b0;
      #(SrcClkPeriod*6);

      #(SrcClkPeriod*20);

//****************************************************************************
// END
//****************************************************************************
      #(SrcClkPeriod*20);
      $stop;
    end

//Instantiate cdc_single
  xpm_cdc_single #(
    .DEST_SYNC_FF          (4),
    .SIM_ASSERT_CHK        (1),
    .SRC_INPUT_REG         (1)
  ) single (
    .src_clk               (src_clk),
    .src_in                (s_src_in),
    .dest_clk              (dest_clk),
    .dest_out              (s_dest_out)
  );

endmodule