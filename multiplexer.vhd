----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2021 17:27:23
-- Design Name: 
-- Module Name: selectcounter - Behavioral
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

entity multiplexer is
    Port ( clockin : in STD_LOGIC;
           sel : out STD_LOGIC_VECTOR (1 downto 0));
end multiplexer;
architecture Behavioral of multiplexer is
begin
process(clockin)
VARIABLE COUNT : INTEGER:=0;
begin
if RISING_EDGE(clockin)THEN
count := count+1;
end IF;
sel<=std_logic_vector(to_unsigned(count,2));
end process;
end Behavioral;