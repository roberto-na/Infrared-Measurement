----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:58:53 12/05/2016 
-- Design Name: 
-- Module Name:    Cont0a2 - Behavioral 
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

entity Cont0a2 is
port(
		Clk    : in  STD_LOGIC;
		Rst    : in  STD_LOGIC;
		Enable : in  STD_LOGIC;
		Cuenta : out STD_LOGIC_VECTOR (1 downto 0));
end Cont0a2;

architecture Behavioral of Cont0a2 is
signal Sel : STD_LOGIC_VECTOR (1 downto 0);
begin

process(Rst, Clk, Enable)
begin
	if Rst = '1' then 
		Sel <= "00";
	elsif (rising_edge(Clk) and Enable = '1') then
		if (Sel = "10") then
			Sel <= "00";
		else
			Sel <= Sel + 1;
		end if;
	end if;
end process;

Cuenta <= Sel;
end Behavioral;

