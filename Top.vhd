----------------------------------------------------------------------------------
-- Company: ITESM - Qro. 
-- Engineer: Los Super Amigos
-- 
-- Create Date:    22:32:11 12/04/2016 
-- Design Name:    Top
-- Module Name:    Top - Behavioral 
-- Project Name:   My Height
-- Target Devices: 
-- Tool versions: 
-- Description: Digital Measuring Rod 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Top is
	  generic (MX_HS : NATURAL := 800;
				  MX_VS : NATURAL := 521);
     port (Clk_100M : in   STD_LOGIC;
           Rst      : in   STD_LOGIC;
           Rx       : in   STD_LOGIC;
           Hsync    : out  STD_LOGIC;
           Vsync    : out  STD_LOGIC;
           Tx       : out  STD_LOGIC;
           Seg      : out  STD_LOGIC_VECTOR (7 downto 0);
           Sel      : out  STD_LOGIC_VECTOR (3 downto 0);
           LEDs     : out  STD_LOGIC_VECTOR (7 downto 0);
           Red      : out  STD_LOGIC_VECTOR (2 downto 0);
           Green    : out  STD_LOGIC_VECTOR (2 downto 0);
           Blue     : out  STD_LOGIC_VECTOR (1 downto 0));
end Top;

architecture Behavioral of Top is

component Clk_Divider_VGA 
	port(
		Clk    : in  STD_LOGIC;
		Rst    : in  STD_LOGIC;
		ClkOut : out STD_LOGIC);
	end component;
	
component VGA 
	port(
		Clk    : in  STD_LOGIC;
		Rst    : in  STD_LOGIC;
		En_25  : in  STD_LOGIC;
		Active : out STD_LOGIC;
		X      : out natural range 0 to MX_HS;
		Y      : out natural range 0 to MX_VS;
		Hsync  : out STD_LOGIC;
		Vsync  : out STD_LOGIC);
	end component;

component VGA_Display 
	port(
		Val    : in STD_LOGIC_VECTOR (10 downto 0);
		En     : in STD_LOGIC;
		Xin    : in natural range 0 to MX_HS;
		Yin    : in natural range 0 to MX_VS;
		Color1 : out STD_LOGIC_VECTOR (7 downto 0);
		Color2 : out STD_LOGIC_VECTOR (7 downto 0);
		Color3 : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
component Refresh_Screen 
	port(
		Clk    : in  STD_LOGIC;
		Rst    : in  STD_LOGIC;
		ClkOut : out STD_LOGIC);
	end component;
	
component Cont0a2 
	port(
		Clk    : in  STD_LOGIC;
		Rst    : in  STD_LOGIC;
		Enable : in  STD_LOGIC;
		Cuenta : out STD_LOGIC_VECTOR (1 downto 0));
	end component;
	
component Mux3a1_Color
	port(
		C1  : in  STD_LOGIC_VECTOR (7 downto 0);
		C2  : in  STD_LOGIC_VECTOR (7 downto 0);
		C3  : in  STD_LOGIC_VECTOR (7 downto 0);
		Sel : in  STD_LOGIC_VECTOR (1 downto 0);
		Col : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
component Ping_Sensor
	port(
			Clk  : in   STD_LOGIC;
			En   : in   STD_LOGIC;
			Rst  : in   STD_LOGIC;
			Rx   : in   STD_LOGIC;
         Tx   : out  STD_LOGIC;
			NumBCD : out  STD_LOGIC_VECTOR (10 downto 0);
			LEDs : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;
	
component Clk_Divider_Ping
	port(
			Clk    : in  STD_LOGIC;
			Rst    : in  STD_LOGIC;
			ClkOut : out STD_LOGIC);
    end component;
	 
component Refresh_Display
	port(
			Clk    : in  STD_LOGIC;
			Rst    : in  STD_LOGIC;
			ClkOut : out STD_LOGIC);
    end component;

component Cont0a3
	port(
			Clk    : in  STD_LOGIC;
			Rst    : in  STD_LOGIC;
			Enable : in  STD_LOGIC;
			Cuenta : out STD_LOGIC_VECTOR (1 downto 0));
    end component;

component Mux4a1_Info
	port(
			Val : in  STD_LOGIC_VECTOR (10 downto 0);
			Sel : in  STD_LOGIC_VECTOR (1 downto 0);
			BCD : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

component Mux4a1_Disp
	port(
			Sel   : in  STD_LOGIC_VECTOR (1 downto 0);
			Anodo : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

component DecBCD7Seg
	port(
			BCD : in  STD_LOGIC_VECTOR (3 downto 0);
			Seg : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

-- Embedded Signals
signal Clk25MHz_emb : STD_LOGIC;
signal Clk60Hz_emb  : STD_LOGIC;
signal Enable       : STD_LOGIC;
signal Clk1ms       : STD_LOGIC;
signal Clk80KHz     : STD_LOGIC;

signal Xemb         : natural range 0 to MX_HS;
signal Yemb         : natural range 0 to MX_VS;

signal C1           : STD_LOGIC_VECTOR (7 downto 0);
signal C2           : STD_LOGIC_VECTOR (7 downto 0);
signal C3           : STD_LOGIC_VECTOR (7 downto 0);
signal Cont2        : STD_LOGIC_VECTOR (1 downto 0);
signal Cont3        : STD_LOGIC_VECTOR (1 downto 0);
signal Color        : STD_LOGIC_VECTOR (7 downto 0);
signal Valo         : STD_LOGIC_VECTOR (10 downto 0);
signal BCD          : STD_LOGIC_VECTOR (3 downto 0);

begin
-- Instantiate components
	U1: Clk_Divider_VGA 
	port map (
			Clk_100M,
			Rst,
			Clk25MHz_emb);

	U2: VGA 
	port map (
			Clk_100M,
			Rst,
			Clk25MHz_emb,
			Enable,
			Xemb,
			Yemb,
			Hsync,
			Vsync);
			
	U3: VGA_Display 
	port map (
			Valo,
			Enable,
			Xemb,
			Yemb,
			C1,
			C2,
			C3);
			
	U4: Refresh_Screen 
	port map (
			Clk_100M,
			Rst,
			Clk60Hz_emb);
	
	U5: Cont0a2 
	port map (
			Clk_100M,
			Rst,
			Clk60Hz_emb,
			Cont2);
		
	U6: Mux3a1_Color 
	port map (
			C1,
			C2,
			C3,
			Cont2,
			Color);
	
	U7: Ping_Sensor 
	port map (
			Clk_100M,
			Clk1ms,
			Rst,
			Rx,
			Tx,
			Valo,
			LEDs);

	U8: Clk_Divider_Ping 
	port map (
			Clk_100M,
			Rst,
			Clk1ms);
			
	U9: Refresh_Display 
	port map (
			Clk_100M,
			Rst,
			Clk80KHz);
			
	U10: Cont0a3 
	port map (
			Clk_100M,
			Rst,
			Clk80KHz,
			Cont3);
	
	U11: Mux4a1_Info 
	port map (
			Valo,
			Cont3,
			BCD);
			
	U12: Mux4a1_Disp 
	port map (
			Cont3,
			Sel);
	
	U13: DecBCD7Seg
	port map (
			BCD,
			Seg);
	
  Red   <= Color(7 downto 5);
  Green <= Color(4 downto 2);
  Blue  <= Color(1 downto 0);
end Behavioral;

