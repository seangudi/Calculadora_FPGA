library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Suma is
	port(
		a,b: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0);
		s_sig: out std_logic
);
end Suma;

architecture Behavioral of Suma is
	signal s1,s2,sr : signed (4 downto 0) ;

begin

s1 <= signed('0'& a) when (a(3) = '0') else
	(signed(not("00" & a(2 downto 0))) + 1) ; -- Comp A2
	
s2 <= signed('0'& b) when (b(3) = '0') else
	(signed(not("00"& b(2 downto 0))) + 1) ; -- Comp A2 
	
sr <= s1 + s2 ;

s <= std_logic_vector(sr(3 downto 0)) when sr(4) = '0' else 
	std_logic_vector(signed(not(std_logic_vector(sr(3 downto 0)))) + 1) ;
	
s_sig <= '0' when sr(4) = '1' else -- el cero prende el led de negativo
	'1';
end Behavioral;

