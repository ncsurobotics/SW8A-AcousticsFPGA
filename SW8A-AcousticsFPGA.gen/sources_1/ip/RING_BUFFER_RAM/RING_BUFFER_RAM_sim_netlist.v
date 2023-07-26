// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Tue Jul 25 22:26:13 2023
// Host        : cpmori-Dell running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/cpmori/Documents/AquaPack/SW8A-AcousticsFPGA/SW8A-AcousticsFPGA.gen/sources_1/ip/RING_BUFFER_RAM/RING_BUFFER_RAM_sim_netlist.v
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
pikqebO/9cwOlVWzTKkwa/pXk0PjHQzEMazSefY=
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
