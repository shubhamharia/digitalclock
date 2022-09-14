----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2021 09:23:11
-- Design Name: 
-- Module Name: min_tb - Behavioral
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

entity min_tb is
--  Port ( );
end min_tb;

architecture Behavioral of min_tb is
component mincounter is
Port ( clockin : in STD_LOGIC;
 reset:in STD_LOGIC;
min0 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
min1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
clockout: out STD_LOGIC);
end component;
--input
signal clockin:STD_LOGIC:='0';
signal reset:STD_LOGIC:='0';
--output
signal min1:STD_LOGIC_VECTOR(3 downto 0);
signal min0:STD_LOGIC_VECTOR(3 downto 0);
signal clockout: STD_LOGIC;
constant clk_period : time :=100 ns;
begin
uut : mincounter Port map(
clockin=> clockin,
reset=>reset,
min1 => min1,
min0=> min0,
clockout=>clockout);
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
wait for  5 us;
reset<='0';
end process;
end Behavioral;

