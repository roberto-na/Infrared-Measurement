----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:42:07 12/05/2016 
-- Design Name: 
-- Module Name:    Cont0a3 - Behavioral 
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

entity Cont0a3 is
	port(
			Clk    : in  STD_LOGIC;
			Rst    : in  STD_LOGIC;
			Enable : in  STD_LOGIC;
			Cuenta : out STD_LOGIC_VECTOR (1 downto 0));
end Cont0a3;

architecture Behavioral of Cont0a3 is
signal Conta : STD_LOGIC_VECTOR (1 downto 0);
begin

  process(Rst, Clk, Enable)
  begin
	if (Rst = '1') then
	   Conta <= "00";
	elsif (rising_edge(Clk) and Enable = '1') then
		Conta <= Conta + 1;
	end if;
  end process;
  
Cuenta <= Conta;
end Behavioral;

