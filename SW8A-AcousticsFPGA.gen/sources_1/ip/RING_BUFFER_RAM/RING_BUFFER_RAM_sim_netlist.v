// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Jul 19 23:41:59 2023
// Host        : DESKTOP-6KV2NE2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top RING_BUFFER_RAM -prefix
//               RING_BUFFER_RAM_ RING_BUFFER_RAM_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21280)
`pragma protect data_block
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
f7UPqz7ohxhcYsttgQ+KCjOMCA==
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
