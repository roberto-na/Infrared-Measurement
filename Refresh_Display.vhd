----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:54:07 12/05/2016 
-- Design Name: 
-- Module Name:    Refresh_Display - Behavioral 
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

entity Refresh_Display is
	port(
			Clk    : in  STD_LOGIC;
			Rst    : in  STD_LOGIC;
			ClkOut : out STD_LOGIC);
end Refresh_Display;

architecture Behavioral of Refresh_Display is
  constant MaxCount200Hz  : natural := 80_000;
  signal Divider200Hz     : natural range 1 to MaxCount200Hz;
begin
 --Process for refreshing the displays
 ClkDiv200Hz: process(Rst,Clk)
  begin
    if (Rst = '1') then
	   Divider200Hz <= 1;
	 elsif (rising_edge(Clk)) then
	   if (Divider200Hz = MaxCount200Hz) then
		  Divider200Hz <= 1;
		  ClkOut  <= '1';
		else
		  Divider200Hz <= Divider200Hz + 1;
		  ClkOut  <= '0';
		end if;
	 end if;
  end process ClkDiv200Hz;

end Behavioral;

