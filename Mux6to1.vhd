library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux_6to1 is-- entity
 port(
 	ch : in std_logic_vector(5 downto 0); -- data input channels
 	cs : in std_logic_vector(2 downto 0); -- mux select inputs
 	mux_out : out std_logic -- output of mux
 	);
end mux_6to1;


architecture behavioral1 of mux_6to1 is
 begin
 	with cs select
 	mux_out <= ch(0) when "000", --mux6to1 logic
 	ch(1) when "001",
 	ch(2) when "010",
 	ch(3) when "011",
 	ch(4) when "100",
 	ch(5) when "101",
 	'0' when others;
end behavioral1;