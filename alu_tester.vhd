library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tester is
Port (btn, sw: in std_logic_vector(3 downto 0);
      clk: std_logic;
      led: out std_logic_vector(3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is

----------------------Intermediate Signals------------------------------
signal debounced: std_logic_vector(3 downto 0);
signal temp_A, temp_b, temp_op, temp_reset: std_logic_vector(3 downto 0);

--------------------ALU Component-------------------------------
component my_alu is
Port (clk, ld_A, ld_B, ld_op, reset: in std_logic;
      A, B, opcode: in std_logic_vector(3 downto 0);
      alu_out: out std_logic_vector(3 downto 0));
end component;

---------------------Debounce Component---------------------------
component debounce is
Port (clk, btn: in std_logic;
      dbnc: out std_logic);
end component;

begin

	Process(clk)
	begin
		if(rising_edge(clk)) then
			if(debounced(3) = '1') then
				temp_a <= "0000";
				temp_b <= "0000";
				temp_op <= "0000";
			elsif(debounced(0) = '1') then
				temp_b <= sw(3 downto 0);
			elsif(debounced(1) = '1') then
				temp_a <= sw(3 downto 0);
			elsif(debounced(2) = '1') then
				temp_op <= sw(3 downto 0);
			end if;
		end if;
	end process;
    

Button_Debounce0: debounce
port map(clk => clk,
         btn => btn(0),
         dbnc => debounced(0));

Button_Debounce1: debounce
port map(clk => clk,
         btn => btn(1),
         dbnc => debounced(1));
         
Button_Debounce2: debounce
port map(clk => clk,
         btn => btn(2),
         dbnc => debounced(2));

Button_Debounce3: debounce
port map(clk => clk,
         btn => btn(3),
         dbnc => debounced(3));

ALU: my_alu
port map(clk => clk, 
         ld_A => debounced(0), 
         ld_B => debounced(1),
         ld_op => debounced(2),
         reset => debounced(3),
         A(3 downto 0) => temp_A(3 downto 0),
         B(3 downto 0) => Temp_B(3 downto 0),
         opcode(3 downto 0) => Temp_op(3 downto 0),
         alu_out(3 downto 0) => led(3 downto 0));
end Behavioral;
