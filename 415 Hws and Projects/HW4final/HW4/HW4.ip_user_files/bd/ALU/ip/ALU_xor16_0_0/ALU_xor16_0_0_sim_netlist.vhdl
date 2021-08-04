-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Sun Mar 21 18:17:15 2021
-- Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {C:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
--               1/HW4Phase1/HW4/HW4.srcs/sources_1/bd/ALU/ip/ALU_xor16_0_0/ALU_xor16_0_0_sim_netlist.vhdl}
-- Design      : ALU_xor16_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ALU_xor16_0_0_xor16 is
  port (
    Y : out STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    A : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ALU_xor16_0_0_xor16 : entity is "xor16";
end ALU_xor16_0_0_xor16;

architecture STRUCTURE of ALU_xor16_0_0_xor16 is
begin
\Y[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(0),
      I1 => A(0),
      O => Y(0)
    );
\Y[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(10),
      I1 => A(10),
      O => Y(10)
    );
\Y[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(11),
      I1 => A(11),
      O => Y(11)
    );
\Y[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(12),
      I1 => A(12),
      O => Y(12)
    );
\Y[13]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(13),
      I1 => A(13),
      O => Y(13)
    );
\Y[14]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(14),
      I1 => A(14),
      O => Y(14)
    );
\Y[15]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(15),
      I1 => A(15),
      O => Y(15)
    );
\Y[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(1),
      I1 => A(1),
      O => Y(1)
    );
\Y[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(2),
      I1 => A(2),
      O => Y(2)
    );
\Y[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(3),
      I1 => A(3),
      O => Y(3)
    );
\Y[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(4),
      I1 => A(4),
      O => Y(4)
    );
\Y[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(5),
      I1 => A(5),
      O => Y(5)
    );
\Y[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(6),
      I1 => A(6),
      O => Y(6)
    );
\Y[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(7),
      I1 => A(7),
      O => Y(7)
    );
\Y[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(8),
      I1 => A(8),
      O => Y(8)
    );
\Y[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B(9),
      I1 => A(9),
      O => Y(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ALU_xor16_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Y : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ALU_xor16_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ALU_xor16_0_0 : entity is "ALU_xor16_0_0,xor16,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ALU_xor16_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ALU_xor16_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ALU_xor16_0_0 : entity is "xor16,Vivado 2019.2";
end ALU_xor16_0_0;

architecture STRUCTURE of ALU_xor16_0_0 is
begin
inst: entity work.ALU_xor16_0_0_xor16
     port map (
      A(15 downto 0) => A(15 downto 0),
      B(15 downto 0) => B(15 downto 0),
      Y(15 downto 0) => Y(15 downto 0)
    );
end STRUCTURE;
