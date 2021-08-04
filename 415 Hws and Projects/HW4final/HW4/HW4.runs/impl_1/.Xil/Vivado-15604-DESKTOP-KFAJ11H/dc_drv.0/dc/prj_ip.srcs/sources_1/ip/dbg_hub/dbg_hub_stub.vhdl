-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Sun Mar 28 13:22:23 2021
-- Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
--               1/HW4Phase1/HW4/HW4.runs/impl_1/.Xil/Vivado-15604-DESKTOP-KFAJ11H/dc_drv.0/dc/prj_ip.srcs/sources_1/ip/dbg_hub/dbg_hub_stub.vhdl}
-- Design      : dbg_hub
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dbg_hub is
  Port ( 
    sl_iport0_o : out STD_LOGIC_VECTOR ( 36 downto 0 );
    sl_oport0_i : in STD_LOGIC_VECTOR ( 16 downto 0 );
    clk : in STD_LOGIC
  );

end dbg_hub;

architecture stub of dbg_hub is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sl_iport0_o[36:0],sl_oport0_i[16:0],clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xsdbm_v3_0_0_xsdbm,Vivado 2019.2";
begin
end;
