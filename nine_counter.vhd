library IEEE;
use IEEE.std_logic_1164.all;


entity nine_counter is 
 port(
    clk: in std_logic;
	counter_out: out integer range 0 to 15
	);
end nine_counter;

architecture arch of nine_counter is
begin 
process(clk)
begin
    if(clk'event and clk='1') then 
     if (counter_out>=9) then
	  counter_out<=0;
	 else 
	  counter_out<=counter_out+1;
	end if;
   end if;
end process;
end architecture;
