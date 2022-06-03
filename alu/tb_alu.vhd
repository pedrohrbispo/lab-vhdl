library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_alu is
	generic
	(
		DATA_WIDTH : natural := 32
	);

end tb_alu;

architecture teste of tb_alu is

component alu is
port (  CONTROL : in    std_logic_vector(3 downto 0);
        SRC1    : in    std_logic_vector(DATA_WIDTH - 1 downto 0);
        SRC2    : in    std_logic_vector(DATA_WIDTH - 1 downto 0);
        RESULT  : out   std_logic_vector(DATA_WIDTH - 1 downto 0);
        ZERO    : out   std_logic
		);
end component;

SIGNAL A : std_logic_vector(3 downto 0);
signal S1, S2, R: std_logic_vector	((DATA_WIDTH-1) downto 0);
SIGNAL z : std_logic;

begin
instancia_alu: alu port map(CONTROL=>A,SRC1=>S1,SRC2=>S2,RESULT=>R,ZERO=>Z);
A <= "0000", "0001" after 30 ns, "0010" after 50 ns, "0110" after 70 ns, "0111" after 90 ns, "1100" after 110 ns;
S1 <= "00000000000000000000000000010001", "00000000000000000000000000010111" after 50 ns;
S2 <= "00000000000000000000000000000011";

end teste;