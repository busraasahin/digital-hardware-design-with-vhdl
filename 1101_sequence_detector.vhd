library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity sequence_detector is
 port (
 clock: in std_logic;
 rst  : in std_logic;
 x    : in std_logic;
 z    : out std_logic
 );
 end sequence_detector;
 --1101--
 architecture arch of sequence_detector is
    type state_type is(S1,S2,S3,S4,S5);
	signal state : state_type;
	begin
	process (rst,clock)
	begin 
	 if(rst='1')then 
	  state<=S1;
	  z<= '0';
	 elsif (rising_edge(clock))then
	   case state is 
	     when S1=> 
		  z<='0';
		  if x='1' then state <=S2; else state<=S1; end if;
		 when S2=>
		  if x='1' then state<= S3; else state<=S1; end if;
		 when S3=>
		  if x='1' then state<=S3; else  state<=S4; end if;
		 when S4=>
		  if x='1' then state<=S5; else  state<=S1; end if;
		 when S5=>
		  if x='1' then state<=S3; else state<=S1; z<='1'; end if;
		 when others=>
		  state<=S1;
	   end case;  
	  end if;
	end process;
end architecture;
		  
