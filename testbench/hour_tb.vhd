----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2021 15:37:51
-- Design Name: 
-- Module Name: hour_tb - Behavioral
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

entity hour_tb is
--  Port ( );
end hour_tb;

architecture Behavioral of hour_tb is
component hourcounter is
Port ( clockin : in STD_LOGIC;
 reset:in STD_LOGIC;
hour0 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
hour1 : out STD_LOGIC_VECTOR (3 DOWNTO 0));
end component;
signal clockin:STD_LOGIC:='0';
signal reset:STD_LOGIC:='0';
--output
signal hour1:STD_LOGIC_VECTOR(3 downto 0);
signal hour0:STD_LOGIC_VECTOR(3 downto 0);
constant clk_period : time :=100 ns;
begin
uut : hourcounter Port map(
clockin=> clockin,
reset=>reset,
hour1 => hour1,
hour0=> hour0);
timer:process
begin
clockin<='0';
wait for clk_period/2;
clockin<='1';
wait for clk_period/2;
end process;
stim_process:process
begin
wait for 20100 us;
reset<='1';
wait for 5 us;
reset<='0';
end process;

end Behavioral;
