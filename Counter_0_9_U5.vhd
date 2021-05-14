----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:12:56 05/14/2021 
-- Design Name: 
-- Module Name:    Counter_0_9_U5 - Behavioral 
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

entity Counter_0_9_U5 is
    Port ( CLK : in  STD_LOGIC;
           FCLK : in  STD_LOGIC;
           MUP5 : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC);
end Counter_0_9_U5;

architecture Behavioral of Counter_0_9_U5 is
	component Counter_0_9_U
		 Port ( CLK : in  STD_LOGIC;
				  UP1 : in  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0);
				  C : out  STD_LOGIC);
	end component;
	component Counter_0_4
		 Port ( CLK : in  STD_LOGIC;
				  RESETC : in STD_LOGIC;
				  C : out  STD_LOGIC);
	end component;
	signal enableTemp : std_logic := '0';
	signal enableTempNot : std_logic := '0';
	signal enable : std_logic := '0';
	signal C4ToEN : std_logic := '0';
	signal inpt : std_logic :='0';
begin
inpt <= MUP5 or C4ToEN;
process(inpt)
begin
	if(rising_edge(inpt)) then
		enableTemp <= MUP5;
		enableTempNot <= not MUP5;
	end if;
end process;
enable <= enableTemp and FCLK;
C1 : Counter_0_4 port map(CLK => enable, RESETC => enableTempNot, C => C4ToEN);
C2 : Counter_0_9_U port map(CLK => CLK, UP1 => enable, S => S, C => C);
end Behavioral;

