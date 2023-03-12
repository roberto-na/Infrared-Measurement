----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:10:15 12/05/2016 
-- Design Name: 
-- Module Name:    Mux4a1_Disp - Behavioral 
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

entity Mux4a1_Disp is
	port(
			Sel   : in  STD_LOGIC_VECTOR (1 downto 0);
			Anodo : out STD_LOGIC_VECTOR (3 downto 0));
end Mux4a1_Disp;

architecture Behavioral of Mux4a1_Disp is

begin
 --Mux to decide in which display to place info
  Anodo <= "1110" when Sel = "00" else
           "1101" when Sel = "01" else
			  "1011" when Sel = "10" else
  			  "0111";

end Behavioral;

