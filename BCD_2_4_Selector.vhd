----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:00:34 05/14/2021 
-- Design Name: 
-- Module Name:    BCD_2_4_Selector - Behavioral 
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

entity BCD_2_4_Selector is
    Port ( I : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (3 downto 0));
end BCD_2_4_Selector;

architecture Behavioral of BCD_2_4_Selector is

begin
	process(I)
	begin
		case I is
			when "00" =>
				O <= "0111";
			when "01" =>
				O <= "1011";
			when "10" =>
				O <= "1101";
			when others =>
				O <= "1110";
		end case;
	end process;

end Behavioral;

