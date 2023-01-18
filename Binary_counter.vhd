library IEEE;
use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

 entity binary_counter is --entity
 generic (n : integer := 4); -- generic for counter width
 port(
 clk : in STD_LOGIC; 
 en : in STD_LOGIC; 
 rst_bar : in STD_LOGIC; 
 q : out STD_LOGIC_vector(n-1 downto 0)
 );
 end binary_counter;

 

 architecture behavioral of binary_counter is
 begin
 	process(clk) 
 	variable count : unsigned (n-1 downto 0); --creating data type variable

 begin
 	if rising_edge(clk) then --clk rising
		if rst_bar = '0' then --reset when = 0
 		count := "0000";
 		elsif en = '1' then --when enable is 1 then
		count := count +1;
 		end if;
 	end if; --converting the unsigned variable to a std_loigc_vector
 	q <= std_logic_vector(count);
 	end process;

end behavioral;