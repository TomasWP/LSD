library IEEE;
use IEEE.STD_lOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter16 is
	port(clk : in std_logic;
		  c_out : out std_logic_vector(3 downto 0));
end Counter16;

architecture Behavioral of Counter16 is
signal counter : unsigned(3 downto 0) := "0000";
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			counter <= counter + 1;
		end if;
	end process;
	c_out <= std_logic_vector(counter);

end Behavioral;