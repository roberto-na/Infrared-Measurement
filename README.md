# Infrared Measurement
The main module of this project is `Top`. The infrared measurement integrates several submodules for controlling for controlling a VGA display, a ping sensor and some LEDs. The project is composed of several libraries which includes:

* Clk_Divider_VGA: A clock divider that generates a lower frequency clock for the VGA module.
VGA: A VGA controller that generates the horizontal and vertical sync signals and the X and Y coordinates for the display.
* VGA_Display: A module that receives the values to be displayed and generates the RGB signals for the VGA display.
* Refresh_Screen: A clock divider that generates a lower frequency clock for refreshing the VGA display.
* Cont0a2: A counter that counts up to 2.
* Mux3a1_Color: A 3-to-1 mux that selects a color signal based on a selection signal.
* Ping_Sensor: A module that controls a ping sensor and converts the received data into a BCD value to display.
* Clk_Divider_Ping: A clock divider that generates a lower frequency clock for the ping sensor module.
* Refresh_Display: A clock divider that generates a lower frequency clock for refreshing the 7-segment display.
* Cont0a3: A counter that counts up to 3.
* Mux4a1_Info: A 4-to-1 mux that selects a BCD value to display on the 7-segment display.
* Mux4a1_Disp: A 4-to-1 mux that selects which 7-segment display to enable.
* DecBCD7Seg: A module that converts a BCD value to a 7-segment display output.

In addition, the Top module defines some input and output ports, including the clock and reset signals, the input from the ping sensor, and the outputs to control the VGA display, LEDs, and 7-segment display. The module also defines some internal signals, including clocks and control signals for the submodules.

# Libraries
## Cont0a2
This is a VHDL code for a simple two-bit counter with synchronous reset and enable signals.

The function Cont0a2 has four ports:

Clk is an input clock signal.
Rst is an input reset signal that clears the counter when high.
Enable is an input enable signal that allows the counter to increment when high.
Cuenta is an output signal that represents the current count value. It is a 2-bit vector.
The architecture Behavioral describes the behavior of the counter. It declares a signal Sel which is a 2-bit vector used to keep track of the current count value.

The process statement inside the architecture is sensitive to the Rst, Clk, and Enable signals. When the reset signal is high (Rst = '1'), the counter is cleared to zero (Sel <= "00"). Otherwise, on each rising edge of the clock (rising_edge(Clk)), if the enable signal is high (Enable = '1'), the counter increments. When the counter value is 2 (Sel = "10"), it is reset to zero (Sel <= "00").

Finally, the count value Sel is assigned to the output port Cuenta to be displayed outside the module.

*Note:* that the code uses several IEEE libraries to support logic operations and numeric operations. It is important to include all necessary libraries in the code to avoid errors during compilation.

## Cont0a3
This is VHDL code for a simple 2-bit up counter with synchronous reset and enable signal. 

The function declaration defines the inputs and outputs of the module. In this case, there are four ports: Clk is the clock input, Rst is the reset input, Enable is the enable input, and Cuenta is the output signal which is a 2-bit std_logic_vector representing the count value.

The architecture Behavioral describes the behavior of the module. It contains a process block which defines the sequential logic of the module. The process has a sensitivity list of Rst, Clk, and Enable, which means that the process will execute whenever any of these signals change.

Inside the process block, there are two conditions, one for reset and another for the count operation. If the reset signal (Rst) is high, the counter value is set to zero. If the clock (Clk) signal is rising edge and the enable (Enable) signal is high, then the counter value is incremented by one.

Finally, the output Cuenta is assigned to the signal Conta, which holds the current count value. The output port Cuenta is a 2-bit std_logic_vector which represents the binary value of the count.

## DecBCD7Seg
This is VHDL code for a combinational logic circuit that takes a 4-bit binary-coded decimal (BCD) input and converts it to an 8-bit output that represents the BCD value in seven-segment display format.

The input port of the function is named "BCD" and it is a 4-bit STD_LOGIC_VECTOR. The output port is named "Seg" and it is an 8-bit STD_LOGIC_VECTOR. The output vector represents the seven-segment display segments a, b, c, d, e, f, g and decimal point (dp), where "1" indicates that the segment is on and "0" indicates that it is off.

The architecture of the function is named "Behavioral" and it implements the conversion logic. It uses a "with select" statement to select the appropriate output value based on the input BCD value. The output values are specified as binary literals that represent the on/off state of the seven-segment display segments.

For example, when the BCD input is "0000" (decimal value 0), the output vector "Seg" is set to "11000000", which turns on segments a, b, and c and turns off all others. When the input is "0001" (decimal value 1), the output is "11111001", which turns on segments a, b, c, d, g and turns off segments e, f, and dp.

The "others" keyword in the last line of the "with select" statement specifies the default output value for all other input values that are not explicitly defined in the statement. In this case, the default value is "10001110", which turns on segments a, b, c, d, f, g and turns off segments e and dp.

Mux_3a1_Col
This is VHDL code for a 3-to-1 multiplexer that selects one of three input vectors (C1, C2, or C3) based on the value of a 2-bit select signal (Sel) and outputs the selected vector as Col.

The STD_LOGIC_VECTOR data type is used for the input and output signals, with a width of 8 bits (7 downto 0). The std_logic_unsigned package is used to enable arithmetic operations on STD_LOGIC_VECTOR signals.

In the Behavioral architecture, the multiplexer functionality is implemented using a conditional signal assignment statement (<=). The selected input vector is assigned to the Col output signal based on the value of the Sel input signal. If Sel is "00", C1 is assigned to Col. If Sel is "01", C2 is assigned to Col. Otherwise (Sel is "10" or "11"), C3 is assigned to Col.

*Note:* that this implementation assumes that Sel can only take on one of four possible values: "00", "01", "10", or "11". If Sel can take on other values, the behavior of the multiplexer is undefined.

## Mux_4a1_Disp
This VHDL code describes the library named "Mux4a1_Disp" that has two input ports and one output port. The input ports are "Sel" and "Anodo" (Anode), which are of the STD_LOGIC_VECTOR data type and have a length of 2 and 4, respectively. The output port is "Anodo", which is also of the STD_LOGIC_VECTOR data type and has a length of 4.

The architecture section of this library defines the behavior of the entity. In this case, it implements a 4-to-1 multiplexer (Mux) using if-else statements to decide which value to output on the "Anodo" port based on the value of the "Sel" input.

The values assigned to "Anodo" in the Mux are 4-bit binary values that represent the anode (positive electrode) connections for a 7-segment display. In this code, the 7-segment displays are assumed to be connected in a common anode configuration, meaning that the anodes of all the LEDs are connected together and controlled by a single output pin.

The code assigns a binary value to "Anodo" based on the value of "Sel". For example, when "Sel" is "00", the binary value "1110" is assigned to "Anodo". This value represents the anode connections needed to display the digit 0 on a 7-segment display.

The code assumes that the 7-segment displays are arranged in a specific order (from left to right) and that the binary values assigned to "Anodo" correspond to the anode connections needed for each digit on the specific display.

## Refresh_Display
This is a VHDL code for a Refresh_Display library which has a clock input (Clk), a reset input (Rst), and a clock output (ClkOut). The purpose of this library is to generate a clock signal with a frequency of 200Hz that can be used for refreshing displays.

The function has one process called ClkDiv200Hz, which is sensitive to both the Rst and Clk signals. When the Rst signal is high, the Divider200Hz signal is set to 1, and when the Clk signal rises, the process checks whether the Divider200Hz signal has reached its maximum count value (MaxCount200Hz). If it has, the process sets the Divider200Hz signal back to 1 and sets the ClkOut signal to high. If the Divider200Hz signal has not reached its maximum count value, it increments the Divider200Hz signal by 1 and sets the ClkOut signal to low.

The constant MaxCount200Hz is set to 80,000, which means that the clock signal generated by this function will have a frequency of 200Hz (i.e., a period of 5ms). The signal Divider200Hz is a counter that counts from 1 to MaxCount200Hz and is used to generate the clock signal with the desired frequency.

## Refresh_Screen
This is a VHDL code for a simple clock divider circuit that generates a slower clock signal from the input clock signal. The slower clock signal is used to refresh the screen of a display device.

The function "Refresh_Screen" has three ports: "Clk" and "Rst" are input ports of the standard logic type, and "ClkOut" is an output port of the standard logic type.

The architecture "Behavioral" contains a process that generates a slower clock signal from the input clock signal "Clk". The slower clock signal is generated by dividing the frequency of the input clock signal by a constant value "MaxCount" (which is set to 10 in this code). The divided clock signal is represented by the signal "En_Re", which is assigned to the output port "ClkOut".

The process is triggered by the input clock signal "Clk" and the reset signal "Rst". When the reset signal is high, the divider is set to 1. When the rising edge of the input clock signal is detected, the process increments the divider by 1. When the divider reaches the value of "MaxCount", the divider is reset to 1, and the signal "En_Re" is set to high to generate a clock pulse. Otherwise, the signal "En_Re" is set to low.

The clock divider circuit generates a slower clock signal that is used to refresh the screen of a display device, such as a computer monitor. By refreshing the screen at a slower rate, the circuit reduces the power consumption of the display device and extends its lifespan.
