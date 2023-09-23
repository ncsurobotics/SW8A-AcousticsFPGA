// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Sep 18 20:37:18 2023
// Host        : DESKTOP-6KV2NE2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/SW8A-AcousticsFPGA.gen/sources_1/ip/dual_port_ram_10x64/dual_port_ram_10x64_sim_netlist.v
// Design      : dual_port_ram_10x64
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dual_port_ram_10x64,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module dual_port_ram_10x64
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [9:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [9:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [5:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [9:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [9:0]doutb;

  wire [5:0]addra;
  wire [5:0]addrb;
  wire clka;
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
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
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
  (* C_INIT_FILE = "dual_port_ram_10x64.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "10" *) 
  (* C_READ_WIDTH_B = "10" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "10" *) 
  (* C_WRITE_WIDTH_B = "10" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  dual_port_ram_10x64_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21168)
`pragma protect data_block
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
4wFOEW3/fUdTZE15StpFWo/UaUdR
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
