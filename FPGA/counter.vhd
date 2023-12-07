
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter is
Port ( 
clk : in STD_LOGIC;
counter : out std_logic_vector(7 downto 0)
);
end counter;

architecture Behavioral of counter is
signal counter_signal : std_logic_vector(7 downto 0):="00000000";
begin
process (clk) begin
if (rising_edge(clk)) then 
   counter_signal<=counter_signal+1;
end if;
end process;
counter<= counter_signal;
end Behavioral;
