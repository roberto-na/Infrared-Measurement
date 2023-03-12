----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:13:18 12/05/2016 
-- Design Name: 
-- Module Name:    Ping_Sensor - Behavioral 
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
use IEEE.std_logic_arith.all;

entity Ping_Sensor is
generic(
        NBITS  : integer :=  9; -- Cantidad de bits del número binario.
        NSALIDA: integer := 11  -- Cantidad de bits de salida en formato BCD.
    );
	port(
			Clk  : in   STD_LOGIC;
			En   : in   STD_LOGIC;
			Rst  : in   STD_LOGIC;
			Rx   : in   STD_LOGIC;
         Tx   : out  STD_LOGIC;
			NumBCD : out  STD_LOGIC_VECTOR (10 downto 0);
			LEDs : out  STD_LOGIC_VECTOR (7 downto 0));
end Ping_Sensor;

architecture Behavioral of Ping_Sensor is
  -- Embedded signals
  -- Declare our States
  type state_values is (Start,Holdoff,Response,Delay);
  signal pres_state, next_state: state_values;
  
  -- Since we are defining a variable time FSM the time durations for each state will be declared next
  -- All durations are specified in microseconds
  constant tStart    : natural := 5;
  constant tDelay    : natural := 500_000;
  
  --The next couple of signals will be used to check the elapsed time for each state
  --The following signal determines how much time has been spent in a state
  signal MicroSecondCount   : natural range 0 to tDelay; --Always use the larger one
  -- The following signal determines the maximum amount of time to spend in a state
  signal StateDuration      : natural range 0 to tDelay;
  
  signal ResponseDuration: natural range 0 to 20_000;
  signal Dis : natural range 0 to 640;
  signal Alt : natural range 0 to 640;
  signal NSTD : STD_LOGIC_VECTOR (8 downto 0);
  
begin
 --Process that determines the response duration in microseconds
  PulseDuration: process(Clk, En, ResponseDuration, Dis, NSTD)
		variable z: STD_LOGIC_VECTOR(NBITS+NSALIDA-1 downto 0);
  begin
		if(rising_edge(Clk) and En = '1') then
			if pres_state = Holdoff then
				ResponseDuration <= 0;
			elsif pres_state = Response then
				ResponseDuration <= ResponseDuration + 1;
			elsif (pres_state = Delay) then
				NSTD <= CONV_STD_LOGIC_VECTOR(Alt, 9);
				LEDs <= CONV_STD_LOGIC_VECTOR(Dis, 8);
			end if;
		end if;
	Dis <=(ResponseDuration * 300) / 18500;
	if (Dis < 201) then
		Alt <= 214 - Dis - 1;
	else 
--		Alt <= Dis;
		Alt <= 0;
	end if;
	-- Inicialización de datos en cero.
        z := (others => '0');
        -- Se realizan los primeros tres corrimientos.
        z(NBITS+2 downto 3) := NSTD;
        -- Ciclo para las iteraciones restantes.
        for i in 0 to NBITS-4 loop
            -- Unidades (4 bits).
            if z(NBITS+3 downto NBITS) > 4 then
                z(NBITS+3 downto NBITS) := z(NBITS+3 downto NBITS) + 3;
            end if;
            -- Decenas (4 bits).
            if z(NBITS+7 downto NBITS+4) > 4 then
                z(NBITS+7 downto NBITS+4) := z(NBITS+7 downto NBITS+4) + 3;
            end if;
            -- Centenas (3 bits).
            if z(NBITS+10 downto NBITS+8) > 4 then
                z(NBITS+10 downto NBITS+8) := z(NBITS+10 downto NBITS+8) + 3;
            end if;
            -- Corrimiento a la izquierda.
            z(NBITS+NSALIDA-1 downto 1) := z(NBITS+NSALIDA-2 downto 0);
        end loop;
        -- Pasando datos de variable Z, correspondiente a BCD.
        NumBCD <= z(NBITS+NSALIDA-1 downto NBITS);
  end process PulseDuration;
  
  -- State Register declaration
  statereg: process (Rst,Clk,En)
  begin
    if Rst = '1' then
      pres_state       <= Start;
		MicroSecondCount <= 0;
	 elsif (rising_edge(Clk) and En = '1') then
		-- Check if the time has ellapsed in order to move to the next state
			if MicroSecondCount = StateDuration-1 then 
				pres_state <= next_state;
				MicroSecondCount <= 0;
			else
				MicroSecondCount <= MicroSecondCount + 1;
			end if;
	 end if;
  end process statereg;
  
  -- Next State Logic declaration
  fsm: process (pres_state, Rx)
  begin
    case (pres_state) is 
      when Start       =>
      	StateDuration <= tStart;
			next_state    <= Holdoff;
      when Holdoff     =>
			if(Rx = '1') then
				next_state <= Response;
			else 
				next_state <= Holdoff;
			end if;
			StateDuration <= 1; --To check each microsecond
      when Response    =>
			if(Rx = '0') then
				next_state <= Delay;
			else
				next_state <= Response;
			end if;
         StateDuration <= 1;
		 when Delay      =>
      	StateDuration <= tDelay;
			next_state    <= Start;
      when others      =>
         next_state    <= Start;
   end case;
  end process fsm;
  
  -- Output section declaration
  -- Moore machine
  outputs: process (pres_state)
  begin
    case (pres_state) is 
      when Start     => Tx <= '1'; 
		when Holdoff   => Tx <= '0'; 
		when Response  => Tx <= 'Z'; --High Impedance State: Fisically d1isconect the wire, always in capital
		when Delay     => Tx <= '0'; 
      when others    => Tx <= 'Z'; 
   end case;		
  end process outputs;

end Behavioral;

