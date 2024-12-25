-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT ama_cache_ram is
			 Port ( clk : in STD_LOGIC;
			  rd : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (9 downto 0);
           result : out STD_LOGIC_VECTOR (11 downto 0);
			  hit : out STD_LOGIC
			  );
          END COMPONENT;
			 
			 
--Inputs
signal clk : std_logic;
signal rd : std_logic;
signal address :  std_logic_vector(9 downto 0);


--Outputs
signal result : std_logic_vector(11 downto 0) := "000000000000" ;
signal hit : std_logic;
			 
-- Clock period definitions
constant clk_period : time := 10 ns;
          

BEGIN
  
-- Component Instantiation
cache_ram: ama_cache_ram PORT MAP(
		clk => clk,
      rd => rd,
		address => address,
		result => result,
		hit => hit
 );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
  
  --  Test Bench Statements
     tb : PROCESS
     BEGIN
	  
		  rd <= '0';
		  address <= "0000000000";
	  
		  wait for 100 ns;
		  
		  rd <= '1';
		  address <= "0000000000";
		  
		  wait for 100 ns;
		  
		  rd <= '1';
		  address <= "0000000000";
		  


		  wait for clk_period; -- wait until global set/reset completes
		  

     END PROCESS tb;
  --  End Test Bench 

  END;
