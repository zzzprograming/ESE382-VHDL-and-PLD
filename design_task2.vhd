 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

 entity binary_counter is
 generic (n : integer := 4); -- generic for counter width
 port(
 clk : in STD_LOGIC; --clock for input
 en : in STD_LOGIC; --enable
 rst_bar : in STD_LOGIC; --reset when it's 1
 q : out STD_LOGIC_vector(n-1 downto 0) -- using the genericinteger so that we can change it whenever we want
 );
 end binary_counter;

 --}} End of automatically maintained section

 architecture behavioral of binary_counter is
  begin
 process(clk) --we are having a synchronous reset
 variable count : unsigned (n-1 downto 0); --using a variable

 begin
 if rising_edge(clk) then --based on the positive

 if rst_bar = '0' then --reset asserted low
 count := "0000";
 elsif en = '1' then --when enable is 1 then
count := count +1;
 end if;
 end if; --converting the unsigned variable to a std_loigc_vector
 q <= std_logic_vector(count);
 end process;

 end behavioral;

 ---------------------------mux_6------------------------
 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;


 entity mux_6to1 is
 port(
 ch : in std_logic_vector(5 downto 0); -- data input channels
 cs : in std_logic_vector(2 downto 0); -- mux select inputs
 mux_out : out std_logic -- output of mux
 );
 end mux_6to1;
 architecture behavioral1 of mux_6to1 is
 begin
 with cs select
 mux_out <= ch(0) when "000", --changing each individual element in the array
 ch(1) when "001",
 ch(2) when "010",
 ch(3) when "011",
 ch(4) when "100",
 ch(5) when "101",
 '0' when others;

 end behavioral1;


 -------------programmable prescalar-------
 library ieee;
 use ieee.std_logic_1164.all;
 use work.all;

 entity programmable_prescalar is
 port(
 clear : in std_logic; -- active low clear
 clk : in std_logic;
 cs : in std_logic_vector(2 downto 0);
 clk_prescaled : out std_logic
 );

 end programmable_prescalar;

 architecture structural of programmable_prescalar is --structuralstyle

 signal c1 : std_logic_vector (3 downto 0); --signal forthe binary counter output
signal mux : std_logic_vector(5 downto 0); --signal forthe mux input since we need to change the array from 4 to 6

 begin
 u1: entity binary_counter port map (clk => clk, en => '1', rst_bar =>clear, q => c1); --mapping the counter entity
mux(5 downto 2) <= c1;
--storing the individual values to the mux array
 mux(1) <= clk;
 mux(0) <= '0';
 u2: entity mux_6to1 port map (ch => mux, cs => cs, mux_out =>clk_prescaled); --mapping the mux

 end structural;
 

