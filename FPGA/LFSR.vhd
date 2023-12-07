library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity lfsr is
Port ( 
clk      : in std_logic;
lfsr_out : out std_logic_vector(3 downto 0)
);
end lfsr;

architecture Behavioral of lfsr is
signal lfsr_reg : std_logic_vector(3 downto 0):="1001";
begin
process (clk) begin 
if(rising_edge(clk)) then
    lfsr_reg(2 downto 0) <=  lfsr_reg(3 downto 1);
    lfsr_reg(3)<= lfsr_reg(0) xor lfsr_reg(1);
end if;
end process;

lfsr_out<=lfsr_reg;
end Behavioral;
