----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.04.2021 18:29:51
-- Design Name: 
-- Module Name: multiplexer_tb - Behavioral
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

entity seg_drive_tb is
--  Port ( );
end seg_drive_tb;

architecture Behavioral of seg_drive_tb is
component seg_drive is 
Port ( sel : in STD_LOGIC_VECTOR (1 downto 0);
hour1:in STD_LOGIC_VECTOR(3 downto 0);
hour0:in STD_LOGIC_VECTOR(3 downto 0);
min1:in STD_LOGIC_VECTOR(3 downto 0);
min0:in STD_LOGIC_VECTOR(3 downto 0);
an : out STD_LOGIC_VECTOR(3 downto 0);
digit: out STD_LOGIC_VECTOR(3 downto 0));
end component;
 --input
signal sel:STD_LOGIC_VECTOR (1 downto 0):="00";
signal hour0:STD_LOGIC_VECTOR (3 downto 0):="0000";
signal hour1:STD_LOGIC_VECTOR (3 downto 0):="0000";
signal min0:STD_LOGIC_VECTOR (3 downto 0):="0000";
signal min1:STD_LOGIC_VECTOR (3 downto 0):="0000";
--OUTPUR
signal an: STD_LOGIC_VECTOR (3 downto 0);
signal digit: STD_LOGIC_VECTOR (3 downto 0);
constant clk_period : time :=100 ns;

begin
utt:seg_drive port map(
sel=>sel,
hour1=>hour1,
hour0=>hour0,
min0=>min0,
min1=>min1,
an=>an,
digit=>digit);
stim_process:process
begin
wait for 100 ns;
sel<="01";
min0<="0001";
min1<="0010";
hour0<="0011";
hour1<="0100";
wait for 100 ns;
sel<="10";
min0<="0001";
min1<="0010";
hour0<="0011";
hour1<="0100";
wait for 100 ns;
sel<="11";
min0<="0001";
min1<="0010";
hour0<="0011";
hour1<="0100";
wait for 100 ns;
sel<="00";
min0<="0001";
min1<="0010";
hour0<="0011";
hour1<="0100";
end process;
end Behavioral;

