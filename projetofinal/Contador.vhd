library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Contador is
    port(clk : in std_logic;
          reset : in std_logic;
          pointA : in std_logic;
          pointB : in std_logic;
          countA : out std_logic_vector(1 downto 0);
          countB : out std_logic_vector(1 downto 0));
end Contador;

architecture Behavioral of Contador is

    signal s_countA : unsigned(1 downto 0);
    signal s_countB : unsigned(1 downto 0);

begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                s_countA <= (others => '0');
                s_countB <= (others => '0');
            elsif (pointA = '0') then
                s_countA <= s_countA + 1;
            elsif (pointB = '0') then
                s_countB <= s_countB + 1;
            end if;
        end if;
    end process;
    countA <= std_logic_vector(s_countA);
    countB <= std_logic_vector(s_countB);
end Behavioral;