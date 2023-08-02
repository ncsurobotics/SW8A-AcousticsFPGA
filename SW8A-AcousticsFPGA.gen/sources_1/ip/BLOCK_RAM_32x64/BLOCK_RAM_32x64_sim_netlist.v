// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Aug  1 18:19:34 2023
// Host        : DESKTOP-6KV2NE2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/SW8A-AcousticsFPGA.gen/sources_1/ip/BLOCK_RAM_32x64/BLOCK_RAM_32x64_sim_netlist.v
// Design      : BLOCK_RAM_32x64
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "BLOCK_RAM_32x64,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2.2" *) 
(* NotValidForBitStream *)
module BLOCK_RAM_32x64
   (clka,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [5:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [5:0]addra;
  wire [5:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]doutb;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_douta_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.68295 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "BLOCK_RAM_32x64.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  BLOCK_RAM_32x64_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[31:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Lg5F1Zfiau3QeByGU2d8iLyq6c0Ay54VBRkPDiennEnh7TDqlDHQ30ugh+dQhv2UbRSQ4p1Rw5u0
jZgZUZmy1Br6WeCfAfENro2z0tYpE6huap6VYu8VXMMViOdpLZhd3Joz8MWf9Vkpz9O8GsaXV6w1
FT3lzzRx4ZlWqSymP/Y=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
k67ldAp8HxMr9nrczAiQCAT2rtecidPnBUTDua4bP0PhBLrvQbOxphm7BiFhkHdGPiDgK6MdINUG
D//GaYQsWWpVUpGZfs8KXRKikvei6OQ4trNDIgpYU9T+zsDYIrvScWpep4H0Kh3R+s45gq7RnJ5m
vdUnaWHtpnFw5f3ARp9akA4O1XBR1BgUKzTCIe0UPAGCpWS1hK4aBQcxKu2PkOA+tPNAh3UV3BiZ
vZru2ov5N6bbEX7XHtyrDx4JovVQLfEIY+57bKNfzEEYKSjLOo5b7ftblU7gLeFmR30a6dQOMMgx
KzeWIzCpQemUcnoi/VEHbHGDt4HRBpIGifDODg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
i+RRRWsjfOwMRpKMUFh0IBcShI8yHuzdR43aSUy7WlXp2lerQDV/hI6ANfHItxdA5uJrEIK5wJiU
VgB5oYlKbVJ1BvZbui5wQoJkmW7IbzfMYtuEI22QXBHs019oGwhANUpCO9BetK/0TTzFxVnHtNOu
/LHdKkMBA0VUUUKT6VU=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tFYGPovVzEoIrKrjTzB6ZqQ6KnkrcjUP1OIG5V7ru9HH8w5P8AlgATXl1Xl3Dc0sTv5AhUl86uI/
Te6q6PxhMPJoRhRB1vXyGzAjrWjA4CWJdMmVu8MWo5zod7cvpkzdrQp18aQTcCDQwlU1DmNGiEOo
zimuLuAUKe6AyAorB43/1QRQQqCxNB7BHRnOJAQDnoyMFVNrG12rKOA/sAyZpMLD4B6xJ7gH7QXT
AZuGXKyILGNZ45qXUr2Hw1p0w3wXMgy/YvUW8HbaHN4jAYcIe/ECoyXyKCAWdzANlF2rT2PeCMqV
QEbigoyqGX27Rm4To5kqLVbmwgAs2ChKUhPckA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR8YLkP+Cq0MiT1XckSgPvE9wroyAiBbeHMaKlLiOTx7yegD3rCMk4uetnkA7xdOCG95C0Od5pVH
e2YrEW06xFSOsWdDnQqKOKFYhTwAs147Ze0j25zjomr5m7CmawjMolxykzS96zChWImangU+6Dpu
mE/MKg5/kaC+7gqdMqPmK5P2lIX+ouok9XKxOokJuqD87QwEzDlFFh/qV9pd923yFRNG1c5yQCAY
jC0bWlxJRQo6nbEwBgMn8rC/mMABPH8uD2sMe1yaJv5P7sFeOf3cmAdUGQBGVHRKdpZ59LnHTu1K
InNoIfz9Mx01CNUYdTBr3X0w6fmS/h2C4MO1mA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qqgM6XiDSmuIOj2QmFL4f6puTJICjYjWzQLoNxU1gzCcXd5+ng75tjwe5w6urE45Df59LYjXr90N
xoD+v0GnCLOppWUn4S+1ojqBqn0qMLsvms3D9/dYenWKxpbEiFxbArUoCPmld0c++8yPVQ73qapG
1gDmjbWJO8ByYC0/tiugtOK/vE3jYVzEtxehN3MCFPsHGsspvaF3CdRsMas3tebV/SuH2XSAP8j+
fZhSi0u301RRmZ6mSAEqJK3He0Y91Z5ZQOd80417UBeLHaQiA9kHY2RWaBMXWHjx36IJNuIr/7jr
pqPYRD+g+IOGSYqYr2U+oVSWF/J6FaLGEFORSw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SLY1z3pfrH+89d+aYr8ZYKuGi1pV2B4YTh8mk4uHOGs4LKQ1igmeyM9GJBaMAmt5JcC96WDDnBw4
nB1kIjnCrjVv02nSbiHz+gz/GD9SP86nLzS9QkwUHgiEudWJ/8Fkv+fRer0hLWhtpFMq+QCQAqbX
Dy+Em4RhLOM5CQyRCxiExuROQRkGjH1tQtyz+peAX147pqTEtR9LrFRYUYEPXhtD9b7MSp46zgf4
lSI4aGfqhp6fXq48O+If4NBHVZAh8gHdbneSQhe7VWYJyFRn5NXB16YXAJLa4JQatsMczE+AmO09
k2OEByw2UvUNKGEaf4tNqeBnQNu8yAJKmMaRpQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
rHgksH8uRTUXMqfrbR/KpR7K/BN7+l1GGoZ5uBkIVJQ9E1b2f3VZJPrQ7S7VUrJ9W3clOpFEhjAM
Oc8jJzlnUOrbHfYO51LCZ66FccJgE3OjLaM/OzA3c72JbMeF05jEDKf4QdMRaIQwV0vXvFMXFbcg
CD7AuUhMJ/GWQx0JJmueM8RLvNdUcIDBkWoZcPsRFynLr8IfIXTFpVIdlFrvWDV9M+csfXnQIq6k
Y3z8TRciA00/EiKvOp6Eo50/kD4QjKDFCqzWcw9vpMR1S+mAW8D3yQQ3Mw+7TRW5DTmB7qmmS/LD
xKznKyYDNP9KJ8z4NfSZgy9kCEKF/AEOrpIJqnNaoA6HXh9YFegFhy9SpTPldFTNyW6JDzyY5DW1
hVFcYJFPmlT/ZDM7HC/yiWmfTZamjNjr6j6r4fX5ptKg03NOZ6yoiMqKwnvLDnRIQe9/S7fEOqdV
LqZswQByjnvoCBsrGYw6cNNfz5CW00eecKgkExyDTb2F/xuv6oGtNaRS

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oDWKuMa0YoA/U/QPkQrlE/kjfj1li0yqCn8MeJ3rAm2Z/2YKghA9gsxWs8xB4fe/adKSQ4aHEt1i
tUAxBkQYlT8XiaSFJIAVhNmuXgiEPZ20R+VwppLUjekdT7PC18dHecsi59XlgVJPcddzakFIoqXD
rk8iU8PsQ4WRTiUl44mpMR93K+emGu1nkBJznWpM1pH3aBODRmMjU7IigwOfmOnDjrCzVULW4z7V
2AuUO8AJxPTXjBkt8QkS+Lo97MZG0bItGmjC+mkr0BAz/l2ADPjOsfpKHAN3Qk4Crlkhpfgt7XT0
5KHCyECHiPkWrJah55lp7roA13m4EgPMJeM69w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rabaiFoR9bIj5CFcJ70CIsYI2myG5mevbxKcSzOpgQHZ4FX874h3Mvv4oNhB5aIwoXefnyix4Pas
3xk2ZBOqreX1vuZUYS7Nk3rT6wqN+/JYXGO7E9xfmFF/iTdL9heWc8JHcLe4e6B8B9QYhGlkRIbN
3etlFTSqKlO5nfA6dKX6Cd+yV3PZZfJXT4jlaY1rpqMPaBtlHWQ7D4o1gO+mHgP0sOQ4bpowU+7Q
jMr0tYghyxsfIddTxrVE0fwZeg1qWlo+iSU1PAJGRVMKIAn7NZ4i8f+ed6NJKt2vGjDFfZXLXClO
nyA+xb6K3aWY3lMR6qP8qDkKAJJZe9Y36MRGng==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpnCRmSw3bCoDXuz4ACuAPPPaMheVpOmUjnTbTAMOWU5UsZtyDXZeGV8/oIsADVazSxLQZSBGgiy
SKvVnFKfYB7AgQDUMZFw0rVRtHiVMwSzKWeKD6RAhsC0bPj9SvO7LAbMlPup0Bqp/B+25di0U3gR
HcJdPJAve7xMFNBSYWEA8qxoNxWNshmZSjI/bZ357HlFVPisa6jUUqfB1NL8is8ZUS6S+cNLQyEf
tij0AWwPrqG8naFrpTzHWE6VrXYG5oNftxQbYOQR6HjuL4cx/R64+btFaWdnBHup1adCO/sGxhdd
Dd1b6OQ/2YtZTyp2K8aDHbceCM5X1/8CZdRU5g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20320)
`pragma protect data_block
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
KZAkKuNthIbmWdiwAs0w+ZkGBlHn4LK0ShslZA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
