----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:36:46 12/05/2016 
-- Design Name: 
-- Module Name:    DecBCD7Seg - Behavioral 
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

entity DecBCD7Seg is
	port(
			BCD : in  STD_LOGIC_VECTOR (3 downto 0);
			Seg : out STD_LOGIC_VECTOR (7 downto 0));
end DecBCD7Seg;

architecture Behavioral of DecBCD7Seg is

begin
with BCD select 
		   --.gfedcba
	Seg <= "11000000" when "0000",
          "11111001" when "0001",
			 "10100100" when "0010",
		    "10110000" when "0011",
			 "10011001" when "0100",
			 "10010010" when "0101",
			 "10000010" when "0110",
			 "11111000" when "0111",
			 "10000000" when "1000",
			 "10010000" when "1001",
			 "10001000" when "1010",
			 "10000011" when "1011",
			 "11000110" when "1100",
			 "10100001" when "1101",
			 "10000110" when "1110",
          "10001110" when others; 

end Behavioral;

