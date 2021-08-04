-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_mod16_0_0 is
  Port ( 
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Y : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end ALU_mod16_0_0;

architecture stub of ALU_mod16_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mod16,Vivado 2019.2";
begin
end;
