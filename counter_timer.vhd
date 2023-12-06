library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity timer_counter is
generic( 
c_clkfreq: integer :=100_000_000
);
 Port (
 clk : in std_logic;
 switch : in std_logic_vector(1 downto 0 );
 counter : out std_logic_vector(7 downto 0)
 );
end timer_counter;

architecture Behavioral of timer_counter is
constant c_timer2secondlim: integer :=c_clkfreq*2;
constant c_timer1secondlim: integer :=c_clkfreq;
constant c_timer500mslim:   integer :=c_clkfreq/2;
constant c_timer250mslim:   integer :=c_clkfreq/4;
signal timer            :  integer range 0 to  c_timer2secondlim :=0;
signal timerlim         :  integer range 0 to  c_timer2secondlim :=0;
signal counter_int      :  std_logic_vector (7 downto 0) := (others=>'0');
begin

timerlim<= c_timer2secondlim when switch="00" else --timerlim switchlerin durumuna gore degisti
           c_timer1secondlim when switch="01" else
           c_timer500mslim   when switch="10" else
           c_timer250mslim; 
process (clk) begin
  if(rising_edge(clk)) then
      if(timer>=timerlim-1) then
         counter_int <=counter_int + 1;
         timer <= 0;
      else 
         timer<= timer+1;
       
       end if;
  end if;
end process;
 counter<=counter_int;
end Behavioral;

