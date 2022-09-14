
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity clockdivide is
    Port ( clockin : in STD_LOGIC;
           reset : in STD_LOGIC;
           clockout : out STD_LOGIC);
end clockdivide;
architecture Behavioral of clockdivide is
begin
process(clockin,reset)--clock divider process to produce a frequency from 100MHz to 1Hz for calculating time 
VARIABLE COUNT : INTEGER:=0;--variable to count the frequency of the fpga frequency
VARIABLE TEMP : STD_LOGIC:='0';--variable to store the output frequency
begin
IF RESET='1' THEN--to cheek if reset is 'high'
COUNT:=0;--set inital value of count to '0'
TEMP:='0';--set initail value of temp to '0'
ELSIF RISING_EDGE(clockin)THEN--cheek if the clock signal is rising 
COUNT:=COUNT+1;--if yes then increase count value by 1
IF COUNT=100 THEN-- cheek if the count value is 100
TEMP:=NOT TEMP;--if yes inverse the temp signal
COUNT:=0;--and reset the value of the count to '0'
END IF;
END IF;
clockout<=TEMP;--write the temp value to clockdivide signal
end process;
end Behavioral;