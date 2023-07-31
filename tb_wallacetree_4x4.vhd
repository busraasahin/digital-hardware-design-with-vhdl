

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_wallacetree_4x4 is
--  Port ( );
end tb_wallacetree_4x4;

architecture Behavioral of tb_wallacetree_4x4 is
component wallace_4x4 is
port(
           A_in: in std_logic_vector (3 downto 0);
		   B_in: in std_logic_vector (3 downto 0);
		   result : out std_logic_vector( 7 downto 0)
	
);


end component;

signal A_in:  std_logic_vector (3 downto 0);
signal B_in: std_logic_vector (3 downto 0);
signal  result :  std_logic_vector( 7 downto 0);
begin

uut :  wallace_4x4 port map (
A_in=> A_in,
B_in=>B_in,
result=>result
);
stim_procc : process
begin
A_in<= "0110";
B_in<= "0100";
wait for 30 ns;
A_in<= "0110";
B_in<= "0100";
wait for 30 ns;
A_in<= "0110";
B_in<= "0100";
wait for 30 ns;
A_in<= "0110";
B_in<= "0000";
wait for 30 ns;
A_in<= "1110";
B_in<= "0100";
wait for 30 ns;
A_in<= "0110";
B_in<= "0110";
wait for 30 ns;
A_in<= "1111";
B_in<= "0111";
wait for 30 ns;
A_in<= "1111";
B_in<= "1111";
wait for 30 ns;
wait;
end process;
end Behavioral;
