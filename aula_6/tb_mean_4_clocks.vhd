library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_mean_4_clocks is
	generic
	(
		W : natural := 32
	);

end tb_mean_4_clocks;

architecture teste of tb_mean_4_clocks is

component mean_4_clocks is
port (  CLK     : in    std_logic;
        RESET   : in    std_logic;
        INPUT   : in    std_logic_vector(W - 1 downto 0);
        OUTPUT  : out   std_logic_vector(W - 1 downto 0)
		);
end component;

signal I, O : std_logic_vector	((W - 1) downto 0);
SIGNAL C, R : std_logic;

begin
instancia_mean_4_clocks: mean_4_clocks port map(CLK=>C,RESET=>R,INPUT=>I,OUTPUT=>O);
C <= '1', '1' after 50 ns, '1' after 100 ns, '1' after 150 ns;
I <= "00000000000000000000000000010001", "00000000000000000000000000010111" after 50 ns, "00000000000000000000000001010111" after 100 ns, "00000000000000000000001000010111" after 150 ns;
R <= '0', '1' after 150 ns;

end teste;