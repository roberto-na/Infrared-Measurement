----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:21:53 12/05/2016 
-- Design Name: 
-- Module Name:    Mux3a1_Color - Behavioral 
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

entity Mux3a1_Color is
	port(
		C1  : in  STD_LOGIC_VECTOR (7 downto 0);
		C2  : in  STD_LOGIC_VECTOR (7 downto 0);
		C3  : in  STD_LOGIC_VECTOR (7 downto 0);
		Sel : in  STD_LOGIC_VECTOR (1 downto 0);
		Col : out STD_LOGIC_VECTOR (7 downto 0));
end Mux3a1_Color;

architecture Behavioral of Mux3a1_Color is

begin
-- Mux
 Col <= C1 when Sel = "00" else
        C2 when Sel = "01" else
		  C3;

end Behavioral;

