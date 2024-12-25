--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:30:42 12/29/2023
-- Design Name:   
-- Module Name:   C:/Users/Morteza/Desktop/Testbench/cache_testbench/cache_test.vhd
-- Project Name:  cache_testbench
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ama_cache
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cache_test IS
END cache_test;
 
ARCHITECTURE behavior OF cache_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ama_cache
    PORT(
         address : IN  std_logic_vector(9 downto 0);
         wr : IN  std_logic;
         clk : IN  std_logic;
         data_in : IN  std_logic_vector(11 downto 0);
         data_out : OUT  std_logic_vector(11 downto 0);
         hit_miss : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(9 downto 0) := (others => '0');
   signal wr : std_logic := '0';
   signal clk : std_logic := '0';
   signal data_in : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(11 downto 0);
   signal hit_miss : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ama_cache PORT MAP (
          address => address,
          wr => wr,
          clk => clk,
          data_in => data_in,
          data_out => data_out,
          hit_miss => hit_miss
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		wr <= '0';
		
		address <= "0000000000";

      wait for clk_period;
		
		wr <= '1';
		
		address <= "0000000000";
		
	   data_in <= "010101010101";
		
		wait for clk_period;
		
		wr <= '0';
		
		address <= "0000000000";
			
      wait;
   end process;

END;