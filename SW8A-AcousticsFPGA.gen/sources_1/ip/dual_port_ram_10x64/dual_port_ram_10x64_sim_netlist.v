// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Jul 19 22:23:26 2023
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
R1Q/WnLgba4Qb1H5C9BYeH9Q7lfv
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
