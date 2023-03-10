library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ROM_16_8 is
    port(address : in std_logic_vector(3 downto 0);
          dataOut : out std_logic_vector(7 downto 0));

end ROM_16_8;

architecture Behavioral of ROM_16_8 is 
    subtype TDataWord is std_logic_vector(7 downto 0);
    type TROM is array (0 to 15) of TDataWord;
    constant c_memory: TROM := (x"00",x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"F0",x"F1",x"F2",x"F3",x"F4",x"F5",x"F6",x"F7");
    
    begin
        dataOut <= c_memory(to_integer(unsigned(address)));

end Behavioral;