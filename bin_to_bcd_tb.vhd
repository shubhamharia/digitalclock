----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.04.2021 21:39:52
-- Design Name: 
-- Module Name: decoder_tb - Behavioral
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

entity bin_to_bcd_tb is
--  Port ( );
end bin_to_bcd_tb;

architecture Behavioral of bin_to_bcd_tb is
component bin_to_bcd is 
Port (digit:in STD_LOGIC_VECTOR(3 downto 0);
    atog: out STD_LOGIC_VECTOR(6 downto 0));
end component;
 --input
signal digit:STD_LOGIC_VECTOR (3 downto 0):="0000";

--OUTPUR
signal atog:STD_LOGIC_VECTOR (6 downto 0);
constant clk_period : time :=100 ns;

begin
utt:bin_to_bcd port map(
atog=>atog,
digit=>digit);
stim_process:process
begin
wait for 100 ns;
digit<="0000";
wait for 100 ns;
digit<="0001";
wait for 100 ns;
digit<="0010";
wait for 100 ns;
digit<="0011";
wait for 100 ns;
digit<="0100";
wait for 100 ns;
digit<="0101";
wait for 100 ns;
digit<="0111";
wait for 100 ns;
digit<="1000";
wait for 100 ns;
digit<="1001";
end process;
end Behavioral;
