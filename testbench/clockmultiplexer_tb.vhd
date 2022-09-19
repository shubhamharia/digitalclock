----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2021 20:33:04
-- Design Name: 
-- Module Name: clockdivide_tb - Behavioral
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

entity clockmultiplexer_tb is
--  Port ( );
end clockmultiplexer_tb;

architecture Behavioral of clockmultiplexer_tb is
component clockmultiplexer is 
port( clockin : in STD_LOGIC;
           reset : in STD_LOGIC;
           clockout : out STD_LOGIC);
end component;
--input
signal clockin:STD_LOGIC:='0';
signal reset:STD_LOGIC:='0';
--OUTPUR
signal clockout: std_logic;
constant clk_period : time :=100 ns;

begin
utt:clockmultiplexer port map(
clockin=> clockin,
reset=>reset,
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
wait for 200 ms;
reset<='1';
wait for 100 us;
reset<='0';
end process;
end Behavioral;

