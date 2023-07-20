// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Jul 19 20:37:17 2023
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
eBBI8UVe1jbg5PcQr2jFtEBP5DDbgw==
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
