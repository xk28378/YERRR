-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Sun Mar 21 18:17:51 2021
-- Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {C:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
--               1/HW4Phase1/HW4/HW4.srcs/sources_1/bd/ALU/ip/ALU_c_addsub_1_0/ALU_c_addsub_1_0_stub.vhdl}
-- Design      : ALU_c_addsub_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_c_addsub_1_0 is
  Port ( 
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end ALU_c_addsub_1_0;

architecture stub of ALU_c_addsub_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A[15:0],B[15:0],CLK,S[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_addsub_v12_0_14,Vivado 2019.2";
begin
end;
