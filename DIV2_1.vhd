----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:06 05/14/2021 
-- Design Name: 
-- Module Name:    DIV2_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DIV2_1 is
    Port ( I : in  STD_LOGIC;
           O : out  STD_LOGIC);
end DIV2_1;

architecture Behavioral of DIV2_1 is
	signal count : integer := 1;
	constant initialCLK : integer := 2;
	constant targetCLK : integer := 1;
	signal tmp : std_logic := '0';
begin
	process(I)
	begin
		if(rising_edge(I)) then
			count <= count + 1;
			if(count = (initialCLK / (targetCLK*2))) then
				tmp <= NOT tmp;
				count <= 1;
			end if;
		end if;
	end process;
O <= tmp;
end Behavioral;

