----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:48:18 12/05/2016 
-- Design Name: 
-- Module Name:    VGA - Behavioral 
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

entity VGA is
	generic (MX_HS : NATURAL := 800;
	 		   MX_VS : NATURAL := 521);
	port(
		Clk    : in  STD_LOGIC;
		Rst    : in  STD_LOGIC;
		En_25  : in  STD_LOGIC;
		Active : out STD_LOGIC;
		X      : out natural range 0 to MX_HS;
		Y      : out natural range 0 to MX_VS;
		Hsync  : out STD_LOGIC;
		Vsync  : out STD_LOGIC);
end VGA;

architecture Behavioral of VGA is
 --Reloj
  CONSTANT pixelclk : NATURAL := 25_000_000;
  
  --Constantes Hsync
  CONSTANT tAL_HS : NATURAL := 640; -- Active Line duration for Hsync
  CONSTANT tFP_HS : NATURAL := 16;  -- Front Porch duration for Hsync
  CONSTANT tPU_HS : NATURAL := 96;  -- Hsync Pulse duration
  CONSTANT tBP_HS : NATURAL := 48;  -- Back Porch  duration for Hsync
  
  --Constantes Vsync
  CONSTANT tAT_VS : NATURAL := 480; -- Active Time duration for Vsync
  CONSTANT tFP_VS : NATURAL := 10;  -- Front Porch duration for Vsync  
  CONSTANT tPU_VS : NATURAL := 2;   -- Vsync Pulse duration
  CONSTANT tBP_VS : NATURAL := 29;  -- Back Porch  duration for Vsync
  
  --Definir estados
  TYPE state IS (AL_HS, FP_HS, PU_HS, BP_HS);
  SIGNAL pr_state, nx_state: state;
  
  --Definir contadores de tiempos
  SIGNAL Tiempo : NATURAL RANGE 0 TO MX_HS;
  
  --Contadores
    signal CuentaH : natural range 0 to MX_HS;
	 signal CuentaV : natural range 0 to MX_VS;
	 
begin
  --Coordenadas del pixel
  X <= CuentaH - 1;
  Y <= CuentaV - 1;
  
  --Señal que se habilita cuando el pixel esta en el area activa
  Active <= '1' when ((pr_state = AL_HS) and (CuentaV <= tAT_VS)) else
            '0';
				
	 process (Clk, En_25,Rst)
    --variable CuentaH : integer range 0 to MX_HS;
	 --variable CuentaV : integer range 0 to MX_VS;
   begin
	  if (Rst = '1') then
	    pr_state <= AL_HS;
     elsif (rising_edge(Clk) and En_25 = '1') then
	  
       if (CuentaH = Tiempo) then
         pr_state <= nx_state;
         CuentaH <= 1;
		 else
		   CuentaH <= CuentaH + 1;
       end if;
		 
		 --El contador de lineas CuentaV, se debe incrementar en el falling edge
		 --de Hsync
		 if (CuentaH = Tiempo and pr_state = FP_HS) then
		   if (CuentaV = MX_VS) then
		     CuentaV <= 1;
		   else
			  CuentaV <= CuentaV + 1;
			end if;
		 end if;
		 
     end if;
   end process;
  
 --Seccion que determina el siguiente estado
 process (pr_state)
 begin
   case pr_state is
	
     when AL_HS =>
       nx_state <=  FP_HS;
		 Tiempo   <= tAL_HS;
		 
	  when FP_HS =>
	    nx_state <=  PU_HS;
		 Tiempo   <= tFP_HS;
	 
	  when PU_HS =>
	    nx_state <=  BP_HS;
		 Tiempo   <= tPU_HS;

     when BP_HS =>
       nx_state <=  AL_HS;
       Tiempo   <= tBP_HS;

   end case;
 end process;
 
 --Seccion de salidas
 -- Proceso que describe el bloque "Output Logic"
  outputs: process (pr_state)
  begin
	 case pr_state is
		when AL_HS => Hsync <= '1';
      when FP_HS => Hsync <= '1';
		when PU_HS => Hsync <= '0';
      when BP_HS => Hsync <= '1';
   end case;
   end process outputs;

   --Generacion de Vsync
	Vsync <= '0' when ((CuentaV >= 490) and (CuentaV <= 491)) else
            '1';	

end Behavioral;

