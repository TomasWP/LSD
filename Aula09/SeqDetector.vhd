library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity SeqDetector is
    port(LEDG : out std_logic_vector(0 downto 0);
			KEY : in std_logic_vector(1 downto 0);
			SW : in  std_logic_vector (0 downto 0);
			LEDR : out std_logic_vector(0 downto 0);
			CLOCK_50 : in  std_logic);
end SeqDetector;

architecture Structural of SeqDetector is 
 
        signal s_reset : std_logic := '0';
        signal s_displayPulse : std_logic;
        signal s_LEDG0 : std_logic;
     
begin

    
         
LEDG(0) <= s_LEDG0; 
                              
    freqdivider : entity work.FreqDivider(behavioral)
                                     port map(clkIn   => CLOCK_50,
                                              clkOut => s_LEDG0);
                                                 
                                                 
    SeqDetFSM: entity work.SeqDetFSM(MealyArch)
                                    port map(reset => s_reset,
                                                xIn   => SW(0),
                                                zOut  => LEDR(0),
                                                clk   => s_LEDG0);
end Structural;