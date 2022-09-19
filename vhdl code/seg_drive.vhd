----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2021 19:50:36
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seg_drive is
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0);
    hour1:in STD_LOGIC_VECTOR(3 downto 0);
    hour0:in STD_LOGIC_VECTOR(3 downto 0);
    min1:in STD_LOGIC_VECTOR(3 downto 0);
    min0:in STD_LOGIC_VECTOR(3 downto 0);
           an : out STD_LOGIC_VECTOR(3 downto 0);
           digit: out STD_LOGIC_VECTOR(3 downto 0));
end seg_drive;

architecture Behavioral of seg_drive is

begin
process(sel,hour1,hour0,min1,min0)
begin
case sel is 
when"00"=>
digit<=hour1;
an<="0111";
when"01"=>
digit<=hour0;
an<="1011";
when"10"=>
digit<=min1;
an<="1101";
when others =>
digit<=min0;
an<="1110";
end case;
end process;
end Behavioral;