library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity programmable_prescalar is --entity of prescalar
 	port(
 	clear : in std_logic; 
 	clk : in std_logic;
 	cs : in std_logic_vector(2 downto 0);
 	clk_prescaled : out std_logic
 	);
	 attribute loc : string;
attribute loc of cs            : signal is "P2, P3, P4";
attribute loc of clear         : signal is "P14";
attribute loc of clk           : signal is "P6";
attribute loc of clk_prescaled : signal is "P43";

end programmable_prescalar;

architecture structural of programmable_prescalar is 

signal c1 : std_logic_vector (3 downto 0); --signal for the binary counter output
signal mux : std_logic_vector(5 downto 0); --signal for the mux input 

begin
	u1: entity binary_counter port map (clk => clk, en => '1', rst_bar =>clear, q => c1); --connecting all the component 
	mux(5 downto 2) <= c1;
	mux(1) <= clk;
 	mux(0) <= '0';
	u2: entity mux_6to1 port map (ch => mux, cs => cs, mux_out =>clk_prescaled); --mapping the mux

end structural;