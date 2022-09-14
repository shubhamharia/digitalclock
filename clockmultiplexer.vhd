----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2021 17:09:49
-- Design Name: 
-- Module Name: clockmultiplexer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockmultiplexer is
    Port ( clockin : in STD_LOGIC;
           reset : in STD_LOGIC;
           clockout: out STD_LOGIC);
end clockmultiplexer;

architecture Behavioral of clockmultiplexer is

begin
process(clockin,reset)--process to divide clock signal to 100Hzthis is a 
VARIABLE COUNT : INTEGER:=0;--variable to count the frequency of the fpga frequency
VARIABLE TEMP : STD_LOGIC:='0';--variable to store the output frequency
begin
IF RESET='1' THEN--to cheek if reset is 'high'
COUNT:=0;--set inital value of count to '0'
TEMP:='0';--set initail value of temp to '0'
ELSIF RISING_EDGE(clockin) THEN--cheek if the clock signal is rising 
COUNT:=COUNT+1;--if yes then increase count value by 1
IF COUNT=50000 THEN-- cheek if the count value is 500000
TEMP:=NOT TEMP;--if yes inverse the temp signal
COUNT:=0;--and reset the value of the count to '0'
END IF;
END IF;
clockout<=TEMP;--write the temp value to clockdiv signal
end process;
end Behavioral;
