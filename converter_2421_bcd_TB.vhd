library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity converter_2421_bcd_tb is
end converter_2421_bcd_tb;

architecture tb_architecture of converter_2421_bcd_tb is

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal p : std_logic;
	signal q : std_logic;
	signal r : std_logic;
	signal s : std_logic;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal d : std_logic;
	signal c : std_logic;
	signal b : std_logic;
	signal a : std_logic;

	constant period : time := 20ns;

begin

	-- Unit Under Test port map
	UUT : entity converter_2421_bcd
		port map (
			p => p,
			q => q,
			r => r,
			s => s,
			d => d,
			c => c,
			b => b,
			a => a
		);

		
	stim: process		-- apply all binary input combinations
	begin
		for i in 0 to 15 loop
			(p, q, r, s) <= (to_unsigned(i,4));
			wait for period;
		end loop;
		wait;
	end process;
		
end tb_architecture;
