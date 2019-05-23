library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity mux_21428317 is 
port(
alu_out: in std_logic_vector(3 downto 0);
input: in std_logic_vector(2 downto 0);
sel: in std_logic;
output: out std_logic_vector(3 downto 0));
end mux_21428317;
architecture bhv of mux_21428317 is
begin
process(input,alu_out,sel)
begin
case sel is 
when '0' => output<=  alu_out;
when '1' => output<= '0' & input;
end case;
end process;
end bhv;