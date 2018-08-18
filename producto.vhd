library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Producto is
	port(
		a,b: in std_logic_vector(3 downto 0);
		p: out std_logic_vector(3 downto 0);
		p_sig,overflow: out std_logic
);
end Producto;

architecture Behavioral of Producto is  
		signal p1,p2 : unsigned (2 downto 0) ; 
		signal sp: unsigned(5 downto 0);
	

begin
-- Calculo el signo del resultado 
	p_sig <= a(3) xnor b(3) ; -- si son iguales => '1' positivo (punto apagado), diferentes => '0' negativo  led prendido
	
-- Calculo magnitud;
	p1 <= unsigned(a(2 downto 0)) ;
	p2 <= unsigned(b(2 downto 0)) ;
	sp <= p1 * p2 ;
-- Me fijo si hay overflow
	overflow <= sp(5) or sp(4) ;  -- si overflow = '1' me sali del rango posible
	
-- Doy el resultado. 
	p <= std_logic_vector(sp(3 downto 0)) ; 		
end Behavioral;

