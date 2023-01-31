library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flipflop is
   port (
        clk : In std_logic;
        rst : In std_logic;
        --din : In std_logic;    -- one bit flipflop
		din : In std_logic_vector(7 downto 0);  
        --dout : out std_logic;  -- one bit flipflop
		enable : in std_logic;
        dout : out std_logic_vector(7 downto 0)  		
          );
end entity;

-- architecture name of entity name
architecture behave of flipflop is 
-- here we can put signal/components/....

 


begin
-- all process here done paraller
-- ff_proc: process(rst, clk) 
--begin
-- everything the process do , we should write here 

-- use asyn reset, with active high and trigger on the rising edge
  -- if rst = '1' then          -- active high 
       --dout <= '0';  one bit
	  -- dout <= (others => '0')           --"00000000"; 
   --elsif rising_edge (clk) then   -- clk rising and rst no active so output equal to input (means ff keep value in its inside)
      --if enable = '1';
	  -- dout <= 'din';    
      --end if;
	-- end if ;	   

--end process;  


 ff_proc: process(rst, clk) 
begin
-- everything the process do , we should write here 

-- use asyn reset, with active high and trigger on the rising edge
   if rst = '1' then          -- active high 
       dout <= (others=>'0');  --one bit
   elsif rising_edge (clk) then   -- clk rising so output equal to input 
      if enable = '1' then
	     dout <= din;
      end if;
    end if ;	   

end process;  

end behave;