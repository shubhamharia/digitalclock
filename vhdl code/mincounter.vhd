----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2021 10:52:56
-- Design Name: 
-- Module Name: mincounter - Behavioral
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mincounter is
    Port ( clockin : in STD_LOGIC;
    reset:in STD_LOGIC;
           min0 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           min1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           clockout: out STD_LOGIC);
end mincounter;

architecture Behavioral of mincounter is

begin
process(clockin,reset)--process to count the seconds and minutes and wirte to corsoponding place
variable sec : natural range 0 to 59:=0;--variable to store the number of seconds and has range 0 to 59
variable min0count : integer range 0 to 10;
variable min1count:integer range 0 to 6;
VARIABLE TEMP : STD_LOGIC:='0';--variable to store the output frequency
begin
IF RESET='1' THEN--to cheek if reset is 'high'
min0count:=0;--set inital value of count to '0'
min1count:=0;--set initail value of temp to '0'
elsif RISING_EDGE(clockin)then--cheek for the rising wave in clock divide
sec:=sec+1;--if the edge is rising the sec variable gets incremented
IF (sec = 59) then --cheek if the sec is equal to 59
min0count:=min0count+1;--if yes than min, once place get incresed by one
sec:=0;--and reset the sec to 0 
if (min0count =10) then --cheek for minutes tens place is equal to 9 and sec at 59
min1count:=min1count+1;-- if yes than increse minutes place by 1
min0count:= 0;-- and resets the minutes onces place to 0

if min1count=6 then
TEMP:='1';
min1count := 0;--also reset minutes to 0
else 
TEMP:='0';
end if;
end if;
end if;
end if;
min0<=std_logic_vector(to_unsigned(min0count,4));
min1<=std_logic_vector(to_unsigned(min1count,4));
clockout<=TEMP;
END process;
end Behavioral;
