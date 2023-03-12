----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:40:44 12/05/2016 
-- Design Name: 
-- Module Name:    Clk_Divider_VGA - Behavioral 
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

entity Clk_Divider_VGA is
	port(
		Clk    : in  STD_LOGIC;
		Rst    : in  STD_LOGIC;
		ClkOut : out STD_LOGIC);
end Clk_Divider_VGA;

architecture Behavioral of Clk_Divider_VGA is
signal Cont : STD_LOGIC_VECTOR (1 downto 0);
begin
  --Obtencion de reloj de 25MHz a partir de uno de 100MHz
  Clk_25: process (Clk,Rst)
  begin
    if (Rst = '1') then
	   Cont <= "00";
	 elsif (rising_edge(Clk)) then
	   Cont <= Cont + 1;
	 end if;
  end process Clk_25;
  
  ClkOut <= '1' when Cont = "11" else
            '0';

end Behavioral;

