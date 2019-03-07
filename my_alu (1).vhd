----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 08:34:40 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
Port(clk, ld_A, ld_B, ld_op, reset: in std_logic;
      A, B, opcode: in std_logic_vector(3 downto 0);
      alu_out: out std_logic_vector(3 downto 0));
end my_alu;

architecture Behavioral of my_alu is

begin
    process(A, B, opcode, reset)
    begin
    
        case(opcode) is
        when "0000" => alu_out <= A + B;
        when "0001" => alu_out <= A - B;
        when "0010" => alu_out <= A + 1;
        when "0011" => alu_out <= A - 1;
        when "0100" => alu_out <= 0 - A;
        when "0101" => 
            if(A > B) then
                alu_out <= "0001";
            else
                alu_out <= "0000";
            end if;
        when "0110" => alu_out <= A(2 downto 0) & '0';
        when "0111" => alu_out <= '0' & A(3 downto 1);
        when "1000" => alu_out <= A(3) & A(3 downto 1);
        when "1001" => alu_out <= not A;
        when "1010" => alu_out <= A and B;
        when "1011" => alu_out <= A or B;
        when "1100" => alu_out <= A xor B;
        when "1101" => alu_out <= A xnor B;
        when "1110" => alu_out <= A nand B;
        when "1111" => alu_out <= A nor B;       
        end case;
    end process;
end Behavioral;
