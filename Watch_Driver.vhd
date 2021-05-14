----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:45:59 05/14/2021 
-- Design Name: 
-- Module Name:    Watch_Driver - Behavioral 
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

entity Watch_Driver is
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
end Watch_Driver;

architecture Behavioral of Watch_Driver is
	component Comparator_4Bit
		 Port ( D1 : in  STD_LOGIC_VECTOR (3 downto 0);
				  D2 : in  STD_LOGIC_VECTOR (3 downto 0);
				  R : out  STD_LOGIC);
	end component;
	component MUX4BIT_2_1
		 Port ( I1 : in  STD_LOGIC_VECTOR (3 downto 0);
				  I2 : in  STD_LOGIC_VECTOR (3 downto 0);
				  S : in  STD_LOGIC;
				  O : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	component Counter_0_9_R
		 Port ( CLK : in  STD_LOGIC;
				  RESET : in  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0);
				  C : out  STD_LOGIC);
	end component;
	component Counter_0_9_U
		 Port ( CLK : in  STD_LOGIC;
				  UP1 : in  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0);
				  C : out  STD_LOGIC);
	end component;
	component Counter_0_9_UR
		 Port ( CLK : in  STD_LOGIC;
				  UP1 : in  STD_LOGIC;
				  RESET : in  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0);
				  C : out  STD_LOGIC);
	end component;
	component Counter_0_9_U5
		 Port ( CLK : in  STD_LOGIC;
				  FCLK : in  STD_LOGIC;
				  MUP5 : in  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0);
				  C : out  STD_LOGIC);
	end component;
	component Counter_0_5
		 Port ( CLK : in  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0);
				  C : out  STD_LOGIC);
	end component;
	component Counter_0_5_R
		 Port ( CLK : in  STD_LOGIC;
				  RESET : in  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0);
				  C : out  STD_LOGIC);
	end component;
	component Counter_0_2_R
		 Port ( CLK : in  STD_LOGIC;
				  RESET : in  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	signal MIN1STUP1									: std_logic := '0';
	signal HOUR1STUP1									: std_logic := '0';
	signal MIN10THC									: std_logic := '0';
	signal HOUR1STCLK									: std_logic := '0';
	signal HOURRESET									: std_logic := '0';
	signal COM0100R									: std_logic := '0';
	signal COM01002R									: std_logic := '0';
	constant COM0100D2								: std_logic_vector (3 downto 0):= "0100";
	signal AMIN1STCLK									: std_logic := '0';
	signal AHOUR1STCLK								: std_logic := '0';
	signal AMIN10THC									: std_logic := '0';
	signal AHOUR1STUP1								: std_logic := '0';
	signal AMIN1STMUP5								: std_logic := '0';	
	signal AHOURRESET									: std_logic := '0';
	signal COM1R										: std_logic := '0';
	signal COM2R										: std_logic := '0';
	signal COM3R										: std_logic := '0';
	signal COM4R										: std_logic := '0';
	signal SECRESET									: std_logic := '0';
	
	signal SEC1STC_SEC10THCLK						: std_logic := '0';
	signal SEC10THC_MIN1STCLK						: std_logic := '0';
	signal MIN1STC_MIN10THCLK						: std_logic := '0';
	signal HOUR1STC_HOUR10THCLK					: std_logic := '0';
	signal AMIN1STC_AMIN10THCLK					: std_logic := '0';
	signal AHOUR1STC_AHOUR10THCLK					: std_logic := '0';
	
	signal SEC1STS_MUXS1STI1						: std_logic_vector (3 downto 0) := "0000";
	signal SEC10THS_MUXS10THI1						: std_logic_vector (3 downto 0) := "0000";
	signal MIN1STS_MUXS1STI2_COM1D2				: std_logic_vector (3 downto 0) := "0000";
	signal MIN10THS_MUXS10THI2_COM2D2			: std_logic_vector (3 downto 0) := "0000";
	signal HOUR1STS_MUX2I1_COM3D2_COM0100D1	: std_logic_vector (3 downto 0) := "0000";
	signal HOUR10THS_MUX1I1_COM4D2				: std_logic_vector (3 downto 0) := "0000";
	signal AMIN1STS_COM1D1_MUX4I2					: std_logic_vector (3 downto 0) := "0000";
	signal AMIN10THS_COM2D1_MUX3I2				: std_logic_vector (3 downto 0) := "0000";
	signal AHOUR10THS_MUX1I2_COM4D1				: std_logic_vector (3 downto 0) := "0000";
	signal AHOUR1STS_MUX2I2_COM3D1_COM01002D1	: std_logic_vector (3 downto 0) := "0000";
	signal MUXS1STO_MUX4I1							: std_logic_vector (3 downto 0) := "0000";
	signal MUXS10THO_MUX3I1							: std_logic_vector (3 downto 0) := "0000";
begin
----------------------------------------------------------------------------------------TIME SECTION
--------------------------------------------------------------------------SEC SECTION
SECRESET <= HM and not AI;
SEC1ST	:	Counter_0_9_R		port map (	CLK => CLK,
														RESET => SECRESET,
														S => SEC1STS_MUXS1STI1,
														C => SEC1STC_SEC10THCLK);
SEC10TH	:	Counter_0_5_R		port map (	CLK => SEC1STC_SEC10THCLK,
														RESET => SECRESET,
														S => SEC10THS_MUXS10THI1,
														C => SEC10THC_MIN1STCLK);
--------------------------------------------------------------------------MIN SECTION
MIN1STUP1 <= MI and not AI; 
MIN1ST	:	Counter_0_9_U		port map (	CLK => SEC10THC_MIN1STCLK,
														UP1 => MIN1STUP1,
														S => MIN1STS_MUXS1STI2_COM1D2,
														C => MIN1STC_MIN10THCLK);
MIN10TH	:	Counter_0_5			port map (	CLK => MIN1STC_MIN10THCLK,
														S => MIN10THS_MUXS10THI2_COM2D2,
														C => MIN10THC);
--------------------------------------------------------------------------HOUR SECTION
HOUR1STCLK <= MIN10THC; --and not(HM);
HOUR1STUP1 <= HI and not AI;
HOURRESET <= HOUR10THS_MUX1I1_COM4D2(1) and COM0100R;
HOUR1ST	:	Counter_0_9_UR		port map (	CLK => HOUR1STCLK,
														UP1 => HOUR1STUP1,
														RESET => HOURRESET,
														S => HOUR1STS_MUX2I1_COM3D2_COM0100D1,
														C => HOUR1STC_HOUR10THCLK);
HOUR10TH	:	Counter_0_2_R		port map (	CLK => HOUR1STC_HOUR10THCLK,
														RESET => HOURRESET,
														S => HOUR10THS_MUX1I1_COM4D2);
COM0100	:	Comparator_4Bit	port map (	D1 => HOUR1STS_MUX2I1_COM3D2_COM0100D1,
														D2 => COM0100D2,
														R => COM0100R);
----------------------------------------------------------------------------------------ALARM SECTION
--------------------------------------------------------------------------MIN SECTION
AMIN1STCLK <= MI and AI;
AMIN1STMUP5 <= SNI and SNOOZE;
AMIN1ST	:	Counter_0_9_U5		port map (	CLK => AMIN1STCLK,
														FCLK => FASTCLK,
														MUP5 => AMIN1STMUP5,
														S => AMIN1STS_COM1D1_MUX4I2,
														C => AMIN1STC_AMIN10THCLK);
AMIN10TH	:	Counter_0_5			port map (	CLK => AMIN1STC_AMIN10THCLK,
														S => AMIN10THS_COM2D1_MUX3I2,
														C => AMIN10THC);
--------------------------------------------------------------------------HOUR SECTION
AHOUR1STCLK <= HI and AI;
AHOUR1STUP1 <= AMIN10THC; --and not(HM);
AHOURRESET <= AHOUR10THS_MUX1I2_COM4D1(1) and COM01002R;
AHOUR1ST	:	Counter_0_9_UR		port map (	CLK => AHOUR1STCLK,
														UP1 => AHOUR1STUP1,
														RESET => AHOURRESET,
														S => AHOUR1STS_MUX2I2_COM3D1_COM01002D1,
														C => AHOUR1STC_AHOUR10THCLK);
AHOUR10TH	:	Counter_0_2_R	port map (	CLK => AHOUR1STC_AHOUR10THCLK,
														RESET => AHOURRESET,
														S => AHOUR10THS_MUX1I2_COM4D1);
COM01002	:	Comparator_4Bit	port map (	D1 => AHOUR1STS_MUX2I2_COM3D1_COM01002D1,
														D2 => COM0100D2,
														R => COM01002R);
--------------------------------------------------------------------------SNOOZE SECTION
COM1		:	Comparator_4Bit	port map (	D1 => AMIN1STS_COM1D1_MUX4I2,
														D2 => MIN1STS_MUXS1STI2_COM1D2,
														R => COM1R);
COM2		:	Comparator_4Bit	port map (	D1 => AMIN10THS_COM2D1_MUX3I2,
														D2 => MIN10THS_MUXS10THI2_COM2D2,
														R => COM2R);
COM3		:	Comparator_4Bit	port map (	D1 => AHOUR1STS_MUX2I2_COM3D1_COM01002D1,
														D2 => HOUR1STS_MUX2I1_COM3D2_COM0100D1,
														R => COM3R);
COM4		:	Comparator_4Bit	port map (	D1 => AHOUR10THS_MUX1I2_COM4D1,
														D2 => HOUR10THS_MUX1I1_COM4D2,
														R => COM4R);
SNOOZE <= COM1R and COM2R and COM3R and COM4R;
----------------------------------------------------------------------------------------OUTPUT SECTION
MUX1		:	MUX4BIT_2_1 		port map (	I1 => HOUR10THS_MUX1I1_COM4D2,
														I2 => AHOUR10THS_MUX1I2_COM4D1,
														S => AI,
														O => DO1);
MUX2		:	MUX4BIT_2_1 		port map (	I1 => HOUR1STS_MUX2I1_COM3D2_COM0100D1,
														I2 => AHOUR1STS_MUX2I2_COM3D1_COM01002D1,
														S => AI,
														O => DO2);
MUX3		:	MUX4BIT_2_1 		port map (	I1 => MUXS10THO_MUX3I1,
														I2 => AMIN10THS_COM2D1_MUX3I2,
														S => AI,
														O => DO3);
MUX4		:	MUX4BIT_2_1 		port map (	I1 => MUXS1STO_MUX4I1,
														I2 => AMIN1STS_COM1D1_MUX4I2,
														S => AI,
														O => DO4);

MUXS1ST	:	MUX4BIT_2_1 		port map (	I1 => MIN1STS_MUXS1STI2_COM1D2,
														I2 => SEC1STS_MUXS1STI1,
														S => SI,
														O => MUXS1STO_MUX4I1);
MUXS10TH	:	MUX4BIT_2_1 		port map (	I1 => MIN10THS_MUXS10THI2_COM2D2,
														I2 => SEC10THS_MUXS10THI1,
														S => SI,
														O => MUXS10THO_MUX3I1);
SHOWD1_2 <= AI or not(SI);
DOT <= CLK or HM or AI;
end Behavioral;

