// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Aug  1 18:19:34 2023
// Host        : DESKTOP-6KV2NE2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/SW8A-AcousticsFPGA.gen/sources_1/ip/RING_BUFFER_RAM/RING_BUFFER_RAM_sim_netlist.v
// Design      : RING_BUFFER_RAM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "RING_BUFFER_RAM,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2.2" *) 
(* NotValidForBitStream *)
module RING_BUFFER_RAM
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
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
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.9043 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
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
  (* C_INIT_FILE = "RING_BUFFER_RAM.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "NONE" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  RING_BUFFER_RAM_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
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
        .web(web));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28928)
`pragma protect data_block
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
eaU+1JXbehdq4RFsSvVJPDWxIk7CKeZQDhvnr9E=
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
