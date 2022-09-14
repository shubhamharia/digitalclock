----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2021 21:36:18
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity bin_to_bcd is
    Port ( digit:in STD_LOGIC_VECTOR(3 downto 0);
    atog: out STD_LOGIC_VECTOR(6 downto 0));
end bin_to_bcd;

architecture Behavioral of bin_to_bcd is

begin
process (digit)--give decided signal to on the leds according to number
begin
case digit is--cheek then number in digit
when "0000"=>atog<="0000001";--if digit is 0 print 0         
when "0001"=>atog<="1001111";--if digit is 1 print 1 
when "0010"=>atog<="0010010";--if digit is 2 print 2
when "0011"=>atog<="0000110";--if digit is 3 print 3 
when "0100"=>atog<="1001100";--if digit is 4  print 4 
when "0101"=>atog<="0100100";--if digit is 5 print 5 
when "0110"=>atog<="0100000";--if digit is 6 print 6 
when "0111"=>atog<="0001111";--if digit is 7 print 7
when "1000"=>atog<="0000000";--if digit is 8 print 8
when others =>atog<="0000100";--if digit is 9 print 9
end case;
end process;
end Behavioral;
