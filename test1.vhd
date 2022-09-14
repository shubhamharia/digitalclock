----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2021 22:47:38
-- Design Name: 
-- Module Name: test1 - Behavioral
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

entity test1 is
--  Port ( );
end test1;

architecture Behavioral of test1 is
component clock is
port( clocksignal : in STD_LOGIC;--clock input of the FPGA board with 100MHz frequency
reset : in STD_LOGIC;--a slide switch input to reset the clock
atog : out STD_LOGIC_VECTOR (6 downto 0);--outputs of cathodes for 7 segments
an : out STD_LOGIC_VECTOR (3 downto 0));--outputs of the anodes of he seven gegments
end component;
--INPUT
signal clocksignal:STD_LOGIC:='0';
signal reset:STD_LOGIC:='0';
--OUTOUT
signal atog: STD_LOGIC_VECTOR(6 downto 0);
signal an: STD_LOGIC_VECTOR(3 downto 0);
constant clk_period : time :=1 ns;
begin
uut : clock Port map(
clocksignal => clocksignal,
reset => reset,
atog => atog,
an=> an);
timer:process
begin
clocksignal<='0';
wait for clk_period/2;
clocksignal<='1';
wait for clk_period/2;
end process;
stim_process:process
begin
wait for 20 ms;
reset<='1';
wait for 100 us;
reset<='0';
end process;
end Behavioral;
