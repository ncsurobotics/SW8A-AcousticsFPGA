// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Jul 19 23:45:13 2023
// Host        : cpmori-Dell running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/cpmori/Documents/AquaPack/SW8A-AcousticsFPGA/SW8A-AcousticsFPGA.gen/sources_1/ip/dual_port_ram_10x64/dual_port_ram_10x64_sim_netlist.v
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
4YTweuiH9+pZt/KUqltXj3JQk9MM
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
