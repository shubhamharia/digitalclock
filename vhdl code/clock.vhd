----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2021 10:52:56
-- Design Name: 
-- Module Name: clock - Behavioral
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

entity clock is
    Port (clocksignal : in STD_LOGIC;--clock input of the FPGA board with 100MHz frequency
reset : in STD_LOGIC;--a slide switch input to reset the clock
atog : out STD_LOGIC_VECTOR (6 downto 0);--outputs of cathodes for 7 segments
an : out STD_LOGIC_VECTOR (3 downto 0));--outputs of the anodes of he seven gegments
end clock;

architecture Behavioral of clock is
component clockdivide is
    Port ( clockin : in STD_LOGIC;
           reset : in STD_LOGIC;
           clockout : out STD_LOGIC);
end component;
component mincounter is
    Port ( clockin : in STD_LOGIC;
    reset : in STD_LOGIC;
           min0 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           min1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           clockout: out STD_LOGIC);
end component;
component hourcounter is
    Port ( clockin : in STD_LOGIC;
    reset : in STD_LOGIC;
           hour0 : out STD_LOGIC_VECTOR(3 downto 0);
           hour1 : out STD_LOGIC_VECTOR(3 downto 0));
end component;
component clockmultiplexer is
    Port ( clockin : in STD_LOGIC;
           reset : in STD_LOGIC;
           clockout: out STD_LOGIC);
end component;
component multiplexer is
    Port ( clockin : in STD_LOGIC;
           sel : out STD_LOGIC_VECTOR (1 downto 0));
end component;
component seg_drive is
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0);
    hour1:in STD_LOGIC_VECTOR(3 downto 0);
    hour0:in STD_LOGIC_VECTOR(3 downto 0);
    min1:in STD_LOGIC_VECTOR(3 downto 0);
    min0:in STD_LOGIC_VECTOR(3 downto 0);
    an : out STD_LOGIC_VECTOR(3 downto 0);
    digit: out STD_LOGIC_VECTOR(3 downto 0));
end component;
component bin_to_bcd is
    Port ( digit:in STD_LOGIC_VECTOR(3 downto 0);
    atog: out STD_LOGIC_VECTOR(6 downto 0));
end component;
signal clock1out,clockmins,clock2out: STD_LOGIC :='0';
signal  mins0,mins1,hours0,hours1,segment,an1: STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal selsignal:STD_LOGIC_VECTOR(1 downto 0) := "00";
signal display: STD_LOGIC_VECTOR(6 downto 0) := "0000000";
begin
clock1: clockdivide port map(clockin => clock2out,reset=>reset,clockout=>clock1out);
minutes: mincounter port map(clockin=>clock1out,reset=>reset,min0=>mins0(3 downto 0),min1=>mins1(3 downto 0),clockout=>clockmins);
hours: hourcounter port map(clockin=>clockmins,reset=>reset,hour0=>hours0(3 downto 0),hour1=>hours1(3 downto 0));
clock2: clockmultiplexer port map(clockin => clocksignal,reset=>reset,clockout=>clock2out);
mux: multiplexer port map (clockin=>clock2out,sel=>selsignal(1 downto 0));
segment_driver: seg_drive port map(sel=>selsignal(1 downto 0),min0=>mins0(3 downto 0),min1=>mins1(3 downto 0),hour0=>hours0(3 downto 0),hour1=>hours1(3 downto 0),an=>an1(3 downto 0),digit=>segment(3 downto 0));
binary:bin_to_bcd port map(digit=>segment(3 downto 0),atog=>display(6 downto 0));
process(an1,display)
begin
an <=an1;
atog<=display;
end process;
end Behavioral;
