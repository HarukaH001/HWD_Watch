----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:10:13 05/14/2021 
-- Design Name: 
-- Module Name:    Counter_0_9_UR - Behavioral 
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

entity Counter_0_9_UR is
    Port ( CLK : in  STD_LOGIC;
           UP1 : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC);
end Counter_0_9_UR;

architecture Behavioral of Counter_0_9_UR is
	signal counter : integer range 0 to 9 := 0;
	signal inpt : std_logic := '0';
begin
	inpt <= CLK or UP1;
	process(inpt, RESET)
	begin
		if(RESET = '1') then 
			counter <= 0;
			C <= '0';
		elsif(rising_edge(inpt)) then
			if(counter = 9) then
				C <= '1';
				counter <= 0;
			else
				C <= '0';
				counter <= counter + 1;
			end if;
		end if;
	end process;
	S <= std_logic_vector(to_unsigned(counter, 4));
end Behavioral;

