library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity full_adder is
Port (a, b, c_in: in std_logic;
      sum, cout: out std_logic);
end full_adder;

architecture Behavioral of full_adder is

begin

sum <= a xor b xor c_in;
cout <= ((a xor b) and c_in) or (a and b);

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ripple_adder is
port(a,b: in std_logic_vector(3 downto 0);
     c: in std_logic;
     s: out std_logic_vector(3 downto 0);
     coute: std_logic);
end ripple_adder;

architecture four_bit of ripple_adder is

component full_adder
Port (a, b, c_in: in std_logic;
      sum, cout: out std_logic);
end component;

signal c_out: std_logic_vector(3 downto 0) := (others => '0');

begin
fa0: full_adder
port map(a => a(0),
         b => b(0),
         c_in => c,
         sum => s(0),
         cout => c_out(0));

fa1: full_adder
port map(a => a(1),
         b => b(1),
         c_in => c_out(1),
         sum => s(1),
         cout => c_out(1));

fa2: full_adder
port map(a => a(2),
         b => b(2),
         c_in => c_out(2),
         sum => s(2),
         cout => c_out(2));

fa3: full_adder
port map(a => a(3),
         b => b(3),
         c_in => c_out(3),
         sum => s(0),
         cout => c_out(3));


end four_bit;

