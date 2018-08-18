library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Resta is
	port(
		a,b: in std_logic_vector(3 downto 0);
		r: out std_logic_vector(3 downto 0);
		r_sig: out std_logic
);
end Resta;

architecture Behavioral of Resta is
	signal rb: std_logic_vector(3 downto 0);

begin
	rb <= not(b(3)) & b( 2 downto 0);
	
	suma: entity work.suma(Behavioral)
		port map (a => a , b => rb , s => r , s_sig => r_sig );
end Behavioral;

