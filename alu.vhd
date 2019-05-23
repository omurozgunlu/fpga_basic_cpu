library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity alu_21428317 is
port
(A : in std_logic_vector (3 downto 0);
B : in std_logic_vector (3 downto 0);
Sel: in std_logic_vector (3 downto 0);
Y : out std_logic_vector (3 downto 0)
);
end entity;
architecture bhv of alu_21428317 is
begin
process(A,B,Sel)
begin
if Sel(3) = '0' then 
case Sel(2 downto 0) is
when "000" => Y <= NOT A;
when "001" => Y <= NOT B;
when "010" => Y <= A and B;
when "011" => Y <= A or B;
when "100" => Y <= A nand B;
when "101" => Y <= A nor B;
when "110" => Y <= A xor B;
when "111" => Y <= A xnor B;
end case;
elsif Sel(3) = '1' then 
case Sel(2 downto 0) is
when "000" => Y <= A;
when "001" => Y <= A+1;
when "010" => Y <= A-1;
when "011" => Y <= B;
when "100" => Y <= A+B;
when "101" => Y <= A-B;
when "110" => Y <=  std_logic_vector(unsigned(a)*unsigned(b))(3 downto 0);
when "111" => Y <= "0000";
end case;
else Y <= "0000";
end if;
end process;
end bhv;