----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:17 05/14/2021 
-- Design Name: 
-- Module Name:    Input_Handler - Behavioral 
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

entity Input_Handler is
    Port ( SN : in  STD_LOGIC;
           H : in  STD_LOGIC;
           M : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           HMCLICK : out  STD_LOGIC;
           SNO : out  STD_LOGIC;
           HO : out  STD_LOGIC;
           MO : out  STD_LOGIC;
			  WCLK : out  STD_LOGIC;
           BCLK : inout  STD_LOGIC;
           SCLK : inout  STD_LOGIC);
end Input_Handler;

architecture Behavioral of Input_Handler is
	component DIV20M_10K
		port ( I : in std_logic;
				 O : out std_logic);
	end component;
	component DIV10K_1000
		port ( I : in std_logic;
				 O : out std_logic);
	end component;
	component DIV1000_2
		port ( I : in std_logic;
				 O : out std_logic);
	end component;
	component DIV2_1
		port ( I : in std_logic;
				 O : out std_logic);
	end component;
	signal DCLK : std_logic := '0';
begin
HMCLICK <= H or M;
SNO <= SN;
HO <= H and DCLK;
MO <= M and DCLK;
DIV1 : DIV20M_10K port map (I => CLK, O => BCLK);
DIV2 : DIV10K_1000 port map (I => BCLK, O => SCLK);
DIV3 : DIV1000_2 port map (I => SCLK, O => DCLK);
DIV4 : DIV2_1 port map (I => DCLK, O => WCLK);
end Behavioral;

