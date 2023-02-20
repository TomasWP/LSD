library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entidade sem portos
entity SeqDetFSM_Tb is
end SeqDetFSM_Tb;

architecture Stimulus of SeqDetFSM_Tb is
	-- Sinais para ligar às entradas da uut
	signal s_reset, s_xIn, s_zOut, s_clk : std_logic;
begin
	-- Instanciação da Unit Under Test (UUT)
	uut: entity work.SeqDetFSM(MealyArch)
		port map(reset => s_reset,
					xIn => s_xIn,
					zOut => s_zOut,
					clk => s_clk);
--Process stim
stim_proc : process
begin
	wait for 100 ns;
	s_xIn <= '1';
	wait for 100 ns;
	s_xIn <= '0';
	wait for 100 ns;
	s_xIn <= '1';
	wait for 100 ns;
	s_xIn <= '0';
	wait for 100 ns;
	s_xIn <= '0';
	wait for 100 ns;
	s_xIn <= '1';
	wait for 100 ns;
end process;
end Stimulus;