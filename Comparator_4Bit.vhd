----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:38:55 05/14/2021 
-- Design Name: 
-- Module Name:    Comparator_4Bit - Behavioral 
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

entity Comparator_4Bit is
    Port ( D1 : in  STD_LOGIC_VECTOR (3 downto 0);
           D2 : in  STD_LOGIC_VECTOR (3 downto 0);
           R : out  STD_LOGIC);
end Comparator_4Bit;

architecture Behavioral of Comparator_4Bit is

begin
R <= '1' when (D1 = D2) else '0';
end Behavioral;

