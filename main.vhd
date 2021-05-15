----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:25 05/14/2021 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
    Port	( CLK_pb123 : in std_logic;
			  SNOOZE_pb1_p45 : in  STD_LOGIC;
           ALARM_pb6_p55 : in  STD_LOGIC;
           H_pb3_p47 : in  STD_LOGIC;
           M_pb4_p48 : in  STD_LOGIC;
           S_pb5_p51 : in  STD_LOGIC;
			  SEG_p30334344 : out std_logic_vector (3 downto 0);
			  DATA_a41b40c35d34e32f29g27 : out std_logic_vector (6 downto 0);
			  DOT_p26 : out std_logic;
			  BUZZER_p83 : out std_logic);
end main;

architecture Behavioral of main is
	component Input_Handler
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
	end component;
	component Watch_Driver
		 Port ( SI : in  STD_LOGIC;
				  AI : in  STD_LOGIC;
				  HM : in  STD_LOGIC;
				  SNI : in  STD_LOGIC;
				  HI : in  STD_LOGIC;
				  MI : in  STD_LOGIC;
				  FASTCLK : in  STD_LOGIC;
				  CLK : in  STD_LOGIC;
				  DO1 : out  STD_LOGIC_VECTOR (3 downto 0);
				  DO2 : out  STD_LOGIC_VECTOR (3 downto 0);
				  DO3 : out  STD_LOGIC_VECTOR (3 downto 0);
				  DO4 : out  STD_LOGIC_VECTOR (3 downto 0);
				  SHOWD1_2 : out  STD_LOGIC;
				  DOT : out  STD_LOGIC;
				  SNOOZE : inout  STD_LOGIC);
	end component;
	component Segment_Driver
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
	end component;
	
	signal IHHMCLICK_WDHM			:	std_logic := '0';
	signal IHSNO_WDSNI				:	std_logic := '0';
	signal IHHO_WDHI					:	std_logic := '0';
	signal IHMO_WDMI					:	std_logic := '0';
	signal IHWCLK_WDCLK				:	std_logic := '0';
	signal IHBCLK_WDFASTCLK			:	std_logic := '0';
	signal IHSCLK_SDCLK				:	std_logic := '0';
	signal WDSNOOZE					:	std_logic := '0';
	signal WDSHOWD_SDSHOWD			: 	std_logic := '0';
	signal WDDOT_SDDOTIN				:	std_logic := '0';
	
	signal WDDO1_SDDI1				: 	std_logic_vector (3 downto 0) := "0000";
	signal WDDO2_SDDI2				: 	std_logic_vector (3 downto 0) := "0000";
	signal WDDO3_SDDI3				: 	std_logic_vector (3 downto 0) := "0000";
	signal WDDO4_SDDI4				: 	std_logic_vector (3 downto 0) := "0000";
begin
IH : Input_Handler	port map (	SN => SNOOZE_pb1_p45,
											H => H_pb3_p47,
											M => M_pb4_p48,
											CLK => CLK_pb123,
											HMCLICK => IHHMCLICK_WDHM,
											SNO => IHSNO_WDSNI,
											HO => IHHO_WDHI,
											MO => IHMO_WDMI,
											WCLK => IHWCLK_WDCLK,
											BCLK => IHBCLK_WDFASTCLK,
											SCLK => IHSCLK_SDCLK);
WD : Watch_Driver		port map (	SI => S_pb5_p51,
											AI => ALARM_pb6_p55,
											HM => IHHMCLICK_WDHM,
											SNI => IHSNO_WDSNI,
											HI => IHHO_WDHI,
											MI => IHMO_WDMI,
											FASTCLK => IHBCLK_WDFASTCLK,
											CLK => IHWCLK_WDCLK,
											DO1 => WDDO1_SDDI1,
											DO2 => WDDO2_SDDI2,
											DO3 => WDDO3_SDDI3,
											DO4 => WDDO4_SDDI4,
											SHOWD1_2 => WDSHOWD_SDSHOWD,
											DOT => WDDOT_SDDOTIN,
											SNOOZE => WDSNOOZE);
SD : Segment_Driver	port map (	DI1 => WDDO1_SDDI1,
											DI2 => WDDO2_SDDI2,
											DI3 => WDDO3_SDDI3,
											DI4 => WDDO4_SDDI4,
											SHOWD1_2 => WDSHOWD_SDSHOWD,
											CLK => IHSCLK_SDCLK,
											DOTIN => WDDOT_SDDOTIN,
											DOT => DOT_p26,
											SEG => SEG_p30334344,
											DATA => DATA_a41b40c35d34e32f29g27);
BUZZER_p83 <= WDSNOOZE and IHBCLK_WDFASTCLK;
end Behavioral;

