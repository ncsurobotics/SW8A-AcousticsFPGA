// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jul 22 12:13:56 2023
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
lTf1kanUg7HSUeMXndPXs0SpTjm52elO99n22g==
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
