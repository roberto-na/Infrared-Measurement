----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:04:34 12/05/2016 
-- Design Name: 
-- Module Name:    Refresh_Screen - Behavioral 
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

entity Refresh_Screen is
	port(
		Clk    : in  STD_LOGIC;
		Rst    : in  STD_LOGIC;
		ClkOut : out STD_LOGIC);
end Refresh_Screen;

architecture Behavioral of Refresh_Screen is
-- Clk divider
  signal   En_Re    : STD_LOGIC;
  constant MaxCount : natural := 10;
  signal   Divider  : natural range 1 to MaxCount;
begin

process(Rst, Clk)
begin
	if Rst = '1' then 
		Divider <= 1;
	elsif (rising_edge(Clk)) then
		if (Divider = MaxCount) then 
			Divider <=  1;
			En_Re <= '1';
		else
			Divider <= Divider + 1;
			En_Re <= '0';
		end if;
	end if;
end process;

ClkOut <= En_Re;

end Behavioral;

