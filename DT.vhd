library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DT is
	port ( clk	: IN std_logic; 
	       rst	: IN std_logic;
	       D1	: IN std_logic_vector(5 downto 0);		
		   D2	: IN std_logic_vector(3 downto 0); 		
		   Qout	: OUT std_logic_vector(11 downto 0)		
		 );
	
end entity;

architecture behavioral of DT is

	signal D1_reg1  : std_logic_vector(5 downto 0) := (others => '0');
	signal D1_reg2  : std_logic_vector(5 downto 0) := (others => '0');
	signal D1_reg3  : std_logic_vector(5 downto 0) := (others => '0');
	
	signal D2_reg1  : std_logic_vector(3 downto 0) := (others => '0');
	signal D2_reg2  : std_logic_vector(3 downto 0) := (others => '0');
	signal D2_reg3  : std_logic_vector(3 downto 0) := (others => '0');
	
	signal mul1     : std_logic_vector(9 downto 0); 
	signal mul2     : std_logic_vector(9 downto 0); 
	signal mul3     : std_logic_vector(9 downto 0); 
	
	signal add1     : std_logic_vector(10 downto 0);
	signal add2     : std_logic_vector(11 downto 0); -- 12 bits


begin
	  
data_proc:	process(rst, clk)
	begin
	if rst = '1' then
	    D1_reg1 <= (others => '0');
	    D1_reg2 <= (others => '0');
	    D1_reg3 <= (others => '0');
		D2_reg1 <= (others => '0');
		D2_reg2 <= (others => '0');
		D2_reg3 <= (others => '0');
		Qout 	<= (others => '0');
	elsif rising_edge (clk) then
	    D1_reg1 <= D1;
	    D1_reg2 <= D1_reg1;
	    D1_reg3 <= D1_reg2;
		D2_reg1 <= D2;
		D2_reg2 <= D2_reg1;
		D2_reg3 <= D2_reg2;
		Qout 	<= add2;
	   end if;  
	end process;


	mul1 <= D1_reg1 * D2_reg1;
	mul2 <= D1_reg2 * D2_reg2;
	mul3 <= D1_reg3 * D2_reg3;

	add1 <= ext(mul1, 11) + ext(mul2, 11); 
	add2 <= ext(add1, 12) + ext(mul3, 12);

end behavioral;
