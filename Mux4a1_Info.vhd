----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:13:00 12/05/2016 
-- Design Name: 
-- Module Name:    Mux4a1_Info - Behavioral 
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

entity Mux4a1_Info is
	port(
			Val : in  STD_LOGIC_VECTOR (10 downto 0);
			Sel : in  STD_LOGIC_VECTOR (1 downto 0);
			BCD : out STD_LOGIC_VECTOR (3 downto 0));
end Mux4a1_Info;

architecture Behavioral of Mux4a1_Info is

begin
  --Mux to decide what info to display in the display
  BCD <= "0000"               when Sel = "00" else
         "0"&Val(10 downto 8) when Sel = "01" else
			    Val(7 downto 4)  when Sel = "10" else
			    Val(3 downto 0);

end Behavioral;

