----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 05:10:06 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - testbench
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ripple_adder_tb is
end ripple_adder_tb;

architecture testbench of ripple_adder_tb is

    signal tb_a, tb_b: std_logic_vector(3 downto 0);
    signal tb_sum: std_logic_vector(3 downto 0);
    signal tb_cout, tb_c: std_logic;    

    component ripple_adder is
        port(a, b: in std_logic_vector(3 downto 0);
             s: out std_logic_vector(3 downto 0);
             c: in std_logic;
             cout_final: out std_logic);
    end component;
    
begin

    generate_inputs: process
    begin
        tb_c <= '0';
        tb_a <= "0000";
        tb_b <= "0001";
        wait for 100 ns;
        
        tb_c <= '0';
        tb_a <= "0101";
        tb_b <= "0011";
        wait for 100 ns;
        
        tb_c <= '0';
        tb_a <= "0010";
        tb_b <= "1000";
        wait for 100 ns;

        tb_c <= '0';
        tb_a <= "1100";
        tb_b <= "0001";
        wait for 100 ns;
        
        
        tb_c <= '0';
        tb_a <= "0110";
        tb_b <= "0101";
        wait for 100 ns;
    
        tb_c <= '0';
        tb_a <= "0111";
        tb_b <= "1010";
        wait for 100 ns;
    end process generate_inputs;
    
    dut: ripple_adder
    port map(a => tb_a,
             c => tb_c,
             b => tb_b,
             s => tb_sum,
             cout_final => tb_cout);
             
end testbench;
