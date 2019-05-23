library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity cpu_21428317 is port(
opcode: in std_logic_vector(3 downto 0);
A:in std_logic_vector(2 downto 0);
B:in std_logic_vector(2 downto 0);
sel: in std_logic ;
load_a: in std_logic;
load_b: in std_logic;
reset : in std_logic;
clock 	: in std_logic;
A_out 	: out std_logic_vector(6 downto 0);
B_out 	: out std_logic_vector(6 downto 0);
clkout : out std_logic;
hex_out 	: out std_logic_vector(6 downto 0));
end entity;
architecture behevior of cpu_21428317 is 
component reg_21428317 is 
port(  
clk: in std_logic;
D: in std_logic_vector(3 downto 0);
Q: out std_logic_vector(3 downto 0);
load: in std_logic;
clk_out:out std_logic;
reset: in std_logic);
end component;
component mux_21428317 is 
port(
alu_out: in std_logic_vector(3 downto 0);
input: in std_logic_vector(2 downto 0);
sel: in std_logic;
output: out std_logic_vector(3 downto 0));
end component;
component alu_21428317 is
port
(A : in std_logic_vector (3 downto 0);
B : in std_logic_vector (3 downto 0);
Sel: in std_logic_vector (3 downto 0);
Y : out std_logic_vector (3 downto 0)
);
end component;
component hex2led IS
	PORT (
		HEX : IN STD_LOGIC_VECTOR (3 DOWNTO 0);  
		LED : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END component;
signal Mux_out,Mux_out1,Reg_A,Reg_B,alu_out : std_LOGIC_VECTOR (3 downto 0);
signal Clk_out1,clk_out2 : std_logic;
begin 
MUX1: mux_21428317 port map (ALU_out,A,sel,Mux_out);
MUX2: mux_21428317 port map (ALU_out,B,sel,Mux_out1);
REG1: reg_21428317 port map (clock, Mux_out,Reg_A,load_a,Clk_out1,reset);
REG2: reg_21428317 port map (clock, Mux_out1,Reg_B,load_b,Clk_out2,reset); 
ALU1: alu_21428317 port map (Reg_A,Reg_B,opcode,ALU_out);
HEX1: hex2led port map (reg_a,a_out);
HEX2: hex2led port map (reg_B,b_out);
HEX3: hex2led port map (alu_out,hex_out);
clkout<=clk_out1;
end architecture;