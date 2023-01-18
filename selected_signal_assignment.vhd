library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all; 

entity converter_2421_bcd is
port(
 p, q, r, s : in std_logic;
 d, c, b, a : out std_logic
 );	  
attribute loc : string;
attribute loc of p : signal is "P3";
attribute loc of q : signal is "P4";
attribute loc of r : signal is "P5";
attribute loc of s : signal is "P6";
attribute loc of d : signal is "P27";
attribute loc of c : signal is "P26";
attribute loc of b : signal is "P25";
attribute loc of a : signal is "P24";

end converter_2421_bcd;


architecture selected of converter_2421_bcd is
signal tmp: std_logic_vector(3 downto 0);
begin
   															 
tmp <= p & q & r & s;
d <= '1' when tmp = "1110" else
	'1' when tmp = "1111" else
	'0' when others 

	'-' when "0101"|"0110"|"0111"|"1000"|"1001"|"1010";

with tmp select
c <= '1' when "0100"|"1100"|"1101"|"1011", '-' when "0101"|"0110"|"0111"|"1000"|"1001"|"1010",
'0' when others;  

with tmp select
b <= '1' when "0010"|"0011"|"1100"|"1101", '-' when "0101"|"0110"|"0111"|"1000"|"1001"|"1010",
'0' when others;

with tmp select
a <= '1' when  "0001"|"0011"|"1011"|"1101"|"1111", '-' when "0101"|"0110"|"0111"|"1000"|"1001"|"1010",
'0' when others;

end;
	
	