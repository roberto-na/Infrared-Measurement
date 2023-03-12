----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:27:08 12/05/2016 
-- Design Name: 
-- Module Name:    VGA_Display - Behavioral 
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

entity VGA_Display is
	generic (MX_HS : NATURAL := 800;
	 		   MX_VS : NATURAL := 521);
	port(
		Val    : in STD_LOGIC_VECTOR (10 downto 0);
		En     : in STD_LOGIC;
		Xin    : in natural range 0 to MX_HS;
		Yin    : in natural range 0 to MX_VS;
		Color1 : out STD_LOGIC_VECTOR (7 downto 0);
		Color2 : out STD_LOGIC_VECTOR (7 downto 0);
		Color3 : out STD_LOGIC_VECTOR (7 downto 0));
end VGA_Display;

architecture Behavioral of VGA_Display is

begin

-- Case unidades
process(Val, En, Xin, Yin)
begin
case Val(3 downto 0) is 
      when "0000" =>
         if En = '1' then 
				if    (Xin > 501 and Xin < 526) and (Yin > 70  and Yin < 400) then Color3 <= "11111111";
				elsif (Xin > 521 and Xin < 563) and (Yin > 70  and Yin < 120) then Color3 <= "11111111";
				elsif (Xin > 538 and Xin < 563) and (Yin > 70  and Yin < 400) then Color3 <= "11111111";
				elsif (Xin > 521 and Xin < 563) and (Yin > 350 and Yin < 400) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "0001" =>
         if En = '1' then 
				if    (Xin > 502 and Xin < 547) and (Yin > 70  and Yin < 121) then Color3 <= "11111111";
				elsif (Xin > 517 and Xin < 547) and (Yin > 120 and Yin < 351) then Color3 <= "11111111";
				elsif (Xin > 476 and Xin < 588) and (Yin > 350 and Yin < 400) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "0010" =>
         if En = '1' then 
				if    (Xin > 502  and Xin < 547) and (Yin > 70  and Yin < 121) then Color3 <= "11111111";
				elsif (Xin > 527  and Xin < 547) and (Yin > 120 and Yin < 206) then Color3 <= "11111111";
				elsif (Xin > 502  and Xin < 547) and (Yin > 205 and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 502  and Xin < 522) and (Yin > 255 and Yin < 351) then Color3 <= "11111111";
				elsif (Xin > 502  and Xin < 547) and (Yin > 350 and Yin < 400) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "0011" =>
         if En = '1' then 
				if    (Xin > 502  and Xin < 547) and (Yin > 70  and Yin < 121) then Color3 <= "11111111";
				elsif (Xin > 532  and Xin < 547) and (Yin > 120 and Yin < 206) then Color3 <= "11111111";
				elsif (Xin > 502  and Xin < 547) and (Yin > 205 and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 532  and Xin < 547) and (Yin > 255 and Yin < 351) then Color3 <= "11111111";
				elsif (Xin > 502  and Xin < 547) and (Yin > 350 and Yin < 401) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "0100" =>
         if En = '1' then 
				if    (Xin > 477  and Xin < 503) and (Yin > 70  and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 502  and Xin < 528) and (Yin > 205 and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 527  and Xin < 553) and (Yin > 70  and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 552  and Xin < 567) and (Yin > 205 and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 527  and Xin < 553) and (Yin > 255 and Yin < 401) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "0101" =>
         if En = '1' then 
				if    (Xin > 501  and Xin < 563) and (Yin > 69  and Yin < 121) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 523) and (Yin > 120 and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 522  and Xin < 563) and (Yin > 204 and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 543  and Xin < 563) and (Yin > 204 and Yin < 401) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 544) and (Yin > 349 and Yin < 401) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "0110" =>
         if En = '1' then 
				if    (Xin > 501  and Xin < 563) and (Yin > 69  and Yin < 121) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 523) and (Yin > 120 and Yin < 206) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 563) and (Yin > 205 and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 523) and (Yin > 255 and Yin < 350) then Color3 <= "11111111";
				elsif (Xin > 536  and Xin < 563) and (Yin > 255 and Yin < 350) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 563) and (Yin > 349 and Yin < 401) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "0111" =>
         if En = '1' then 
				if    (Xin > 501 and Xin < 548) and (Yin > 69  and Yin < 121) then Color3 <= "11111111";
				elsif (Xin > 526 and Xin < 548) and (Yin > 119 and Yin < 206) then Color3 <= "11111111";
				elsif (Xin > 511 and Xin < 558) and (Yin > 205 and Yin < 256) then Color3 <= "11111111";
				elsif (Xin > 526 and Xin < 548) and (Yin > 255 and Yin < 401) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "1000" =>
         if En = '1' then 
				if    (Xin > 501  and Xin < 561) and (Yin > 69  and Yin < 121) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 521) and (Yin > 119 and Yin < 226) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 521) and (Yin > 244 and Yin < 401) then Color3 <= "11111111";
				elsif (Xin > 541  and Xin < 561) and (Yin > 119 and Yin < 226) then Color3 <= "11111111";
				elsif (Xin > 541  and Xin < 561) and (Yin > 244 and Yin < 401) then Color3 <= "11111111";
				elsif (Xin > 511  and Xin < 551) and (Yin > 204 and Yin < 265) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 551) and (Yin > 349 and Yin < 401) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when "1001" =>
         if En = '1' then 
				if    (Xin > 501  and Xin < 562) and (Yin > 69  and Yin < 121) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 522) and (Yin > 119 and Yin < 266) then Color3 <= "11111111";
				elsif (Xin > 501  and Xin < 562) and (Yin > 349 and Yin < 401) then Color3 <= "11111111";
				elsif (Xin > 541 and Xin < 562)  and (Yin > 119 and Yin < 266) then Color3 <= "11111111";
				elsif (Xin > 541 and Xin < 562)  and (Yin > 264 and Yin < 351) then Color3 <= "11111111";
				elsif (Xin > 521  and Xin < 543) and (Yin > 214 and Yin < 266) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
      when others =>
         if En = '1' then 
				if    (Xin > 501 and Xin < 526) and (Yin > 70  and Yin < 400) then Color3 <= "11111111";
				elsif (Xin > 521 and Xin < 563) and (Yin > 70  and Yin < 120) then Color3 <= "11111111";
				elsif (Xin > 538 and Xin < 563) and (Yin > 70  and Yin < 400) then Color3 <= "11111111";
				elsif (Xin > 521 and Xin < 563) and (Yin > 350 and Yin < 400) then Color3 <= "11111111";
				else
					Color3 <= "10101010";
				end if;
			else
				Color3 <= "10101010";
			end if;
   end case;
end process;

--Case Decenas
process(Val, En, Xin, Yin)
begin
case Val(7 downto 4) is 
      when "0000" =>
         if En = '1' then 
				if    (Xin > 288 and Xin < 313) and (Yin > 70  and Yin < 400) then Color2 <= "11111111";
				elsif (Xin > 308 and Xin < 330) and (Yin > 70  and Yin < 120) then Color2 <= "11111111";
				elsif (Xin > 325 and Xin < 350) and (Yin > 70  and Yin < 400) then Color2 <= "11111111";
				elsif (Xin > 308 and Xin < 330) and (Yin > 350 and Yin < 400) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "0001" =>
         if En = '1' then 
				if    (Xin > 289 and Xin < 334) and (Yin > 70  and Yin < 121) then Color2 <= "11111111";
				elsif (Xin > 304 and Xin < 334) and (Yin > 120 and Yin < 351) then Color2 <= "11111111";
				elsif (Xin > 263 and Xin < 375) and (Yin > 350 and Yin < 400) then Color2 <= "11111111";
				else
					Color2<= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "0010" =>
         if En = '1' then 
				if    (Xin > 289  and Xin < 334) and (Yin > 70  and Yin < 121) then Color2 <= "11111111";
				elsif (Xin > 314  and Xin < 334) and (Yin > 120 and Yin < 206) then Color2 <= "11111111";
				elsif (Xin > 289  and Xin < 334) and (Yin > 205 and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 289  and Xin < 309) and (Yin > 255 and Yin < 351) then Color2 <= "11111111";
				elsif (Xin > 289  and Xin < 334) and (Yin > 350 and Yin < 400) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "0011" =>
         if En = '1' then 
				if    (Xin > 289  and Xin < 334) and (Yin > 70  and Yin < 121) then Color2 <= "11111111";
				elsif (Xin > 319  and Xin < 334) and (Yin > 120 and Yin < 206) then Color2 <= "11111111";
				elsif (Xin > 289  and Xin < 334) and (Yin > 205 and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 319  and Xin < 334) and (Yin > 255 and Yin < 351) then Color2 <= "11111111";
				elsif (Xin > 289  and Xin < 334) and (Yin > 350 and Yin < 401) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "0100" =>
         if En = '1' then 
				if    (Xin > 264  and Xin < 290) and  (Yin > 70  and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 289  and Xin < 315) and (Yin > 205 and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 314  and Xin < 340) and (Yin > 70  and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 339  and Xin < 353) and (Yin > 205 and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 314  and Xin < 340) and (Yin > 255 and Yin < 401) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "0101" =>
         if En = '1' then 
				if    (Xin > 288  and Xin < 350) and (Yin > 69  and Yin < 121) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 310) and (Yin > 120 and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 309  and Xin < 350) and (Yin > 204 and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 330  and Xin < 350) and (Yin > 204 and Yin < 401) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 331) and (Yin > 349 and Yin < 401) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "0110" =>
         if En = '1' then 
				if    (Xin > 288  and Xin < 350) and (Yin > 69  and Yin < 121) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 310) and (Yin > 120 and Yin < 206) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 350) and (Yin > 205 and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 310) and (Yin > 255 and Yin < 350) then Color2 <= "11111111";
				elsif (Xin > 328  and Xin < 350) and (Yin > 255 and Yin < 350) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 350) and (Yin > 349 and Yin < 401) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "0111" =>
         if En = '1' then 
				if    (Xin > 288 and Xin < 335) and (Yin > 69  and Yin < 121) then Color2 <= "11111111";
				elsif (Xin > 313 and Xin < 335) and (Yin > 119 and Yin < 206) then Color2 <= "11111111";
				elsif (Xin > 298 and Xin < 345) and (Yin > 205 and Yin < 256) then Color2 <= "11111111";
				elsif (Xin > 313 and Xin < 335) and (Yin > 255 and Yin < 401) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "1000" =>
         if En = '1' then 
				if    (Xin > 288  and Xin < 348) and (Yin > 69  and Yin < 121) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 308) and (Yin > 119 and Yin < 226) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 308) and (Yin > 244 and Yin < 401) then Color2 <= "11111111";
				elsif (Xin > 328  and Xin < 348) and (Yin > 119 and Yin < 226) then Color2 <= "11111111";
				elsif (Xin > 328  and Xin < 348) and (Yin > 244 and Yin < 401) then Color2 <= "11111111";
				elsif (Xin > 298  and Xin < 338) and (Yin > 204 and Yin < 265) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 348) and (Yin > 349 and Yin < 401) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when "1001" =>
         if En = '1' then 
				if    (Xin > 288  and Xin < 349) and (Yin > 69  and Yin < 121) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 309)  and (Yin > 119 and Yin < 266) then Color2 <= "11111111";
				elsif (Xin > 288  and Xin < 349) and (Yin > 349 and Yin < 401) then Color2 <= "11111111";
				elsif (Xin > 328 and Xin < 349) and (Yin > 119 and Yin < 266) then Color2 <= "11111111";
				elsif (Xin > 328 and Xin < 349) and (Yin > 264 and Yin < 351) then Color2 <= "11111111";
				elsif (Xin > 308  and Xin < 330) and (Yin > 214 and Yin < 266) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
      when others =>
         if En = '1' then 
				if    (Xin > 288 and Xin < 313) and (Yin > 70  and Yin < 400) then Color2 <= "11111111";
				elsif (Xin > 308 and Xin < 330) and (Yin > 70  and Yin < 120) then Color2 <= "11111111";
				elsif (Xin > 325 and Xin < 350) and (Yin > 70  and Yin < 400) then Color2 <= "11111111";
				elsif (Xin > 308 and Xin < 330) and (Yin > 350 and Yin < 400) then Color2 <= "11111111";
				else
					Color2 <= "10101010";
				end if;
			else
				Color2 <= "10101010";
			end if;
   end case;
end process;

--Case Decenas
process(Val, En, Xin, Yin)
begin
	case ('0'&Val(10 downto 8)) is 
      when "0000" =>
         if En = '1' then 
				if    (Xin > 75  and Xin < 100) and (Yin > 70  and Yin < 400) then Color1 <= "11111111";
				elsif (Xin > 95  and Xin < 117) and (Yin > 70  and Yin < 120) then Color1 <= "11111111";
				elsif (Xin > 112 and Xin < 137) and (Yin > 70  and Yin < 400) then Color1 <= "11111111";
				elsif (Xin > 95 and Xin  < 117) and (Yin > 350 and Yin < 400) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "0001" =>
         if En = '1' then 
				if    (Xin > 76 and Xin < 121) and (Yin > 70  and Yin < 121) then Color1 <= "11111111";
				elsif (Xin > 91 and Xin < 121) and (Yin > 120 and Yin < 351) then Color1 <= "11111111";
				elsif (Xin > 50 and Xin < 162) and (Yin > 350 and Yin < 400) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "0010" =>
			if En = '1' then 
				if    (Xin > 76  and Xin < 121) and (Yin > 70  and Yin < 121) then Color1 <= "11111111";
				elsif (Xin > 101 and Xin < 121) and (Yin > 120 and Yin < 206) then Color1 <= "11111111";
				elsif (Xin > 76  and Xin < 121) and (Yin > 205 and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 76  and Xin < 96)  and (Yin > 255 and Yin < 351) then Color1 <= "11111111";
				elsif (Xin > 76  and Xin < 121) and (Yin > 350 and Yin < 400) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "0011" =>
         if En = '1' then 
				if    (Xin > 76  and Xin < 121) and (Yin > 70  and Yin < 121) then Color1 <= "11111111";
				elsif (Xin > 106 and Xin < 121) and (Yin > 120 and Yin < 206) then Color1 <= "11111111";
				elsif (Xin > 76  and Xin < 121) and (Yin > 205 and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 106 and Xin < 121) and (Yin > 255 and Yin < 351) then Color1 <= "11111111";
				elsif (Xin > 76  and Xin < 121) and (Yin > 350 and Yin < 401) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "0100" =>
         if En = '1' then 
				if    (Xin > 51  and Xin < 77) and  (Yin > 70  and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 76  and Xin < 102) and (Yin > 205 and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 101 and Xin < 127) and (Yin > 70  and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 126 and Xin < 141) and (Yin > 205 and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 101 and Xin < 127) and (Yin > 255 and Yin < 401) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "0101" =>
         if En = '1' then 
				if    (Xin > 75  and Xin < 137) and (Yin > 69  and Yin < 121) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 97)  and (Yin > 120 and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 96  and Xin < 137) and (Yin > 204 and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 117 and Xin < 137) and (Yin > 204 and Yin < 401) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 118) and (Yin > 349 and Yin < 401) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "0110" =>
         if En = '1' then 
				if    (Xin > 75  and Xin < 137) and (Yin > 69  and Yin < 121) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 97)  and (Yin > 120 and Yin < 206) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 137) and (Yin > 205 and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 97)  and (Yin > 255 and Yin < 350) then Color1 <= "11111111";
				elsif (Xin > 115 and Xin < 137) and (Yin > 255 and Yin < 350) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 137) and (Yin > 349 and Yin < 401) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "0111" =>
         if En = '1' then 
				if    (Xin > 75  and Xin < 122) and (Yin > 69  and Yin < 121) then Color1 <= "11111111";
				elsif (Xin > 100 and Xin < 122) and (Yin > 119 and Yin < 206) then Color1 <= "11111111";
				elsif (Xin > 85  and Xin < 132) and (Yin > 205 and Yin < 256) then Color1 <= "11111111";
				elsif (Xin > 100 and Xin < 122) and (Yin > 255 and Yin < 401) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "1000" =>
         if En = '1' then 
				if    (Xin > 75  and Xin < 135) and (Yin > 69  and Yin < 121) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 95)  and (Yin > 119 and Yin < 226) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 95)  and (Yin > 244 and Yin < 401) then Color1 <= "11111111";
				elsif (Xin > 115 and Xin < 135) and (Yin > 119 and Yin < 226) then Color1 <= "11111111";
				elsif (Xin > 115 and Xin < 135) and (Yin > 244 and Yin < 401) then Color1 <= "11111111";
				elsif (Xin > 85  and Xin < 125) and (Yin > 204 and Yin < 265) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 135) and (Yin > 349 and Yin < 401) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when "1001" =>
         if En = '1' then 
				if    (Xin > 75  and Xin < 136) and (Yin > 69  and Yin < 121) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 96)  and (Yin > 119 and Yin < 266) then Color1 <= "11111111";
				elsif (Xin > 75  and Xin < 136) and (Yin > 349 and Yin < 401) then Color1 <= "11111111";
				elsif (Xin > 115 and Xin < 136) and (Yin > 119 and Yin < 266) then Color1 <= "11111111";
				elsif (Xin > 115 and Xin < 136) and (Yin > 264 and Yin < 351) then Color1 <= "11111111";
				elsif (Xin > 95  and Xin < 117) and (Yin > 214 and Yin < 266) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
      when others =>
         if En = '1' then 
				if    (Xin > 75  and Xin < 100) and (Yin > 70  and Yin < 400) then Color1 <= "11111111";
				elsif (Xin > 95  and Xin < 117) and (Yin > 70  and Yin < 120) then Color1 <= "11111111";
				elsif (Xin > 112 and Xin < 137) and (Yin > 70  and Yin < 400) then Color1 <= "11111111";
				elsif (Xin > 95 and Xin  < 117) and (Yin > 350 and Yin < 400) then Color1 <= "11111111";
				else
					Color1 <= "10101010";
				end if;
			else
				Color1 <= "10101010";
			end if;
   end case;
end process;

end Behavioral;

