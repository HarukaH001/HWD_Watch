----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:06:21 05/14/2021 
-- Design Name: 
-- Module Name:    Counter0_3 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter0_3 is
    Port ( CLK : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (1 downto 0));
end Counter0_3;

architecture Behavioral of Counter0_3 is
	signal counter : std_logic_vector (1 downto 0) := "00";
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			case counter is
				when "00" =>
					counter <= "01";
				when "01" =>
					counter <= "10";
				when "10" =>
					counter <= "11";
				when others =>
					counter <= "00";
			end case;
		end if;
	end process;
	S <= counter;
end Behavioral;

