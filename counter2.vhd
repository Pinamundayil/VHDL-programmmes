library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter2 is
   port (
        clk1 : In std_logic;
        rst : In std_logic;
          
        --dout : out std_logic;  -- four bit counter
		en : In std_logic;
        dout : out std_logic_vector(3 downto 0)  		
          );
end entity;

architecture behave of counter2 is

signal cnt1 : std_logic_vector(1 downto 0);
signal cnt2 : std_logic_vector(3 downto 0);
signal en2 : std_logic;
signal clk2 : std_logic; -- 50 MHz

begin


cnt1_proc: process(rst,clk1)

begin
    
	    if rst = '0' then
		   cnt1 <= (others => '0');
		elsif falling_edge (clk1) then
		    if en <= '1' then
		      cnt1 <= cnt1 + 1;
			else
			   cnt1 <= cnt1;
			end if;
	    end if;

end process;
   
    en2 <= '1' when (cnt1 = "10" or cnt1 = "11") else '0';
	
	clk2 <= cnt1(0);
	
cnt2_proc: process(rst,clk2)

begin

    if rst <= '0' then
	   cnt2 <= (others => '0');
	elsif falling_edge (clk2) then
        if en2 <= '1' then
           cnt2 <= cnt2 + 1;
        else		   
           cnt2 <= cnt2;
		end if;
    end if;
end process;

dout <=  cnt2;

end behave;