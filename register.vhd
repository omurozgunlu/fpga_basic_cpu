library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity reg_21428317 is 
port(
clk: in std_logic;
D: in std_logic_vector(3 downto 0);
Q: out std_logic_vector(3 downto 0);
load: in std_logic;
clk_out:out std_logic;
reset: in std_logic);
end reg_21428317;
architecture bhv of reg_21428317 is
signal temp:std_logic:='0';
signal temp2:std_logic_vector(3 downto 0);

begin 
reg1: process(clk,load,temp,reset)
variable counter: integer range 0 to 100000000:=0;
variable counter_zero: integer range 0 to 1:=0;
begin
if reset='0' then

temp2<="0000";
counter_zero:=1;
else
if falling_edge(load)  then
temp2<=D;
counter_zero:=1;
end if;
if rising_edge(clk) then
counter:=(counter+1)*counter_zero;
if counter=100000000 then 
temp<= not temp;
counter:=0;
Q<=temp2;
end if;
end if;
counter_zero:=0;
end if;
clk_out<=temp;
end process;
end bhv;