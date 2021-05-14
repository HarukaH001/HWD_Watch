----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:33:09 05/14/2021 
-- Design Name: 
-- Module Name:    Counter_0_2_R - Behavioral 
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

entity Counter_0_2_R is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end Counter_0_2_R;

architecture Behavioral of Counter_0_2_R is
	signal counter : integer range 0 to 2 := 0;
begin
	process(CLK, RESET)
	begin
		if(RESET = '1') then counter <= 0;
		elsif(rising_edge(CLK)) then
			if(counter = 2) then
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	S <= std_logic_vector(to_unsigned(counter, 4));
end Behavioral;

