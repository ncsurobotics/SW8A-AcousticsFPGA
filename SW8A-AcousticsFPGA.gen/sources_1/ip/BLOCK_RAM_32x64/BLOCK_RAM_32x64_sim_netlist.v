// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Sat Jul 22 01:27:42 2023
// Host        : cpmori-Dell running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/cpmori/Documents/AquaPack/SW8A-AcousticsFPGA/SW8A-AcousticsFPGA.gen/sources_1/ip/BLOCK_RAM_32x64/BLOCK_RAM_32x64_sim_netlist.v
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
gdE4AZm28iqZJoqjHxry2y1Q7moAMXHHB0ID/A==
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
