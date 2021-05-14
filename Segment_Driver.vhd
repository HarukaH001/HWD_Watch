----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:11 05/14/2021 
-- Design Name: 
-- Module Name:    Segment_Driver - Behavioral 
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

entity Segment_Driver is
    Port ( DI1 : in  STD_LOGIC_VECTOR (3 downto 0);
           DI2 : in  STD_LOGIC_VECTOR (3 downto 0);
           DI3 : in  STD_LOGIC_VECTOR (3 downto 0);
           DI4 : in  STD_LOGIC_VECTOR (3 downto 0);
           SHOWD1_2 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  DOTIN : in STD_LOGIC;
			  DOT : out STD_LOGIC;
           SEG : out  STD_LOGIC_VECTOR (3 downto 0);
           DATA : out  STD_LOGIC_VECTOR (6 downto 0));
end Segment_Driver;

architecture Behavioral of Segment_Driver is
	component MUX4BIT_4_1
		Port ( I1 : in  STD_LOGIC_VECTOR (3 downto 0);
				  I2 : in  STD_LOGIC_VECTOR (3 downto 0);
				  I3 : in  STD_LOGIC_VECTOR (3 downto 0);
				  I4 : in  STD_LOGIC_VECTOR (3 downto 0);
				  S : in  STD_LOGIC_VECTOR (1 downto 0);
				  O : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	component BCD_4_7Segment
		 Port ( DATA : in  STD_LOGIC_VECTOR (3 downto 0);
				  O : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
	component BCD_2_4_Selector
		 Port ( I : in  STD_LOGIC_VECTOR (1 downto 0);
				  O : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	component Counter0_3
    Port ( CLK : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (1 downto 0));
	end component;
	signal counterToSelector : std_logic_vector (1 downto 0);
	signal muxToBCD : std_logic_vector (3 downto 0);
	signal segTemp : std_logic_vector (3 downto 0);
	signal dataTemp : std_logic_vector (6 downto 0);
begin
MUX1 : MUX4BIT_4_1 port map(I1 => DI1, I2 => DI2, I3 => DI3, I4 => DI4, S => counterToSelector, O => muxToBCD);
BCD1 : BCD_4_7Segment port map(DATA => muxToBCD, O => dataTemp);
C1 : Counter0_3 port map(CLK => CLK, S => counterToSelector);
BCD2 : BCD_2_4_Selector port map(I => counterToSelector, O => segTemp);
--SEG <= segTemp when (SHOWD1_2 = '1') else ("11" & segTemp(1 downto 0));
SEG <= segTemp;
process (counterToSelector, dataTemp, SHOWD1_2)
begin
	if((counterToSelector = "00" or counterToSelector = "01") and SHOWD1_2 = '0') then
		DATA <=  "0000000";
	else
		DATA <= dataTemp;
	end if;
end process;
DOT <= DOTIN when (counterToSelector = "01") else '0';
end Behavioral;

