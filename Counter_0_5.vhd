----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:31:02 05/14/2021 
-- Design Name: 
-- Module Name:    Counter_0_5 - Behavioral 
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

entity Counter_0_5 is
    Port ( CLK : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C : inout  STD_LOGIC);
end Counter_0_5;

architecture Behavioral of Counter_0_5 is
	signal counter : integer range 0 to 5 := 0;
begin
	process(CLK, C)
	begin
		if(rising_edge(CLK)) then
			if(counter = 5) then
				C <= '1';
				counter <= 0;
			else
				C <= '0';
				counter <= counter + 1;
			end if;
		end if;
		if(C = '1') then C <= '0';
		end if;
	end process;
	S <= std_logic_vector(to_unsigned(counter, 4));
end Behavioral;

