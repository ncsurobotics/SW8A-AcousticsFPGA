// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Jul 19 23:42:00 2023
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [9:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [9:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [9:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [9:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [9:0]dina;
  wire [9:0]dinb;
  wire [9:0]douta;
  wire [9:0]doutb;
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
  wire [9:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7865 mW" *) 
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
  (* C_READ_WIDTH_A = "10" *) 
  (* C_READ_WIDTH_B = "10" *) 
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
  (* C_WRITE_WIDTH_A = "10" *) 
  (* C_WRITE_WIDTH_B = "10" *) 
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[9:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21568)
`pragma protect data_block
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
y4uHhrLBqHuCpCqTKqtzgNQ/u/mwuQ==
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
