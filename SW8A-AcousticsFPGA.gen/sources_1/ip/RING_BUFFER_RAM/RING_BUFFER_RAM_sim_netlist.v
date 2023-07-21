// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Jul 19 20:37:16 2023
// Host        : cpmori-Dell running 64-bit Ubuntu 22.04.2 LTS
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
EoqQ9x30x50NMg1iRTCRKmfKiw==
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
