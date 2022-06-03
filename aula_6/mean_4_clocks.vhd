-- mean_4_clocks - A system that calculates the mean over four clocks
-- Copyright (C) 2018  Digital Systems Group - UFMG
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mean_4_clocks is
    generic (
        W       :       integer := 32
    );
    port (
        CLK     : in    std_logic;
        RESET   : in    std_logic;
        INPUT   : in    std_logic_vector(W - 1 downto 0);
        OUTPUT  : out   std_logic_vector(W - 1 downto 0)
    );
end mean_4_clocks;

-- Implemente o testbench e encontre os erros neste modelo.
-- Considere o seguinte comportamento esperado:
-- Cada borda de subida da entrada CLK, o conteúdo de INPUT
-- é adicionado a uma cadeia de registradores e usado para calcular o
-- valor médio em 4 períodos de clock

architecture arch of mean_4_clocks is
begin
    process(CLK, RESET) is
        variable var1 : unsigned(W - 1 downto 0);
        variable var2 : unsigned(W - 1 downto 0);
        variable var3 : unsigned(W - 1 downto 0);
        variable var4 : unsigned(W - 1 downto 0);
    begin
        if (RESET = '1') then
            var1 := to_unsigned(0,W);
            var2 := to_unsigned(0,W);
            var3 := to_unsigned(0,W);
            var4 := to_unsigned(0,W);
        elsif (rising_edge(CLK)) then
            var1 := unsigned("00" & INPUT(W-1 downto 2));
            var2 := var1;
            var3 := var2;
            var4 := var3;
        end if;
        
        OUTPUT <= std_logic_vector(var1 + var2 + var3 + var4);
    end process;
    
end arch;