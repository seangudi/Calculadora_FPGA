library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Calculadora is
	port(
		a,b: in std_logic_vector(3 downto 0);
		op: in std_logic_vector(2 downto 0);   -- operacion a realizar
		dig: out std_logic_vector(3 downto 0); -- selecciona cual display encender
		sseg: out std_logic_vector(7 downto 0);-- patron a mostrar en el display
		sig: out std_logic                     -- prende led de signo 
		
		
);
end Calculadora;

architecture Behavioral of Calculadora is
	signal hex_s,hex_r,hex_p,RES: std_logic_vector(3 downto 0);
	signal sig_s,sig_r,sig_p,overflow_p: std_logic;

begin
-- Defino cual es el digito que se prende
	dig <= "1110" ;
	
-- llamo a la SUMA
		Suma: entity work.Suma(Behavioral)
		port map (a => a , b => b , s => hex_s , s_sig => sig_S );

-- llamo a la RESTA
		Resta: entity work.Resta(Behavioral)
	port map (a => a , b => b , r => hex_r , r_sig => sig_R );

-- Llamo al PRODUCTO 
 		Producto: entity work.Producto(Behavioral)
	port map (a => a , b => b , p => hex_p , p_sig => sig_P , overflow => overflow_p );


--Decido cual resultado mostrar
	RES <= hex_p when(op(0) = '1') else
			 hex_s when(op(1) = '1') else
			 hex_r ;
	sseg(7) <= sig_p when(op(0) = '1') else
			 sig_s when(op(1) = '1') else
			 sig_r ;
			 			 	 
-- Paso el RES a SSEG

	sseg(6 downto 0) <= "0111111" when(op = "000") else -- Ningun boton de operacion pulsado da una linea en la mitad del display
			  "0001001" when(op(0) = '1' and overflow_p = '1') else -- con overflow muestra una H (casi como una x de error)
			  "1000000" when(RES = "0000" ) else
			  "1111001" when(RES = "0001" ) else
			  "0100100" when(RES = "0010" ) else
			  "0110000" when(RES = "0011" ) else
			  "0011001" when(RES = "0100" ) else
			  "0010010" when(RES = "0101" ) else
			  "0000010" when(RES = "0110" ) else
			  "1111000" when(RES = "0111" ) else
			  "0000000" when(RES = "1000" ) else
			  "0011000" when(RES = "1001" ) else
			  "0001000" when(RES = "1010" ) else
			  "0000011" when(RES = "1011" ) else
			  "1000110" when(RES = "1100" ) else
			  "0100001" when(RES = "1101" ) else
			  "0000110" when(RES = "1110" ) else
			  "0001110" when(RES = "1111" ) ;						  				
end Behavioral;

