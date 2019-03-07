----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 08:18:33 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ripple_adder is
    port(a, b: in std_logic_vector(3 downto 0);
         c: in std_logic;
         s: out std_logic_vector(3 downto 0);
         cout_final: out std_logic);
end ripple_adder;

architecture four_bit of ripple_adder is

component full_adder is
    Port (a, b, c_in: in std_logic;
          sum, cout: out std_logic);
end component;

signal c1 : std_logic;
signal c2 : std_logic;
signal c3 : std_logic;

begin
fa0: full_adder
port map(a => a(0),
         b => b(0),
         c_in => c,
         sum => s(0),
         cout => c1);

fa1: full_adder
port map(a => a(1),
         b => b(1),
         c_in => c1,
         sum => s(1),
         cout => c2);

fa2: full_adder
port map(a => a(2),
         b => b(2),
         c_in => c2,
         sum => s(2),
         cout => c3);

fa3: full_adder
port map(a => a(3),
         b => b(3),
         c_in => c3,
         sum => s(3),
         cout => cout_final);


end four_bit;

