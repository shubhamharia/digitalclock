----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2021 10:52:56
-- Design Name: 
-- Module Name: hourcounter - Behavioral
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

entity hourcounter is
    Port ( clockin : in STD_LOGIC;
    reset: in STD_LOGIC;
           hour0 : out STD_LOGIC_VECTOR(3 downto 0);
           hour1 : out STD_LOGIC_VECTOR(3 downto 0));
end hourcounter;

architecture Behavioral of hourcounter is

begin
process(clockin,reset)--process to count the seconds and minutes and wirte to corsoponding place
variable hour0count : integer range 0 to 10;
variable hour1count:integer range 0 to 3;

begin
IF RESET='1' THEN--to cheek if reset is 'high'
hour0count:=0;--set inital value of count to '0'
hour1count:=0;--set initail value of temp to '0'
elsif RISING_EDGE(clockin)then--cheek for the rising wave in clock divide
hour0count:=hour0count+1;--if yes than min, once place get incresed by one
if (hour0count =10) then --cheek for minutes tens place is equal to 9 and sec at 59
hour1count:=hour1count+1;-- if yes than increse minutes place by 1
hour0count:= 0;-- and resets the minutes onces place to 0
end if;
end if;
if (hour1count = 2) and (hour0count = 4) then
hour1count := 0;--also reset minutes to 0
hour0count:= 0;
end if;
hour0<=std_logic_vector(to_unsigned(hour0count,4));
hour1<=std_logic_vector(to_unsigned(hour1count,4));
END process;
end Behavioral;