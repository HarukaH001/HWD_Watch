----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:51:33 05/14/2021 
-- Design Name: 
-- Module Name:    BCD_4_7Segment - Behavioral 
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

entity BCD_4_7Segment is
    Port ( DATA : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (6 downto 0));
end BCD_4_7Segment;

architecture Behavioral of BCD_4_7Segment is
	signal temp: std_logic_vector (6 downto 0);
begin
process(DATA)
	begin
		case DATA is
			when "0000" =>
				temp <= "1111110";
			when "0001" =>
				temp <= "0110000";
			when "0010" =>
				temp <= "1101101";
			when "0011" =>
				temp <= "1111001";
			when "0100" =>
				temp <= "0110011";
			when "0101" =>
				temp <= "1011011"; 
			when "0110" =>
				temp <= "1011111";
			when "0111" =>
				temp <= "1110000";
			when "1000" =>
				temp <= "1111111";
			when "1001" =>
				temp <= "1111011"; 
			when others =>
				temp <= "0000000"; 
		end case;
	end process;
	
	O <= temp;
end Behavioral;

