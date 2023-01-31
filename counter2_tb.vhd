library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter2_tb is
end entity;

architecture behave of counter2_tb is

component counter2 is
   port (
        clk1 : In std_logic;
        rst : In std_logic;
          
        --dout : out std_logic;  -- four bit counter
		en : In std_logic;
        dout : out std_logic_vector(3 downto 0)  		
          );
end component;


signal clk1_sim : std_logic;
signal rst_sim : std_logic;
signal en_sim : std_logic;
signal dout_sim : std_logic_vector(3 downto 0);

constant clk_per : time := 10 ns;
begin
cnt1_proc:counter2 port map (
                             clk1 => clk1_sim,
							 rst => rst_sim,
							 en => en_sim,
							 dout => dout_sim
                             );

process
begin 
  clk1_sim <= '0';
  wait for clk_per/2;  --5 ns 
  clk1_sim <= not clk1_sim;
  wait for clk_per/2;
end process;

process
begin
    rst_sim <= '0';
	wait for clk_per * 5;
	rst_sim <= not rst_sim;
	wait;
end process;

process
begin
     en_sim	<= '0';
	 wait for clk_per * 10;
	 en_sim <= not en_sim;
	 wait for clk_per * 30;

end process;
end behave;
