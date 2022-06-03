library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

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
signal B, S, R: std_logic_vector	((DATA_WIDTH-1) downto 0);
SIGNAL z : std_logic;
begin
instancia_alu: alu port map(CONTROL=>A,SRC1=>B,SRC2=>S,RESULT=>R,ZERO=>Z);
A <= "0000";
B <= "00000000000000000000000000000001";
S <= "00000000000000000000000000000011";
end teste;