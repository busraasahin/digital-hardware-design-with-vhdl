
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ripplecarry is
port (
A: in std_logic_vector (3 downto 0);
B: in std_logic_vector (3 downto 0);
Cin: in std_logic;
S: out std_logic_vector(3 downto 0);
Cout: out std_logic
);
end ripplecarry;
architecture Behavioral of ripplecarry is
 component full_adder
 port(
 A: in std_logic;
 B: in std_logic;
 Cin: in std_logic;
 S: out std_logic;
 Cout: out std_logic
 );
 end component;
 signal c1,c2,c3: std_logic;
 begin 
 FA1: full_adder
           port map (A => A(0), B => B(0), Cin=>Cin, S=> S(0), Cout => c1);
 FA2: full_adder
           port map (A=> A(1), B=>B(1), Cin=> c1, S=> S(1), Cout=> c2);
 FA3: full_adder
           port map (A=>A(2), B=> B(2), Cin =>c2, S=> S(2), Cout=>c3);	
 FA4: full_adder
           port map (A=>A(3), B=>B(3), Cin=> c3, S=>S(3), Cout=> Cout);
end Behavioral;
		   
