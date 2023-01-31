library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ff_tb is
end entity;

architecture behave of ff_tb is

component flipflop is
   port (
        clk : In std_logic;
        rst : In std_logic;
        --din : In std_logic;    -- one bit flipflop
		din : In std_logic_vector(7 downto 0);  
        --dout : out std_logic;  -- one bit flipflop
		enable : in std_logic;
        dout : out std_logic_vector(7 downto 0)  		
          );
end component;
   -- provide signal to the components

signal clk_sim :std_logic;
signal rst_sim :std_logic;
signal din_sim :std_logic_vector(7 downto 0);
signal enable_sim : std_logic;
signal dout_sim :std_logic_vector(7 downto 0);

-- use 100 MHz clock 1/ freq = clock period
constant clk_per : time := 10 ns;   -- := in this case no variable , just assigning

begin
-- connecting port to signal
ff_inst: flipflop port map (
                             clk => clk_sim,
							 rst => rst_sim,
							 din => din_sim,
							 enable => enable_sim,
							 dout => dout_sim
                             );
-- clock genneratiomn
process
begin 
  clk_sim <= '0';
  wait for clk_per/2;  --5 ns 
  clk_sim <= not clk_sim;
  wait for clk_per / 2;
end process;		

process
begin
    rst_sim <= '1';
	wait for clk_per * 5;
    rst_sim <= not rst_sim;
    wait;
end process;

process
begin
   enable_sim <= '0';
   wait for clk_per * 10;
   enable_sim <= not enable_sim;
   wait for clk_per * 30;


end process;

process
begin
   din_sim <= X"ab";
   wait for clk_per * 15;
   din_sim <= X"77";
   wait for clk_per * 40;

end process;
end behave;