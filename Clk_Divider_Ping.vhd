----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:45:06 12/05/2016 
-- Design Name: 
-- Module Name:    Clk_Divider_Ping - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Clk_Divider_Ping is
	port(
			Clk    : in  STD_LOGIC;
			Rst    : in  STD_LOGIC;
			ClkOut : out STD_LOGIC);
end Clk_Divider_Ping;

architecture Behavioral of Clk_Divider_Ping is
  -- Signals and constants used by the Frequency divider process
  constant Fosc    : integer := 100_000_000;      --Oscillator Frequency for Nexys3 board
  constant Fdiv    : integer := 1_000_000;          --Desired sampling baud rate (twice the input rate)
  constant CtaMax  : integer := Fosc / Fdiv;    --Maximum count to obtain desired outputfreq
  signal   Cont    : integer range 0 to CtaMax;
begin
-- Clock divider to obtain a 1 microsecond signal
  ClkDiv: process (Rst,Clk)
  begin
    if Rst = '1' then
	   Cont <= 0;
	 elsif (rising_edge(Clk)) then
	   if Cont = CtaMax then
        Cont <= 0;
        ClkOut <= '1';
      else		  
	     Cont <= Cont + 1;
		  ClkOut<= '0';
		end if;
	 end if;
  end process ClkDiv;

end Behavioral;

