library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DT_Test is
end entity;

architecture behave of DT_Test is

	signal clk_sim : std_logic;
	signal rst_sim : std_logic;
	signal D1_sim  : std_logic_vector(5 downto 0);
	signal D2_sim  : std_logic_vector(3 downto 0);
	signal Qout_sim: std_logic_vector(11 downto 0);	
		     
	constant clk_period : time := 20 ns;	     
		     
component DT 
	port ( clk	: IN std_logic; 
	       rst	: IN std_logic;
	       D1	: IN std_logic_vector(5 downto 0); --(5 downto 0);
		   D2	: IN std_logic_vector(3 downto 0); --(3 downto 0);
		   Qout	: OUT std_logic_vector(11 downto 0)   --(11 downto 0)
		 );
	
end component;
begin

	DT_inst : DT 
	          port map
	           (clk  => clk_sim,			
				rst  => rst_sim,
				D1   => D1_sim,
				D2   => D2_sim,
	            Qout => Qout_sim
	           );

	clk_proc:process
	begin
	  clk_sim <= '1';
	  wait for clk_period/2;
	  clk_sim <= '0'; 
	  wait for clk_period/2;
	end process;

	
	rst_proc:process
	begin
	  rst_sim <= '1';
	  --wait for 50 ns;
	  wait for clk_period*3;
	  rst_sim <= '0';
	  wait;
	end process;

	D1_sim <= "000001",
	          "000001" after 75 ns,   
	          "000011" after 500 ns;  
	       
	D2_sim <= x"2",
	          x"2" after 150 ns,    
	          x"4" after 600 ns; 
	       
	       	
end behave;